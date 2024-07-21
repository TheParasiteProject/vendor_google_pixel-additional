package com.google.android.turboadapter;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.BatteryManager;
import android.os.Bundle;
import android.os.IBinder;
import android.os.ResultReceiver;
import android.os.ServiceSpecificException;
import android.util.Log;

import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;

public class GoogleBatteryService extends Service {
    private static final boolean DEBUG = false;
    private static final String TAG = GoogleBatteryService.class.getName();

    private GoogleBatteryProxyDummy mBinder;
    ExecutorService mSingleThreadExecutor = Executors.newSingleThreadExecutor();

    IBinder bindToGoogleBatteryProxyDummy() {
        if (mBinder == null) {
            mBinder = new GoogleBatteryProxyDummy(this);
        }
        return mBinder;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return bindToGoogleBatteryProxyDummy();
    }

    @Override
    public boolean onUnbind(Intent intent) {
        mBinder = null;
        return false;
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    public void runOnBackgroundThread(Runnable runnable) {
        mSingleThreadExecutor.execute(runnable);
    }

    public class GoogleBatteryProxyDummy extends IGoogleBatteryService.Stub {
        final GoogleBatteryService mGoogleBatteryService;

        GoogleBatteryProxyDummy(GoogleBatteryService googleBatteryService) {
            mGoogleBatteryService = googleBatteryService;
        }

        @Override
        public String getVersion() {
            dlog("getVersion");
            return "4";
        }

        @Override
        public boolean isAdaptiveChargingEnabled() {
            dlog("isAdaptiveChargingEnabled");
            return false;
        }

        @Override
        public boolean setChargingDeadline(int i) {
            dlog("setChargingDeadline: i=" + i);
            return false;
        }

        @Override
        public void getChargingStageAndDeadline(ResultReceiver resultReceiver) {
            dlog("getChargingStageAndDeadline");
            runOnBackgroundThread(new GetChargingStageAndDeadlineRunnable(resultReceiver));
        }

        @Override
        public boolean setProperty(int i, int i2, int i3) {
            dlog("setProperty: i=" + i + ", i2=" + i2 + ", i3=" + i3);
            return false;
        }

        @Override
        public void getProperty(int i, int i2, ResultReceiver resultReceiver) {
            dlog("getProperty: i=" + i + ", i2=" + i2);
            runOnBackgroundThread(new GetBatteryPropertyRunnable(i, i2, resultReceiver));
        }

        @Override
        public boolean setStringProperty(int i, int i2, String str) {
            dlog("setStringProperty: i=" + i + ", i2=" + i2 + ", str=" + str);
            return false;
        }

        @Override
        public String getStringProperty(int i, int i2) {
            dlog("getStringProperty: i=" + i + ", i2=" + i2);
            return null; // TODO: Correctly report dummy value
        }
    }

    final class GetBatteryPropertyRunnable implements Runnable {
        final int mFeature;
        final int mProperty;
        final ResultReceiver mResultReceiver;

        GetBatteryPropertyRunnable(int i, int i2, ResultReceiver resultReceiver) {
            mFeature = i;
            mProperty = i2;
            mResultReceiver = resultReceiver;
        }

        @Override
        public void run() {
            try {
                Bundle bundle = new Bundle();
                bundle.putInt("feature_property", 0);
                mResultReceiver.send(0, bundle);
            } catch (ServiceSpecificException | IllegalArgumentException e) {
                Log.e("GoogleBatteryService", "getProperty failed", e);
            }
        }
    }

    final class GetChargingStageAndDeadlineRunnable implements Runnable {
        final ResultReceiver mResultReceiver;

        GetChargingStageAndDeadlineRunnable(ResultReceiver resultReceiver) {
            mResultReceiver = resultReceiver;
        }

        @Override
        public void run() {
            try {
                Bundle bundle = new Bundle();
                String charing = "Disabled";
                if (isCharging()) {
                    charing = "Enabled";
                }
                bundle.putString("charging_stage", charing); // Inactive, Active, Enabled, ...
                bundle.putInt("deadline_seconds", -3);
                mResultReceiver.send(0, bundle);
            } catch (ServiceSpecificException | IllegalArgumentException e) {
                Log.e("GoogleBatteryService", "getChargingStageAndDeadline failed", e);
            }
        }
    }

    private boolean isCharging() {
        BatteryManager batteryManager =
                (BatteryManager) this.getSystemService(Context.BATTERY_SERVICE);
        if (batteryManager != null) {
            return batteryManager.isCharging();
        }
        return false;
    }

    public static void dlog(String msg) {
        if (DEBUG) Log.d(TAG, msg);
    }
}

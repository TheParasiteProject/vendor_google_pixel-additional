#!/bin/bash

if [ ! -d .repo/local_manifests ];
then
    mkdir -p .repo/local_manifests
fi

if [ ! -f .repo/local_manifests/pixel-additional.xml ];
then
    cp vendor/pixel-additional/pixel-additional.xml .repo/local_manifests/pixel-additional.xml
    rm -Rf prebuilts/module_sdk
fi

if [ ! -d prebuilts/module_sdk ];
then
    repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all) prebuilts/module_sdk
fi

if [ ! -d vendor/partner_modules ];
then
    repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all) vendor/partner_modules
fi

rm -Rf vendor/gapps/product/packages/apps/PrebuiltGoogleAdservicesTvp
rm -Rf vendor/gapps/product/packages/apps/PrebuiltGoogleTelemetryTvp
rm -Rf vendor/gapps/system/packages/apps/CaptivePortalLoginGoogle
rm -Rf vendor/gapps/system/packages/privileged_apps/DocumentsUIGoogle
rm -Rf vendor/gapps/system/packages/privileged_apps/NetworkStackGoogle

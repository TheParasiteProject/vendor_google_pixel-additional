#!/bin/bash

if [ ! -d .repo/local_manifests ];
then
    mkdir -p .repo/local_manifests
fi

cp -Rf vendor/pixel-additional/pixel-additional.xml .repo/local_manifests/pixel-additional.xml

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all) prebuilts/module_sdk

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all) vendor/partner_modules

rm -Rf vendor/aosp/rro_overlays/GooglePermissionControllerOverlay

if [ ! "$DONT_COPY_BT_CERT" = true ];
then
    rm -Rf vendor/partner_modules/build/certificates/bluetooth.x509.pem
    cp vendor/pixel-additional/products/apex/certificates/bluetooth.x509.pem vendor/partner_modules/build/certificates/
fi

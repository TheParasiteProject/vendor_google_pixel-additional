#!/bin/bash

if [ ! "$TARGET_SUPPORTS_PREBUILT_UPDATABLE_APEX" = false ];
then

if [ ! -d .repo/local_manifests ];
then
    mkdir -p .repo/local_manifests
fi

#cp -Rf vendor/pixel-additional/pixel-additional.xml .repo/local_manifests/pixel-additional.xml

#repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all) vendor/partner_modules

rm -Rf vendor/aosp/rro_overlays/GooglePermissionControllerOverlay

else

if [ -f .repo/local_manifests/pixel-additional.xml ];
then
    rm -Rf .repo/local_manifests/pixel-additional.xml

    repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
fi

fi

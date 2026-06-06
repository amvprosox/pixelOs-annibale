
#!/bin/bash

set -e



ROM_DIR="PixelOS_annibale"

RECIPE_DIR="$(cd "$(dirname "$0")" && pwd)"


mkdir -p ~/$ROM_DIR && cd ~/$ROM_DIR


repo init -u https://github.com/PixelOS-AOSP/manifest.git -b sixteen --git-lfs --no-clone-bundle


mkdir -p .repo/local_manifests

cp "$RECIPE_DIR"/local_manifests/*.xml .repo/local_manifests/


repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags


git -C device/lineage/sepolicy apply "$RECIPE_DIR"/patches/01-lineage-sepolicy.patch

git -C packages/apps/Aperture apply "$RECIPE_DIR"/patches/02-aperture-ultrahdr.patch

git -C hardware/lineage/compat apply "$RECIPE_DIR"/patches/03-tinyxml2-page-size.patch

git -C device/xiaomi/annibale apply "$RECIPE_DIR"/patches/04-device-annibale.patch


cp -r "$RECIPE_DIR"/new-files/* ./


find hardware/qcom-caf/sm8450-6.6 -name 'Android.bp' -exec sh -c 'echo "// disabled - unused sm8450-6.6 on sm8750 annibale" > "$1"' _ {} \;


source build/envsetup.sh

lunch aosp_annibale-bp4a-userdebug

m installclean

m bacon -j$(nproc --all)


echo "Build done. Zip in out/target/product/annibale/"


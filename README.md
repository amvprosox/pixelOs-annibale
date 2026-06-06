# PixelOS for POCO F8 Pro / Redmi K90 (annibale)

Unofficial PixelOS Android 16 (16.2, QPR2) build recipe for the Xiaomi POCO F8 Pro (codename: annibale, Snapdragon 8 Elite / sm8750).

Maintainer: amvprosox

## What this is

A spoon-feed build recipe. It does not contain the full source tree. The script inits the PixelOS manifest, syncs sources, applies the annibale patches, and builds. Clone this, run the script, get a flashable zip.

## Requirements

- Linux (Ubuntu 22.04 or WSL2) with build environment set up
- ~300GB free disk, 16GB+ RAM, repo + git-lfs installed
- Several hours for first sync and build

## Build

```bash
git clone https://github.com/amvprosox/pixelOs-annibale.git
cd pixelOs-annibale
./build.sh
```

Output zip lands in `~/PixelOS_annibale/out/target/product/annibale/`.

## What the recipe does

- Inits PixelOS manifest (branch: sixteen)
- Adds annibale device tree, prebuilt kernel, kernel source, hardware/xiaomi (lineage-23.2)
- Swaps system/sepolicy to LineageOS lineage-23.2 (device tree expects lineage HAL sepolicy)
- Applies lineage HAL sepolicy fixes, Aperture UltraHDR disable, libtinyxml2-v36 page-size fix
- Adds aosp_annibale product makefile (PixelOS bringup on the lineage tree)
- Disables unused sm8450-6.6 Soong modules (device is sm8750)
- Builds aosp_annibale-bp4a-userdebug

## Flashing

1. Unlock bootloader
2. Boot to recovery (OrangeFox)
3. Flash the zip
4. For root: patch init_boot.img in Magisk, flash to both init_boot_a and init_boot_b

## Credits

- PixelOS-AOSP
- LineageOS
- xiaomi-annibale device tree maintainers
- voxonage (Aperture UltraHDR fix)

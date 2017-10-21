#!/system/bin/sh
# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

#Copy original fonts.xml to the MODDIR to overwrite dummy file
cp /dev/magisk/mirror/system/etc/fonts.xml $MODDIR/system/etc

#Change fonts.xml file
sed -i 's@<font weight="400" style="normal" index="0">NotoSansCJK-Regular.ttc</font>@<font weight="300" style="normal">Koruri-Light.ttf</font>\n        <font weight="400" style="normal">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal">Koruri-Extrabold.ttf</font>@g' $MODDIR/system/etc/fonts.xml

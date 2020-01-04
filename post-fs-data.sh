#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode

#Copy original fonts.xml to the MODDIR to overwrite dummy file
cp /dev/magisk/mirror/system/etc/fonts.xml $MODDIR/system/etc

#Change fonts.xml file
sed -i 's@<font weight="400" style="normal" index="0">NotoSansCJK-Regular.ttc</font>@<font weight="300" style="normal">Koruri-Light.ttf</font>\n        <font weight="400" style="normal">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal">Koruri-Extrabold.ttf</font>@g' $MODDIR/system/etc/fonts.xml

#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}
# This script will be executed in post-fs-data mode

#Copy original fonts.xml to the MODDIR to overwrite dummy file
cp /system/etc/fonts.xml $MODDIR/system/etc

#Change fonts.xml file
sed -i 's@<font weight="400" style="normal" index="0">NotoSansCJK-Regular.ttc</font>@<font weight="300" style="normal">Koruri-Light.ttf</font>\n        <font weight="400" style="normal">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal">Koruri-Extrabold.ttf</font>@g' $MODDIR/system/etc/fonts.xml

sed -i 's@<font weight="400" style="normal" index="0" fallbackFor="serif">NotoSerifCJK-Regular.ttc</font>@<font weight="300" style="normal" fallbackFor="serif">Koruri-Light.ttf</font>\n        <font weight="400" style="normal" fallbackFor="serif">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal" fallbackFor="serif">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal" fallbackFor="serif">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal" fallbackFor="serif">Koruri-Extrabold.ttf</font>@g' $MODDIR/system/etc/fonts.xml

#Goodbye, SomcUDGothic
sed -i 's@SomcUDGothic-Light.ttf@null.ttf@g' $MODDIR/system/etc/fonts.xml
sed -i 's@SomcUDGothic-Regular.ttf@null.ttf@g' $MODDIR/system/etc/fonts.xml

#Goodbye, OnePlus Font
sed -i 's@OpFont-@Roboto-@g' $MODDIR/system/etc/fonts.xml
sed -i 's@NotoSerif-@Roboto-@g' $MODDIR/system/etc/fonts.xml

#Copy fonts_slate.xml for OnePlus
opslate=fonts_slate.xml
if [ -e /system/etc/$opslate ]; then
    cp /system/etc/$opslate $MODDIR/system/etc
	
	#Change fonts_slate.xml file
	sed -i 's@<font weight="400" style="normal" index="0">NotoSansCJK-Regular.ttc</font>@<font weight="300" style="normal">Koruri-Light.ttf</font>\n        <font weight="400" style="normal">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal">Koruri-Extrabold.ttf</font>@g' $MODDIR/system/etc/$opslate

	sed -i 's@SlateForOnePlus-Thin.ttf@Koruri-Light.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Light.ttf@Koruri-Light.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Book.ttf@Koruri-Regular.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Regular.ttf@Koruri-Regular.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Medium.ttf@Koruri-Semibold.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Bold.ttf@Koruri-Bold.ttf@g' $MODDIR/system/etc/$opslate
	sed -i 's@SlateForOnePlus-Black.ttf@Koruri-Extrabold.ttf@g' $MODDIR/system/etc/$opslate
fi

#Copy fonts_base.xml for OnePlus OxygenOS 11+
oos11=fonts_base.xml
if [ -e /system/etc/$oos11 ]; then
    cp /system/etc/$oos11 $MODDIR/system/etc
	
	#Change fonts_slate.xml file
	sed -i 's@<font weight="400" style="normal" index="0">NotoSansCJK-Regular.ttc</font>@<font weight="300" style="normal">Koruri-Light.ttf</font>\n        <font weight="400" style="normal">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal">Koruri-Extrabold.ttf</font>@g' $MODDIR/system/etc/$oos11

	sed -i 's@<font weight="400" style="normal" index="0" fallbackFor="serif">NotoSerifCJK-Regular.ttc</font>@<font weight="300" style="normal" fallbackFor="serif">Koruri-Light.ttf</font>\n        <font weight="400" style="normal" fallbackFor="serif">Koruri-Regular.ttf</font>\n        <font weight="600" style="normal" fallbackFor="serif">Koruri-Semibold.ttf</font>\n        <font weight="700" style="normal" fallbackFor="serif">Koruri-Bold.ttf</font>\n        <font weight="800" style="normal" fallbackFor="serif">Koruri-Extrabold.ttf</font>@g' $MODDIR/system/etc/$oos11

	sed -i 's@NotoSerif-@Roboto-@g' $MODDIR/system/etc/$oos11
fi
# Replace Roboto to Open Sans
REPLACE="
"

APILEVEL=$(getprop ro.build.version.sdk)
if [ $APILEVEL -lt 31 ] ; then
	abort "Only Android 12+ is supported, sorry."
fi
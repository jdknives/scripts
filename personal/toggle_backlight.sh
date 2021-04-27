#!/bin/bash

val=`cat /sys/devices/platform/thinkpad_acpi/leds/tpacpi\:\:kbd_backlight/brightness`

echo $val

if [[ $val -eq 2 ]]
    then
        echo 0 > /sys/devices/platform/thinkpad_acpi/leds/tpacpi\:\:kbd_backlight/brightness
else
        echo 2 > /sys/devices/platform/thinkpad_acpi/leds/tpacpi\:\:kbd_backlight/brightness
fi

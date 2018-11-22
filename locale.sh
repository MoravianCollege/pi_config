#!/bin/bash

if [ $(id -u) -ne 0 ] ; then
    echo "Usage sudo locale.sh"
    exit 1
fi

# locale
echo 'Setting locale to en_US.UTF-8'
cp config_files/etc.locale.gen /etc/locale.gen
locale-gen en_US.UTF-8
cp config_files/etc.default.locale /etc/default/locale

# Keyboard
echo 'Setting keyboard to US Generic 101'
cp config_files/etc.default.keyboard /etc/default/keyboard

# Timezone
echo 'Setting timezone to US/New York'
cp config_files/etc.timezone /etc/timezone




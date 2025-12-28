#!/bin/bash

PROC="pw-loopback --capture=alsa_input.usb-PreSonus_AudioBox_Go_UGBA21484258-00.analog-stereo --playback=alsa_output.usb-Corsair_CORSAIR_HS80_MAX_WIRELESS_Gaming_Receiver_13FD4D7B74A86463-00.analog-stereo --latency=0"

if pgrep -f "$PROC" >/dev/null; then
    pkill -f "$PROC"
else
    nohup $PROC >/dev/null 2>&1 &
    sleep 0.1  # kurz warten, damit pgrep den neuen Prozess erkennen kann
fi


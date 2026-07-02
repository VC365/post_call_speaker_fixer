#!/system/bin/sh

call_active="0"
while true; do
    state=$(dumpsys telephony.registry | grep mCallState | head -1 | cut -d= -f2)
    if [ "$state" = "0" ] && [ "$call_active" = "1" ]; then
        sleep 1
        if dumpsys media.audio_flinger 2>/dev/null | grep -m1 "Output device" | grep -q "EARPIECE"; then
            log -t PostCallSpeakerFixer "EARPIECE stuck detected, restarting audioserver"
            killall audioserver 2>/dev/null
        fi
        call_active="0"
    elif [ "$state" = "2" ]; then
    	call_active="1"
    fi
    sleep 3
done

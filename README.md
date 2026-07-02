# Post Call Speaker Fixer

Automatically restores audio when it gets stuck on the earpiece after a phone call.

## Logs

Monitor the module with:

```sh
logcat -s PostCallSpeakerFixer
```

## Tested on

* Hol-U19 (LineageOS 14.1)

Other devices may also work if they exhibit the same audio routing issue.

## Why this module exists

Some devices fail to restore the normal audio route after a phone call. As a result, media playback continues through the earpiece instead of the main speaker.

This module detects that condition and restarts `audioserver` only when the issue is detected.

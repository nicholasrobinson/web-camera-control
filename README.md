# Motivation

I wanted to control an Avaya HC020 USB Web Camera (HuddleCamHD Pro) via PTZOptics Camera Control App via homebridge.

# Example config.json

```
...
    {
        "platform": "Cmd4",
        "name": "Cmd4",
        "accessories": [
            {
                "type": "Switch",
                "displayName": "WEBCAM_PRESET_1",
                "on": "FALSE",
                "name": "Man Cave Webcam - Whiteboard",
                "state_cmd": "/homebridge/Cmd4Scripts/WebCameraControl.sh",
                "polling": true,
                "interval": 5,
                "timeout": 60000
            },
            {
                "type": "Switch",
                "displayName": "WEBCAM_PRESET_2",
                "on": "FALSE",
                "name": "Man Cave Webcam - Wall",
                "state_cmd": "/homebridge/Cmd4Scripts/WebCameraControl.sh",
                "polling": true,
                "interval": 5,
                "timeout": 60000
            }
        ]
   }
...
```

# Example WebCameraControl.sh

Change:
```
curl "http://IP_ADDRESS:PORT/cam/recallPreset?callSpeed=1&presetNum=$OUTPUT"
```

to (your host machine's IP and web server port - configured using PTZOptics Camera Control App):
```
curl "http://192.168.0.1:8080/cam/recallPreset?callSpeed=1&presetNum=$OUTPUT"
```

# References
https://ptzoptics.com/ptz-app/
https://huddlecamhd.com/pro/
https://www.avaya.com/en/devices-and-phones/huddle-rooms/camera-hc020/

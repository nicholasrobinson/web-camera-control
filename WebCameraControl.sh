#!/bin/bash

# Script for controlling an Avaya HC020 USB Web Camera via PTZOptics Camera Control App.
# Usage: bash WebCameraControl.sh Set <COMMAND> On true

if [ "$1" = "Get" ]; then
   # Stateless switch is always off
   echo "0"
   exit 0
fi

if [ "$1" = "Set" ]; then
   if [ "$3" = "On" ]; then
      if [ "$4" = "true" ]; then
         # Clean up input (https://unix.stackexchange.com/questions/311758/remove-specific-word-in-variable)
         INPUT="$2"
         WORDTOREMOVE="WEBCAM_PRESET_"
         OUTPUT=${INPUT//$WORDTOREMOVE/}
         # Execute cURL
         curl "http://IP_ADDRESS:PORT/cam/recallPreset?callSpeed=1&presetNum=$OUTPUT"
         exit $?
      else
         # There is no turning off a command
         exit 0
      fi
   fi
fi

exit -1

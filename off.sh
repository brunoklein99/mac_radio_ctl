#!/bin/bash

mkdir ~/wifi-ctl > /dev/null 2> /dev/null

while [ true ]
do
	date=$(echo -n $(date))
	wifi_status=$(networksetup -getairportpower en0)
	if [[ $wifi_status != *"Off"* ]]; then
		networksetup -setairportpower en0 off
		set_wifi_exit_code=$?
  		echo $date - $wifi_status - $set_wifi_exit_code 
	fi
	# defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0
	# killall -HUP bluetoothd
	sleep 1
done
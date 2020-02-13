#!/bin/bash

if nc -zw1 google.com 443; then
  echo "Internet connection is OK"
  exit 0
fi

echo "No connection"

echo "4" > /sys/class/gpio/export
echo "6" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio4/direction
echo "out" > /sys/class/gpio/gpio6/direction


sleep 0.1
echo "1" > /sys/class/gpio/gpio4/value
echo "1" > /sys/class/gpio/gpio6/value
sleep 5

echo "0" > /sys/class/gpio/gpio4/value
echo "0" > /sys/class/gpio/gpio6/value

/home/pi/waveshare_4g_hat_scripts/sim7600_4G_hat_init.sh

exit 0

#!/bin/bash

qmicli -d /dev/cdc-wdm0 --dms-get-operating-mode
qmicli -d /dev/cdc-wdm0 --nas-get-signal-strength
sleep 2
qmicli -d /dev/cdc-wdm0 --nas-get-home-network

qmicli -d /dev/cdc-wdm0 -w

ip link set wwan0 down
echo 'Y' | tee /sys/class/net/wwan0/qmi/raw_ip
sudo ip link set wwan0 up

qmicli -p -d /dev/cdc-wdm0 --device-open-net='net-raw-ip|net-no-qos-header' --wds-start-network=apn='internet.sberbank-tele.com',username='internet',password='internet',ip-type=4 --client-no-release-cid


udhcpc -b -i wwan0

ip a s wwan0
ip r s

exit 0

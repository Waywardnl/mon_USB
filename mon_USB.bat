#! /bin/sh

LogFile='/var/log/mon_USB.log'
CHECKDEV='/tmp/check_dev.log'

RIGHTNOW=$(date +"%m-%d-%y_%H-%M")

echo $RIGHTNOW > $CHECKDEV
echo $RIGHTNOW >> $LogFile

FirstUSB=$(usbconfig)

Counter=0
while [ $Counter -lt 720 ]
do
RIGHTNOW=$(date +"%m-%d-%y_%H-%M")

echo $RIGHTNOW > $CHECKDEV
echo $RIGHTNOW >> $LogFile

echo $FirstUSB >> $LogFile
echo $FirstUSB >> $CHECKDEV

echo "--------------FirstUSB--------------" >> $LogFile
echo "--------------FirstUSB--------------" >> $CHECKDEV

sleep 30

CheckUSB=$(usbconfig)

echo $CheckUSB >> $LogFile
echo $CheckUSB >> $CHECKDEV

echo "---------CheckUSB--------------------" >> $LogFile
echo "---------CheckUSB--------------------" >> $CHECKDEV

if [ "$FirstUSB" = "$CheckUSB" ]; then
    echo "USB Devices are the same" >> $LogFile
    echo "USB Devices are the same" >> $CHECKDEV
else
    echo "USB Devices are different!" >> $LogFile
    echo "USB Devices are different!" >> $CHECKDEV
fi;
Counter=$(expr $Counter + 1)
if [ $Counter -ge 720 ]
then exit
fi
done

RIGHTNOW=$(date +"%m-%d-%y_%H-%M")

echo $RIGHTNOW >> $CHECKDEV
echo $RIGHTNOW >> $LogFile

echo "END" >> $CHECKDEV
echo "END" >> $LogFile

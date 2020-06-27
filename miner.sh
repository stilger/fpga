#!/bin/bash
#Variables
startpath=/root/fpga
nextjtagpath=$startpath/NextJtag/linux/bin

card=`echo "$1" |tr A-Z a-z`
algo=`echo "$2" |tr A-Z a-z`

if [ "$card" == "fk1" ]; then
	dna=4000000001234567890123456
elif [ "$card" == "fk2" ]; then
	dna=4000000001234567890123456
else
	echo "Syntax: miner.sh card algo"
	echo "Supported Algos: tellor odo"
	echo "Example: miner.sh fk1 tellor"
	exit
fi

if [ "$algo" == "odo" ]; then
	algopath=$startpath/sqrl/odo_sqrl
	voltage=0.78
	bit=odo_fk33_uart-i2c_1592352000.bit
	miner=odominer
	stratum=stratum+tcp://dgb-odocrypt.f2pool.com:11115
	user=odoaddress
	freq=850
elif [ "$algo" == "tellor" ]; then
	algopath=$startpath/sqrl/tellor
	voltage=0.78
	bit=tellor_fk33_uart.bit
	miner=telminer
	stratum=pplns.trb.stratum.hashpool.com:8208
	user=0telloraddress
	freq=900
else
	echo "Syntax: miner.sh card algo"
	echo "Supported Algos: tellor odo"
	echo "Example: miner.sh fk1 tellor"
	exit
fi

$nextjtagpath/nextjtag --dna $dna --set-voltage $voltage
echo "Flashing DNA: $dna"
$nextjtagpath/nextjtag --dna $dna --set-jtag-freq 30000000 -b $algopath/$bit

while true; do
	rmmod ftdi_sio
	echo "Starting miner with DNA: $dna"
	$algopath/$miner --stratum $stratum --user $user.$card --freq $freq --dna $dna | tee $card.log
	echo "Restarting the miner in 10 seconds..."
	sleep 10
done

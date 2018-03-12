#!/bin/bash
echo '0' > /proc/sys/kernel/nmi_watchdog
instructions=8
thread=1
while getopts "i:t:" arg
do
case $arg in
	i)
		instructions=$OPTARG
	;;
	t)
		thread=$OPTARG
	;;
        esac
done
toplev.py -I 1000 -l3 -x, -o tl-build.csv ~/pix2code/run.sh -i ${instructions} -t ${thread}
tl-barplot.py --cpu C0-T0 tl-build.csv -o ~/plot_${instruction}_${thread}.png

#!/bin/bash

busy=$(sadf  -td -- -dp | awk -F ';' -v VOLUME="$1" '$4 ~ VOLUME {print $12}' | tail -n 1)

if [ "$(echo "${busy} > 90" | bc)" -eq "1" ] ; then
        EXIT=2
elif [ "$(echo "${busy} < 80" | bc)" -eq "1" ] ; then
        EXIT=0
else
        EXIT=1
fi


echo "Volume activity: ${1} - ${busy}% | busy=${busy}%;80;90;0;100"
exit $EXIT

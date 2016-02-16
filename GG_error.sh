#!/bin/bash
###############################################################################
########### Arkadiusz Borucki
########### gg_err.sh - script is checking golden gate errors in ggserr.log
########### this script grep from last 10 minuts  in ggserr.log
########### if error occure return code 1 is provided
###############################################################################

GOLDEN_GATE_HOME=/GG/app/oracle/product/12.1.2/oggcore_1
ORACLE_HOME="/Oracle/app/oracle/product/db11g"

 
cd $GOLDEN_GATE_HOME

a=`awk -v d1="$(date --date="-11 min" "+%Y-%m-%d %H:%M:%S")" -v d2="$(date "+%Y-%m-%d %H:%M:%S")" '$0 > d1 && $0 < d2 || $0 ~ d2' ggserr.log | grep ERROR|wc -l`
echo $a
if [ $a -gt 0 ]; 
echo "errors occured in last 10 min in ggserr.log"
return 1
exit
fi

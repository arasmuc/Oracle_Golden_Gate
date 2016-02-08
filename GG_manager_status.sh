#!/bin/bash
#######################################################################
########### Arkadiusz Borucki
########### mgr_on.sh - script is checking golden gate mgr proccess status
########### returns 0 and 1
########### 1 - gg mgr problem
#######################################################################

GOLDEN_GATE_HOME=/GG/app/oracle/product/12.1.2/oggcore_1
ORACLE_HOME="/Oracle/app/oracle/product/db11g"

a=`ps aux | grep -v grep | grep mgr.prm | wc -l`
echo $a
if [ $a -eq 0 ]; 
echo "manager down"
return 1
exit
fi

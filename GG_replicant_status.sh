#!/bin/bash
#######################################################################
########### Arkadiusz Borucki
########### gg_on.sh - script is checking golden gate replicant proccess status
########### returns 0 and 1
########### 1 - rscatsdd problem
########### 2 - ralmasdd problem
########### 3 - ralmabeu problem
########### 4 - rscatbeu problem
########### 5 - ralmaeu2 problem
########### 6 - rscateu2 problem
#######################################################################

DBA="aborucki@xxxxx"
ORACLE_SID="ALMA"
GOLDEN_GATE_HOME=/GG/app/oracle/product/12.1.2/oggcore_1
ORACLE_HOME="/Oracle/app/oracle/product/db11g"

a=`ps aux | grep -v grep | grep rscatsdd | wc -l`
echo $a
if [ $a -eq 0 ]; 
echo "replicat catalog rscatsdd down"
return 1
exit
fi

b=`ps aux | grep -v grep | grep ralmasdd | wc -l`
echo $b
if [ $b -eq 0 ]; 
echo "replicat alma xml rscatsdd down"
return 2
exit
fi

c=`ps aux | grep -v grep | grep ralmabeu | wc -l`
echo $c
if [ $c -eq 0 ]; 
echo "replicat alma xml xml ralmabeu down"
return 3
exit
fi

d=`ps aux | grep -v grep | grep rscatbeu | wc -l`
echo $d
if [ $d -eq 0 ]; 
echo "replicat alma catalog rscatbeu down"
return 4
exit
fi

e=`ps aux | grep -v grep | grep ralmaeu2 | wc -l`
echo $e
if [ $e -eq 0 ]; 
echo "replicat xml  ralmaeu2 down"
return 5
exit
fi

f=`ps aux | grep -v grep | grep rscateu2 | wc -l`
echo $f
if [ $f -eq 0 ]; 
echo "replicat  catalog rscateu2 down"
return 6
exit
fi

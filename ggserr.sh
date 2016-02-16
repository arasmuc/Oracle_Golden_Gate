#!/bin/bash
##################################################################################
########### Arkadiusz Borucki
########### ggserr.sh - script is checking golden gate errors in ggserr.log
########### this script greping last 10 minuts  in ggserr.log
########### if declared error occured return code 1 is provided to Icinga
##################################################################################
GOLDEN_GATE_HOME=/GG/app/oracle/product/12.1.2/oggcore_1
cd $GOLDEN_GATE_HOME
declare -a errors=('OGG-01971' 'OGG-00987' 'OGG-01668' 'OGG-00963' );

error_chk()
{
for i in `awk -v d1="$(date --date="-11 min" "+%Y-%m-%d %H:%M:%S")" -v d2="$(date "+%Y-%m-%d %H:%M:%S")" '$0 > d1 && $0 < d2 || $0 ~ d2' ggserr.log |  awk -F ' ' '{print $4}'`;
do
 for ((j=0;j<=${#errors[@]};j++));
   do
     #echo ${errors[j]}
     if [ "${errors[j]}" == $i ]; then
        echo $i
        echo "error occured"
        return 1
        exit
     fi
   done
done
}

error_chk

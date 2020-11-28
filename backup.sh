#!/bin/bash

var_Date_Dir="/home/daniel/Backup_SH/"$(date "+20%y_%m_%d___%H_%M")"/"
mkdir $var_Date_Dir
cp /home/daniel/Bash_Project__PerformanceTest_for_Procedure_A/*sh $var_Date_Dir


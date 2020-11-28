#!/bin/bash


### Procedure_A definition:
###   --- executing 1 time function Fibonacci__92_10times from 'FUNCTIONS.sh' file (executed as Procedure_A.sh)


### Goal of Test:
###   --- calculating/checking with high accuracy how much CPU time is needed to execute Procedure_A


### Algorithm of test method, in pseudocode:
###
###   ------ Execution 100 times Procedure_A
###   ---------- for every execution of Procedure_A take Real CPU usage time (with 0,001 s accuracy)
###   -------------- use 'time' Linux command to get CPU time usage 
###   ----------- save all 100 results to text file (full_Time_Results.txt)
###   ------ save all 100 results to text file (full_Time_Results.txt)
###
###   ------ Results processing (full_Time_Results.txt):
###   ---------- use sed tool to process 'full_Time_Results.txt' to have only REAL CPU usage results
###   ---------- use sort tool to sort results
###   ---------- deleting from text file: 10% of the smallest results (10 samples) and 10% highest results (10 samples)
###   ------ Calculating/Discovering MEDIAN and MEDIUM values
###   -------- MEDIAN value - max two line of code (by using Linux tools)
###   -------- MEDIUM value - by using one loop





# import of dedicated functions:
source FUNCTIONS.sh





# MAIN


dirLog="LOGS__PerformanceTest_for_Procedure_A"


# checking if LOGS directory exists
 
if ! [ -d $dirLog ]
then 
mkdir $dirLog
fi

if [ -e $dirLog/full_Time_Results.txt ]
then
rm $dirLog/full_Time_Results.txt

#
################# Below 2 lines were just for condition test
# echo "removed"
# read -p "go..." INPUT
fi



# executing 'time ./Procedure_A.sh' x 100 and saving time`s results to te

for num in `seq 1 100`
do
{ time ./Procedure_A.sh 2> /dev/null ; } 2>> LOGS__PerformanceTest_for_Procedure_A/full_Time_Results.txt
#######
####### OR:
####### (time ./......) &> file
#######
done



# Results processing:

sed -n 's/^real[ ]*//p' < $dirLog/full_Time_Results.txt | sed -n 's/^.*0m//p' | cut -c 1-5 > $dirLog/prepared_Results.txt



# Sorting:

sort $dirLog/prepared_Results.txt > $dirLog/sorted_Results.txt


# Deleting 10% of the fastest and 10% of the longest samples:

head -90 $dirLog/sorted_Results.txt | tail -80 > $dirLog/ready_Results.txt


#
# End Results txt file definition:
#
end_Results=$dirLog/End_Results$(date "+__20%y_%m_%d___%H_%M.txt")

# Median value is:
median=$(sed -n '40 p' <$dirLog/ready_Results.txt)
echo ""
echo "Median value is: $median" > $end_Results


# Medium value is:

temp=0.000

while read LINE
do
temp=$( echo "scale=3;$temp+$LINE" | bc ) 
done < $dirLog/ready_Results.txt

medium=$(echo "scale=3; $temp/80" | bc )
echo "Medium value is: $medium" >> $end_Results

echo "I finished execution of: $0"
logger "I finished execution of: $0"

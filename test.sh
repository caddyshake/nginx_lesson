#/bin/bash
count_of_fail=$(grep Failed ~/dgoss.log | awk '{ print$4 }' | grep -Eo '[0-9]')

if [[ $count_of_fail == "0" ]];
then
	echo "Test was passed. Dont have any errors."
else
	echo "We have fail of test, please check dgoss.log for more information."
fi
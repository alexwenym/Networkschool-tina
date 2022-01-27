#
# this script asks to specify parameters for MESA nova simulation and starts it
#

export TERM=xterm

die () {
    echo ""
    echo >&2 "$@"
    echo ""
    exit 1
}

clear
echo ""

if [ $# -eq 0 ]
then
   echo "At least, one nova case must be given as an input argument!"
   die "Ending..."
elif [ $1 = "1" ]
then
   nova_case="co_nova_1.15_10_B_mixed"
elif [ $1 = "2" ]
then
   nova_case="ne_nova_1.3_20_X_weiss_mixed"
elif [ $1 = "3" ]
then
   nova_case="ne_nova_1.3_7_B_weiss_mixed"
elif [ $1 = "4" ]
then
   nova_case="ne_nova_1.15_12_X_weiss_mixed"
elif [ $1 = "5" ]
then
   nova_case="co_nova_1.15_12_X_mixed"
elif [ $1 = "6" ]
then
   nova_case="ne_nova_1.3_12_X_Barcelona"
elif [ $1 = "7" ]
then
   nova_case="ne_nova_1.3_15_X_Barcelona"
elif [ $1 = "8" ]
then
   nova_case="ne_nova_1.3_20_X_Barcelona"
else
   die "Selected nova case must be from 1 to 8. Ending..."
fi
echo "You have selected nova case $1 ($nova_case)."

echo "Deleting old output files..."
./clean_output

rm -f trajectory.input initial_abundance.dat
ln -s nova_cases/$nova_case/trajectory_$nova_case.input  trajectory.input
ln -s nova_cases/$nova_case/iniab_$nova_case.dat initial_abundance.dat

./ppn.exe

echo
echo Finished ppn run. Use Result_Explorer notebook to plot the results.

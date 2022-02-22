#
# this script asks to specify parameters for ccsn ppn simulation and starts it
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
   echo "At least, one ccsn case must be given as an input argument!"
   die "Ending..."
elif [ $1 = "1" ]
then
   ccsn_case="ccsn_cburning"
elif [ $1 = "2" ]
then
   ccsn_case="ccsn_oburning"
elif [ $1 = "3" ]
then
   ccsn_case="ccsn_siburning"
elif [ $1 = "4" ]
then
   ccsn_case="ccsn_gammaprocess"
else
   die "Selected ccsn case must be from 1 to 4. Ending..."
fi
echo "You have selected ccsn case $1 ($ccsn_case)."

echo "Deleting old output files..."
./clean_output

rm -f trajectory.input initial_abundance.dat
ln -s ccsn_cases/$ccsn_case/trajectory_$ccsn_case.input  trajectory.input
ln -s ccsn_cases/$ccsn_case/iniab_$ccsn_case.dat initial_abundance.dat

./ppn.exe

echo
echo Finished ppn run. Use Result_Explorer notebook to plot the results.

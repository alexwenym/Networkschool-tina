dirname=$1

rm -rf $dirname
mkdir $dirname
if [ -f flux_00001.DAT ] ; then mv flux_*.DAT $dirname ; fi
mv iso_massf*.DAT $dirname
mv x-time.dat $dirname
cp networksetup.txt isotopedatabase.txt *input $dirname
cp initial_abundance.dat trajectory.input $dirname

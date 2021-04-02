#!/bin/bash
# This script takes one argument which is the name
# of the directory into which a new clone of the 
# NuGrid/Networkschool-tina git repository
# https://github.com/NuGrid/Networkschool-tina
# will be copied and setup for running. 
#
# ARG1: name of your tina directory, e.g. your name
#
# Example usage: ./make_new_template.sh anna

if [ $# -eq 0 ]
  then
    echo
    echo "*** ERROR: No arguments supplied. ***"
    echo
    echo "Supply exactly one argument which is"
    echo "the name of your tina directory. Use"
    echo "for example your name"
    echo
    exit
fi

if [ $# -gt 1 ]
  then
      echo $#
    echo "More than one argument supplied"
    exit
fi



git clone https://github.com/NuGrid/Networkschool-tina.git $1
ln -s /data/NPDATA $1/NPDATA
ln -s /data/master-result $1/master-result
echo To run your first test type change into your directory:
echo $ cd $1
echo And then start the program by typing:
echo ./ppn
echo Both commands are launched by pressing the Return key.

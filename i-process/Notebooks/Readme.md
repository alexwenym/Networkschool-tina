# Additional notebooks 
The notebooks make some of the standard plots for heavy-element nucleosynthesis from the i-process one-zone simulation results created in this module. These are abundance and flux charts, elemental and isotopic abundance distribution plots as well as time-evolution plots of abundances. 

For elemental abundance distribution plots the simulation data can be plotted together with observational data. The i-process run of this modules can be compared with three different observations, as explained in the Readme.md file one directory up, the _weak_, _Sakurai's object_ (1st peak) and _2nd-peak_ CEMP-r/s stars. The only difference is that different cycles (or time steps) have to be used. For that reason in each of the notebooks in this directory at the top you have to select an observational `case` as well as the `rundir` which sets which run you are going to plot. 

You can instantiate different python data objects for different runs in order to compare them.
# CCSN (Core-Collapse SuperNova) nucleosynthesis in TINA

Start with the `Model-runner` notebook to run and save a simulation. Then use the `Result-Explorer` to plot a chart of isotopes. The `Rate-changer` notebook allows you to change reaction rates by a factor for a new run.

The model program is called `ppn.exe`. It takes temperature and density as functions of time from an ccsn model `trajectory.input` file. You can use one of the four available ccsn model trajectories that were extracted from zones of C, O, and Si burning in the $15 M_\odot$ CCSN model with the initial metallicity $Z=0.01$
from [paper](https://ui.adsabs.harvard.edu/abs/2016ApJS..225...24P/abstract). The fourth model simulates
gamma-p process. The choice of ccsn model cases is organized similar to the nova TINA project.

 One more detail for advanced users. The code can run in two modes. If `ININET  = 0` in the input file `ppn_physics.input` then a new network will be created with default choices for all reaction rates. This new generated network is written to the `networksetup.txt` file. The procedure described in the `Rate-Changer` notebook will apply changes to the `networksetup.txt` file. When run in mode `ININET  = 3` the code will read in the network from the current `networksetup.txt` file and not attempt to create a default. 
 
 This directory lives on Github: https://github.com/NuGrid/Networkschool-tina/tree/main/ccsn

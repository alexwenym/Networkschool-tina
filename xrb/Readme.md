# X-ray bursts in TINA

Start with the `Model-runner` notebook to run and save a simulation. Then use the `Result-Explorer` to plot a chart of isotopes. The `Rate-changer` notebook allows you to change reaction rates by a factor for a new run.




In the file `run_me.sh` you can select different nova cases that use their corresponding trajectories and initial abundances taken from the following reference:

[Denissenkov P.A., Truran J.W., Pignatari M., Trappitsch R., Ritter C., Herwig F., Battino U., Setoodehnia K., Paxton B. 2014. MESA and NuGrid simulations of classical novae: CO and ONe nova nucleosynthesis. Monthly Notices of the Royal Astronomical Society. 442:2058.](https://ui.adsabs.harvard.edu/abs/2014MNRAS.442.2058D/abstract)

 One more detail for advanced users: The code can run in two modes. If `ININET  = 0` in the input file `ppn_physics.input` then a new network will be created with default choices for all reaction rates. This new generated network is written to the `networksetup.txt` file. The procedure described in the `Rate-Changer` notebook will apply changes to the `networksetup.txt` file. When run in mode `ININET  = 3` the code will read in the network from the current `networksetup.txt` file and not attempt to create a default. 
 
 This directory lives on Github: https://github.com/NuGrid/Networkschool-tina/tree/main/nova

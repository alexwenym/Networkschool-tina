# X-ray bursts in TINA

Start with the `Model-runner` notebook to run and save a simulation. Then use the `Result-Explorer` to plot a chart of isotopes. The `Rate-changer` notebook allows you to change reaction rates by a factor for a new run.

The following cell executes the model program called `./ppn.exe`. It takes temperature and density as functions of time from an xrb model `trajectory.input` file. So far, you can use one of the two available xrb model trajectories, either `trajectory.input.xrb_mesa` that was extracted from an xrb `MESA` model, or 
`trajectory.input.xrb_example` from the NuGrid example `ppn_XRB_K04`. Choose one of these files and copy it to `trajectory.input` before running `./ppn.exe`.

 One more detail for advanced users: The code can run in two modes. If `ININET  = 0` in the input file `ppn_physics.input` then a new network will be created with default choices for all reaction rates. This new generated network is written to the `networksetup.txt` file. The procedure described in the `Rate-Changer` notebook will apply changes to the `networksetup.txt` file. When run in mode `ININET  = 3` the code will read in the network from the current `networksetup.txt` file and not attempt to create a default. 
 
 This directory lives on Github: https://github.com/NuGrid/Networkschool-tina/tree/main/nova

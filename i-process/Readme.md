# i-process in TINA

Start with the `Model-runner` notebook to run and save a simulation. Then use the `Result-Explorer` to plot a chart of isotopes. The `Rate-changer` notebook allows you to change reaction rates by a factor for a new run.

Find more analysis notebooks in the folder `Notebooks`. Some of the
plots in those notebooks require flux output which is by default turned off for new
runs. Turn it on by setting `iplot_flux_option = 1` in the input file
`ppn_frame.input`. 

The `master-result` folder does contain the default reference output including flux data. It is available as a compressed archive `tina-iprocess-master-result.tgz` in `/data/nugrid-data/projects/tina` which is also accessible via the Globus endpoint `astrohub#nugrid:/data/projects/tina`. You can extract this zipped tar archive into the present directory with the following command in a Python notebook:
```Python
!tar -xzvf /data/nugrid_data/projects/tina/tina-iprocess-master-result.tgz 
```



In the input file `ppn_frame.input` you can also select the different
initial abundances for the following cases:

Case | Reference
-----|----------
`2ndpeak` | [Denissenkov P. A., Herwig F., Perdikakis G., Schatz H. 2020. The impact of (n,$\gamma$) reaction rate uncertainties of unstable isotopes on the i-process nucleosynthesis of the elements from Ba to W. MNRAS, arXiv e-prints.:arXiv:2010.15798.](https://ui.adsabs.harvard.edu/abs/2020arXiv201015798D/abstract)
`Sakurai` | [Denissenkov P., Perdikakis G., Herwig F., Schatz H., Ritter C., Pignatari M., Jones S., Nikas S., Spyrou A. 2018. The impact of (n, γ) reaction rate uncertainties of unstable isotopes near N = 50 on the i-process nucleosynthesis in He-shell flash white dwarfs. Journal of Physics G Nuclear Physics. 45:055203.](https://ui.adsabs.harvard.edu/abs/2018JPhG...45e5203D/abstract)
`weak` | [McKay J. E., Denissenkov P. A., Herwig F., Perdikakis G., Schatz H. 2020. The impact of (n,γ) reaction rate uncertainties on the predicted abundances of I-process elements with 32 ≤ Z ≤ 48 in the metal-poor star HD94028. Monthly Notices of the Royal Astronomical Society. 491:5179.](https://ui.adsabs.harvard.edu/abs/2020MNRAS.491.5179M/abstract)

 One more detail for advanced users: The code can run in two modes. If `ININET  = 0` in the input file `ppn_physics.input` then a new network will be created with default choices for all reaction rates. This new generated network is written to the `networksetup.txt` file. The procedure described in the `Rate-Changer` notebook will apply changes to the `networksetup.txt` file. When run in mode `ININET  = 3` the code will read in the network from the current `networksetup.txt` file and not attempt to create a default. 
 
 This directory lives on Github: https://github.com/NuGrid/Networkschool-tina/tree/main/i-process
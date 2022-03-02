import numpy as np

# functions to get the p-isotope list

def get_isotope_data(isotope_array, abundance_array, isotope): 
    index = np.where(isotope_array == isotope)[0][0]
    return float(abundance_array[index])

def get_p_abundances(isotope_array, abundance_array):
    p_nucleides = ['Se-74',  'Kr-78',  'Sr-84',  'Mo-92',  'Mo-94',\
                   'Ru-96',  'Ru-98',  'Pd-102', 'Cd-106', 'Cd-108',\
                   'In-113', 'Sn-112', 'Sn-114', 'Sn-115', 'Te-120',\
                   'Xe-124', 'Xe-126', 'Ba-130', 'Ba-132', 'La-138',\
                   'Ce-136', 'Ce-138', 'Sm-144', 'Gd-152', 'Dy-156',\
                   'Dy-158', 'Er-162', 'Er-164', 'Yb-168', 'Hf-174',\
                   'Ta-180', 'W-180',  'Os-184', 'Pt-190', 'Hg-196']
    
    p_nucleides = np.asarray(p_nucleides)
    p_abundance_array = np.asarray([])
    
    for p in p_nucleides:
        iso = get_isotope_data(isotope_array, abundance_array, p)
        p_abundance_array = np.append(p_abundance_array, iso)
        
    return p_nucleides, p_abundance_array

# function to change a certain rate

def generate_mult_factors(): 
    
    generatorfile = 'new_mult_factors_generator'


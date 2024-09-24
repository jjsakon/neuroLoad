#!/bin/sh

#  Freeview_launcher.sh
#  
#
#  Created by Aditya Datta on 12/7/23.
#
# Will need to run following lines first so terminal can find freeview:
# source $FREESURFER_HOME sources.sh
# export FREESURFER_HOME=/Applications/freesurfer/7.4.1
# export SUBJECTS_DIR=$FREESURFER_HOME/subjects
# source $FREESURFER_HOME/SetUpFreeSurfer.sh
#  
bids=/Volumes/data/ImagingData/bids
derivs=${bids}/derivatives
fs=${derivs}/freesurfer_7.3.2

read -a sub -p "########### Enter Patient ID # ( 527, or list like 528 529 ... ): ";

for i in ${sub[@]}; do
    
    #Loads in relevant files
    t1=${fs}/sub-${i}/elec_loc/sub-${i}_desc-FS_T1w.nii.gz;
    
    micros=${fs}/sub-${i}/elec_loc/sub-${i}_space-FS_desc-micros_electrodes.nii.gz;
    macros=${fs}/sub-${i}/elec_loc/sub-${i}_space-FS_desc-macros_electrodes.nii.gz;
    
    t2_slab=${fs}/sub-${i}/mri/highres_T2star.FSspace.mgz;
    
#     lh_hc_amyg=${fs}/sub-${i}/mri/lh.hippoAmygLabels.mgz;
#     rh_hc_amyg=${fs}/sub-${i}/mri/rh.hippoAmygLabels.mgz;
#     
#     dkt_atlas=${fs}/sub-${i}/mri/aparc.DKTatlas+aseg.mgz;
#     
#     wm_parc=${fs}/sub-${i}/mri/wmparc.mgz;
#     
#     lh_pial=${fs}/sub-${i}/surf/lh.pial.T1;
#     rh_pial=${fs}/sub-${i}/surf/rh.pial.T1;
#     
#     lh_white=${fs}/sub-${i}/surf/lh.white;
#     rh_white=${fs}/sub-${i}/surf/rh.white;
    
    #Opens all files in Freeview
    freeview -v ${t1} ${micros}:colormap=lut ${macros}:colormap=lut ${t2_slab} ${lh_hc_amyg} ${rh_hc_amyg} ${dkt_atlas} ${wm_parc} -f ${lh_white}:edgecolor=blue ${rh_white}:edgecolor=blue ${lh_pial}:edgecolor=red ${rh_pial}:edgecolor=red;
done

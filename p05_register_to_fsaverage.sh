tcsh
setenv FREESURFER_HOME /Applications/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.csh
setenv SUBJECTS_DIR /Volumes/dml/frank/hires_landmark4_EEG_fMRI/data_fMRI/MPRAGES/all_subs/

foreach isub (s01)
# switch to fsaverage dir 
cd $SUBJECTS_DIR/
# register to fsaverage
fslregister --s fsaverage --mov $SUBJECTS_DIR/${isub}/mri/rawavg.mgz --reg $SUBJECTS_DIR/${isub}/${isub}_register_2_fsaverage.dat
# double check registration
tkmedit fsaverage T1.mgz -overlay $SUBJECTS_DIR/s01/corticalroi/s01_lh_ACC.nii -overlay-reg $SUBJECTS_DIR/s01/s01_register_2_fsaverage.dat -fthresh 0.5 -surface lh.white -aux-surface rh.white
# map roi to fsaverage surface
mri_vol2surf --mov $SUBJECTS_DIR/s01/corticalroi/s01_lh_ACC.nii --reg $SUBJECTS_DIR/${isub}/${isub}_register_2_fsaverage.dat --projdist-max 0 1 0.1 --interp nearest --hemi lh --out lh.fsaverage.ROI5.mgh --reshape

end 

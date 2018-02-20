#!/bin/sh
# set up freesurfer 
export FREESURFER_HOME=/Applications/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

for isub in sub01 sub02 sub05 sub06 sub07 sub08 sub10 sub11 sub13 sub14 sub15 sub16 sub17 sub19 sub20 sub21 sub22 sub23 sub24 sub25 sub26 sub27 sub28 sub29 sub30
	do
		SUBJECTS_DIR=/Users/Jordan/zoocon/images_ffx_par/$isub/structurals/$isub

		# check LH
		freeview -f $SUBJECTS_DIR/surf/lh.pial:annot=aparc.a2009s.annot --viewport 3d
		# check RH
		freeview -f $SUBJECTS_DIR/surf/rh.pial:annot=aparc.a2009s.annot --viewport 3d

		# look at subcort parcellation
		freeview -v $SUBJECTS_DIR/mri/T1.mgz $SUBJECTS_DIR/mri/aseg.mgz:colormap=lut:opacity=0.2



done
#!/bin/sh
export FREESURFER_HOME=/Applications/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

for isub in sub01 sub02 sub05 sub06 sub07 sub08 sub10 sub11 sub13 sub14 sub15 sub16 sub17 sub19 sub20 sub21 sub22 sub23 sub24 sub25 sub26 sub27 sub28 sub29 sub30
	do
		SUBJECTS_DIR=/Users/Jordan/zoocon/images_ffx_par/$isub/structurals # set subject specific ROI
		OUTDIR=$SUBJECTS_DIR/subcortical_roi
		mkdir $OUTDIR

		# register to anatomical t1 from free surfer space
		tkregister2 --mov $SUBJECTS_DIR/$isub/mri/rawavg.mgz --noedit --s $isub --regheader --reg $OUTDIR/${isub}_register.dat

		mri_convert $SUBJECTS_DIR/$isub/mri/aseg.mgz -ot nii $OUTDIR/${isub}_aseg2raw.nii
		# ## LH
		# fslmaths $OUTDIR/${isub}_aseg2raw.nii -uthr 17 -thr 17 $OUTDIR/${isub}_lh_hipp.nii.gz
		# fslmaths $OUTDIR/${isub}_lh_hipp.nii -div 17 $OUTDIR/${isub}_lh_hipp.nii.gz  # binarize
		# ## RH
		# fslmaths $OUTDIR/${isub}_aseg2raw.nii -uthr 53 -thr 53 $OUTDIR/${isub}_rh_hipp.nii.gz
		# fslmaths $OUTDIR/${isub}_rh_hipp.nii -div 53 $OUTDIR/${isub}_rh_hipp.nii.gz # binarize

		# # gunzip
		# gunzip $OUTDIR/${isub}_lh_hipp.nii.gz $OUTDIR/${isub}_rh_hipp.nii.gz
		# coregister to native space anatomical # investigate other registration techniques
		# mri_convert -rl $SUBJECTS_DIR/$isub/mri/rawavg.mgz -rt nearest $SUBJECTS_DIR/$isub/mri/aseg.mgz -ot nii $OUTDIR/${isub}_aseg2raw.nii

		# ## mask all other ROIS and make binary image of left (17) and right (53) hippo seperately
		# #LH
		# fslmaths $OUTDIR/${isub}_aseg2raw.nii -uthr 17 -thr 17 $OUTDIR/${isub}_lh_hipp.nii
		# fslmaths $OUTDIR/${isub}_lh_hipp.nii -div 17 $OUTDIR/${isub}_lh_hipp.nii  # binarize
		# #RH
		# fslmaths $OUTDIR/${isub}_aseg2raw.nii -uthr 53 -thr 53 $OUTDIR/${isub}_rh_hipp.nii
		# fslmaths $OUTDIR/${isub}_rh_hipp.nii -div 53 $OUTDIR/${isub}_rh_hipp.nii # binarize
		# # inspect in itk snap
		# # gunzip
		# gunzip $OUTDIR/${isub}_lh_hipp.nii.gz $OUTDIR/${isub}_rh_hipp.nii.gz
done
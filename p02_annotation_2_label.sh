#!/bin/sh
export FREESURFER_HOME=/Applications/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

for isub in s001 s002 s003 s004 s007 s008 s009 s010 s011
	do
		SUBJECTS_DIR=/Users/wbr/walter/fmri/sms_scan_analyses/crick_imac/FreeSurfer_sms_scan/$isub/002_mprage_sag_NS_g3
		OUTDIR=$SUBJECTS_DIR/corticalroi
		echo $OUTDIR # print subject specific direct
		# each vertex in the annotation gets a label
		# only grabs cortical ROIs
		mri_annotation2label --subject $isub --hemi lh --outdir $OUTDIR --annotation aparc.a2009s
		mri_annotation2label --subject $isub --hemi rh --outdir $OUTDIR --annotation aparc.a2009s
done





# tcsh
# setenv FREESURFER_HOME /Applications/freesurfer
# source $FREESURFER_HOME/SetUpFreeSurfer.csh
# setenv SUBJECTS_DIR /Volumes/dml/frank/hires_landmark4_EEG_fMRI/data_fMRI/MPRAGES/all_subs/

# foreach isub (s01 s03 s04 s05 s06 s07 s08 s09 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19)
# ## run for all steps
# set OUTDIR=$SUBJECTS_DIR${isub}

# ## step 2
# mri_annotation2label --subject ${isub} --hemi lh --outdir $OUTDIR/corticalroi --annotation aparc.a2009s
# mri_annotation2label --subject ${isub} --hemi rh --outdir $OUTDIR/corticalroi --annotation aparc.a2009s

# end
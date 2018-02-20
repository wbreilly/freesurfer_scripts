#!/bin/bash -l 
#
#SBATCH --job-name=sms_scan_surf
#SBATCH --output=/home/wbreilly/sms_scan_crick/FreeSurfer/logs/sms_scan_surf.%j.%N.out
#SBATCH --error=/home/wbreilly/sms_scan_crick/FreeSurfer/logs/sms_scan_surf.%j.%N.err
#SBATCH --nodes=1
#SBATCH -c 4
#SBATCH --time=5-00:00:00
#SBATCH --mem-per-cpu=2000 # 2gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=wbreilly@ucdavis.edu
#SBATCH --array=1-9


date 
hostname
module load freesurfer/6.0.0

source $FREESURFER_HOME/SetUpFreeSurfer.sh

# this is what JCD had at the beginnning of the non-array script
# #!/bin/sh
# export FREESURFER_HOME=/Applications/freesurfer
# source $FREESURFER_HOME/SetUpFreeSurfer.sh

for isub in sub01 sub02 sub05 sub06 sub07 sub08 sub10 sub11 sub13 sub14 sub15 sub16 sub17 sub19 sub20 sub21 sub22 sub23 sub24 sub25 sub26 sub27 sub28 sub29 sub30
	do
		SUBJECTS_DIR=/Users/Jordan/zoocon/images_ffx_par/$isub/structurals
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
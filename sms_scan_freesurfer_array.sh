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

SEEDFILE=/home/wbreilly/sms_scan_crick/FreeSurfer/scripts/sub_array.txt # this is a file with the subjects to run one line for each subject i.e. sub01 sub02 etc.
SEED=$(cat $SEEDFILE | head -n $SLURM_ARRAY_TASK_ID | tail -n 1) 

SUBJECTS_DIR=/home/wbreilly/sms_scan_crick/FreeSurfer/$SEED/002_mprage_sag_NS_g3/

cd $SUBJECTS_DIR
echo $SUBJECTS_DIR

OUTPUT="$(ls s*.nii)"
echo $OUTPUT

srun recon-all -s $SEED -i $OUTPUT -all


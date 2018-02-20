#!/bin/sh
# 
for isub in s001 # s002 s003 s004 s007 s008 s009 s010 s011
	do
		subj_dir=/Users/wbr/walter/fmri/sms_scan_analyses/crick_imac/FreeSurfer_sms_scan3/MMP1_native/$isub/masks
		cd subj_dir
		gzip -d -k *.nii.gz
done
#!/bin/sh
# rsync free surfer output files to local machine
# loop through subjects
for isub in s001 s002 s003 s004 s007 s008 s009 s010 s011 
	do
		echo $isub
		# rsync files in the freesurfer output folder
		rsync -avP wbreilly@crick.cse.ucdavis.edu:/home/wbreilly/sms_scan_crick/FreeSurfer/$isub/ /Users/wbr/walter/fmri/sms_scan_analyses/crick_imac/FreeSurfer_sms_scan/$isub/
done

		# rsync the other files freesurfer creates ## these files dont exist? Weird 
		# rsync -avP jecd@crick.cse.ucdavis.edu:/group/dml/jecd/zoocon/images_ffx_par_v3/$isub/structurals/rh.EC_average/ /Users/Jordan/zoocon/images_ffx_par/$isub/structurals/$isub/
		# rsync -avP jecd@crick.cse.ucdavis.edu:/group/dml/jecd/zoocon/images_ffx_par_v3/$isub/structurals/lh.EC_average/
		# rsync -avP jecd@crick.cse.ucdavis.edu:/group/dml/jecd/zoocon/images_ffx_par_v3/$isub/structurals/fsaverage/


# rsync -avP wbreilly@crick.cse.ucdavis.edu:/home/wbreilly/sms_scan_crick/FreeSurfer/logs/ /Users/wbr/walter/fmri/sms_scan_analyses/crick_imac/FreeSurfer_sms_scan/logs/
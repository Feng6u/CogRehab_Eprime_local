# CogRehab_Eprime_local
This is a script that resides in the CogRehab USB-stick for transferring data from the latpop used to collect E-prime data from the Brain Imaging Center (BIC) at the Royal Ottawa Mental Health Center.

It does the following: 
- asks user to input participant ID and Time Point (TP; 1 vs. 2)
- creates a folder in the format of ID_TP in the CogRehab_data folder on the USB stick
- copies e-prime output files (.edat3 files) for all functional magnetic resonance imaging (fMRI) tasks for the participant into the relavant folder on the USB stick
- moves all output files (.edat3 files, txt files, xml files) for all fMRI tasks for the participant into the data folder in CogRehab folder on the BIC computer where the Eprime data are collected. 

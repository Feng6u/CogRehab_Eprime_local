@echo off
REM echo off stops the terminal from printing each command line

REM This batch script copies data from the E-prime folder on computer to a USB-stick
REM Created by Feng Gu in Sept. 2019. Modified by Feng Gu in May 2020. 

REM ask user to enter participant and take user's input as the value for variable ID
set /P ID="What is the participant ID? (e.g.,CR000)" 

REM ask user to enter session point (e.g., 1 or 2) and take user's input as the value for variable SESSION
set /P SESSION="What is the session number? (e.g., 1)"

REM show this message to user 
echo Copying files for %ID% for session %SESSION%...

REM take only the digits (the last 3 characters of the variable ID) from participant ID as ID_num
set ID_num=%ID:~2,3%

REM take only the first digit from participant ID as group (0 is for healthy controls, 1 is for schizophrenia, 2 is for deprssion)
set GROUP=%ID:~2,1%

REM set ScriptDir as folder where the script is saved (i.e., this USB stick)
set ScriptDir=%~dp0

REM create a folder per participant per session, in the format of ID_TP
mkdir %ScriptDir%\CogRehab_data\%ID%_TP%SESSION%

REM copy all runs of VM encoding, VM recognition, EFN-back, false belief for that participant at that TP from E-prime folders to ID_TP folder on USB stick
for %%i in (Version_1, Version_2) do xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\1. VM_TP%SESSION%\Encoding\%%i\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%_TP%SESSION%
for %%i in (Version_1, Version_2) do xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\1. VM_TP%SESSION%\Recognition\%%i\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%_TP%SESSION%
xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\2. EFN_TP%SESSION%\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%_TP%SESSION%
xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\3. FB_TP%SESSION%\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%_TP%SESSION%

REM show the following message to user
echo ------------------------------------------------------------------------
echo.
echo Successfully copied all E-prime output files onto the USB disk. 
echo. 
echo Type a key to start moving files into Data folders on this computer.
echo.
echo ------------------------------------------------------------------------

pause

REM move all runs of VM encoding, VM recognition, EFN-back, false belief for that participant at that TP from E-prime folders to data sub-folder in each E-prime task folder
for %%i in (Version_1, Version_2) do move "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\1. VM_TP%SESSION%\Encoding\%%i\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\1. VM_TP%SESSION%\Encoding\data" 
for %%i in (Version_1, Version_2) do move "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\1. VM_TP%SESSION%\Recognition\%%i\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\1. VM_TP%SESSION%\Recognition\data" 
move "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\2. EFN_TP%SESSION%\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\2. EFN_TP%SESSION%\data" 
move "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\3. FB_TP%SESSION%\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP%SESSION%\3. FB_TP%SESSION%\data" 


REM show the following message to user
echo ------------------------------------------------------------------------
echo.
echo Successfully Completed! 
echo. 
echo Type a key to exit.
echo.
echo ------------------------------------------------------------------------

pause

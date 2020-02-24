REM echo off stops the terminal from printing each command line
@echo off

REM ask user to enter participant
set /P ID="What is the participant ID? (e.g.,CR000)" 

REM ask user to enter session point (e.g., 1 or 2)
set /P SESSION="What is the session number?"

REM show this message to user 
echo Copying files for %ID% for session %SESSION%...

REM take only the digits from participant ID as ID_num
set ID_num=%ID:~2,3%

REM take only the first digit from participant ID as group
set GROUP=%ID:~2,1%

REM set ScriptDir as folder where the script is saved (i.e., this USB stick)
set ScriptDir=%~dp0

REM decide if the particiapnt is a HC or a patient. then create one folder for HC. create two folders for two time points for patients.
if %GROUP%==0 mkdir %ScriptDir%\CogRehab_data\%ID% %ScriptDir%\CogRehab_data\%ID%\TP1

if %GROUP%==1 if %SESSION%==1 mkdir %ScriptDir%\CogRehab_data\%ID% %ScriptDir%\CogRehab_data\%ID%\TP1
if %GROUP%==1 if %SESSION%==2 mkdir %ScriptDir%\CogRehab_data\%ID%\TP2

if %GROUP%==2 if %SESSION%==1 mkdir %ScriptDir%\CogRehab_data\%ID% %ScriptDir%\CogRehab_data\%ID%\TP1
if %GROUP%==2 if %SESSION%==2 mkdir %ScriptDir%\CogRehab_data\%ID%\TP2


REM for time point 1, copy all runs of VM encoding, VM recognition, EFN-back, false belief from E-prime folders to USB stick
for %%i in (Version_1, Version_2) do if %SESSION%==1 xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\1. VM_TP1\Encoding\%%i\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%\TP1
for %%i in (Version_1, Version_2) do if %SESSION%==1 xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\1. VM_TP1\Recognition\%%i\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%\TP1
if %SESSION%==1 xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\2. EFN_TP1\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%\TP1
if %SESSION%==1 xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\3. FB_TP1\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%\TP1

REM for time point 2, copy all runs of VM encoding, VM recognition, EFN-back, false belief from E-prime folders to USB stick
for %%i in (Version_1, Version_2) do if %SESSION%==2 xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\1. VM_TP2\Encoding\%%i\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%\TP2
for %%i in (Version_1, Version_2) do if %SESSION%==2 xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\1. VM_TP2\Recognition\%%i\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%\TP2
if %SESSION%==2 xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\2. EFN_TP2\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%\TP2
if %SESSION%==2 xcopy "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\3. FB_TP2\*-%ID_num%-*.edat3" %ScriptDir%\CogRehab_data\%ID%\TP2

REM show the following message to user
echo ------------------------------------------------------------------------
echo.
echo Successfully copied all E-prime output files onto the USB disk. 
echo. 
echo Type a key to start moving files into Data folders on this computer.
echo.
echo ------------------------------------------------------------------------

pause

REM for time point 1, move all runs of VM encoding, VM recognition, EFN-back, false belief from E-prime folders to data sub-folder in each E-prime task folder
for %%i in (Version_1, Version_2) do if %SESSION%==1 move "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\1. VM_TP1\Encoding\%%i\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\1. VM_TP1\Encoding\data" 
for %%i in (Version_1, Version_2) do if %SESSION%==1 move "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\1. VM_TP1\Recognition\%%i\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\1. VM_TP1\Recognition\data" 
if %SESSION%==1 move "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\2. EFN_TP1\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\2. EFN_TP1\data" 
if %SESSION%==1 move "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\3. FB_TP1\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP1\3. FB_TP1\data" 


REM for time point 2, move all runs of VM encoding, VM recognition, EFN-back, false belief from E-prime folders to data sub-folder in each E-prime task folder
for %%i in (Version_1, Version_2) do if %SESSION%==2 move "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\1. VM_TP2\Encoding\%%i\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\1. VM_TP2\Encoding\data" 
for %%i in (Version_1, Version_2) do if %SESSION%==2 move "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\1. VM_TP2\Recognition\%%i\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\1. VM_TP2\Recognition\data" 
if %SESSION%==2 move "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\2. EFN_TP2\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\2. EFN_TP2\data" 
if %SESSION%==2 move "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\3. FB_TP2\*-%ID_num%-*.*" "C:\Users\crani\Desktop\CogRehab_Guimond\TP2\3. FB_TP2\data" 


REM show the following message to user
echo ------------------------------------------------------------------------
echo.
echo Successfully Completed! 
echo. 
echo Type a key to exit.
echo.
echo ------------------------------------------------------------------------

pause

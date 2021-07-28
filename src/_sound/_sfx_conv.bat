@echo off
SETLOCAL EnableDelayedExpansion
set PRESERVE=abcdefghijklmnopqrstuvwxyz1234567890

if [%1]==[] goto Message

set FILE=%~n1
call :FixName FILE PROJECT=

..\..\bin\SMPS2ASM.EXE %1 ..\..\smps?SFX %PROJECT%

goto :End

:FixName filename newFilename=
set %2=
:nextChar
   set "char=!%1:~0,1!"
   if "!PRESERVE:%char%=!" neq "%PRESERVE%" set "%2=!%2!%char%"
   set "%1=!%1:~1!"
if defined %1 goto nextChar
exit /b

:Message
echo Drag and drop the SMPS file onto this batch file to convert it

:End
pause
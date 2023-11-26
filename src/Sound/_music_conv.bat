@echo off
SETLOCAL EnableDelayedExpansion
set PRESERVE=abcdefghijklmnopqrstuvwxyz1234567890

if [%1]==[] goto Message

set FILE=%~n1
call :FixName FILE PROJECT=

..\..\bin\SMPSOPT.EXE S1 %1 "%~n1.opt.bin"
..\..\bin\SMPS2ASM.EXE "%~n1.opt.bin" ..\..\amps %PROJECT%
del "%~n1.opt.bin" > nul
ren "%~n1.opt.asm" "%~n1.asm"

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
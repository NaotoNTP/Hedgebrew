@echo off

set ROM=prism.md
set /a "PAD=1"

..\bin\asm68k /m /p Main.asm, %ROM%, , _LISTINGS_.lst>%ROM%.log
type %ROM%.log
if not exist %ROM% pause & exit
echo.
if "%PAD%"=="1" ..\bin\rompad %ROM% 255 0
..\bin\fixheader %ROM%
"_ERROR_/ConvSym.exe" %ROM%.sym %ROM% -input asm68k_sym -a
del %ROM%.log
del %ROM%.sym
echo.

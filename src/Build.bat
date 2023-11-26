@echo off

set ROM=ROM
set /a "PAD=1"

IF EXIST %ROM%.mdrv move /Y %ROM%.mdrv %ROM%_prev.mdrv >NUL
Utilities\Assembler\asm68k.exe /m /p Main.asm, %ROM%.mdrv, , _LISTINGS.lst>_ERROR.log
type _ERROR.log
if not exist %ROM%.mdrv pause & exit
echo.
if "%PAD%"=="1" Utilities\rompad.exe %ROM%.mdrv 255 0
Utilities\fixheadr.exe %ROM%.mdrv
"Config/Error/ConvSym.exe" _SYMBOLS.sym %ROM%.mdrv -input asm68k_sym -a
del _ERROR.log
del _SYMBOLS.sym
echo.

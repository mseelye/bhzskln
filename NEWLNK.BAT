@echo off
:: DOSBox compatible new mdf util
::  Used by NEWMOD.BAT
::
::  BHZ Skeleton Module for MBBS v6.x
::  Mark Seelye (bhz) 2023
::  burninghorizon.com, bhz.co

:: 4 required args
IF "%4"=="" goto usage
set _modnam=%1
set _pharlib=%2
set _bbsdir=%3
set _file=%4

:: Make a Module's default LNK File
@echo %_pharlib%\c0phdll + > %_file%
@echo %_bbsdir%\phobj\%_modnam% >> %_file%
@echo %_bbsdir%\%_modnam% >> %_file%
@echo nul >> %_file%
@echo phapi galimp msgimp gsblimp /Tdd /s /n >> %_file%
@echo %_bbsdir%\dlib\nodef >> %_file%

goto end

:usage
echo.
echo Create new default LNK file (DOSBox compatible) v0.1
echo   (used by NEWMOD.BAT)
echo.
echo  BHZ Skeleton Module for MBBS v6.x
echo  Mark Seelye (bhz) 2023
echo  burninghorizon.com, bhz.co
echo.
echo USAGE:
echo   NEWLNK.BAT MODNAM PHARLIBPATH BBSPATH FILE
echo     MODNAM is the name of your mod, usually Dev ID + Mod Id (EX: BHZSKLN)
echo     PHARLIBPATH is the path to your pharlib dir. (typically c:\run286\bc3\lib)
echo     BBSPATH is the path to your bbs install dir. (typically c:\bbsv6)
echo     FILE is the path/filename for output LNK file.
echo       Ex: c:\bbsv6\SRC\FOO\BARRR\FOOBARRR.LNK
echo   Notes:
echo       For best effect enter MODNAM in ALL CAPS
echo.
echo     Examples: 
echo       NEWLNK.BAT BHZBLURP c:\run286\bc3\lib c:\bbsv6 c:\newsrc\BHZBLURP.LNK
echo          Creates new LNK file in C:\newsrc\ called BHZBLURP.LNK
echo.

goto end

:end

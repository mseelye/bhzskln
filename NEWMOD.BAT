@echo off
:: DOSBox compatible newproject batch file
::  BHZ Skeleton Module for MBBS v6.x
::  Mark Seelye (bhz) 2023
::  burninghorizon.com, bhz.co

:: Defaults
set _modmaindef=MODMAIN
set _modmain=%_modmaindef%
set _drdef=C:
set _bbsdef=BBSV6
set _srcdirdef=SRC
set _dr=%_drdef%
set _bbs=%_bbsdef%
set _srcdir=%_srcdirdef%

:: 2 required args
:: devid and modid
IF "%2"=="" goto usage

:: optional args
:: modmain, drive (c:, d: etc.), bbs dir (bbsv6, mbbs, etc.), src dir ("src" etc)
IF "%3"=="" goto arg4
set _modmain=%3
:arg4
IF "%4"=="" goto arg5
set _dr=%4
:arg5
IF "%5"=="" goto arg6
set _bbs=%5
:arg6
IF "%6"=="" goto start
set _srcdir=%6

:start
IF "%_modmain%"=="%_devid%%_modid%" goto notsame
set _devid=%1
set _modid=%2
set _name=%_devid%%_modid%
set _bbsdir=%_dr%\%_bbs%
set _bbssrc=%_bbsdir%\%_srcdir%
set _dest=%_bbssrc%\%_devid%\%_modid%
set _from=BHZSKLN
set _c=""

:devdir
IF EXIST %_bbssrc%\%_devid% goto moddir
mkdir %_bbssrc%\%_devid%

:moddir
IF EXIST %_bbssrc%\%_devid%\%_modid% goto files
mkdir %_bbssrc%\%_devid%\%_modid%
:: No loops in DOSBox batch :(

:files
:file1
set _ext=BCR
set _file=%_dest%\%_name%.%_ext%
IF EXIST %_file% goto file2
COPY %_from%.%_ext% %_file% > nul
set _c=%_file%

:file2
set _ext=MDF
set _file=%_dest%\%_name%.%_ext%
IF EXIST %_file% goto file3
set _c=%_c%,%_file%
CALL NEWMDF.BAT %_name% %_file%

:file3
set _ext=MSG
set _file=%_dest%\%_name%.%_ext%
IF EXIST %_file% goto file4
COPY %_from%.%_ext% %_file% > nul
set _c=%_c%,%_file%

:file4
set _file=%_dest%\%_modmain%.C
IF EXIST %_file% goto file5
COPY MODMAIN.C %_file% > nul
set _c=%_c%,%_file%

:file5
set _file=%_dest%\%_modmain%.H
IF EXIST %_file% goto file6
COPY MODMAIN.H %_file% > nul
set _c=%_c%,%_file%

:file6
set _file=%_dest%\MODDEFS.H
IF EXIST %_file% goto file7
set _c=%_c%,%_file% > %_file%
CALL NEWDEFS.BAT %_name% %_modmain% %_file%

:file7
set _ext=LNK
set _file=%_dest%\%_name%.%_ext%
IF EXIST %_file% goto makefile1
set _c=%_c%,%_file% > %_file%
CALL NEWLNK.BAT %_name% %_dr%\run286\bc3\lib %_bbsdir% %_file%

:makefile1
set _file=%_dest%\MAKEFILE.INC
IF EXIST %_file% goto otherfiles
set _c=%_c%,%_file%
CALL NEWINC.BAT %_devid% %_modid% %_modmain% %_dr% %_bbs% %_srcdir% %_file%

:otherfiles
COPY MAKEFILE.MAK MAKEMOD.BAT BATS.INC DSBXWARP.INC MAKEMSGS.INC %_dest%\. > nul
COPY MKHELP.TXT LICENSE %_dest%\. > nul

:nextsteps
IF %_c%=="" goto nothing

:done
echo Done!
goto outdir

:nothing
echo.
echo Nothing to do!
:outdir
echo.
cd %_dest%
dir /w %_dest%
echo.
goto end

:usage
echo.
echo Create new project batch (DOSBox compatible) v0.1
echo.
echo  BHZ Skeleton Module for MBBS v6.x
echo  Mark Seelye (bhz) 2023
echo  burninghorizon.com, bhz.co
echo.
echo USAGE:
echo   NEWMOD.BAT DID MODID [[MODMAIN] [[Drive] [BBSv6 dir] [src]]]
echo     DID is your desired dev id.  ex: ABC (3 characters)
echo     MODID is your desired module id.  ex: BLURP (1-5 characters)
echo     [MODMAIN] optional, can't be [DID]+[MODID]! Defaults to %_modmaindef%
echo     [Drive] [BBSv6 dir] [src] all optional, defaults to %_drdef% %_bbsdef% %_srcdirdef%
echo     Notes: 
echo       For best effect enter DID and MODID in ALL CAPS
echo       To specify optional components, must also specify all args to the left.
echo.
echo     Examples: 
echo       NEWMOD.BAT BHZ BLURP
echo          Would create a new mod in %_bbssrcdef%\BHZ\BLURP\
echo          With the main C/H files called %_modmain%.C/H
echo       NEWMOD.BAT BHZ BLURP BLURPMOD
echo          Same but the main C/H files called BLURPMOD.C/H
echo       NEWMOD.BAT BHZ BLURP BLURPMOD f: mbbs src
echo          Same as before but in f:\mbbs\src\BHZ\BLURP\
echo.         Note: f: mbbs src are all separate, not f:\mbbs\src!

goto end

:notsame
echo.
echo ERROR:
echo  [MODMAIN] can't be [DID]+[MODID]!
echo  Using %_devid%+%_modid% for MODMAIN will conflict with bbsmsx's output .H file!

:end

# BHZ Skeleton MBBS v6.x simple module makefile example
#   Mark Seelye (bhz) 2023 - burninghorizon.com, bhz.co
#   Very simple/explicit makefile example without weird ansi and targets
#   Isn't included in NEWMOD.BAT because lazy.
#   Notes:
#     VIR target need to firest run c:\bbsv6\btrieve.exe
#     MAKE v3.6 doesn't have .phony, so there is a phony kludge here
#     @ prefix seems to be ignored, using > nul

.autodepend
.nosilent
.noignore
.path.c=c:\bbsv6\src\bhz\skln
.path.h=c:\bbsv6\src\bhz\skln
.path.dll=c:\bbsv6
.path.obj=c:\bbsv6\phobj

all: phony.mdf bhzskln.vir bhzskln.dll

bhzskln.dll : bhzskln.obj c:\bbsv6\dlib\galimp.lib c:\run286\bc3\lib\phapi.lib
  @cd c:\bbsv6\src\bhz\skln > nul
  ltdll bhzskln

phony.mdf : bhzskln.mdf
  @cd c:\bbsv6\src\bhz\skln > nul
  @copy bhzskln.mdf phony.mdf > nul
  @copy phony.mdf c:\bbsv6\bhzskln.mdf > nul
  @touch phony.mdf > nul

bhzskln.obj : modmain.c modmain.h bhzskln.h moddefs.h
  @cd c:\bbsv6\src\bhz\skln > nul
  # ctdll modmain
  bcc -oc:\bbsv6\phobj\bhzskln.obj @\bbsv6\src\makdll.cfg modmain

bhzskln.h : phony.msg
  @cd c:\bbsv6 > nul
  bbsmsx bhzskln
  @cd c:\bbsv6\src\bhz\skln > nul
  @copy c:\bbsv6\bhzskln.h . > nul

phony.msg : bhzskln.msg
  @cd c:\bbsv6\src\bhz\skln > nul
  @copy bhzskln.msg phony.msg > nul
  @copy phony.msg c:\bbsv6\bhzskln.msg > nul
  @touch phony.msg > nul

bhzskln.vir : bhzskln.bcr
  # must first run c:\bbsv6\btrieve.exe
  #  or uncomment this:
  #@-c:\bbsv6\btrieve.exe > nul
  @cd c:\bbsv6\src\bhz\skln > nul
  butil -create bhzskln.vir bhzskln.bcr
  @copy bhzskln.vir c:\bbsv6\. > nul

# Purge files from deploy directory
# Note: There are more elegant ways to do 'clean' with make
# but this is more clear and explicit.
clean : 
  @cd c:\bbsv6 > nul
  @del bhzskln.vir > nul
  @del bhzskln.dll > nul
  @del bhzskln.h > nul
  @del bhzskln.mcv > nul
  @del bhzskln.mdf > nul
  @del bhzskln.msg > nul
  @del PHOBJ\bhzskln.obj > nul
  @cd c:\bbsv6\src\bhz\skln > nul
  @del phony.* > nul
  @del bhzskln.vir > nul
  @del bhzskln.h > nul

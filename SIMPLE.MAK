# BHZ Skeleton MBBS v6.x simple module makefile example
#   Mark Seelye (bhz) (c)2023 
#   burninghorizon.com, bhz.co
#   mseelye@yahoo.com
#
#   Very simple/explicit makefile example without weird ansi, includes and targets
#   Isn't included in NEWMOD.BAT because lazy.
#
#   Notes:
#     VIR target need to firest run c:\bbsv6\btrieve.exe
#     MAKE v3.6 doesn't have .phony, so there is a phony kludge here
#     @ prefix seems to be ignored, using > nul

.autodepend
.nosilent
.noignore
.path.dll=c:\bbsv6
.path.obj=c:\bbsv6\phobj

all: phony.mdf bhzskln.vir bhzskln.dll

bhzskln.dll : bhzskln.obj c:\bbsv6\dlib\galimp.lib c:\run286\bc3\lib\phapi.lib
  # ltdll bhzskln
  tlink /Lc:\run286\bc3\lib;c:\bbsv6\dlib @bhzskln.lnk

phony.mdf : bhzskln.mdf
  @copy bhzskln.mdf phony.mdf > nul
  @copy phony.mdf c:\bbsv6\bhzskln.mdf > nul
  @touch phony.mdf > nul

bhzskln.obj : modmain.c modmain.h bhzskln.h moddefs.h
  # ctdll modmain
  bcc -oc:\bbsv6\phobj\bhzskln.obj -Ic:\bbsv6\src -Ic:\run286\inc @c:\bbsv6\src\makdll.cfg modmain

bhzskln.h : phony.msg
  c:\bbsv6\bbsmsx bhzskln
  @copy bhzskln.mcv c:\bbsv6\bhzskln.mcv > nul

phony.msg : bhzskln.msg
  @copy bhzskln.msg phony.msg > nul
  @copy phony.msg c:\bbsv6\bhzskln.msg > nul
  @touch phony.msg > nul

bhzskln.vir : bhzskln.bcr
  @-c:\bbsv6\btrieve.exe > nul
  butil -create bhzskln.vir bhzskln.bcr
  @copy bhzskln.vir c:\bbsv6\. > nul

# Purge files from deploy directory
# Note: There are more elegant ways to do 'clean' with make
# but this is more clear and explicit.
clean : 
  @del c:\bbsv6\bhzskln.vir > nul
  @del c:\bbsv6\bhzskln.dll > nul
  @del c:\bbsv6\bhzskln.h > nul
  @del c:\bbsv6\bhzskln.mcv > nul
  @del c:\bbsv6\bhzskln.mdf > nul
  @del c:\bbsv6\bhzskln.msg > nul
  @del c:\bbsv6\phobj\bhzskln.obj > nul
  @del phony.* > nul
  @del bhzskln.map > nul
  @del bhzskln.mcv > nul
  @del bhzskln.vir > nul
  @del bhzskln.h > nul

# BHZ Skeleton MBBS v6.x simple module makefile
#   Mark Seelye (bhz) 2023 - burninghorizon.com, bhz.co
#   Simple, but extendable makefile example without weird ansi and targets
#   Notes:
#     VIR target need to firest run c:\bbsv6\btrieve.exe
#     MAKE v3.6 doesn't have .phony, so there is a phony kludge here
#     @ prefix seems to be ignored, using > nul

# DEVID=BHZ
# MODID=SKLN
!include "MAKEFILE.INC"
MODULE=$(DEVID)$(MODID)
BBS=\BBSV6
PHARLIB=\RUN286\BC3\LIB\PHAPI.LIB
BBSSRC=$(BBS)\SRC
MODSRC=$(BBSSRC)\$(DEVID)\$(MODID)
MODMAIN=MODMAIN

# If you're using DOSBox use/modify the folowing for CTDLL and LTDLL
# DOSBox BAT files don't seem to return error status well to MAKE
CTDLL=bcc -o$(BBS)\phobj\$(MODULE).OBJ @$(BBSSRC)\makdll.cfg
LTDLL=tlink @$(MODULE).LNK | REM
# use the actual CTDLL, LTDLL if not DOSBox, or if you don't care about errors
# CTDLL=ctdll
# LTDLL=ltdll

.autodepend
.nosilent
.noignore
.path.c=$(MODSRC)
.path.h=$(MODSRC)
.path.dll=$(BBS)
.path.obj=$(BBS)\phobj

all : PHONY.MDF $(MODULE).VIR $(MODULE).DLL

$(MODULE).DLL : $(MODULE).obj $(BBS)\dlib\galimp.lib $(PHARLIB)
  @cd $(MODSRC) > nul
  $(LTDLL) $(MODULE)

PHONY.MDF : $(MODULE).MDF
  @cd $(MODSRC) > nul
  @copy $(MODULE).MDF PHONY.MDF > nul
  copy $(MODULE).MDF $(BBS)\$(MODULE).MDF
  @touch PHONY.MDF > nul

$(MODULE).OBJ : $(MODMAIN).C $(MODMAIN).H $(MODULE).H MODDEFS.H
  @cd $(MODSRC) > nul
  $(CTDLL) $(MODMAIN)

$(MODULE).H : PHONY.MSG
  @cd $(BBS) > nul
  bbsmsx $(MODULE)
  @cd $(MODSRC) > nul
  @copy $(BBS)\$(MODULE).h . > nul

PHONY.MSG: $(MODULE).MSG
  @cd $(MODSRC) > nul
  @copy $(MODULE).MSG PHONY.MSG > nul
  copy $(MODULE).MSG $(BBS)\$(MODULE).MSG
  @touch PHONY.MSG

$(MODULE).VIR : $(MODULE).BCR
  @-$(BBS)\btrieve.exe > nul
  cd $(MODSRC)
  butil -create $(MODULE).VIR $(MODULE).BCR
  @copy $(MODULE).VIR $(BBS)\. > nul

# Clean, show status
clean : purge
  $(STATUS)

# Purge files from deploy directory
# Note: There are more elegant ways to do 'clean' with make
# but this is more clear and explicit.
purge :
  @cd $(BBS) > nul
  @del $(MODULE).VIR > nul
  @del $(MODULE).DLL > nul
  @del $(MODULE).H > nul
  @del $(MODULE).MCV > nul
  @del $(MODULE).MDF > nul
  @del $(MODULE).MSG > nul
  @del PHOBJ\$(MODULE).OBJ > nul
  @cd $(MODSRC) > nul
  @del PHONY.* > nul
  @del $(MODULE).VIR > nul
  @del $(MODULE).H > nul

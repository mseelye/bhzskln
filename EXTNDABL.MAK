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
BBS=C:\BBSV6
PHARINC=C:\RUN286\INC
PHARLIB=C:\RUN286\BC3\LIB
BBSSRC=$(BBS)\SRC
MODSRC=$(BBSSRC)\$(DEVID)\$(MODID)

.autodepend
.nosilent
.noignore
.path.dll=$(BBS)
.path.obj=$(BBS)\PHOBJ

all : PHONY.MDF $(MODULE).VIR $(MODULE).DLL

$(MODULE).DLL : $(MODULE).obj $(BBS)\DLIB\GALIMP.LIB $(PHARLIB)\PHAPI.LIB
  # ltdll $(MODULE)
  TLINK /L$(PHARLIB);$(BBS)\DLIB @$(MODULE).LNK

PHONY.MDF : $(MODULE).MDF
  @copy $(MODULE).MDF PHONY.MDF > nul
  copy $(MODULE).MDF $(BBS)\$(MODULE).MDF
  @touch PHONY.MDF > nul

$(MODULE).OBJ : $(MODMAIN).C $(MODMAIN).H $(MODULE).H MODDEFS.H
  # ctdll $(MODMAIN)
  bcc -o$(BBS)\phobj\$(MODULE).OBJ -I$(BBSSRC) -I$(PHARINC) @$(BBSSRC)\makdll.cfg $(MODMAIN)

$(MODULE).H : PHONY.MSG
  $(BBS)\bbsmsx $(MODULE)
  @copy $(MODULE).MCV $(BBS)\$(MODULE).MCV > nul

PHONY.MSG: $(MODULE).MSG
  @copy $(MODULE).MSG PHONY.MSG > nul
  copy $(MODULE).MSG $(BBS)\$(MODULE).MSG
  @touch PHONY.MSG > nul

$(MODULE).VIR : $(MODULE).BCR
  @-$(BBS)\btrieve.exe > nul
  butil -create $(MODULE).VIR $(MODULE).BCR
  @copy $(MODULE).VIR $(BBS)\$(MODULE).VIR > nul

# Clean, show status
clean : purge
  $(STATUS)

# Purge files from deploy directory
# Note: There are more elegant ways to do 'clean' with make
# but this is more clear and explicit.
purge :
  @del $(BBS)\$(MODULE).VIR > nul
  @del $(BBS)\$(MODULE).DLL > nul
  @del $(BBS)\$(MODULE).H > nul
  @del $(BBS)\$(MODULE).MCV > nul
  @del $(BBS)\$(MODULE).MDF > nul
  @del $(BBS)\$(MODULE).MSG > nul
  @del $(BBS)\PHOBJ\$(MODULE).OBJ > nul
  @del PHONY.* > nul
  @del $(MODULE).MAP > nul
  @del $(MODULE).MCV > nul
  @del $(MODULE).VIR > nul
  @del $(MODULE).H > nul

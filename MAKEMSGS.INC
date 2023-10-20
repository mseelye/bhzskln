#
# Common MSGS
#
CLEAN_BBS_START=Clean deployed $(MODNAM) files in $(BBS) and $(BBS)\phobj... 
TIDY_SRC_START=Tidying transient files in (current) module source dir...
DIST_START=Building module and deploying to .\dist\ dir...

!ifndef QUIET
ECHO=@echo
DIR=@dir
Q= 
QE= 
!endif
!ifdef QUIET
ECHO=@REM
DIR=@REM
Q=@
QE= > nul
!endif

#
# Plain messages
#
!ifndef PRETTY
ALL_START=Building $(MODNAM)...
GEN_START=Building $....
DLL_START=$(GEN_START)
LNK_START=$(GEN_START)
MDF_START=Deploying $(MODNAM).MDF file to $(BBS)...
OBJ_START=$(GEN_START)
MNH_START=Building $(MODNAM).MSG, $(MODNAM).MCV, $(MODNAM).H files...
MSG_START=Deploying $(MODNAM).MSG message file to $(BBS)\...
BT_START=Starting Btrieve (if not started)...
VIR_START=Creating blank $(MODNAM).VIR database file...
WARP_START=DOSBox warp: engaged!
WARP_DONE=DOSBox warp: disengaged!
ALL_DONE=Done.
!endif

#
# "Pretty"/ANSI messages
#
!ifdef PRETTY
# Clear and save
ESCS = [2J[s
# return to save, move down one, clr line, save, right
ESC1 = [u[1B[K[s  * 
ESCDONE = $(ESC1)[4D[K
ESCSTATUS = [K
ESCB = [1;34m
ESCG = [1;32m
ESCY = [1;33m
ESCZ = [0m

ALL_START=$(ESCS)$(ESCG)Building $(MODNAM)$(ESCZ)...
DLL_START=$(ESC1)$(ESCY)LTDLL: $(ESCZ)Building $(MODNAM).DLL...
LNK_START=$(ESC1)$(ESCY)LNK: $(ESCZ)Building $(MODNAM).LNK file...
MDF_START=$(ESC1)$(ESCY)COPY: $(ESCZ)Deploying $(MODNAM).MDF file to $(BBS)...
OBJ_START=$(ESC1)$(ESCY)CTDLL: $(ESCZ)Building $(MODNAM).OBJ...
MNH_START=$(ESC1)$(ESCY)BBSMSX: $(ESCZ)Building $(MODNAM).MSG, $(MODNAM).MCV, $(MODNAM).H files...
MSG_START=$(ESC1)$(ESCY)COPY: $(ESCZ)Deploying $(MODNAM).msg message file to $(BBS)\...
BT_START=$(ESC1)$(ESCY)BTRIEVE: $(ESCZ)Starting Btrieve (if not started)...
VIR_START=$(ESC1)$(ESCY)BUTIL: $(ESCZ)Creating blank $(MODNAM).VIR database file...
ALL_DONE=$(ESCDONE)$(ESCG)Done$(ESCZ).
WARP_START=$(ESC1)$(ESCB)DOSBox warp: $(ESCZ)engaged!
WARP_DONE=$(ESC1)$(ESCB)DOSBox warp: $(ESCZ)disengaged!
!endif

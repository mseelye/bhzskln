# BHZ Skeleton MBBS v6.x module makefile
#   Mark Seelye (bhz) 2023
#   burninghorizon.com
#   bhz.co
#
# Can be easily customized to be used for new projects:
#   Change DEVID to your 3 character dev id.
#   Change MODID to your mod name 
#   (Tip: These 2 combined should be <= 8 chars!)
#   Update BBS to path to your MBBS install
#
#   Remember to:
#     Customize the purge target for clean!
#     Customize your DLL libs as needed, (update LNK file too!)
#     If you don't like MODMAIN.C/MODMAIN.H customize it!
#     Modify/Configure your MDF file!
#     Modify/Configure your LNK file!
#     Modify/Configure your BCR file(s)!
#
#  Assumptions:
#    MBBS 6.x installed at $(BBS)
#    MBBS 6.x dev files/tools installed at $(BBS)\SRC
#    Btrieve.exe and butil.exe in path
#    BBSMSX.exe in classpath
#    BorlandC 3.1 installed
#    Pharlap/phobj installed
#    Main code for module in $(MODID)MOD.C/.H
#
# To make all the things:
#   make all
# 
# To clean all the things:
#   make clean
#
# Notes:
#   VIR target need to first run c:\bbsv6\btrieve.exe
#   MAKE v3.6 doesn't have .phony, so there is a phony kludge here
#   @ prefix seems to be ignored, using > nul

# DEVID=BHZ
# MODID=SKLN
!include "MAKEFILE.INC"
MODULE=$(DEVID)$(MODID)
BBSDR=C:
BBS=$(BBSDR)\BBSV6
PHARINC=$(BBSDR)\RUN286\INC
PHARLIB=$(BBSDR)\RUN286\BC3\LIB
BBSSRC=$(BBS)\SRC
MODSRCDR=$(BBSDR)
MODSRC=$(BBSSRC)\$(DEVID)\$(MODID)
# MODSRCDR=E:
# MODSRC=$(MODSRCDR)

STATUS=dir /w $(BBS)\$(DEVID)$(MODID)*.*
# If you're using DOSBox use/modify the folowing for CTDLL and LTDLL
# DOSBox BAT files don't seem to return error status well to MAKE
#CTDLL=bcc -o$(BBS)\phobj\$(MODULE).OBJ @$(BBSSRC)\makdll.cfg
#LTDLL=tlink @$(MODULE).LNK | REM

# Comment this line out if you are not using DOSBox, or you do not want to
# auto warp on make all
DOSBOX_WARP=1
# Set this to the # of cycles you normally have configured to return
# to after auto warping
DOSBOX_CYCLES=50000

# -DPRETTY to use esc sequences
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
!endif

.autodepend
.silent
.noignore
.path.dll=$(BBS)
.path.obj=$(BBS)\PHOBJ

# all: Clean, Build Messages, Build Module, Create Empty Database, show status of install
# all : start warp messages database module unwarp done
all: start warp mdf database module unwarp done

start:
  echo $(ESCS)$(ESCG)Building $(MODULE)$(ESCZ)...

done:
  echo $(ESCDONE)$(ESCG)Done$(ESCZ).
  echo $(ESCSTATUS)$(ESCY)Status of:$(ESCZ) $(BBS)\$(DEVID).*:
  $(STATUS)

# mdf: Deploy module def file
mdf: PHONY.MDF

# module: build module dll
module: $(MODULE).DLL

# messages: build .h/.mcv files (bbsmsx)
messages : $(MODULE).H

# database: build empty btrieve database to specs in BCR file, aka VIR file
database : $(MODULE).VIR

# status: Show what we have in the BBS dir for this module
status :
  $(STATUS)

# Builds DLL
# Note: You add libs here as needed
$(MODULE).DLL : $(MODULE).OBJ $(BBS)\dlib\galimp.lib $(PHARLIB)\PHAPI.LIB
  @echo $(ESC1)$(ESCY)LTDLL: $(ESCZ)Building $(MODULE).DLL...
  # ltdll $(MODULE)
  TLINK /L$(PHARLIB);$(BBS)\DLIB @$(MODULE).LNK

# Deploy MDF as needed (uses phony kludge)
PHONY.MDF : $(MODULE).MDF
  @echo $(ESC1)$(ESCY)COPY: $(ESCZ)Deploying $(MODULE).MDF file to $(BBS)...
  @copy $(MODULE).MDF PHONY.MDF > nul
  copy $(MODULE).MDF $(BBS)\$(MODULE).MDF
  @touch PHONY.MDF > nul

# Build object files for module
$(MODULE).OBJ : $(MODMAIN).C $(MODMAIN).H $(MODULE).H MODDEFS.H
  @echo $(ESC1)$(ESCY)CTDLL: $(ESCZ)Building $(MODULE).OBJ...
  # ctdll $(MODMAIN)
  bcc -o$(BBS)\phobj\$(MODULE).OBJ -I$(BBSSRC) -I$(PHARINC) @$(BBSSRC)\makdll.cfg $(MODMAIN)

# Build message file, create .H and .MCV files and deploy them
$(MODULE).H : PHONY.MSG
  @echo $(ESC1)$(ESCY)BBSMSX: $(ESCZ)Deploying and Building $(MODULE).MSG message file...
  $(BBS)\bbsmsx $(MODULE)
  @copy $(MODULE).MCV $(BBS)\$(MODULE).MCV > nul

# Deploy the MSG file (uses phony kludge)
PHONY.MSG : $(MODULE).MSG
  @echo $(ESC1)$(ESCY)COPY: $(ESCZ)Deploying $(MODULE).msg message file to $(BBS)\...
  @copy $(MODULE).MSG PHONY.MSG > nul
  copy $(MODULE).MSG $(BBS)\$(MODULE).MSG
  @touch PHONY.MSG > nul

# Build empty btrieve database for module using BCR file, deploy
$(MODULE).VIR : $(MODULE).BCR
  echo $(ESC1)$(ESCY)BTRIEVE: $(ESCZ)Starting Btrieve (if not started)...
  @-$(BBS)\btrieve.exe > nul
  echo $(ESC1)$(ESCY)BUTIL: $(ESCZ)Creating blank $(MODULE).VIR database file...
  butil -create $(MODULE).VIR $(MODULE).BCR
  @copy $(MODULE).VIR $(BBS)\$(MODULE).VIR > nul

# Clean, show status
clean : purgeall
  cls
  $(STATUS)

# Just cleans local dir
tidy : purgemodsrc
  cls
  dir /w

# Purge files from deploy directory
# Note: There are more elegant ways to do 'clean' with make
# but this is more clear and explicit.
purgeall : purgebbs purgemodsrc

purgebbs:
  @echo $(ESC1)$(ESCY)DEL: $(ESCZ)Clean $(MODULE) files in $(BBS) and $(BBS)\phobj...
  @del $(BBS)\$(MODULE).VIR > nul
  @del $(BBS)\$(MODULE).DLL > nul
  @del $(BBS)\$(MODULE).H > nul
  @del $(BBS)\$(MODULE).MCV > nul
  @del $(BBS)\$(MODULE).MDF > nul
  @del $(BBS)\$(MODULE).MSG > nul
  @del $(BBS)\PHOBJ\$(MODULE).OBJ > nul

purgemodsrc:
  @del PHONY.* > nul
  @del $(MODULE).MAP > nul
  @del $(MODULE).MCV > nul
  @del $(MODULE).VIR > nul
  @del $(MODULE).H > nul

#
# Convenience Stuff
#
#     _   ,_,   _   
#    / `'=) (='` \  
#   /.-.-.\ /.-.-.\ 
#   `      "      ` 
# Note: Only works if you set $(MODSRC)/$(MODSRCDR) correctly
bats:
  @cls
  @echo Building convenience batch files...
  @echo $(ESCY)Note: Only works if you set MODSRC/MODSRCDR correctly!$(ESCZ)
  @echo Currently set to $(MODSRC)\ and $(MODSRCDR)
  @del $(BBS)\$(MODULE).bat > nul
  @echo :: Convenience batch file to return to module src dir. > $(BBS)\$(MODULE).bat
  @echo cd $(MODSRC)\ >> $(BBS)\$(MODULE).bat
  @echo $(MODSRCDR) >> $(BBS)\$(MODULE).bat
  @echo cls >> $(BBS)\$(MODULE).bat
  @del bbs.bat > nul
  @echo :: Convenience batch file to open BBS > bbs.bat
  @echo cd $(BBS)\ >> bbs.bat
  @echo $(BBSDR) >> bbs.bat
  @echo bbs.bat >> bbs.bat
  @echo.
  @echo --- $(MODSRC)\bbs.bat: ---
  @type $(MODSRC)\bbs.bat
  @echo.
  @echo --- $(BBS)\$(MODULE).bat: ---
  @type $(BBS)\$(MODULE).bat
  @echo.
  @echo $(ESCY)If ^^ those ^^ directories and drive letters are not correct
  @echo $(ESCY)then these batch files won't work.$(ESCZ)


warp:
  echo.
  !ifdef DOSBOX_WARP
      echo $(ESC1)$(ESCB)DOSBox warp: $(ESCZ)engaged!
      config -set "cpu cycles=max"
  !endif

unwarp:
  echo.
  !ifdef DOSBOX_WARP
      echo $(ESC1)$(ESCB)DOSBox warp: $(ESCZ)disengaged.
      config -set "cpu cycles=fixed $(DOSBOX_CYCLES)"
  !endif

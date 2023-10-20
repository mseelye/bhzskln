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
  @del $(BBS)\$(MODNAM).bat > nul
  @echo :: Convenience batch file to return to module src dir. > $(BBS)\$(MODNAM).bat
  @echo cd $(MODSRC)\ >> $(BBS)\$(MODNAM).bat
  @echo $(MODSRCDR) >> $(BBS)\$(MODNAM).bat
  @echo cls >> $(BBS)\$(MODNAM).bat
  @del bbs.bat > nul
  @echo :: Convenience batch file to open BBS > bbs.bat
  @echo cd $(BBS)\ >> bbs.bat
  @echo $(BBSDR) >> bbs.bat
  @echo bbs.bat >> bbs.bat
  @echo.
  @echo --- $(MODSRC)\bbs.bat: ---
  @type $(MODSRC)\bbs.bat
  @echo.
  @echo --- $(BBS)\$(MODNAM).bat: ---
  @type $(BBS)\$(MODNAM).bat
  @echo.
  @echo $(ESCY)If ^^ those ^^ directories and drive letters are not correct
  @echo $(ESCY)then these batch files won't work.$(ESCZ)

# Uncomment this to disable DOSBox warp without having to pass switch
# NOWARP=1
# Set this to the # of cycles you normally have configured to return
# to after auto warping
!ifndef CYCLES
CYCLES=50000
!endif

!ifndef ECHO
ECHO=@echo
!endif

# These targets can be used to have DOSBOX speed up while doing builds
# see MAKEFILE.MAK
warp:
  !ifdef NOWARP
    @REM NOWARP is defined, silently skipping
  !endif
  !ifndef NOWARP
      $(ECHO) $(WARP_START)
    @config -set "cpu cycles=max" > nul
  !endif

unwarp:
  !ifdef NOWARP
    @REM NOWARP is not defined, silently skipping
  !endif
  !ifndef NOWARP
    $(ECHO) $(WARP_DONE)
    @config -set "cpu cycles=fixed $(CYCLES)" > nul
  !endif

BHZ Skeleton MBBS v6.x module skeleton
Mark Seelye (bhz) 2023
burninghorizon.com, bhz.co
  mseelye        com
        _at_  -dot-
           yahoo

Simple module source that can be used as boilerplate for a new module.
Has some simple examples user input handling, msg reading, and database access.

(Note: No affiliation with themajorbbs/Galacticomm/WorldGroup)

Much credit to paladine for his work on the MBBSEMU test module, 
which was an invaluable resource to help make this.

Can be easily customized to be used for new projects:
  run included NEWMOD.BAT:
    NEWMOD.BAT DID MODID [drive bbsdir srcdir]
      DID = Your 3 char developer id
      MODID = Your 1-5 char module id
      [drive bbsdir srcdir] = Path to BBS source, they default to c: bbsv6 src

Remember to:
  Customize the purge target in the make files for clean!
  Customize your DLL libs as needed, (update LNK file too!)
  Modify/Configure your MDF file!
  Modify/Configure your LNK file!
  Modify/Configure/Remove your BCR file(s)!

Assumptions:
  MBBS 6.x installed at $(BBS)  (Use themajorbbs.com's official free 6.2)
  MBBS 6.x dev files/tools installed at $(BBS)\SRC  (can be found online)
  Btrieve.exe and butil.exe in path  (can be found online)
  BBSMSX.exe in classpath
  BorlandC 3.1 installed  (check archive.org)
  Pharlap/phobj installed (can be found online)
  You are building all this within DOSBox, using BorlandC, and BorlandC's tooling!

Information:
  "The Major BBS Developer's Guide"
    https://www.themajorbbs.com/download/major-bbs-v6-2-developers-guide/?tmstv=1697295157
    https://download.mbbsemu.com/docs/MajorBBS_Developers_Guide_Rev_6.2_Jan_1994.pdf
  "MBBSEmu Test Module"
    https://github.com/mbbsemu/MBBSEmu.Module

Installing MBBS 6.2
  Free Edition:
    https://www.themajorbbs.com/download/the-major-bbs-v6-25-free-edition/?tmstv=1697295157
  Misc. Other MBBS Files (Dev Source, PHARLIB, Etc)
    http://software.bbsdocumentary.com/IBM/DOS/MAJORBBS/

Emulation:
  MBBSEmu https://www.mbbsemu.com/
  VirtualBox (Free Edition)
    https://www.themajorbbs.com/download/installing-the-major-bbs-v6-25-in-virtualbox/?tmstv=1697295157
    https://www.themajorbbs.com/download/the-major-bbs-v6-25-free-edition-virtualbox-files/?tmstv=1697295157

Files Map:
  Makefile related files:
    MAKEFILE.MAK  - The main makefile, has it's own help file, can view with: "make help"
    MAKEFILE.INC  - Various make macros/variables related to current project. (Generated with NEWMOD.BAT/NEWINC.BAT)
    MAKEMSGS.INC  - Various make macros and !ifdefs used to control what output from make looks like.
    DSBXWARP.INC  - Mark macros to set/unset DOSBox "cpu cycyles" to max when building. (warp/unwarp)
    BATS.INC      - Make target for creating usefule bat files for going between project dir and bbs dir.
    MKHELP.TXT    - The file dispalyed when you use "make help"
    MAKEMOD.BAT   - A convenience batch file to put desired make switches in. (Copied to new projects.)
    SIMPLE.MAK    - An example makefile without all the ansi, targets, includes and macros

  Module Skeleton Source Files:
    MODMAIN.C     - C source for the base skeleton module. (Can use different name when creating new project with NEWMOD.BAT)
    MODMAIN.H     - C Header/.H file for the base skeleton module. (Can also use different name like the .C above.)
    MODDEFS.H     - Intermediate C Header/.H file for skeleton module with various defines for a project (Generated with NEWMOD.BAT/NEWDEFS.BAT)
      (Note: The following all get renamed to [DID][MODID].[EXT] when creating new project with NEWMOD.BAT)
    BHZSKLN.BCR   - Simple BCR (Btrieve database definition) file that works with the example/skeleton code. 
    BHZSKLN.LNK   - LNK file used when linking the module project. (Generated with NEWMOD.BAT/NEWLNK.BAT)
    BHZSKLN.MDF   - MBBS Module Definition file. (Generated with NEWMOD.BAT/NEWMDF.BAT)
    BHZSKLN.MSG   - Example MBBS MSG file that works with the example/skeleton code.

  Creating new Module Projects:
    NEWMOD.BAT    - Use this to create a new project from this project.
    NEWINC.BAT    - Used by NEWMOD.BAT to create the MAKEFILE.INC file, listed above.
    NEWLNK.BAT    - Used by NEWMOD.BAT to create the [DEV ID][MODULE ID].LNK file, listed above.
    NEWMDF.BAT    - Used by NEWMOD.BAT to create the [DEV ID][MODULE ID].MDF file, listed above.
    NEWDEFS.BAT   - Used by NEWMOD.BAT to create the MODDEFS.H file, listed above.

  Other files:
    README.TXT    - This.
    LICENSE       - MIT License for this project.

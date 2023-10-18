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
    NEWMOD.BAT YOU MODNM [bbs src]
      YOU = Your 3 char developer id
      MODNM = Your 1-5 char module id
      [bbs src] = Path to BBS source, defaults to c:\bbsv6\src

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
  Main code for module in MODMAIN.C/MODMAIN.H

Information:
  "The Major BBS Developer's Guide"
    https://www.themajorbbs.com/download/major-bbs-v6-2-developers-guide/?tmstv=1697295157
    https://download.mbbsemu.com/docs/MajorBBS_Developers_Guide_Rev_6.2_Jan_1994.pdf
  "MBBSEmu Test Module"
    https://github.com/mbbsemu/MBBSEmu.Module

Installing MBBS 6.2
  Free Edition:
    https://www.themajorbbs.com/download/the-major-bbs-v6-25-free-edition/?tmstv=1697295157

Emulation:
  MBBSEmu https://www.mbbsemu.com/
  VirtualBox (Free Edition)
    https://www.themajorbbs.com/download/installing-the-major-bbs-v6-25-in-virtualbox/?tmstv=1697295157
    https://www.themajorbbs.com/download/the-major-bbs-v6-25-free-edition-virtualbox-files/?tmstv=1697295157

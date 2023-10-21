# Quick MBBS/DOSBox Development Environment Setup  
Derived from blixel@gmail.com's Dev Env ISO (2013)  

## History:  
 - 2023-10-15 mseelye, README created
---

## Assumptions
- You have DOSBox installed and know how to configure it.  
- You have the following installs in the following dir structure in DOSBox C: drive:  
  - C:\
  - C:\INSTALLS\
  - C:\INSTALLS\\[MBBSFREE](https://www.themajorbbs.com/download/the-major-bbs-v6-25-free-edition/?tmstv=1697295157)\  
  *Free version of **MajorBBS v6.2** from themajorbbs.com*
  - C:\INSTALLS\\[BORLANDC](https://archive.org/download/bcpp31)\  
  ***BorlandC 3.1** from archive.org*
  - C:\INSTALLS\\[RUN286](http://software.bbsdocumentary.com/IBM/DOS/MAJORBBS/phar312.zip)\  
  ***RUN286/Pharlap/Pharlib** DOS Extender lib, from bbsdocumentary.com archive*
  - C:\INSTALLS\\[MBBS_SDK](http://software.bbsdocumentary.com/IBM/DOS/MAJORBBS/mbbs625src.zip)\  
  ***MBBS_SDK** MajorBBS v6 SDK Source Installs from bbsdocumentary.com archive*
  - C:\INSTALLS\\[HUGEMODL](http://software.bbsdocumentary.com/IBM/DOS/MAJORBBS/mbbsdev.zip)\  
  ***HUGEMODL BC3** support from bbsdocumentary.com archive*
  - C:\INSTALLS\\[BUTIL](https://www.nomad.ee/btrieve/files/index.shtml)\  
  ***BUTIL** Btrieve DB utility program, from btrieve archive site.*  
  *(Can't locate actual BUTIL.EXE anymore. :/ )*

---
## Setup of MBBS/DosBox development environment notes  
I did not want to include all the dependencies for setting up the development in this repository.  
You should be able to find most of what you need readily online.  
Here is an abridged version of my personal steps I follow, derived from blixel@gmail.com's dev env. ISO.  

1. Fresh DOSBox mount dir, setup DOSBox autoexec  
Note: Change `E:\Dev\DosBox` to whatever clean dir you need/want  
In the dosbox.conf under [autoexec]:  
```
[autoexec]
mount c E:\Dev\DOSBox
path=%path%;C:\BORLANDC\BIN;C:\RUN286\BIN;C:\BBSV6\SRC;
C:
```

2. Install MBBS to `C:\BBSV6` (see MBBSFREE readme!)  

3. Install **Borland C++ 3.1** to `C:\BORLANDC`  
Note: Borland installer uses `A:` as source, change that to `C:`!  
   - Required install options: **Command Line**, **Turbo Assembler**  
   - Required DOS Library Models: **LARGE**, and **HUGE**  
   - Everything else is **optional**!

4. Install **Phar Lap 286** DOS Memory Extender to `C:\RUN286\`  

5. Install the Major BBS v6.25 **MBBS SDK** to `C:\BBSV6` (at `C:\BBSV6\SRC`)  

6. Install **Borland C Huge Model Support**  

7. Install **BUTIL.EXE** Btrieve's database utility.  

8. Build `MBBS`
```
  C:
  CD \BBSV6\SRC
  MAKEBBS.BAT
```

To add BHZ Skeleton Module to MBBS (MBBS Free editon):
 - MBBS Console: Option `2` "Design Menu Tree"
    - While "TOP" is highlighted, `F2` (edit)
    - Arrow down to open option (Fresh install will be #11)
    - `Alt-E`, Choose open Letter, Enter Description, Key: [leave blank], Page: BHZSKLN, Save: Yes
    - Arrow down to `"BHZSKLN"`  
      Should be under the "TOP" menu, after "QWK, before "REMOTE"
    - `F2` (edit), Select: Module Page, Yes, USER, `"BHZ Module Skeleton v0.1"`, Yes, hit `enter` twice
    - `F10` (exit/save)
  - MBBS Console: Select `5` "Go!"
    - After BBS Loads hit `F7` to log in  
    You should see an option in the top menu for the skeleton module matching what you enetered above.  

To use skeleton:  
  See README.MD and MAKEFILE.MAK in `c:\bbsv6\src\bhz\skln`

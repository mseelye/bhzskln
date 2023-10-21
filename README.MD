# BHZ Skeleton Module for MajorBBS v6.x

BHZ Skeleton Module is a simple boilerplate MajorBBS Module project. It can be used to create new modules for MajorBBS v6.x.

Simple module source that can be used as boilerplate for a new module.
Has some simple examples user input handling, msg reading, and database access.

(Note: No affiliation with themajorbbs/Galacticomm/WorldGroup)

Much credit to [paladine](https://github.com/paladine) for his work on the [MBBSEMU test module](https://github.com/mbbsemu/MBBSEmu.Module), 
which is an great resource to help understand how these modules work, and how they are built.


## Author
- Mark Seelye (bhz) (c)2023
- burninghorizon.com bhz.co
- mseelye@yahoo.com

## Installation (DOSBox + MBBS Free v6.2)

* **Clone [Project](https://github.com/mseelye/bhzskln)**  
In a terminal, shell, cmd prompt, gitbash, msys, mingw, what-haveyou; clone the repo using whatever method you like.  
(Not in DOSBox, if this isn't obvious)
```bash
C:\> e:
E:\> cd e:\projects\mbbs
E:\projects\mbbs> git git@github.com:mseelye/bhzskln.git
```
* **[DOSBox](https://www.dosbox.com/download.php?main=1)**  
Setup DOSBox so it has a mount to the directory with the cloned repo.  
(Assumes you have MajorBBS Free Edition installed and running with DOSBox)  
Something like:  
`c:\Program Files (x86)\DOSBox-0.74\DOSBox.exe -editconf notepad.exe`

Update the `[autoexec]` section (near/at the end of the config) to have your mounts:
```properties
[autoexec]
mount c e:\Dev\DOSBox
mount e e:\projects\mbbs\bhzskln
path=%path%;C:\BORLANDC\BIN;C:\RUN286\BIN;C:\BBSV6\SRC;
c:
```

## Usage  
In a DOSBox CMD shell run `NEWMOD.BAT` from the mount point and path with the [`bhzskln` project](https://github.com/mseelye/bhzskln) source cloned from github.  
In this example E: is mounted to the host's `e:\projects\mbbs\bhzskln` directory.  
```bash
E:\> NEWMOD.BAT DID MODID
```
- **DID** (Developer ID)  
This your 3 character MBBS Developer ID.  
You can just make this up, but try choose a unique one and avoid ones you've seen before!
- **MODID** (Module ID)  
This your 1-5 character Module ID.  
This will be combined with your "Developer ID" to make an 8 character module name, like `ABCSTUFF`
---
### Initialize a new module project directory
Note: Run [NEWMOD.BAT](newmod.bat) without arguments to see some usage info (or just look through it).  

In this example, while in the DOSBox command prompt, we are running `NEWMOD.BAT` with the arguments `ABC` and `STUFF` which will create a new module project directory with the default path to the bbs, in `c:\bbsv6\src\abc\stuff`  
```bash
E:\> NEWMOD.BAT ABC STUFF
Done!
Directory of C:\BBSV6\SRC\ABC\STUFF\.
[.]             [..]            ABCSTUFF.BCR    ABCSTUFF.LNK    ABCSTUFF.MDF
ABCSTUFF.MSG    BATS.INC        DSBXWARP.INC    LICENSE         MAKEFILE.INC
MAKEFILE.MAK    MAKEMOD.BAT     MAKEMSGS.INC    MKHELP.TXT      MODDEFS.H
MODMAIN.C       MODMAIN.H
   15 File(s)            27,597 Bytes.
    2 Dir(s)        262,111,744 Bytes free.
```
---
### Build and Deploy
Run `make help` to get some information on targets and switches/options, or just look at [mkhelp.txt](mkhelp.txt).

In this example, while in the DOSBox command prompt, we are running `make all` to build and deploy the module dll and config files to `c:\bbsv6\`
```bash
E:\> make all
...
[lots of make/build output]
...
Done.
Directory of C:\BBSV6\.
ABCSTUFF.DLL    ABCSTUFF.MCV    ABCSTUFF.MDF    ABCSTUFF.MSG    ABCSTUFF.VIR
    5 File(s)             9,977 Bytes.
    0 Dir(s)        262,111,744 Bytes free.
```
---
**Tips:**  
Take a look in [MAKEFILE.MAK](makefile.mak) for more details about how it all works.

The [MODMAIN.C](modmain.c) file also has information detailing pages in the MBBS Development guide for various GAL/MBBS functions used.

---
### Running the module in MBBS FREE  
This assumes you have MBBS FREE installed, and running in DOSBox.  
This also assumes you have the skeleton module (DIST) deployed to the `BBSV6` directory.
 - Start the BBS Console (bbs.bat from c:\bbsv6\ directory.)
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

---
### Running the module in MBBSEmu
In this example, while in the DOSBox command prompt, we are running `make dist` to build and deploy the module dll and config files to a `dist` sub-directory in the module project source directory.
```bash
E:\> make dist
[screen clears]

Directory of C:\BBSV6\SRC\ABC\STUFF\DIST\.
ABCSTUFF.DLL              4,245 21-10-2023  11:20
ABCSTUFF.MCV                837 21-10-2023  11:20
ABCSTUFF.MDF                340 21-10-2023  11:20
ABCSTUFF.MSG              2,507 21-10-2023  11:20
ABCSTUFF.VIR              2,048 21-10-2023  11:20
    5 File(s)             9,977 Bytes.
    0 Dir(s)        262,111,744 Bytes free.
```

Create a directory for these files somewhere along-side/near your MBBSEmu installation, and copy the files from this project's DIST directory into it.

Update your installation's `modules.json` to have the module, it might look something like:
```json
{
  "Modules": [
    {
      "Identifier": "SOMETHNG",
      "Path": "E:\\Files\\MBBS\\MODULES\\XYZ_SOMETHING",
      "Enabled": 1,
      "Patches": []
    },
    {
      "Identifier": "ABCSTUFF",
      "Path": "E:\\Files\\MBBS\\MODULES\\ABCSTUFF",
      "Enabled": 1,
      "Patches": []
    }
  ]
}
```

Start MBBSEmu using the modified module.json, log in, and you should see your module!

```
Enter Username or enter "NEW" to create a new Account
Username: sysop
Password: ****
/SYS to access SYSOP commands

Please select one of the following:

   1 ... XYZ Something Module
   2 ... ABCSTUFF Module

Main Menu
Make your selection (X to exit):
```

**Tips**  
Another option is to just point MBBSEmu `modules.json` at the `./DIST` sub-directory instead of copying everything. However, there may be unwanted side-effects if you compile while MBBSEmu is running.


## Contributing

I'm not taking pull requests at this time. However, please feel free to open an issue or send me an email.

## License

[MIT](https://choosealicense.com/licenses/mit/) [License](LICENSE)

## Assumptions:
-  MBBS 6.x installed at C:\BBSV6  (You can use [themajorbbs.com's official free 6.2](https://www.themajorbbs.com/download/the-major-bbs-v6-25-free-edition/?tmstv=1697295157))
-  MBBS 6.x dev files/tools installed in BBS's SRC sub-directory (can be [found online](http://software.bbsdocumentary.com/IBM/DOS/MAJORBBS/))
-  Btrieve.exe and butil.exe in path  (can be [found online](https://www.nomad.ee/btrieve/files/index.shtml))
-  BBSMSX.exe somwhere in DOSBox's path (usually installed with mbbs dev)
-  BorlandC 3.1 installed  ([check archive.org](https://archive.org/download/bcpp31) and [other](https://www.google.com/search?q=borland+c%2B%2B+3.1+compiler+free+download) [places](https://winworldpc.com/product/borland-c/30))
-  Pharlap/phobj installed (can be [found online](https://archive.org/download/pharlap-286-v2.5))
-  You are building all this within DOSBox, using BorlandC, and BorlandC's tooling!

## Information:
### The Major BBS Developer's Guide
https://www.themajorbbs.com/download/major-bbs-v6-2-developers-guide/?tmstv=1697295157

https://download.mbbsemu.com/docs/MajorBBS_Developers_Guide_Rev_6.2_Jan_1994.pdf

### MBBSEmu Test Module
Great module used to test MBBSEmu (another great project), serves as a nice example:

https://github.com/mbbsemu/MBBSEmu.Module

### Installing MBBS 6.2, Dev Kit, Other Tools
Disclaimer: You should **ALWAYS** scan **ANY** files you get online (even from archive.org) for viruses. I have found quite a few archives, and many of the files had (ancient, but functional) viruses.

- Official MBBS V6.x Free Edition:  
https://www.themajorbbs.com/download/the-major-bbs-v6-25-free-edition/?tmstv=1697295157

- Misc. Other MBBS Files (Dev Source, PHARLIB, Etc)  
http://software.bbsdocumentary.com/IBM/DOS/MAJORBBS/  
https://archive.org/download/pharlap-286-v2.5  

- BorlandC 3.1  
https://archive.org/download/bcpp31  
https://winworldpc.com/product/borland-c/30  

-  Misc Btrieve utilities  
https://www.nomad.ee/btrieve/files/index.shtml

- Emulation  
  MBBSEmu https://www.mbbsemu.com/  
  VirtualBox (Free Edition)  
    https://www.themajorbbs.com/download/installing-the-major-bbs-v6-25-in-virtualbox/?tmstv=1697295157  
    https://www.themajorbbs.com/download/the-major-bbs-v6-25-free-edition-virtualbox-files/?tmstv=1697295157  

---

## Files Map

There are 4 groups of files: `Makefile`, `Skeleton Source`, `Create Module`, and `Other`

- **Makefile** - These files are for use with `make`, or are include files for the main makefile `MAKEFILE.MAK`, or are somehow otherwise related to running make for the project. These files are either copied directly (with some renaming), or generated into a new module project directory.
- **Skeleton Source** - These files contain the source code, mbbs config, or db config for a module. These files are either copied directly (with some renaming), or generated into a new module project  directory.
- **Create Module** - The are the batch files used to create a new instance of a module project. These files are not copied into a new module project directory.
- **Other** - Readme files, help files, license files, etc.  Some of these files are copied into a new module project directory.


|File/[Dir]|Type/Group|Description |
|-|-|-|
|[MAKEFILE.MAK](MAKEFILE.MAK)|Makefile|The main makefile, has it's own help file, can view with: "make help"|
|[MAKEFILE.INC](MAKEFILE.INC)|Makefile|Various make macros/variables related to current project. (Generated with NEWMOD.BAT/NEWINC.BAT)|
|[MAKEMSGS.INC](MAKEMSGS.INC)|Makefile|Various make macros and !ifdefs used to control what output from make looks like.|
|[DSBXWARP.INC](DSBXWARP.INC)|Makefile|Mark macros to set/unset DOSBox "cpu cycyles" to max when building. (warp/unwarp)|
|[BATS.INC](BATS.INC)        |Makefile|Make target for creating usefule bat files for going between project dir and bbs dir.|
|[MAKEMOD.BAT](MAKEMOD.BAT)  |Makefile|A convenience batch file to put desired make switches in. (Copied to new projects.)|
|[SIMPLE.MAK](SIMPLE.MAK)    |Makefile|An example makefile without all the ansi, targets, includes and macros|
||||
||||
|[MODMAIN.C](MODMAIN.C)      |Skeleton Source|C source for the base skeleton module. (Can use different name when creating new project with [NEWMOD.BAT](NEWMOD.BAT))|
|[MODMAIN.H](MODMAIN.H)      |Skeleton Source|C Header/.H file for the base skeleton module. (Can also use different name like the [.C file](MODMAIN.C) above.)|
|[MODDEFS.H](MODDEFS.H)      |Skeleton Source|Intermediate C Header/.H file for skeleton module with various defines for a project (Generated with NEWMOD.BAT/NEWDEFS.BAT)(Note: The following all get renamed to [DID][MODID].[EXT] when creating new project with NEWMOD.BAT)|
|[BHZSKLN.BCR](BHZSKLN.BCR)  |Skeleton Source|Simple BCR (Btrieve database definition) file that works with the example/skeleton code.|
|[BHZSKLN.LNK](BHZSKLN.LNK)  |Skeleton Source|LNK file used when linking the module project. (Generated with NEWMOD.BAT/NEWLNK.BAT)|
|[BHZSKLN.MDF](BHZSKLN.MDF)  |Skeleton Source|MBBS Module Definition file. (Generated with NEWMOD.BAT/NEWMDF.BAT)|
|[BHZSKLN.MSG](BHZSKLN.MSG)  |Skeleton Source|Example MBBS MSG file that works with the example/skeleton code.|
||||
||||
|[NEWMOD.BAT](NEWMOD.BAT)    |Create Module|Use this to create a new project from this project.|
|[NEWINC.BAT](NEWINC.BAT)    |Create Module|Used by NEWMOD.BAT to create the [MAKEFILE.INC](MAKEFILE.INC) file, listed above.|
|[NEWLNK.BAT](NEWLNK.BAT)    |Create Module|Used by NEWMOD.BAT to create the [[DEV ID][MODULE ID].LNK](BHZSKLN.LNK) file, listed above.|
|[NEWMDF.BAT](NEWMDF.BAT)    |Create Module|Used by NEWMOD.BAT to create the [[DEV ID][MODULE ID].MDF](BHZSKLN.MDF) file, listed above.|
|[NEWDEFS.BAT](NEWDEFS.BAT)  |Create Module|Used by NEWMOD.BAT to create the [MODDEFS.H](MODDEFS.H) file, listed above.|
||||
||||
|[MKHELP.TXT](MKHELP.TXT)    |Makefile/Other|The file dispalyed when you use "make help"|
|[README.MD](README.MD)      |Other|This file.|
|[LICENSE](LICENSE)          |Other|MIT License for this project.|
|[[DEMO](DEMO)]              |Other|Videos and explanation readme showing usage of the skeleton's newmod.bat tool.|
|[[DIST](DIST)]              |Other|Compiled distributables of the BHZSKLN skeleton module.|
||||

## Extras

### Demo

There is a set of demo videos of using this tooling, with some explanation text in the [demo directory](DEMO).

---

### More Tips, Tricks, Info

#### Configure MBBS to be less annoying for development and testing  
Start the BBS as usual using bbs.bat in the C:\bbsv6 directory.  

---
**To Speed up the BBS when using `F7` to log in from terminal**  
 - Select option `1` "Hardware Setup":  
    Scroll down to Option `7` of ~383, it is named `BAUD1`.  
    Set the value of `BAUD1` to **57600**  (This is the actual channel group max)  
    Hit `F10` to save and exit back to the main menu.

---
**To Speed up log in process, shorten the new user survey**  
 - Select option `4` Configuration:  
    Scroll down to option `9` of ~252, `LANGOP`, Hit `F3` to set value to `AUTO`  
    Scroll down to option `10` of ~252, `ANSIOP`, Hit `F5` to set value to `ON`  
    Scroll down to or search(`F8`) for option `ASKNAM` in the `BBSSUP.MSG options` section.  
    Set **EACH** of the values for options `ASKNAM` threough `ASKSEX` (7 options) to `NO` (Use `F3` to select NO)  
    Scroll down to, or search(`F8`) for option `DFTPR2` in the `GALMS.MSG options` section  
    Hit `F3` to set `DFTPR2`'s value to `Notify`  
    Hit `F10` to save and exit back to the main menu.

---
**To remove the prompt that pasues long text output**  
*This one is especially annoying while playing things like InfinityComplex!*  
  - With each account you log in as:  
  Type `/GO ACCOUNT`, Hit `A` and then enter  
  Cursor over to `"Pause output?"` and hit space until you select `"CONTINUOUS"`
    
---
**To stop the BBS quickly while it is running**  
 - From console to kill the BBS you can quickly hit: `F10` `F9` `F10` `F9`  
(Then hold Alt-F12 to speed it up/warp in DOSBox) 

---
#### DOSBox stuff  
**To stop the BBS quickly while it is running**  
 - When waiting for BBS, "Go!", shutting down, or while compiling  
You can press-and-hold `alt-F12` to "warp" DOSBox.

---
#### [Notes on setting up a DOSBox/MBBS Development Environment](EXTRAS/MBBS-DOSBox-Dev-Env-Setup.MD)

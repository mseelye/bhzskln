## [Example 1:](dosbox_bhz_skeleton_example_1.mp4)

Here I'm showing a fresh git pull of the repo, and a fresh(ish) install of the BBS. (no other mods, audit cleared) 

The example is showing the creation of a new mod from the skeleton.

1. I run NEWMOD.BAT and create a new module called (Dev ID:ABC, MOD ID:BLOOP) ABCBLOOP.

2. I enter the fresh src directories it created in BBSV6/SRC; BBSV6/SRC/ABC/BLOOP

3. I build the module using make. In this case I'm using the MAKEMOD.BAT batch file, which is just `make -DPRETTY %1` for the ansi output.

4. I start the BBS, add an entry to the `TOP` menu, and point the new menu option at the ABCBLOOP module.

5. I hit 5-`GO!` the BBS starts and you can see ABCBLOOP in the audit log.

6. I log in, select the menu option and you can see the module in use.


## [Example 2:](dosbox_bhz_skeleton_example_2.mp4)

Here I'm showing another fresh git pull of the repo, and a fresh(ish) install of the BBS. (no other mods, audit cleared)

The example is showing the creation of another new module from the skeleton.

1. I run NEWMOD.BAT and create a new module called (Dev ID:ABC, MOD ID:BLEEP) ABCBLEEP.

[Basically the same as 2-6]

7. I show that the output for option `1` is `ABCBLEEP v1.0.0`

8. I stop the BBS, return to the module's source directory and open MODMAIN.C with BorlandC's BC.EXE

9. I go to line ~252 and change the prf statement from 
  ```C
  prf("%s %s\n", MODNAM, MODVER);
  ``` 
to 
  ```C
  prf("Module: %s Version: %s\n", MODNAM, MODVER);
  ```

10. I save the file, return to the command line and build the module using `make -DPRETTY all` (MAKEMOD.BAT would do the same, just showing it)

11. I start the BBS, and then [Basically the same as 5-6]

12. I show that the output for option `1` is `Module: ABCBLEEP Version: v1.0.0`


## [Example 3:](dosbox_bhz_skeleton_example_3.mp4)

Here we start where Example 2 left off. I'm showing the creation of a new module along-side the previous one.

13. [Basically 1-6] (Except calling the mod `ABCOTHER`) I'm showing that the newly created modules do not conflict with existing modules (Provided they are named uniquely.) and are managed in sub-directories of their own.

14. After I log in I show that both BLEEP and OTHER are running side-by-side and working.

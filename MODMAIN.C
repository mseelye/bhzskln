/* 
  BHZ Skeleton MBBS v6.x module main skeleton source
  Mark Seelye (bhz) 2023
  burninghorizon.com, bhz.co
    mseelye        com
          _at_  -dot-
            yahoo

  Simple module source that can be used as boilerplate for a new module.
  Has some simple examples user input handling, msg reading, and database access.

  (Note: No affiliation with themajorbbs/Galacticomm/WorldGroup)

  Much credit to paladine for his work on MBBSEmu.Module test module,
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
*/
#include "gcomm.h"
#include "majorbbs.h"
#include "moddefs.h"

static int bhz_sttrou(void);
static void bhz_finrou(void);

static int bhz_stub_lonrou(void);
static void bhz_stub_stsrou(void);
static int bhz_stub_injrou(void);
static int bhz_stub_lofrou(void);
static void bhz_stub_huprou(void);
static void bhz_stub_mcurou(void);
static void bhz_stub_dlarou(void);

/*
  Module Structure Block
    See: Page 30, "The Major BBS Developer's Guide"
*/
struct module ptrmodule = {  /* module interface block                */
    "",                     /*  name used to refer to this module   */
    bhz_stub_lonrou,        /*  user logon supplemental routine     */
    bhz_sttrou,             /*  input routine if selected           */
    bhz_stub_stsrou,        /*  status-input routine if selected (dfsthn) */
    bhz_stub_injrou,        /*  Reprompting routine for this module */
    bhz_stub_lofrou,        /*  user logoff supplemental routine    */
    bhz_stub_huprou,        /*  hangup (lost carrier) routine       */
    bhz_stub_mcurou,        /*  midnight cleanup routine            */
    bhz_stub_dlarou,        /*  delete-account routine              */
    bhz_finrou              /*  finish-up (sys shutdown) routine    */
};

int statecode;
FILE *mbkptr = NULL;
BTVFILE *bbptr = NULL;

/*
  Module Initialization Routine
    See: Page 29, "The Major BBS Developer's Guide"

  "The Major BBS Developer's Guide"
    stzcpy:           Page 175    - Copy a string with limit and null termination
    register_module:  Page 30     - Register a module structure, returns state code
    opnmsg:           Page 65     - Open a new MCV file, returns pointer
    opnbtv:           Page 150    - Open a btrieve database file for I/O, returns pointer
    setmbk:           Page 66     - Set current MCV file block pointer
    shocst:           Page 148    - Log message to Audit Trail, summary (<= 32 chars), details (<= 65 chars)
    rstmbk:           Page 66     - Restore to previous MCV from before last setmbk() call
*/
// handles init__[DEVID][MODID] see moddefs.h
void init(void) {
  stzcpy(ptrmodule.descrp, gmdnam(MODMDF), MNMSIZ);
  statecode = register_module(&ptrmodule);
  mbkptr = opnmsg(MODMCV);
  bbptr = opnbtv(MODDAT, sizeof(BHZ_DBRECORD));
  setmbk(mbkptr);
  shocst(spr("%s %s %s", MODNAM, MODVER, getmsg(STARTING)), 
         spr("%s %s %s", ptrmodule.descrp, MODVER, getmsg(STARTING)));
  rstmbk();
}

/*
  Insert a record into the database.
  Add in current userid too

  "The Major BBS Developer's Guide"
    stzcpy:           Page 175    - Copy a string with limit and null termination
    prfmsg:           Pages 65,69 - Works like printf/prf, control string from current MCV file
    ncdate/nctime:    Page 178    - Encode date/time into: "MM/DD/YY" / "HH:MM:SS"
    dinsbtv:          Page 152    - Failure tolerant insert routine, returns l=inserted O=duplicate collision
*/
static void insert_rec(BHZ_DBRECORD *rec) {
  stzcpy(rec->userid, usaptr->userid, UIDSIZ);
  prfmsg(INSREC, 
    ncdate(rec->date), rec->date,
    nctime(rec->time), rec->time,
    rec->userid,
    rec->data1,
    rec->data2);

  if (!dinsbtv(rec)) {
    prfmsg(INSFAIL);
  }
}

/*
  Create a new record for the database.
  Use date and time as key (see BCR)
  Set data1 to default, or to word after option "2" input.
  Set data2 to default, or to everything after data1.

  Example user input:

  2 1234567890 Hey there, how are you doing?

    Would insert:
      data1:1234567
      data2:Hey there, how are you do
    As data1 is max DATA1SIZE, data2 is max DATA2SIZE (with \0s on each)

  "The Major BBS Developer's Guide"
    today/now:        Page 178    - Find out today's date / current time as long int.
    stzcpy:           Page 175    - Copy a string with limit and null termination
    rstrin:           Page 74     - Restore parsed input line (undo effects of parsin)
*/
static void insert_new() {
  BHZ_DBRECORD rec;
  memset(&rec, 0, sizeof(rec));

  rec.date = today();
  rec.time = now();

  if (margc > 1) {
    stzcpy(rec.data1, margv[1], DATA1SIZE);
  } else {
    stzcpy(rec.data1, getmsg(DEFDATA1), DATA1SIZE);
  }
  if (margc > 2) {
    // This will copy margv[2...] after rstrin() is called, up to DATA2SIZE
    rstrin();
    stzcpy(rec.data2, margv[2], DATA2SIZE);
  } else {
    stzcpy(rec.data2, getmsg(DEFDATA2), DATA2SIZE);
  }
  insert_rec(&rec);
}

/*
  Print out a passed db record with index
  Converts date and time from ints back to strings

  "The Major BBS Developer's Guide"
    prfmsg:           Pages 65,69 - Works like printf/prf, control string from current MCV file
    ncdate/nctime:    Page 178    - Encode date/time into: "MM/DD/YY" / "HH:MM:SS"
*/
static void out_next_rec(int recn, BHZ_DBRECORD *rec) {
  prfmsg(OUTREC, recn, 
    rec->date, ncdate(rec->date),
    rec->time, nctime(rec->time),
    rec->userid,
    rec->data1, rec->data2);
}

/*
  Loop through the database dumping all records.
  Displays DB empty message if no records.

  "The Major BBS Developer's Guide"
    prfmsg:           Pages 65,69 - Works like printf/prf, control string from current MCV file
*/
static void out_records() {
  BHZ_DBRECORD rec;
  int recn = 1;

  if(slobtv((char*)&rec)) {
    do {
      out_next_rec(recn++, &rec);
    } while (snxbtv((char*)&rec));
  } else {
    prfmsg(DBEMPTY);
  }
}

/*
  Input routine.
  Very simple, handles user selecting 1, 2, 3, or X.
  Allows for extra input when selecting option 2.
    See: Page 69, "The Major BBS Developer's Guide"

  Handle options 1, 2, 3, and X
  Otherwise echoes input.

  "The Major BBS Developer's Guide"
    setmbk:           Page 66     - Set current MCV file block pointer
    rstmbk:           Page 66     - Restore to previous MCV from before last setmbk call
    setbtv:           Page 150    - Set BTVFILE ptr for subsequent ops
    rstbtv:           Page 150    - Restore to previous BTVFILE from before last setbtv call
    prfmsg:           Pages 65,69 - Works like printf/prf, control string from current MCV file
    outprf:           Pages 65,69 - Send prfbuf to a channel & clear user number
    sameas:           Page 174    - Case-ignoring string match
    rstrin:           Page 74     - Restore parsed input line (undo effects of parsin)
    stzcpy:           Page 175    - Copy a string with limit and null termination
*/
static int bhz_sttrou(void) {
  int rc = 1;
  setmbk(mbkptr);
  setbtv(bbptr);

  if (usrptr->substt == 0) {
    prfmsg(MENU);
    usrptr->substt = 1;
    rc = 1;
  } else {
    if (margc > 0) {
      if (sameas(margv[0], "1")) {
        prfmsg(OPT1);
      } else if (sameas(margv[0], "2")) {
        prfmsg(OPT2);
        insert_new();
      } else if (sameas(margv[0], "3")) {
        prfmsg(OPT3);
        out_records();
      } else if (sameas(margv[0], "x")) {
        rc = 0; // 0 tells mbbs to exit module
      } else {
        prfmsg(OUTPUT);
        // Set prf buffer to original input value
        rstrin();
        stzcpy(prfptr, input, inplen + 1);
        prfptr += inplen;
      }
    } else {
      prfmsg(MENU);
    }
  }

  prfmsg(SHMENU); // Show the "Selection" message
  rstmbk();
  rstbtv();

  outprf(usrnum);

  return rc;
}

/*
  System shutdown routine.
  Close out msg file and database.
    See: Page 38, "The Major BBS Developer's Guide"

  "The Major BBS Developer's Guide"
    spr:              Page 175    - sprintf-like string formatter utility
    clsmsg:           Page 67     - Close an MCV file
    clsbtv:           Page 153    - Close a Btrieve file when finished
*/
static void bhz_finrou(void) {
  shocst(MODNAM, spr("%s %s session ending.", ptrmodule.descrp, MODVER));

  if (mbkptr != NULL) {
    clsmsg(mbkptr);
    mbkptr = NULL;
  }

  if (bbptr != NULL) {
    clsbtv(bbptr);
    bbptr = NULL;
  }
}

/*
  Module hook stub routines
  These are all stub routines, they show up in the audit.
  They are here to serve as boilerplate for a module.

  stub_called is just a convenience function they all use
  here to output to the audit.

  "The Major BBS Developer's Guide"
    shocst:           Page 148    - Log message to Audit Trail, summary (<= 32 chars), details (<= 65 chars)
    spr:              Page 175    - sprintf-like string formatter utility
    cncall:           Page 77     - expect a variable-length word sequence (consume all remaining input)
*/
static void stub_called(char *rtnnam) {
  static char stub_msg[] = STUB;
  shocst(spr("%s %srou %s", MODNAM, rtnnam, stub_msg), 
         spr("%s %srou %s", ptrmodule.descrp, rtnnam, stub_msg));
}

/*
  lonrou - Log on input service routine.
    See: Page 38, "The Major BBS Developer's Guide"
*/
static int bhz_stub_lonrou(void) {
  stub_called("lon");
  cncall();
  return 0;
}

/*
  stsrou - Status handler routine.
  dfsthn - Default status handler.
    See: Page 35, "The Major BBS Developer's Guide"
*/
static void bhz_stub_stsrou(void) {
  stub_called("sts");
  dfsthn();
}

/*
  injrou - Reprompting routine.
    See: Page 35, "The Major BBS Developer's Guide"
*/
static int bhz_stub_injrou(void) {
  stub_called("inj");
  cncall();
  return 0;
}

/*
  lofrou - Log off input service routine.
    See: Page 38, "The Major BBS Developer's Guide"
*/
static int bhz_stub_lofrou(void) {
  stub_called("lof");
  cncall();
  return 0;
}

/*
  huprou - User disconnect (hang-up) routine.
    See: Page 38, "The Major BBS Developer's Guide"
*/
static void bhz_stub_huprou(void) {
  stub_called("hup");
  cncall();
}

/*
  mcurou - Auto-cleanup routine.
    See: Page 38, "The Major BBS Developer's Guide"
*/
static void bhz_stub_mcurou(void) {
  stub_called("mcu");
  cncall();
}

/*
  dlarou - Delete user account routine.
    See: Page 38, "The Major BBS Developer's Guide"
*/
static void bhz_stub_dlarou(void) {
  stub_called("dla");
  cncall();
}

  11 22FL    #LIS  K0XENON>K0LIBRARY>K0ALLGEO
  15 22_=    #SEG  XENON                        [N.R.BOULT   
   9 23DW                   8HXENON  
  11 23YG          SEGENTRY K1XENON,QK1XENON 
  11 24D6          SEGENTRY K2XENON,QK2XENON 
  19 24XQ    #     THIS SEGMENT TRIES TO GET XENOTAPES AND NON-STANDARD TAPES
   9 25CB    #     LOADED FOR USERS. 
   8 25X2    #     HENCE ITS NAME
   4 26BL    #   
   4 26W=    #   
   7 27*W    #     CONSTANTS 
   4 27TG    #   
   4 27WF ...#   
   9 27XD ...QFAST          4HFAST   
   9 27YC ...QSLOW          4HSLOW   
   7 27YL ...#UNS  JMODGCR   
   4 27YT ...#SKI
   4 27_4 ...(   
   9 27_B ...TAB1           +GLIBTRA7
   9 282* ...               +GLIBTRA9
   9 283# ...               +GLIBPE  
   9 284? ...               +GLIBNRZI
   8 285= ...TAB2           +6   
   9 2869 ...               8HTRACK7 
   8 2878 ...               +6   
   9 2887 ...               8HTRACK9 
   8 2896 ...               +2   
   8 28=5 ...               8HPE 
   8 28?4 ...               +4   
   9 28#3 ...               8HNRZI   
   4 28#J ...)   
   4 28*6    #   
  15 28SQ    #                                  ENTRY POINT 1
  14 29#B    #     THIS IS THE ENTRY POINT FOR XENOTAPES 
   5 29S2    QK1XENON
  17 2=?L          MHUNT    3,FILE,FABSNB       [ABSOLUTE NAME BLOCK 
   9 2=R=          SMO      HDREC(3) 
  18 2?=W          LDX   0  A1-6(3)             [FIRST WORD OF LOCAL NAME
  14 2?QG          BNZ   0  P1                  [NON-ZERO
   8 2#=6    #     NO LOCAL NAME 
  15 2#PQ          SETREP   XENONAME            [SET REPLY   
  15 2*9B          UPPLUS   1                   [REPORT BACK 
  13 2*P2    #     CHECK IF CLASH WITH SECURE TAPE   
   9 2B8L    P1    SMO      HDREC(3) 
  16 2BN=          LDXC  7  A1+1(3)             [TSN(B0 NOT SET) 
  17 2BY4 ...      BCS      /                   [CLEAR CARRY IF SET  
  12 2C7W          OPENSYS  PBRKIN,SERIAL,READ   
  20 2CMG          SSEARCH  P2,7                [LOOK FOR ENTRY IN :SYSTEM.SERIAL
  16 2D76    #     TSN FOUND - OPEN DIRECTORY TO COMPARE NAMES   
  18 2DLQ          LDX   4  2(3)                [1ST WORD OF USER NAME   
  15 2F6B          BZE   4  P2                  [NOT OWNED   
   8 2FL2          LDX   0  5(3) 
   7 2G5L          SLC   0  1
  15 2GK=          BNG   0  P2                  [OR WORK TAPE
   8 2H4W          LDX   5  3(3) 
   8 2HJG          LDX   6  4(3) 
  11 2J46          SETNCORE 12,3,FILE,FABSNB 
   8 2JHQ          LDN   0  10   
  16 2K3B          STO   0  A1(3)               [RECORD HEADER   
   8 2KH2          LDN   0  #2001
  15 2L2L          ORS   0  ATYPE(3)            [MT ENTRANT  
   9 2LG=          STO   4  A1+1(3)  
   9 2L_W          STO   5  A1+2(3)  
   9 2MFG          STO   6  A1+3(3)  
   9 2M_6          STOZ     A1+4(3)  
   9 2NDQ          LDN   0  A1+4(3)  
   9 2NYB          LDN   1  A1+5(3)  
   7 2PD2          MOVE  0  5
   7 2PXL          NGN   0  1
  17 2QC=          STO   0  A1+10(3)            [NO RETENTION PERIOD 
  13 2QWW          STO   7  A1+11(3)            [TSN 
  12 2RBG          OPENDIR  PBRKIN,READ,ERASING  
  10 2RW6          MFREE    FILE,FABSNB  
   8 2S*Q    #     COMPARE NAMES 
  10 2STB          MHUNT    3,FILE,ENT   
  10 2T*2          MHUNT    2,FILE,FABSNB
   9 2TSL          LDX   0  ELOC1(3) 
  17 2W#=          BZE   0  P4                  ['NEW' SO CAN'T TELL 
   9 2WRW          SMO      HDREC(2) 
   9 2X?G          TXU   0  A1-6(2)  
  15 2XR6          BCS      P4                  [DIFFERENT   
   9 2Y=Q          LDX   0  ELOC2(3) 
   9 2YQB          SMO      HDREC(2) 
   9 2_=2          TXU   0  A1-5(2)  
  15 2_PL          BCS      P4                  [DIFFERENT   
   9 329=          LDX   0  ELOC3(3) 
   9 32NW          SMO      HDREC(2) 
   9 338G          TXU   0  A1-4(2)  
  15 33N6          BCS      P4                  [DIFFERENT   
   9 347Q          SMO      HDREC(2) 
  13 34MB          LDX   0  A1-3(2)             [REEL
   8 3572          ANDN  0  #7777
   9 35LL          TXU   0  EREEL(3) 
  15 366=          BCS      P4                  [DIFFERENT   
   9 36KW          SMO      HDREC(2) 
  15 375G          LDX   0  A1-2(2)             [GENERATION  
   8 37K6          BZE   0  PNOX 
   8 384Q          ANDN  0  #7777
   9 38JB          TXU   0  EGEN(3)  
  15 3942          BCS      P4                  [DIFFERENT   
   9 39HL    #     THE ENTRIES TALLY 
   4 3=3=    PNOX
  15 3=GW          CLOSETOP                     [DIRECTORY   
  14 3?2G          CLOSETOP                     [SERIAL  
   9 3?G6          SETREP   NOXENO   
   7 3?_Q          UPPLUS   1
  11 3#FB    #     THE ENTRIES DO NOT TALLY  
  15 3#_2    P4    CLOSETOP                     [DIRECTORY   
  14 3*DL    P2    CLOSETOP                     [SERIAL  
   7 3*Y=          LDN   4  0
   9 3BCW          STOZ     AWORK3(2)
  13 3BXG          LDX   6  7                   [TSN 
  14 3CC6          ORX   6  GSIGN               [SET B0  
  10 3CWQ    #     CHECK IF TAPE LOADED  
   5 3DBB    XWAKE   
  12 3DW2          OPENSYS   PBRKIN,DOCUMENT,READ
   9 3F*L    XW1   SDSEARCH XW3,TSN,6
  16 3FT=          MHUNT    2,FILE,FABSNB       [NAME COMPARISON 
   9 3G#W          SMO      HDREC(2) 
  15 3GSG          LDX   0  A1-6(2)             [1ST WORD ?  
   8 3H#6          TXU   0  3(3) 
  13 3HRQ          BCS      XW1                 [NO  
   9 3J?B          SMO      HDREC(2) 
  15 3JR2          LDX   0  A1-5(2)             [2ND WORD ?  
   8 3K=L          TXU   0  4(3) 
  13 3KQ=          BCS      XW1                 [NO  
   9 3L9W          SMO      HDREC(2) 
  15 3LPG          LDX   0  A1-4(2)             [3RD WORD ?  
   8 3M96          TXU   0  5(3) 
  13 3MNQ          BCS      XW1                 [NO  
   9 3N8B          SMO      HDREC(2) 
  11 3NN2          LDX  0  A1-3(2)     [REEL 
   8 3P7L          ANDN  0  #777 
   8 3PM=          TXU   0  6(3) 
  13 3Q6W          BCS      XW1                 [NO  
   9 3QLG          SMO      HDREC(2) 
  15 3R66          LDX   0  A1-2(2)             [GENERATION  
   8 3RKQ          BZE   0  XW   
   8 3S5B          ANDN  0  #7777
   8 3SK2          TXU   0  7(3) 
  13 3T4L          BCS      XW1                 [NO ?
   4 3TJ=    XW  
  20 3W3W          CALL  7  TSTALLOC            [SEE IF TAPE IS ALREADY IN USE   
  15 3WHG          BRN      Q4                  [NOT IN USE  
   8 3WR# ...      BRN      XWA  
   8 3X36    XW3   BZE   4  XNUP 
   8 3XGQ          SMO      FX2  
   9 3Y2B          STOZ     AWORK3   
   7 3YG2    XNUP  LDN   4  0
   4 3YPS ...XWA 
   7 3Y_L          CLOSETOP  
  15 3_F=          BRN      PA                  [FOR REQUEST 
  13 3_YW    #     GRAB TAPE - CHECK WPR & MODE STATE
   4 42DG    Q4  
  11 42Y6          MHUNT    2,CPAR,GPERCON   
   7 43CQ          NGN   0  2
   9 43XB          ANDX  0  A1+2(2)  
   8 44C2          BZE   0  PM   
  15 44WL          MOCHAS                       [CHECK MODE  
  13 45B=          TESTREP  OK,PM               [OK  
  16 45TW          TESTREP  SWITCHED,PM         [OR SWITCHED OK  
   7 4634 ...#UNS     JMT21  
   7 468= ...      MT21SMES  
   8 46*G          BRN      PUNL 
   4 46T6    PM  
  10 46W# ...      HUNTW    1,FLIB,FSPD  
  17 46XG ...      BNG   1  PMW                 [J NO PROPS SPECIFIED
   8 46XR ...      LDX   0  A1(1)
   7 46XW ...#UNS  JMODGCR   
   4 46X_ ...#SKI
  15 46Y4 ...      ANDN  0  GLIBTRA9+GLIBTRA7+GLIBPE+GLIBNRZI
   7 46Y7 ...#UNS  JMODGCR   
  17 46Y= ...      ANDN  0  GLIBTRA9+GLIBTRA7+GLIBPE+GLIBNRZI+GLIBGCR
  17 46Y* ...      BZE   0  PMW                 [J NO HW CODE GIVEN  
  18 46YN ...      MTCHAR   A1(1)               [CONVERT SPD TO HW CODE  
  16 46_W ...      LPROP    ,5                  [GET DECKS PROPS 
  10 4734 ...      LDX   0  ACOMMUNE1(2) 
   8 474= ...      LDN   1  #201 
   8 475D ...      BXL   0  1,PMV
   8 476L ...      ANDN  5  #203 
   8 477S ...      BRN      PMV1 
   8 4792 ...PMV   ANDN  5  #200 
   9 47=8 ...PMV1  BXU   5  0,PUNL   
   4 47?B ...PMW 
  11 47#Q          MHUNT    2,CPAR,GPERCON   
   7 47SB          LDN   1  1
   8 48#2          SMO      FX2  
   8 48RL          LDX   3  CPPTR
   8 49?=          JWPR     3,PMX
   7 49QW          LDN   1  0
   4 4==G    PMX 
  19 4=Q6          LDX   7  1                   [X7=1 IF WPR, =0 IF NO WPR   
   7 4?9Q          LDN   0  1
   9 4?PB          ANDX  0  A1+2(2)  
  18 4#92          BZE   0  P6                  [WPR STATE NOT SPECIFIED 
   9 4#NL          ANDX  0  A1+1(2)  
  14 4*8=          ERX   0  1                   [COMPARE 
  14 4*MW          BZE   0  P6                  [AGREE   
   8 4B7G          LGEOG    3,5  
   9 4BM6          UNLOAD   ,,,UNL   
   9 4C6Q          LONGSET  #61,XWT,6
   8 4CLB          BZE   6  P5   
  15 4D62          CONSERNO 6                   [CONVERT TSN 
  10 4DKL          MHUNT    3,FLIB,FTSN  
  12 4F5=          OUTPARAM A1(3),A1+1,FLIB,FTSN 
   8 4FJW          BRN      P5A  
   7 4G4G    P5    OUTNULL   
   8 4GJ6    P5A   OUTNUM   5,0  
  16 4H3Q          BZE   7  P5B                 [J IF WPR NEEDED 
   9 4HHB          MTREQUEST HUNLWP  
   8 4J32          BRN      P5C  
   9 4JGL    P5B   MTREQUEST HLOADWP 
  17 4K2=    P5C   LDN   4  0                   [TAPE NO LONGER UP   
   9 4KFW          STOZ     AWORK3(2)
   8 4K_G          BRN      PA1A 
   9 4LF6    PUNL  UNLOAD   ,,,UNL   
  17 4LYQ          LDN   4  0                   [TAPE NO LONGER UP   
   9 4MDB          STOZ     AWORK3(2)
   8 4MY2          BRN      PA   
   8 4NCL    P6    LDX   2  FX2  
   6 4NX=          PERON 
   9 4PBW          VFREE    GMON,AOUT
   8 4PWG          SETREP   OK   
   7 4QB6          UPPLUS   1
   9 4QTQ    #     TAPE NOT LOADED   
  18 4R*B    PA    LONGSET  #61,XWT,6           [WAITING FOR TAPE LOAD   
   4 4RT2    PA1A
   9 4S#L          LDX   0  AWORK3(2)
   8 4SS=          BZE   0  PA1  
   9 4T?W          LDX   0  AWORK4(2)
   9 4TRG          STO   0  EXEC3(2) 
   8 4W?6          BRN      REENT
   4 4WQQ    PA1 
  15 4X=B          BZE   6  P7                  [NON-STANDARD
   7 4XQ2          CONSERNO 6
  13 4Y9L          MHUNT    3,FLIB,FTSN         [TSN 
  12 4YP=          OUTPARAM A1(3),A1+1,FLIB,FTSN 
   8 4_8W          BRN      P8   
  10 4_NG    P7    MHUNT    3,FILE,FABSNB
   9 5286          SMO      HDREC(3) 
  17 52MQ          LDN   7  A1-6                [ADDRESS WITHIN BLOCK
   8 537B          LDN   3  12   
  11 53M2          OUTPARAX 3,7,FILE,FABSNB  
  15 546L    P8    MONOUT   FWAITING            [^WAITING^   
  14 54L=          BNZ   4  OUTP                [TAPE UP 
  15 555W          BZE   6  P9                  [NONSTANDARD 
  14 55KG          OUTMESS  HXEN                [XENOTAPE
  10 5656          MHUNT    3,FLIB,FTSN  
  12 56JQ          OUTPARAM A1(3),A1+1,FLIB,FTSN 
   9 574B          MFREE    FLIB,FTSN
  10 57J2          DOWN     CONSERNO,3   
   9 583L          BRN      PBRKIN   
  10 58H=          MHUNT    3,AONBS,GTN  
  13 592W          OUTPARAM A1+4(3),A1+5,AONBS,GTN   
  10 59GG          MHUNT    3,AONBS,GTN  
  13 5=26          OUTPARAM A1+8(3),A1+9,AONBS,GTN   
   9 5=FQ          MFREE    AONBS,GTN
   4 5=_B    P13 
  10 5?F2          OUTNUM   JOBNO(2),0   
  11 5?YL          MHUNT    3,CPAR,GPERCON   
   9 5#D=          LDX   0  A1+2(3)  
   7 5#XW          ANDN  0  1
  16 5*CG          BNZ   0  WPR                 [WPR REQUIREMENT 
   7 5*X6          OUTNULL   
   8 5BBQ          BRN      P10  
   9 5BWB    WPR   LDX   0  A1+1(3)  
   7 5CB2          ANDN  0  1
  17 5CTL          BZE   0  NOWPR               [DEFINITELY NO WPR   
   8 5D*=          OUTMESS  AWP  
   8 5DSW          BRN      P10  
   5 5F#G    NOWPR   
   8 5FS6          OUTMESS  HNOWP
   4 5G?Q    P10 
  11 5GRB          MHUNT    3,CPAR,GPERCON   
   9 5H?2          LDX   0  A1+1(3)  
   7 5HQL          SRL   0  1
   8 5J==          BZE   0  PM1  
   9 5JPW          OUTMESS  HMODE2   
   6 5K9G          MONICA
  10 5KP6          MHUNT    3,AONBS,GROT 
  12 5L8Q          OUTPARAM A1(3),A1+1,AONBS,GROT
   8 5LNB          BRN      P12  
   4 5M82    PM1 
   7 5MML          OUTNULL   
   7 5N7=          OUTNULL   
   8 5NLW          BRN      P12  
  15 5P6G    P9    OUTMESS  HNS                 [NONSTANDARD 
  13 5PL6          OUTMESS  HMT                 [MT  
  10 5Q5Q          DOWN     CONSERNO,3   
   9 5QKB          BRN      PBRKIN   
  10 5R52          MHUNT    3,AONBS,GTN  
  13 5RJL          OUTPARAM A1+4(3),A1+5,AONBS,GTN   
  10 5S4=          MHUNT    3,AONBS,GTN  
  13 5SHW          OUTPARAM A1+8(3),A1+9,AONBS,GTN   
   9 5T3G          MFREE    AONBS,GTN
   8 5TH6          BRN      P13  
   4 5W2Q    P12 
  10 5WGB          HUNT     2,FLIB,FSPD  
   7 5X22 ...      LDN   7  0
   8 5XFL          BNG   2  P12A 
   8 5X_= ...      LDX   7  A1(2)
   4 5YDW    P12A
   7 5YFM ...      LDX   5  7
  19 5YGD ...      ANDN  5  +GLIBFAST           [PERIPHERAL PR FAST SPECIFIED
  16 5YH9 ...      BZE   5  SLOWSP              [IF NOT THEN J   
  18 5YJ2 ...      LDX   5  QFAST(1)            [ELSE LOAD STRING 'FAST' 
   8 5YJR ...      BRN      SLFS 
   5 5YKJ ...SLOWSP  
   7 5YL* ...      LDX   5  7
  19 5YM6 ...      ANDN  5  +GLIBSLOW           [PERIPHERAL PR SLOW SPECIFIED
  15 5YMX ...      BNZ   5  SLOW1               [IF SO THEN J
  16 5YNN ...      OUTNULL                      [ELSE NO OUTPUT  
   9 5YPF ...      BRN      PERPROP  
   5 5YQ= ...SLOW1   
  17 5YR3 ...      LDX   5  QSLOW(1)            [LOAD STRING 'SLOW'  
   4 5YRS ...SLFS
   8 5YSK ...      LDX   2  FX2  
  16 5YTB ...      STO   5  ACOMMUNE1(2)        [PRESERVE STRING 
  15 5YW7 ...      LDN   3  4                   [LOAD LENGTH 
  17 5YWY ...      OUTPARAM 3,ACOMMUNE1         [FAST/SLOW PARAMETER 
   5 5YXP ...PERPROP 
   8 5YYG          SMO      FX2  
   9 5_D6 ...      STO   7  ACOMMUNE1
  10 5_XQ          DOWN     TRANSPOT,2   
   9 62CB          TESTREP  NOTAV,P11
  10 62X2          MTREQUEST   HSELUNIT  
  14 63BL          BRN      OUTP                [TO WAIT 
   4 63CM ...P11 
  18 63DN ...      HUNT     2,FLIB,FSPD         [RE-FIND FLIB/FSPD BLCK  
  17 63FP ...      BNG   2  NOPP                [J IF DOESN'T EXIST  
   7 63FW ...#UNS  JMODGCR   
   9 63G3 ...      OUTMTPROP A1(2)   
   7 63G8 ...#UNS  JMODGCR   
   4 63G* ...#SKI
   4 63GG ...(   
   8 63GQ ...      LDX   2  A1(2)
  21 63HR ...      ANDN  2  GLIBTRA7+GLIBTRA9+GLIBPE+GLIBNRZI   [PERIPHERAL PROPERTY?
  15 63JS ...      BZE   2  NOPP                [J IF NONE   
  21 63KT ...      LDN   3  4                   [SET UP CT FOR NO TO BE TESTED FOR   
   4 63LW ...PP1 
   7 63MX ...      SMO      3
  14 63NY ...      LDX   0  TAB1-1(1)           [GET MASK
   7 63P_ ...      ANDX  0  2
  18 63R2 ...      BNZ   0  PP2                 [J IF PER PROP DETERMINED
   8 63S3 ...      BCT   3  PP1  
   8 63T4 ...      GEOERR   1,XEN
   4 63W5 ...PP2 
   7 63X6 ...      LDX   0  3
   7 63Y7 ...      SLL   3  1
   7 63_8 ...      ADX   0  3
  20 6429 ...      ADN   0  TAB2-3(1)           [X3= ADDRESS OF PER PROP STRING  
   8 643= ...      SMO      FX2  
   9 644? ...      LDN   1  ACOMMUNE1
  15 645# ...      MOVE  0  3                   [MOVE STRING 
   8 646* ...      LDX   2  FX2  
  19 647B ...      OUTPARAM ACOMMUNE1(2),ACOMMUNE2  [PUT PER PROP IN MESSAGE 
   4 647W ...)   
   9 648C ...      BRN      OPSMESS  
   4 649D ...NOPP
  16 64=F ...      OUTNULL                          [NO PER PROP 
   5 64?G ...OPSMESS 
  10 64#H ...      MTREQUEST  HSLCTWHN   
  14 64*W    OUTP  OUTPAUSE PBRKIN,WOKEN,PCANTDO,2,REENT 
   7 64TG          LDN   0  1
  16 65*6          STO   0  AWORK3(2)           [NOT FIRST TIME  
  16 65SQ          BRN      PA1                 [NEXT PLEASE LOAD
  16 66#B    WOKEN LDN   0  1                   [NOT FIRST TIME  
   9 66S2          STO   0  AWORK3(2)
   9 67?L          LDX   0  EXEC3(2) 
   9 67R=          STO   0  AWORK4(2)
   9 68=W          BZE   6  NSWAKE   
  15 68QG          BRN      XWAKE               [SEE IF OK   
   5 69=6    PCANTDO 
   8 69PQ          SETREP   NOTAV
   7 6=9B          UPPLUS   1
   5 6=P2    PBRKIN  
  14 6?8L          UP                           [BREAKIN 
  15 6?N=    #              ENTRY POINT FOR NONSTANDARD TAPES
   5 6#7W    QK2XENON
   7 6#MG          LDN   4  0
   9 6*76          STOZ     AWORK3(2)
  10 6*LQ          MHUNT    3,FILE,FABSNB
   9 6B6B          LDX   0  ATYPE(3) 
  13 6BL2          ANDN  0  #2000               [TSN?
   9 6C5L          BZE   0  NSWAKE   
   9 6CK=          SETREP   NONSER   
   7 6D4W          UPPLUS   1
   5 6DJG    NSWAKE  
  12 6F46          OPENSYS  PBRKIN,DOCUMENT,READ 
   9 6FHQ          SDSEARCH Q1,NONS  
  18 6G3B          LDN   6  0                   [RESET X6=0 FOR NONS TAPE
  20 6GH2          CALL  7  TSTALLOC            [SEE IF TAPE IS ALREADY IN USE   
   8 6H2L          BRN      Q4   
   8 6HG=          BRN      QA   
   8 6H_W    Q1    BZE   4  QNUP 
   8 6JFG          SMO      FX2  
   9 6J_6          STOZ     AWORK3   
   7 6KDQ    QNUP  LDN   4  0
  15 6KYB          LDN   6  0                   [NONS MARKER 
  14 6LD2    QA    CLOSETOP                     [DOCUMENT
   8 6LXL          BRN      PA   
  17 6MC=    #              SUBROUTINE TO TEST IF DECK IS ALLOCATED  
   5 6MWW    TSTALLOC
   8 6NBG          SBX   7  FX1  
  17 6NW6          LDX   3  22(3)               [DEVICE LIST POINTER 
  15 6P*Q ...      JALLOC   3,TSTJOB            [ALLOCATED   
  16 6PTB          SETALLOC 3                   [MARK ALLOCATED  
   8 6Q*2          SMO      FX2  
   8 6QSL          STO   3  CPPTR
  10 6R#=          HUNT     1,FLIB,GOLMT 
   8 6RRW          BPZ   1  NBLK 
  11 6S?G          SETNCORE 11,1,FLIB,GOLMT  
   7 6SR6    NBLK  STEPAGAIN 
  10 6T=Q          MHUNT    1,FLIB,GOLMT 
   8 6TQB          LDN   0  2(3) 
   9 6W=2          LDN   1  A1+3(1)  
   7 6WPL          MOVE  0  8
  18 6X9=          LDX   0  0(1)                [REMOVE BIT 0 IF XENOTAPE
  21 6XNW          STOC  0  0(1)                [SO THAT OBJ PROG REPLY IS CORRECT   
  14 6Y8G          CLOSETOP                     [DOCUMENT
   8 6YN6          ADX   7  FX1  
   7 6_7Q          EXIT  7  0
   5 6_9F ...TSTJOB  
   8 6_?8 ...      LJOBNO   3,0  
  19 6_#X ...      BZE   0  XIT                     [CHECK NOT ALREADY ONLINE
   8 6_BL ...      SMO      FX2  
  15 6_D* ...      BXU   0  JOBNO,XIT            [TO THIS JOB
  17 6_G4 ...      CLOSETOP                          [SYSTEM.DOCUMENT
   9 6_HR ...      SETREP   CLUDGE   
   7 6_KG ...      UPPLUS   1
  14 6_MB    XIT   LDN   4  1                   [TAPE UP 
   8 7272          ADX   7  FX1  
   7 72LL          EXIT  7  1
   4 736=    #   
   7 73KW    #     GEOERRS   
   4 745G    #   
   8 74K6    XWT   GEOERR   1,XWT
  10 754Q          MENDAREA 50,K99XENON  
   4 75JB    #END
   8 ____ ...07352010001200000000

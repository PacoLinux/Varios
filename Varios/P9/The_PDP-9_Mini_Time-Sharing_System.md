https://bitsavers.org/pdf/dartmouth/theses/Blean_-_The_PDP-9_Mini_Time-Sharing_System_197206.pdf

				THAYER SCHOOL OF ENGINEERING
						DARTMOUTH COLLEGE

				The PDP-9 Mini Time-Sharing System
							  by

						Robert Wo Blean

						Master of Science

						JUNE 1972

						ABSTRACT

The PDP-9 Mini Time-Sharing System (MTSS) is a small general purpose time-sharing system running on a Digital Equipment Corporation PDP-9 computer with BK of core memory and three Teletype terminals. MTSS demonstrates the practicality of implementing a general purpose time sharing system on such a small computer, and illustrates one way in which this can be done.
 
MTSS provides the facility for three users simultaneously to load or create, debug, run, and save arbitrary machine language programs. These machine language programs may exceed (slightly) 7K in length, or may be arbitrarily large if assembled in 7K segments.

MTSS imposes minimum constraint on the content of such programs. Physical paper tape, Teletype, and disk input/output are available to users using standard IOT instructions. Physical disk and DECtape input/output are available to users by means of Special IOT instructions~ Logical file operations on disk or the user's own DECtape are also available by Special IOT instructions.

MTSS is designed to permit additional system programs and features to be easily added.



					 ACKNOWLEDGEMENTS

I would like to express my gratitude to my advisor, Professor Miles Ve Hayes, for his help, encouragement, and time spent as a sounding board. In addition, I am grateful for the advice of my other committee members.

My thanks also go to Thayer School and to the College for the resources provided which enabled me to do this projecto Finally, my thanks to those students who maintain the service software I used in DTSS and on the PDP-9 for their unending patience with my allegations of buqs in their programs (and prompt repairs when my allegations were correct).



					TABLE OF CONTENTS

1. ABSTRACT

2. ACKNOWLEDGEMENTS

3. INTRODUCTION

4. ENVIRONMENT

	4.1. Software Environment
	
	4.2. MTSS, GROWTH, and DTSS Relationship 13
	
	4.3. Hardware Environment 14
	
5. INPUT/OUTPUT DEVICE TREATMENT 18

6. SYSTEM INITIALIZATION 26

	6.1. What A ctually Happens 28
	
	6.2. Adding New System Programs to MTSS 28
	
7. HOW TO LOAD AND RUN A PROGRAM 30

	7.1. System Programs 30
	
	7.2. User-Supplied Programs 30
	
8. MTSS CONVENTIONS 31

9. PROGRAM STRUCTURE 33

	9.1. Resident Executive 33
	
	9.2. Executive Overlays 35
	
		9.2.1) SWAPPER 35
		
		9.2.2) Memory Protection 40
		
		9.2.2.1) Memory Reference Instructions 41
		
		9o2.2.2) Operate Instructions 41
		
		9.2.2.3) Input/Output Instructions 42
		
		9.2.3) Special IOT Instructions 46
		
	9.3. Phantom Programs 53
	
		9.3.1 MONITOR 53
		
			9.3.1.1 Commands 54
			
			9.3.1.2 Validation 56
			
			9.3.1.3 Control Line 57
			
			9.3.1.4 MONITOR Error Messages 57
			
			9.3.1.5	Run-Time Error Messages 58
			
		9.3.2 LOADER 61
		
			9.3.2.1 Formats 61
			
			9.3.2.1 Filenames 61
			
			9.3.2.1 Commands 61
			
		9.3.3 DDT
		
			9.3.3.1 Command Format 65
			
			9.3.3.2 File Specification 65
			
			9.3.3.3 Range specification 67
			
			9.3.3.4 Mode specification 67
			
			9.3.3.5 DDT Commands 70
			
		9.3.4 CATALOG 77
		
	9.4 System-Supplied User Programs 78
	
		9.4.1 BASIC Interpreter 79
		
		9.4.2 DEBUGGER 78
		
	9.5 General Discussion of System Programs 80
	
10. SCHEDULING

11. FILE STRUCTURE

12. CORE STRUCTURE

13. DISK STRUCTURE


							FIGURES

12.1. MTSS CORE MAP: USER or S-USER PROGRAM 79

12.2. MTSS CORE MAP: PHANTOM PROGRAM 81

13.1. MAJOR DIVISIONS OF THE DISK 83

13.2. A TYPICAL USER'S DISK AREA 85

13.3. MAJOR DIVISIONS OF THE MTSS/GROWTH DISK 86

--

							APPENDICES

PROGRAM LISTINGS

A. Initialization

B. Executive Resident

C. Executive Overlays

 1) Memory Protection #1
 
 2) Memory Protection #2
 
 3) Special IOT handler
 
 4) Swapper
 
D. Phantom programs

 1) MONITOR/system message output
 
 2) LOADER
 
E) System-Supplied User programs

 1) DDT
 
 2) [BASIC Interpreter](./PDP9.MAR.asm)

						INTRODUCTION

The PDP-9 Mini Time-Sharing System (MTSS) is a general purpose time sharing system running on a Digital Equipment Corporation (DEC) PDP-9 computer with BK of core memoryo MTSS is capable of handling arbitrary user-originated machine-language programs whose length may (slightly) exceed 7K without segmenting, or may be arbitrarily large if assembled in 7K segments.

MTSS is a two-fold project. It serves the educational purpose of illustrating one way in which a general purpose time-sharing system can be implemented. It is also an exploration of the practicality of a general purpose time- sharing system on such a small computer.

Educational Role

MTSS provides a relatively simple system running on a relatively simple hardware setup for students to work with. In contrast to a larger public-utility type of system MTSS is designed to be easily altered by students to see how changes affect the system. MTSS is ·simple enough for this to be practical; it is written flexibly enough to permit easy addition of system features or system programs. The small core size of the PDP-9 proves to be a much less serious limitation than one might suppose. One could implement on MTSS almost any feature of a larger system he wished to.

---Section 3 -1-

--

Practicality

It is interesting to note that the PDP-9 memory protection hardware was engineered assuming that it would not be used on an 8K machine (see section 4.3: Memory Protection). In spite of that, MTSS is a highly flexible system capable of giving good service to a limited number of users. The main limitation on the number of users is that it is difficult to fit very many Teletype line buffers into a Resident Executive which is itself only about seven hundred
(octal) words long.

MTSS Hardware

MTSS uses:

one minimum configuration PDP-9 including:

8K of 18 bit core memory

300 cps paper tape reader

50 cps paper tape punch console Teletype

16.7 msec real time clock

high speed I/O data channels

program interrupt control

---Section 3 -2-

--

memory protection option

disk controller with one 256K disk platter

DECtape controller with two DECtape transports Teletype

controller with two model KSR33 Teletypes


These numbers are in no way system limits. In addition to the current hardware, MTSS is capable of supporting additional disk platters, DECtapes (DEC's block addressable magnetic tape), and additional terminals~ MTSS could be considerably expanded, should the hardware be purchased.

System Transparency

MTSS is designed to permit machine language programs to operate as nearly as possible as they would on a dedicated machine (i.eo MTSS is designed to permit maximum practical system transparency.) Also the user can control from his Teletype nearly all of the functions he could normally control from the console switches. Transparency makes the system especially valuable to beginning machine-language programmers.

System transparency permits programs written for the PDP-9 to be run under MTSS with minimal alterations. Illustrating this, MTSS currently runs the GROWTH system DEBUGGER, LOADER, standard Teletype handler and standard

---Section 3 -3-

--

INTRODUCTION (continued)

catalog routines. These are run with little change from the originals, except to add a few features desirable for MTSS users~ The BASIC Interpreter is also run this way.

As an extension to its transparent mode of operation MTSS offers users certain Executive services~ The user requests such services by using "Special IOT instructions".

MISS System Programs

MTSS system programs are of three types. The first type is the Executive program. The Executive consists of one Resident Executive program and (currently) four Executive overlays. The overlays are SWAPPER, two Memory Protection overlays, and a Special IOT handler. (Special IOT'S are MTSS EXECUTIVE service calls.)

The second type of system program is the Phantom programQ Phantom programs may be thought of as parts of the Executive that run in place of the user for whom they are doing a serviceo Except that they have privileges normally reserved for the Executive, and except that they alter neither the user's core nor his registers, they are in all respects a user program& The name is derived from the fact that apart from the service it· performs, the user cannot detect the presence of a Phantom program.

---Section 3 -4-

--

NTRODUCTION (continued)
The third type of system program is the System-Supplied User Program (S-user program)~ These programs are, at the user's request, overlaid on his coree
User Programs
MTSS permits a user to load (using LOADER) or to create (by patching with DDT)· his machine language programe The user can then debug the program (using DDT) or he can run it (from MONITOR or from DDT) o Upon completion he can save to
disk or to DECtape his core image and/or his "physical disk" (using LOADER) o
A lternatively he can create· and - run· a BASIC program using the BASIC Interpreter.
MTSS Disk and DECtape Usage
MTSS uses the disk for· program storage and for swapping. It keeps a copy of each of· its files (except the initialization and Resident Executive programs) on the disk. Each time it needs a program it reads in a fresh copy.
Also on the disk, for each user, is a place to which he can be swapped, a place to which the non-pure portion of any Phantom program he caused· to run for him can be swapped, and
Section 3 -5-

--

INTRODUCTION (continued)
an area referred to as the user·'s 0 physical disk". The user's "physical disk" is the only area of the disk he can reference physicallyo He can do this either with standard IOT instructions or with a Special.
MTSS files are cataloged in the GROWTH system catalog. It is possible for a user to catalog files in the same catalog a This practice is strongly· discouraged, however, else the disk would soon be fullo It is preferred that the user save his files only on his own DECtapeo Files saved on either the disk or on the user's own DECtape are completely compatable with the major operating system on the dedicated machine (the GROWTH system) o Likewise, files saved under GROWTH are accessible to MTSS~
System Performance and V erification
MTSS verification has been somewhat informal. One type of verification is that the system runs. Both the Phantom programs (MONITOR, LOADER, DDT, and CATALOG) and the S-user programs (DEBUGGER and BASIC) run successfullyG This set of programs includes three written for the system, and three written previously with no thought of the system~ That all of these run successfully is regarded as verification of the system's ability to run arbitrary· machine-language programso
Section 3 -6-

--

NTRODUCTION (continued)
The system's ability to handle infinite· loops and large amounts of output has been demonstrated by setting from one to three Teletypes ·doing either· an infinite loop (and verifying that each Teletype was getting ·it's share of service) or doing· an infinite core dump to the Teletype.
User response has always been good~ In none.of the above trials~ nor in any specially patched test programs has it been possible. to deprive any user · of his share· of processor time, to prevent him from returning to MONITOR at will, or to prevent him from keeping his Teletype continuously busy with output if that was what his program was trying to do. It has
not been possible to drive user response to be slower thart one and a half or two seconds, and response is generally faster than that5
The sole exception to these response figures is that if one user is doing ·a DECtape operation, it temporarily suspends all system functions except buffered· Teletype I/O. This produces no noticeable effect generally, but is noticeable if a long DECtape operation is involvedo A long DECtape operation is felt to be rare enough· that this is not a very significant shortcomingo
Section 3 -7-

--

INTRODUCTION (continued)
Scope
This thesis project establishes a powerful and flexible structure for MTSSQ It does not attempt -to completely fill in this structure· more than is necessary to demonstrate the important features of it~ Thus further program level system services would - be provided as additional Special IOT instructions, possibly requiring additional Special overlays or Phantom programs~ Improved catalog structure, file- building and editing, compilers, and assemblers would all be provided as additional Phantom programs~ The DATAPHONE and Graphics II peripherals could be enabled, but would probably each require an additional memory protection overlaye The Automatic Priority Interrupt system could be enabled in the same manner as the Program Interrupt system is now, but would require a larger Resident Executive, which would slightly exceed lK, pushing the Executive size up to the next boundary, 2K~ In· the current implementation it was felt desirable to allow maximum size user programs~
Comparison
It is difficult to compare MTSS directly with other small machine time-sharing systems~ Most such systems require from 12K to 20K minimum core size, and it is not
Section 3 -8-

--

INTRODUCTION (continued)
always clear how many users this size can handle. Most such systems are then limited to running interpretive programso Perhaps better than most is DECws PDP-8 system which can run user programs of up to 4K in length in a machine with a minimum of 12K of core0
By contrast, MTSS can handle arbitrary programs for userso MTSS allows 7K user programs to be run in an BK
machine, and full size programs to also be debugged. With its Phantom and s-user system program structure added to its capability for running arbitrary user-mode machine-language programs, MTSS is particularly easy· to expand· to add system services as desired~ Adding system services does· not make MTSS any larger than nowu It merely requires more disk storage&
Future Ideas
There are several minor additions that could be made& One could make a virtue of the software echo required for the remote Teletypes by adding a mode to refrain from doing the echoing, thus concealing inputo
The catalog · structure could be changed to permit filenames of more than three characters, as well as passwords and access bits.
Section 3 -9-

--

NTRODUCTION (continued)
There are also some more important additionso To conserve core space·with a lot of Teletypes, a denser packing scheme could be used for Teletype buffers. To minimize Teletype buffer size·, an improved scheduling algorithm could be developed to give a priority for core time to a job which has just had it's I/O roadblock status cleared.
A number of MONITOR· commands, including specifically the resource allocation and de-allocation commands could be handled from programs, possibly~
If the Resident Executive is allowed to grow, and if the Executive overlay area is allowed to grow, the Graphics II scope and the DATAPHONE could be enabled, and user API service could also be enabled.
A very useful thing would be to have· a fault vector for user programs~ This· should be optionally enabled by either a MONITOR command or a Special IOT instruction. It would, for example, permit system programs such as DDT to retain control when the user does an illegal operation0 It would mean that not all currently fatal errors need be so0
Special IOT instructions for bulk data transfers could be easily amended to specify a device table entry rather than an actual device for the transfer. Then this table
Section 3 -10-

--

INTRODUCTION (continued)
could be set either by a MONITOR command or by a Special IOT, thus giving programs- full device independence a The transfer commands could also be expanded to include paper tape operations and Teletype operations.
User CAL instructions should be made legal. When that is done then the DEC VSA·operating system can be added to the system as a set of S-user programsw There is no reason other than the CAL instruction why VSA cannot be run so far as it fits into 7K.
Section 3 -11-

--

ENVIRONMENT
MTSS is not operating in a vacuum~ To maximize its usefulness and to minimize inconvenience for all machine users it must take into account established local patterns of usage as well as available hardware ..
4.1 ) Software Environment
At Dartmouth the PDP-9 is used mainly for two purposes$ One purpose is to allow actual hands-on machine experience for beginning machine language prograrnmerso The other (lower priority) purpose is the playing of real-time games on the
Graphics II display scope~ The locally programmed GROWTH operating system is commonly used; the DEC VSa operating system usage is small and declining.
Most PDP•9 users-do all of· their file building, editing, and assembling operations -under the· Dartmouth Time-Sharing System for two reasons~ First, DTSS has more familiar and more powerful facilities for these things than does the PDP- 9o Second, this frees the PDP-9 from unnecessary work, allowing it to do those things which can be done only on it -- the debugging and running of PDP-9 machine language programso MTSS, therefore, accepts- all forms of output from the DTSS assembler (9MAP) o
Section 4al -12-

--

ENVIRONMENT (continued)
To permit users to easily switch operating systems without doing frequent disk saves to and restores from DECtape all three systems share the disk (see section 13)~ Since GROWTH is more commonly used than VSA, MTSS and GROWTH catalogs and files are interchangeable (see section 11)0
There are two other fundamental constraints underlying MTSS designo One is that, since most machine usage is to gain familiarity with machine language programming, maximum system transparency should be retained~ That is, so far as possible, a program running under MTSS should produce the same results it would on the bare machine~ The other constraint is that since we have only 8K of core, users should be allowed as much core as possible~ Due to the way
the memory protection hardware works this means restricting the operating system to lKo
4 "2) Relationship· Between· MTSS ·, . GROWTH, and DTSS
Neither GROWTH nor MTSS has its own assemblere To create a program for the PDP-9 one should create a source file in DTSS, assemble it in DTSS using 9MAP, and either punch the object file on a paper tape or write it on a DECtapeo Copy either version onto a DECtape with a GROWTH catalog if you
wish tos (If you do not know how to do these things consult

--

ENVIRONMENT (continued)
the GROWTH system documentation which is available both in the DTSS file PDP9LIB***:DOCUMENT and in a line printer listing binder in the PDP-9 machine roomQ)
Files written in any format onto paper tape, disk, or DECtape by the GROWTH system are acceptable to MTSS; and files created by MTSS are acceptable to GROWTHo

4o3) Hardware Environment
MTSS runs on a DEC PDP-9 computer with 8K of core memory~ Core memory is (optionally) expandable to 32K by 8K increments~ Memory cycle time is one micro-secondw For high
speed data transfers the memory is accessed by a data channel facilityo
Clock
Timing is controlled by a sixty· pulse per second real- time clockm The clock can be enabled or disabled under program control.
Program Interrupt-system
Coordination is achieved through the Program Interrupt control (PI) , a single level interrupt facility which can be

Section 4~3 -14-

--

ENVIRONMENT (continued)
enabled or disabled under program control. All input/output devices are interfaced to the PI, as are the clock and memory protection violationso Disk and DECtape can be disconnected from the PI under program control~ Upon receipt of an interrupt a flag search must be made to determine which device generated the interrupt.
Memory Protection
The memory protection option permits a boundary to be set which specifies protected core {locations 0 to boundary - 1) and unprotected core (locations boundary to the maximum core address) c This boundary can be set, under program control, in 2000(8) word increments.. Memory protection violations are caused by an attempt to execute any IOT instruction, to halt, to OR the accumulator switches into the accumulator, to do a memory reference instruction whose effective address is below the· boundary·, or to do an XCT of an XCT. The last is because chained· XCT's form a non- interruptable sequence~ Note that indirect memory references where the effective address is fetched from a location below the boundary are quite legal if the effective address is itself above the boundary~ In particular this allows the user to reference the auto-index registers indirectly (thus altering them), so the Executive may as well
Section 4..3 -15-

--

ENVIRONMENT (continued)
allow the user full and correct use of them.
References to non-existant memory, including disk or DECtape data channel transfers past the end of ·core are supposed to be trapped with the non-existant memory reference violation flag set .. On an· 8K PDP-9, however, this flag is not enabledo- ·Non-existant memory references instead wrap core (i$eQ they are used mod 8K) Q The result is that memory reference instructions will either cause an ordinary memory protection violation, or if they are far enough off the end of core will be legal~ But data channel transfers that go off the end of core will not traEo If such a data channel transfer were writing to core it could destroy the resident Executiveo Therefore the system must do enough error checking to never let such a transfer get under way..
User mode can be enabled under program control.. It is disabled by a program interrupt, by a memory protection violation, by a CAL ·instruction, or by a CAL (indirect) instructiono The system must be careful or else a CAL
(indirect) could seize control of the system.

Peripheral Devices

Standard PDP-9 peripheral devices used in MTSS are a 300 cps paper tape reader, a 50 cps paper tape punch, and a KSR33

Section 4.3 -16-

--

	
ENVIRONMENT (continued)
Teletypeo MTSS currently also has· one multi-station Teletype control and two Teletypes connected to it·e The PDP-9 can accept up to four Teletype ·controls,· each of which can control up to four Teletypes~ For these remote Teletypes software must echo each· character· typed~ The console Teletype has a hardware echoo
DECtape is DEC 8 s block ·addressable magnetic tapeQ A single block anywhere on the tape can be read or writtenG Standard DECtape format is 1100(8)· blocks of 400(8) words eacho The DECtape can be attached to or detached from the PI system under program control. MTSS has one DECtape control and two DECtape transports~ The control is capable of handling up to· eight transports~
MTSS has one disk control with one 256K fixed head disk plattero The disk can· be attached to or detached from the PI SYSTEM under program control~ The control can handle up to eight platterso
Section 4c3 -17-

--

INPUT/OUTPUT DEVICE TREATMENT

Except for Teletypes it is not practical to make a permanent as~ignment ·of· ·any resource to a particular user. For one thing there would not be enough resources for all userso In the second place, even if there were, someone would be apt to have a legitimate need for more than his share of some resourceo The way MTSS handles resource allocation is that it permits a user to specify to MONITOR the resources he needso If the resource specified is free it is assigned~ Otherwise a warning message is printed. When a user is done with a resource he must have MONITOR de-allocate itB No one can de-allocate anyone else's resource unless he is on a control line~ An allocation request is a MONITOR command:

ON <resource>

A de-allocation is of· the form:

OFF <resource>

Resources can neither be allocated nor de-allocated under program controlo Available resources and their abbreviations are:

abbreviation   resource name

ACS 						hardware accumulator switches

DTn  						DECtape handler #n

PTR 						paper tape reader

PTP 						paper tape punch

CNT 						control line

Section 5 -18-

--

INPUT/OUTPUT DEVICE TREATMENT -(continued)
When a job tries to execute an IOT instruction pertaining to a device· not previously- allocated to it, the job is terminated with ·an appropriate error message and control is returned to MONITOR~
All flags of devices not allocated to a job will be turned off in its software I/O device status word.
TELETYPES
Teletype I/O is as nearly transparent to the user as is practicale The only character the user cannot use indiscriminately is a null (control shift up')~ If the user types one it will kill his running program, stop all I/O, and return control to MONITORa No character other than null has any meaning to the MTSS system when a -user program is running"
In order to insure that Teletype I/O w ill be continuous, even while the user is swapped· out for a maximum length of time, The Resident Executive keeps an I/O buffer and a one character-buffer for each Teletype. The I/O buffer is used as either an input buffer or an output buffer at any given time8 Its purpose is to permit uninterrupted Teletype I/O while the running program is swapped out of core.

Section 5 -19-

--

INPUT/OUTPUT DEVICE TREATMENT- ( c o n t i n u e d )
On input, whenever the user types a character other than null (or control 'x' if the delete option is on and output is in progress)i his software keyboard- flag is set, his keyboard I/O roadblock flag is cleared and the character overwrites the previous character in the one-character buffero If no teleprinter output is in progress the character is also placed in the next slot in the line buffer~ If the buffer is full the last character in it is overwritten~
When the user does a keyboard read buffer (KRB) instruction his accumulator will be supplied with a buffered input characteru If output is in progress, this will be the character from his one-character buffer and his software keyboard flag will be clearedo If output is not in progress this will be the oldest character from his line buffer; the software keyboard flag-will be cleared only if it is the last character from this buffer~ Thereafter, continued KRB's will continue to read the same character if there is no more input typed.
When the user program does a keyboard skip on flag (KSF) instruction his program is made to skip if and only if his software keyboard flag is set~ Keyboard I/O roadblock occurs when a program does a KSF which fails to skip and is followed by a <JMP o-l>Q It is relieved whenever the user
Section 5 -20-

--

NPUT/OUTPUT DEVICE TREATMENT (continued)
next sets his software keyboard flago Thus input is character ori~nted rather than line orientede This causes an inefficiency which is tolerable to a system the size of MTSS and which is necessary in order to have reasonable system transparency.,
When the user program does a teleprinter send (TLS) instruction and the output~in-progress flag is already set, its output is placed in the next available character position in the line buffer~ If· the buffer is already full the previous character is overwritten~ If output is not in progress any unread input is destroyed, the character is sent to the teleprinter, the software teleprinter flag is set, and the output-in-progress flag is set~
When a program does a TSF the skip will occur if the teleprinter flag· is set and if there is also room in the output buffer~ Teleprinter I/O roadblock occurs if the program does a TSF which fails to skip and is followed by a <JMP o-l>o It is relieved the next time a character is printed reducing the amount left in the I/O buffer below the cutoff point necessary· to maintain comtinuous output~
Whenever the Resident Executive receives a teleprinter interrupt it checks· to see whether or not output is already in progresso If not, it exits~ If so, it tries to get
Section 5 -21-

--

INPUT/OUTPUT DEVICE TREATMENT (continued)
another character to printo If it gets one it prints it~ but if the buffer is now empty it changes the I/O buffer to an input buffer and then checks the software keyboard flag. If that is set it copies the character from the one-character buffer into the line buffero
PAPER TAPE
Paper Tape Reader and Paper Tape Punch are handled as two distinct devices~ Each may be assigned to only one job at a time, They may be assigned to different jobs or both to the same jobo Since neither device cares much about real time, a software image exists only of their flags. Remaining information is kept in the hardware.
Whenever a paper tape interrupt occurs the Executive sets the proper software flag, clears the hardware flag, and exitsQ
When a job issues a paper tape command an error message is printed if the resource has not been allocated to that job~ Otherwise if the command pertains to the device flag it is simulated based on the software flag~ Any other paper tape command is executede
Paper tape I/O is not buffered, so it pauses whenever
Section 5 -22-

--

NPUT/OUTPUT DEVICE TREATMENT- ( c o n t i n u e d )
the job using it is swapped out of coreo
DISK
Disk I/O can be permitted to all user's simultaneously, since each user has his - own 'physical· disk' and his own set- of software disk registers and flags" The Executive cannot overlap much of anything with disk operations, anyway, so it uses non~interrupting disk operations~ User programs may use either interrupting or non-interrupting disk operationso
Whenever the Executive gets a disk interrupt it copies all of the hardware information into the current job's software images and exits~
A user program may use either standard disk IOT instructions or Special IOT instructions to cause transfers of data between disk addresses 0 - 17777, and core addresses 2000 -177770 All disk operations will be simulated by the Executive so that they are transparent to· the user program,. The executive will map the disk addresses onto the job's "user physical diskn.. Any attempt to violate either the disk addressing or core addressing constraints will cause an appropriate error· message to be printed and the job to be terminated with control returned to MONITOR0
Section 5 -23-

--

INPUT/OUTPUT DEVICE TREATMENT (continued)
DECTAPE
DECtape I/O is not conducted in a transparent manner.. It is handled solely by Specialso For a DECtape Special to be legal it must request the transfer of data between unprotected core and a DECtape handler previously allocated to the job. If the Special is legal, the transfer will be carried out and then control will be returned to the jobo Otherwise the job will be terminated, an appropriate error message will be printed, and control will be returned to MONITOR.,
ACCUMULATOR' SWITCHES
The hardware accumulator switches can be read only by a job to which they have been allocated. For any other job such instructions will be simulated on its software "accumulator switches register" ..
OTHER
Other I/O devices and commands are illegal. The problems involved in implementing them ·are mainly concerned with a lack of core room for the necessary buffers and flags0 If they were to be made legal, the Executive would have to have
Section 5 -24-

--

INPUT/OUTPUT DEVICE TREATMENT (continued)
software versions of all of their flags, and in some cases would have to buffer information for theme It was felt to be better for now to keep the compact Resident Executive that MTSS has than to try to include all of these extra devicese In addition they establish little or nothing in principle that MTSS does not already have.
If the Executive gets an interrupt it does not recognize, it just clears all other possible interrupts and exits.
Section 5 -25-

--

SYSTEM INITIALIZA TION
60) How to Initialize MTSS
1) Find the DECtape labelled "GROWTH"
2) Mount it on a DECtape handler: choose a DECtape handlero Turn the LOCAL-OFF-REMOTE switch to LOCALo Rewind onto the left-hand take-up reel whatever DECtape is currently mountedo Turn the switch to OFF" Remove the old DECtapeo Put the "GROWTH" DECtape on the left=hand spindle~ Take two or three turns of tape around the right-hand take~up reel~ Turn the switch to REMOTEo Turn the WRITE LOCK WRITE ENABLED switch to WRITE LOCK to protect the system DECtape from accidental damage.
3) Open the door to the disk cabinet~ Check to be sure that the WRITE LOCKOUT switches are all DISABLED except those numbered 54, 60, 64, 70, and 74 should be ENABLEDo Close the d o o r ..
4) Turn the LINE-OFF-LOCAL switch on the console Teletype to LINEo
5) Carefully mount the first part of the paper tape labelled "GROWTH bootstrap" in the paper tape reader, Be
Section 6 26

--

SYSTEM INITIALIZATI'ON (continued)
sure the feed holes in the paper tape are correctly seated on the drive sprocketo Set the address switches to 100(8) (all of the white console switches should be down, except the left-hand bit 11 switch should be up)o Depress and release the I/O RESET toggle. Briefly depress the little white button on the paper tape reader. Depress the READ IN toggle switcho
6) The paper tape will be read in and a user number will be requested on the console Teletypew Type any six digits followed by a carriage return~ Next a dollar sign ($) will bs printed on the console Teletype. You type "TPn:INT", substituting for n the number of the handler on which you mounted the MTSS DECtape~ (If it is handler 8, call it handler O..)
7) Relax and watch the DECtape move back and forth for a short whileQ It is busy initializing MTSS on the disk. When done it will type a completion message followed by:

TSSMON
#

The system is now up and running.

Section 6 27

--

SYSTEM INITIALIZATION (continued)
601 What
The required from the the disk programs that all
A ctualll Happens
INITIALIZATION program has internal lists of the system programs~ When it runs, it first unsaves disk any existing versions of them~ Then it purges
to compact storage. Next it copies all system from the system DECtape to the disk. This insures system files on the disk have the right parameters
and are current~
During initialization the correct RESIDENT and SWAPPER
catalogs are set up~
602) Adding New System Programs To MTSS
To insert a new program into MTSS save it on the MTSS library DECtape ·and:
1 -- Overlay-programs: add its name to the list of overlay programs (0FILES) o In the OFILES list the memory protection overlays must be listed consecutively a Other than that, order is immaterial~
2 -- User-type system programs~ add its name to the list of user-type system programs (UFILES) o Order i s immaterial~
Section 602
28

--

SYSTEM INITIALIZATION (continued)
3 -- Phantom-type system programs: add its name to the list of Phantom-type user programs (PFILES).
Order is immateriale
Note that all program names must already be defined in the DEFINS programo That is to make them available to all MTSS programs.
Section 6~2 29

--

LOADING AND RUNNING A PROGRAM
7ol) System Programs
To start (or to return to) MONITOR type a break© To load any· other system program type its name in response to MONITOR vs sharp sign (#) o System programs start
automatically ..
7.2) User Supplied Programs
To load a user-supplied program use LOADER. Using LOADERi replace the file 'COR' with the desired user file, and EXITo The user physical disk may be loaded in the same way by replacing the file 5 DIS'. (See the LOADER description~) To run a program in user core, TRANSFER to the start or CONTINUE from either MONITOR or from DDTo
To save the contents of user core use LOADER.. Save or replace the disired file from the file 'COR'~ The user physical disk may be saved in the same way by using 'DIS' as the·source file~ Then EXIT ..
Section 7o2
30

--

MTSS CONVENTIONS
Be) MTSS Conventions
MTSS has few input conventions. A user can at any time type a break or a null (control shift 'p')o That will stop his running program, stop further Teletype output, and transfer control to MONITORe
For all system programs a control 'x' will delete the remaining output. This convention is optionally available to user programs (see MONITOR Delete command)o
A letter may be either upper case or lower case; a digit may be either an octal digit (0,1, ... 7) or a decimal digit (0,1,oos,9); a delimiter is any character that is neither a letter nor a digit; a number is any sequence of one or more digits followed by a delimiter; a word is any sequence of letters and/or numbers followed by a delimiter. Note that a trailing space is a legal delimiter. Leading spaces are ignored therefore multiple spaces have precisely the same effect as one space.
On a cataloged disk or DECtape a filename is of the form <device>:<name> where device is DTn, TPn or DKn, and the name is a three character or shorter name for the file. The
filename of an uncatalogued file is either PPT \J.
I'.;: itisona
..L
paper tape) or else it is of the form <device>,<starting
Section 8 31

--

/MTSS CONVENTIONS (continued)
block number>. In addition, core (COR) and user disk (DIS) may be used as filenameso
Whenever MONITOR wants input it will print a sharp sign (#)e Whenever any other system program wants input it will print a question mark (?) o This is so that the user need never be confused as to whether he is in MONITOR or whether
he is in some other program.
Section 8 32

--

PROGRAM STRUCTURE
The program structure used by MTSS is one of its most important features. It is the key· to MTSS' success in offering a very large amount of service on a very small machineo ·It is also the key to MTSS' great flexibility and power8 Basically MTSS considers programs to be of five types:

1) Resident Executive

2) Executive overlays

3) Phantom system programs

4) System-Supplied user programs

5) User-Supplied user programs

The first four of these are types of programs supplied by MTSS. Which system services will be supplied in which manner is in most cases a design choice, though in a few
cases choice is dictated by logical or ·practical necessityo The fifth type of program is that which the ordinary user wishes to run under MTSSo
9.1) Resident Executive
The Resident Executive is the only core-resident program in MTSSo Since it is core-resident, it uses a very scarce resource on our BK PDP-9 -- core space. Consequently it must be kept as small as possiblec The Resident

Section 9.1 -33-

--

PROGRAM STRUCTURE
Executive is responsible for supplying the storage and those service routines which logically must be in core at all timese If it then has any further room it may supply storage and routines intended to make the system more efficient..
As an example of· this philosophy, the routines to initiate handling of program interrupts and to retrieve SWAPPER from the disk must be in core at all times. However SWAPPER itself is not core-resident~ Teletype I/O buffers and their handling routines are core-resident only as a matter of system efficiencyo

The Resident Executive is a collection of largely
disjoint routines and storage areas (See figures 12.1, 12.2.)  The Resident Executive contains:

a) temporary storage

b) I/O parameters for each user

c) an I/O buffer for each Teletype

d) routines to handle Teletype I/O

e) routine to handle input of a null

f) allocation records for system resources

g) state-of-the-system information

h) routines for all legal I/O devices

i) information to retrieve SWAPPER

j) routines to service all PI interrupts

Section 9.1 -34-

--

PROGRAM STRUCTURE (continued)
k) CAL service
9 .. 2) Executive Overlays
Executive Overlays provide those user services not provided by the Resident Executive but which either logically or for efficiency must be provided by a routine co-resident with the user. The Executive Overlay area always contains one of the Executive Overlays. (See figures 12.1, 12.2.)
9o2..l SWAPPER
It would be nice to make SWAPPER a part of the Resident Executive; the system would run faster if this were done. However this is not loqically necessary if the Resident Executive has enough information to call SWAPPER from the disk as needed. The reason SWAPPER was made an Executive Overlay in MTSS is that· otherwise the Executive would exceed
lK, and therefore· have to be enlarged to 2K. This would be a reasonable and desirable change to make in MTSS if additional core were purchased.
Another logical alternative for SWAPPER would be to be a Phantom program. This was rejected because it would be inefficient and would also require an enlarged Resident Executive to allow user core to be swapped out before SWAPPER
Section 9"2 .. 1 -35-

--

PROGRAM STRUCTURE (continued)
WAS read in over it.
SWAPPER does all swapping for the system. It can be initiated by the Resident Executive, any Executive Overlay, or by any running program. In each of these cases the actual SWAPPER fetch is accomplished by the Resident Executive, using its resident disk handler and resident catalog. No matter who calls SWAPPER, it is entered with its flag set so that further interrupts will not actually call SWAPPER prematurelyu Instead, their occurence will be noted for later actiono
If the Resident Executive initiates a SWAPPER call, it is the result of a PI interrupt. Either a user has typed a null to request the killing of his current program and the calling of MONITOR, or else the clock has run out and there is another user ready to run.
If a Memory Protect Overlay initiates a SWAPPER call it is because it has detected an error condition and is calling the error message output routine. A Special IOT Overlay may initiate a SWAPPER call either for this reason or as the result of a Special.
A user program can call SWAPPER only indirectly, as the result of an error or of a Special call. A Phantom program
Section 9.2el -36-

--

PROGRAM STRUCTURE (continued)
can generate a SWAPPER call this way, or it may intentionally call SWAPPER (eQgO MONITOR uses SWAPPER to call DDT) e
Each of these types of SWAPPER calls except the ·last has its own special entry to SWAPPERo These special entrances allow SWAPPER to set up its own parameters, thus simplifying SW APPER m o d i f i c a t i o n s . T h e y a l s o m i n i m i z e t h e r e q u i r e d resident or overlay code.
SWAPPER runs as much as possible with the PI system enabled to permit continuous Teletype I/Oo The generalized sequence of SWAPPER actions is:
a) if a special entrance, do necessary setup b) prepare to turn on the interrupt system c) turn on the interrupts
d) do the requested swap activity
The requested swap activity is determined by a bit-coded word directing SWAPPER to do, in order, any or all of the following things:

a) swap out the current user's core

b) swap out the current user's job table

c) set the current user to also be the next user

d) read in the next user's job table

e) see if next user has an outstanding MONITOR request

f) read in the next user's core

Section 9 .. 2Ql -37-

--

PROGRAM STRUCTURE (continued)

g) set up the named Phantom program for the next user

h) set up the named S-user program for the next user
 
i) record the new core user

j) override the restart address

k) restore the user's registers, etc., and go

Swap out the current user's core: copies all of user core to the user's core image on the disk if the current program type is USER& If the current program type is PHANTOM, the non-pure code portion of core is copied out to the user's Phantom core image.
Swap out the current user's job table: is ignored if the current user is also the next user.
Read in the next user's job table is also ignored if the current and next users are the same.
See if the next user has an outstanding MONITOR request: replaces whatever the next user's job was to have been with MONITOR ·if he has typed a null since the last time he was in core.

Read in the next user's core: copies in the saved copy. It then checks for a Phantom program, and if it finds one copies in the pure code portion provided it is not already in core. Typically the previous user will have been using

Section 9.2.1 -38-

--

PROGRAM STRUCTURE (continued)

MONITOR and the next user will want to. In this case the pure code copy is unnecessary and is not done.

Alternatively SWAPPER can set up a specified Phantom or S-user program for the user.

The last thing that SWAPPER does before starting the new user is to record the new user's name to update its internal records, and then to copy itself out to the disk to record the update.

Section 9.2.1 -39-

--
PROGRAM STRUCTURE (continued)
9.2.2) Memory Protection
The memory protection overlays handle all memory protection violations, either returning to the user after taking appropriate action or printing an appropriate error message and returning to MONITORo
Logically, the handling of memory protection violations need not be in the Executive. The Executive could note the violating instruction, swap out the user, and swap in a Phantom program to analyse the violation. However, each violation would then cause several disk operations for a total of about 16K words transferred. Memory protection violations are expected to be frequent enough to make this impractical, so MTSS handles memory protection violations with Executive overlays which are very carefully laid out to minimize required overlay exchanges.
Memory Protection is designed, so far as possible, to allow the user to run an arbitrary machine-language program involving any of the system resources except DECtape with the same results that program would produce on a dedicated machine. This is felt to be an important goal for one major class of Dartmouth PDP-9 users -- beginning machine-language programmers.

Section 9.2.2 -40-

--

PROGRAM STRUCTURE (continued)
9.2.2ol) Memory Reference Instructions
The memory protection boundary is set to 2000(8). Therefore any memory reference to locations 2000-17777 is legal. Programs should be assembled to run above 2000 because this machine has no hardware address relocation. In addition, the Executive will allow direct memory references
to the locations 0-37. For various hardware reasons, the user's contents of 0 and 10-17 are stored in their true locations, but 1-7 and 20-37 are stored in a table. This means that both indirect and direct program references to 0 and 10-17 will work, but that only direct program references to 1-7 and 20-37 will work. No direct memory references to 40-1777 will work and undefined results are produced by indirect memory references through these locations. No instruction that results in a transfer to any location below
the boundary will work. Note that this means CAL and CAL (indirect) are also illegal instructions. The user may use
all program accessible registers.
9.2.2.2) Operate Instructions
Operate instructions which get trapped are those which have either the halt or the or-the-accumulator-switches bit sete The actual accumulator switches are considered a system

Section 9.2.2.2 -41-

--

PROGRAM STRUCTURE (continued)
resource and are assigned to users just as any other resource, such as the paper tape readerg Each user has a software "accumulator register" which he can examine or alter through MONITOR'" When an OAS instruction is encountered it is carried out by the memory protection overlays using either the actual switches (if that resource is assigned to the user) or else using the value in the user's software "register". A HLT instruction causes a return to MONITOR,
with an appropriate message printed.

9.2.2.3) Input/Output Instructions

All IOT instructions are detected by Memory Protection. Certain IOT instructions not otherwise used are used as Special Executive Service requests. (See section 9.2.3.)

The memory protection overlays contain a table of legal IOT instructionse Any IOT instruction other than a Special or one of these will cause a return to MONITOR with an appropriate error message being printedo The following IOT instructions, including all of their microcoded variations are legal:

basic IOT instructions (IOT, IORS, CAF, TTS, SKP7)
 
program interrupt instructions (IOF, ION)

console Teletype instructions (KSF, KRB, TSF, TCF,

Section 9.2.2.3 -42-

--

PROGRAM STRUCTURE (continued)

TLS)

DBK and DBR

paper tape reader instructions (RSF, RCF, RSA, RRB, RSB)

paper tape punch instructions (PSF, PCF, PSA, PSB)
disk instructions (DSSF, DSCC, DRAL, DRAH, DLAL, DLAH
                  DSCF, DSFX, DSCN, DLOK, DSCD, DSRS)
                  
The Executive keeps in the user's job table a record of all of the user's !OT operations and of their results~ When the user attempts an IOT instruction its effect is simulated as transparently as possible, based on the current state of the user's IOT records. In most cases, the user will be unable to detect this simulation.
Basic IOT Instructions
All basic IOT instructions are implemented in a totally transparent manner for user programs.
Program Interrupt:.Instructions
Both program interrupt instructions are implemented in a totally transparent manner for· user·programs.

DBK and DBR

Both instructions are implemented in a totally

Section 9.2.2.3 -43-

--

PROGRAM STRUCTURE (continued)
transparent manner for user programs except that a terminal error message is caused by· a DBR which is not followed by a <JMP Y,X>., After· a DBR instruction, the· jump will occur as if bit 2 of word Y were turned on (regardless of its actual state), but the bit its~lf will be unaffected.
Paper Tape Instructions
All paper tape reader and paper tape punch instructions are implemented in a totally transparent· manner for user programsQ Since paper tape I/O is not buffered by the Executive, tape operations can occur only while the user's program is actually in core. Any paper tape instruction by a user who has not previously been allocated the device will result in a terminal error message.
Disk Instructions
All disk instructions are implemented in a totally transparent manner for user programs except that data transfers involving a core address less than 2000(8) or a disk address greater than 8K will result in a terminal error message.

Console Teletype Instructions

Console Teletype instructions are handled in as nearly

Section 9.2.2.3 -44-

--

PROGRAM STRUCTURE (continued)
transparent a manner as practicalm Additional transparency is possible only if one were willing to have all Teletype I/O stop whenever the user was swapped outo The chief variation from transparency is best shown by the- following example from the GROWTH system Teletype handler.
In this handler, message output involves the following sequence of instructions:

TSF
JMP .-1
KSF
TLS

The effect is to delete further message output after any key is struck_ Under MTSS, the program will delete all further output after the remainder of the I/0 buffer is printed.

Section 9.2.2.3 -45-

PROGRAM STRUCTURE (continued)
9o2o3) Special IOT Instructions
Special IOT instructions are a particular block of otherwise unused IOT instructionso They are used by a program running under MTSS to call upon the Executive for system services. The fundamental Special IOT instruction is
7050000 Possible Specials range from Special+O to Special+377o Only a few of these are currently enabled, leaving this as one area for major future system expansion.
When the user executes a Special, the Special handler overlay is called; it either services the user's request or else it prints an error message and returns control to MONITOR.
Specials could logically handled by a Phantom program. It does seem more efficient", however, to do a disk operation as a core-to-disk operation using an overlay than to have to do a buffered disk-to-disk operation using a Phantom program.
9..2.3..1) MPOFF
MPOFF (705000) is legal only for Phantom programso Control is returned to the user at the next instruction after the Special, with the state of the machine unchanged except

Section 9.. 2.. 3.. l -46-

--

PROGRAM STRUCTURE (continued)
that user mode is disabledc- The program itself should re- enable user mode as· soon -as possible by issuing an MPEU (701742) instruction to guard against its own bugs crashing
the systemo
MPOFF should be disallowed as soon as practicable by adding enough Executive services to the system to make it unnecessary.. This will greatly enhance system reliability ..
9"2o3o2) TERMINATE
TERMINA TE ( 7 0 5 0 0 1 ) i s l e q a l f o r a l l p r o g r a m s o I t s effect is exactly the same as if a HLT instruction were encountered in the running program· except it returns control to MONITOR without the error message "HALTED AT.. " being printed... In either case·,· if MONITOR is requested to
'CONTINUE', program execution will ·be resumed at the next instruction-with registers.unaltered ..
DISK AND DECTAPE SPECIALS
The disk and DECtape Specials make use of a modified standard GROWTH system disk/DECtape handler; to simplify modifying stand-alone programs to run under MTSS, the format used by the Specials is · the · same one that the handler normally useso

Section 9..2..3o3 ~47-

--

PROGRAM STRUCTURE (continued)
The disk/DECtape Specials provide- all programs with the capabilities of:
1) reading or writing in a logical-block-addressed format the programvs DECtapes or "user "physical disk" ..
2) reading in a logical-block-addressed format the actual physical disk.
In addition, Phantom programs can write in a logical- block-addressed format the actual physical disko These capabilities allow device independent programming with respect to disk and DECtapeo
All disk/DECtape Specials are executed with the AC containing a pointer to a list of parameters of the following form:
wordl: bits 0~2 are the DECtape handler number or the physical disk number, as appropriate.
bit 3 =- 0 for a DECtape operation; = 1 for a disk- operation ..
bits
word2: core word3: word
8-17 contain the block number for the start of the data transfer.,
address for the start of the data transrerc count to be transferred.

S e c t i o n 9~2"3.,3

--

PROGRAM STRUCTURE (continued)
The disk/DECtape Specials perform the-following checks:
1) An attempt to read or write off the end of a DECtape
or disk generates an error· message for the usero
2) An attempt· to transfer data to or from a core address in excess of 8k generates an error message
for the user ..
3) A core address below the memory protect boundary is
legal only for Phantom programso If a user program attempts a data transfer to or from such an address, an error· message is generated for the usere
4) An attempt to transfer data to/from a non-existant disk generates an error·message for the usero
5) An attempt to transfer data to/from a DECtape not assigned to the user generates an error messagev
6) An attempt· ·by a user program to write to the physical disk .generates an error message.
Return of control to the user:
1) If the disk/DECtape transfer is successfully
completed control is returned to the user at the
address the user passed in the MQo
2) If a device error was encountered control is returned
to the user one location past the SpeciaL

Section 9.2 .. 3"3 -49-

--

PROGRAM STRUCTURE (continued)
3) If a user software error is encountered an error message is printed on his Teletype and control is returned to MONITORo
Some possible causes of a "device error" are:

1) a disk or DECtape hardware malfunction

2) a DECtape called which has not been remote-enabled.
 3) a DECtape not wound far enough onto the spool to
start.

9.2.3.3) READ and WRITE

READ (705002) and WRITE (705004) are legal for all programs. These Specials use the standard disk/DECtape format (see aboveo) They cause the operation indicated by their parameters to be attempted to/from the DECtape or "user physical disk".

1) if the READ/WRITE is to/from DECtape, it is passed along unaltered.

2) if the READ/WRITE is to/from the disk, the block number is understood to refer to the block desired on the user's "physical disk".

Section 9.. 2.3.3 -50-

--

PROGRAM STRUCTURE (continued)
9o 2·..3o 4) PREAD·and PWRITE
PREAD (705003) and PWRITE (705005) are identical to READ AND WRITE· except that;
1) disk references are to the actual physical disk instead of to the "user physical disk'' ..
2) PWRITE is illegal for user programs
9"2.3s 5) OPEN
OPEN (705018) is legal for all programs& The disk file whose name is passed in the AC is located and its parameters are stored in the user's· job table,. On entrance the following parameters are passed:
AC: filename to be opened word!: OPEN
word2: bits 0-2 handler number
bit 3 is 0 for DECtape1 l for disk·
Return to the user is:
+l for a hardware error
to an error message and· MONITOR· for a software error +2 for success
In addition to any applicable error message which can be caused by a disk/DECtape Specialf OPEN can also cause a "file not found" message.

Section 9.2.,3.,5 -51-

--

PROGRAM STRUCTURE (continued)

9.2.6.3 COPY


COPY (705019) is 'legal for all programs. It provides core-to-device· and device-to-core copies to or from files on DECtape or on the system disk., Only Phantom programs are allowed to copy from core to any· disk file other than 'DIS'
(user "physibal disk"). On entrance, the parameters passed are:
AC: bit 0 - 0 for device-to-core copy = 1 for core-to-device copy
MQ: bits 5-17: user's desired restart address word!: copy
word2: bits 5-17: starting core address for the copy word3: length of the copy
Control is returned to the user after a succesful copy at the user-specified restart address. This allows a 100% overlayo An error message is printed and control is returned to MONITOR if for any reason the copy was unsuccessful. This is because that is what should happen for a software error on the part' of the user. - If the error was-a hardware error, it is probably unrecoverable, anyway.

Section 9.. 2.306 -52-

--

PROGRAM STRUCTURE (continued)


systeme It is a phantom program which can perform certain services for the user, such as initiating or terminating his sessiono It can call any other system program, or it can initiate running the user's programo
9o3.l.l MONITOR Commands
Any command which is longer than three characters can be abbreviated to its first three characterso
ON <resource> requests that the system allocate to the requesting user's sole use the specified <resource>e To prevent an error message this must be done prior to running a program requiring the <resource> in question. When one user has been allocated a <resource>, no other user can use or be allocated that particular <resource>o
OFF <resource> tells the system that the <resource> is no longer needed and can be de-allocatedo The <resource> is now available once more to other users. A user may not do an OFF on another user's <resource>o Available resources are:
ACS CNT DTn PTP PTR
hardware accumulator switches control line
DECtape handler #n
paper tape punch
paper tape reader


Section 9a 3o 1.1 -54-

--

















































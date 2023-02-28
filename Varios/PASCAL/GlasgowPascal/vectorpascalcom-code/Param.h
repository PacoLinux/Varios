typedef unsigned long long uint64;
typedef unsigned int uint32;
typedef float dataType;
const uint32 REG_SIZE=1024;
const uint32 MAX_SPU_THREADS=2;
const uint32 BUFFER=(REG_SIZE/MAX_SPU_THREADS);
const uint32 SIZE=BUFFER*sizeof(dataType);
const int NO_REG=4;
const int alignBytes=(128/sizeof(dataType));
typedef struct {
   unsigned long long sID[4];
   unsigned long long ls_ea[4];
   unsigned long long p_s_area[4];
   unsigned int no;
   unsigned int ped;
   unsigned long long fill[3];
 } spesids;
typedef struct {
	unsigned int ea;
	unsigned int op;
	unsigned int desReg;
	unsigned int srcReg;
	unsigned int flg;
	unsigned int storeflg;
	unsigned int fill[26];
} controlPar;
#define SPU_MBOX_STAT 0x14		
#define SPU_OUT_INTR_MBOX_STAT 0x0
#define SPU_IN_MBOX 0x0C
#define SPU_OUT_MBOX 0x04
#define LOAD 0x01
#define STORE 0x02
#define REPI 0x03
#define REPS 0x04
#define REPB 0x05
#define REPF 0x06
#define REPD 0x07
#define ADDI 0x10
#define SUBI 0x11
#define DIVI 0x12
#define MULI 0x13
#define ADDS 0x20
#define SUBS 0x21
#define DIVS 0x22
#define MULS 0x23
#define ADDB 0x20
#define SUBB 0x31
#define DIVB 0x32
#define MULB 0x33
#define ADDF 0x40
#define SUBF 0x41
#define DIVF 0x42
#define MULF 0x43
#define ADDD 0x50
#define SUBD 0x51
#define DIVD 0x52
#define MULD 0x53
#define SQRTF 0x44

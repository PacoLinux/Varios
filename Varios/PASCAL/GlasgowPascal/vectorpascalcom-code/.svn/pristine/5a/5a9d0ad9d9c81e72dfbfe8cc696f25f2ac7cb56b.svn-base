Program{
 Let cpu=Processor {
/* here is a tiny machine description */
	Let regs= Array[8] Of Signed[32];
	Let main= Array[5000000] Of Bits[8];
	Let base= Pattern {
		Let r In 0 .. 7;
		Let meaning = regs_r;
		Let assembler = 'R'++r
        };
	Let baseplusoffset = Pattern {
		Let r In 0 .. 7;
		Let o In Signed[16];
		Let meaning = regs_(r+o);
		Let assembler = o ++ 'R'+r
	};
        Let ea = baseplusoffset | base ;
	Let memref = Pattern{
		Let a In ea;
		Let meaning = main _ a;
		Let assembler = '[' ++ ea ++ ']'
	};
	Let load = Pattern{
		Let src In memref;
		Let dest In base;
		Let meaning=Seq{ dest <- ! src};
		Let assembler='mov ' ++ dest ++ ',' ++ src
	};
	Let store = Pattern{
		Let dest In memref;
		Let src In base;
		Let meaning=Seq{ dest <- ! src};
		Let assembler='mov ' ++ dest ++ ',' ++ src
	};
	Let add = Pattern{
		Let src In base;
		Let dest In base;
		Let meaning = Seq{ dest <- ! dest + ! src};
		Let assembler = 'add '++ dest ++ ',' ++ src
	};
	Let instructionset = load | add
   };
 Let actions = ( Seq{
	Let x = LOCAL RESERVE Signed[32];
	Let y = LOCAL RESERVE Signed[32];
	x <- y
   } );
   Let code = ( actions COMPILEDON cpu) PRINT 'p.asm'

}
	

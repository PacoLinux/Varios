		unit pentium;
 interface uses ilcp;
		{$i pentium00.pas }
		{$i pentium01.pas }
		{$i pentium02.pas }
		{$i pentium03.pas }
		implementation 
		{$i pentium10.pas }
		{$i pentium11.pas }
		{$i pentium12.pas }
		{$i pentium13.pas }
		begin
		 predecp;
			new(patEAX_EAX);
		new(	patEAX_EAX^.meaning);
		new(	patEAX_EAX^.matchedassembler);
			patEAX_EAX^.meaning^.tag:=reg;
			patEAX_EAX^.meaning^.index:=regEAX_EAXcode;
			patEAX_EAX^.params:=nil;
			patEAX_EAX^.matchedassembler:=string2printlist('eax');
			registers[regEAX_EAXcode].format:=(0+fref+fsigned+2);
			registers[regEAX_EAXcode].printsas:='eax';
			registers[regEAX_EAXcode].permanentlyreserved:=false;
			registers[regEAX_EAXcode].code:=regEAX_EAXcode;
			registers[regEAX_EAXcode].basecode:=[0..3];
			new(patECX_ECX);
		new(	patECX_ECX^.meaning);
		new(	patECX_ECX^.matchedassembler);
			patECX_ECX^.meaning^.tag:=reg;
			patECX_ECX^.meaning^.index:=regECX_ECXcode;
			patECX_ECX^.params:=nil;
			patECX_ECX^.matchedassembler:=string2printlist('ecx');
			registers[regECX_ECXcode].format:=(0+fref+fsigned+2);
			registers[regECX_ECXcode].printsas:='ecx';
			registers[regECX_ECXcode].permanentlyreserved:=false;
			registers[regECX_ECXcode].code:=regECX_ECXcode;
			registers[regECX_ECXcode].basecode:=[4..7];
			new(patEBX_EBX);
		new(	patEBX_EBX^.meaning);
		new(	patEBX_EBX^.matchedassembler);
			patEBX_EBX^.meaning^.tag:=reg;
			patEBX_EBX^.meaning^.index:=regEBX_EBXcode;
			patEBX_EBX^.params:=nil;
			patEBX_EBX^.matchedassembler:=string2printlist('ebx');
			registers[regEBX_EBXcode].format:=(0+fref+fsigned+2);
			registers[regEBX_EBXcode].printsas:='ebx';
			registers[regEBX_EBXcode].permanentlyreserved:=false;
			registers[regEBX_EBXcode].code:=regEBX_EBXcode;
			registers[regEBX_EBXcode].basecode:=[8..11];
			new(patEBP_EBP);
		new(	patEBP_EBP^.meaning);
		new(	patEBP_EBP^.matchedassembler);
			patEBP_EBP^.meaning^.tag:=reg;
			patEBP_EBP^.meaning^.index:=regEBP_EBPcode;
			patEBP_EBP^.params:=nil;
			patEBP_EBP^.matchedassembler:=string2printlist('ebp');
			registers[regEBP_EBPcode].format:=(0+fref+fsigned+2);
			registers[regEBP_EBPcode].printsas:='ebp';
			registers[regEBP_EBPcode].permanentlyreserved:=false;
			registers[regEBP_EBPcode].code:=regEBP_EBPcode;
			registers[regEBP_EBPcode].basecode:=[12..15];
			new(patESP_ESP);
		new(	patESP_ESP^.meaning);
		new(	patESP_ESP^.matchedassembler);
			patESP_ESP^.meaning^.tag:=reg;
			patESP_ESP^.meaning^.index:=regESP_ESPcode;
			patESP_ESP^.params:=nil;
			patESP_ESP^.matchedassembler:=string2printlist('esp');
			registers[regESP_ESPcode].format:=(0+fref+fsigned+2);
			registers[regESP_ESPcode].printsas:='esp';
			registers[regESP_ESPcode].permanentlyreserved:=true;
			registers[regESP_ESPcode].code:=regESP_ESPcode;
			registers[regESP_ESPcode].basecode:=[16..19];
			new(patESI_ESI);
		new(	patESI_ESI^.meaning);
		new(	patESI_ESI^.matchedassembler);
			patESI_ESI^.meaning^.tag:=reg;
			patESI_ESI^.meaning^.index:=regESI_ESIcode;
			patESI_ESI^.params:=nil;
			patESI_ESI^.matchedassembler:=string2printlist('esi');
			registers[regESI_ESIcode].format:=(0+fref+fsigned+2);
			registers[regESI_ESIcode].printsas:='esi';
			registers[regESI_ESIcode].permanentlyreserved:=false;
			registers[regESI_ESIcode].code:=regESI_ESIcode;
			registers[regESI_ESIcode].basecode:=[20..23];
			new(patEDI_EDI);
		new(	patEDI_EDI^.meaning);
		new(	patEDI_EDI^.matchedassembler);
			patEDI_EDI^.meaning^.tag:=reg;
			patEDI_EDI^.meaning^.index:=regEDI_EDIcode;
			patEDI_EDI^.params:=nil;
			patEDI_EDI^.matchedassembler:=string2printlist('edi');
			registers[regEDI_EDIcode].format:=(0+fref+fsigned+2);
			registers[regEDI_EDIcode].printsas:='edi';
			registers[regEDI_EDIcode].permanentlyreserved:=false;
			registers[regEDI_EDIcode].code:=regEDI_EDIcode;
			registers[regEDI_EDIcode].basecode:=[24..27];
			new(patEDX_EDX);
		new(	patEDX_EDX^.meaning);
		new(	patEDX_EDX^.matchedassembler);
			patEDX_EDX^.meaning^.tag:=reg;
			patEDX_EDX^.meaning^.index:=regEDX_EDXcode;
			patEDX_EDX^.params:=nil;
			patEDX_EDX^.matchedassembler:=string2printlist('edx');
			registers[regEDX_EDXcode].format:=(0+fref+fsigned+2);
			registers[regEDX_EDXcode].printsas:='edx';
			registers[regEDX_EDXcode].permanentlyreserved:=false;
			registers[regEDX_EDXcode].code:=regEDX_EDXcode;
			registers[regEDX_EDXcode].basecode:=[28..31];
			registers[8].format:=(0+fref+funsigned+2);
			registers[8].printsas:='eax';
			registers[8].permanentlyreserved:=false;
			registers[8].code:=reguax_code;
			registers[8].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+3];
			new(patuax_);
		new(	patuax_^.meaning);
		new(	patuax_^.matchedassembler);
			patuax_^.meaning^.tag:=reg;
			patuax_^.meaning^.index:=reguax_code;
			patuax_^.params:=nil;
			patuax_^.matchedassembler:=string2printlist('eax');
			registers[9].format:=(0+fref+funsigned+2);
			registers[9].printsas:='ecx';
			registers[9].permanentlyreserved:=false;
			registers[9].code:=regucx_code;
			registers[9].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+3];
			new(patucx_);
		new(	patucx_^.meaning);
		new(	patucx_^.matchedassembler);
			patucx_^.meaning^.tag:=reg;
			patucx_^.meaning^.index:=regucx_code;
			patucx_^.params:=nil;
			patucx_^.matchedassembler:=string2printlist('ecx');
			registers[10].format:=(0+fref+funsigned+2);
			registers[10].printsas:='ebx';
			registers[10].permanentlyreserved:=false;
			registers[10].code:=regubx_code;
			registers[10].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+3];
			new(patubx_);
		new(	patubx_^.meaning);
		new(	patubx_^.matchedassembler);
			patubx_^.meaning^.tag:=reg;
			patubx_^.meaning^.index:=regubx_code;
			patubx_^.params:=nil;
			patubx_^.matchedassembler:=string2printlist('ebx');
			registers[11].format:=(0+fref+funsigned+2);
			registers[11].printsas:='esi';
			registers[11].permanentlyreserved:=false;
			registers[11].code:=regusi_code;
			registers[11].basecode:=[(regESI_ESIcode+0)..(regESI_ESIcode+0)+3];
			new(patusi_);
		new(	patusi_^.meaning);
		new(	patusi_^.matchedassembler);
			patusi_^.meaning^.tag:=reg;
			patusi_^.meaning^.index:=regusi_code;
			patusi_^.params:=nil;
			patusi_^.matchedassembler:=string2printlist('esi');
			registers[12].format:=(0+fref+funsigned+2);
			registers[12].printsas:='edi';
			registers[12].permanentlyreserved:=false;
			registers[12].code:=regudi_code;
			registers[12].basecode:=[(regEDI_EDIcode+0)..(regEDI_EDIcode+0)+3];
			new(patudi_);
		new(	patudi_^.meaning);
		new(	patudi_^.matchedassembler);
			patudi_^.meaning^.tag:=reg;
			patudi_^.meaning^.index:=regudi_code;
			patudi_^.params:=nil;
			patudi_^.matchedassembler:=string2printlist('edi');
			registers[13].format:=(0+fref+funsigned+2);
			registers[13].printsas:='edx';
			registers[13].permanentlyreserved:=false;
			registers[13].code:=regudx_code;
			registers[13].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+3];
			new(patudx_);
		new(	patudx_^.meaning);
		new(	patudx_^.matchedassembler);
			patudx_^.meaning^.tag:=reg;
			patudx_^.meaning^.index:=regudx_code;
			patudx_^.params:=nil;
			patudx_^.matchedassembler:=string2printlist('edx');
			registers[14].format:=(0+fref+fsigned+0);
			registers[14].printsas:='al';
			registers[14].permanentlyreserved:=false;
			registers[14].code:=regAL_ALcode;
			registers[14].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+0];
			new(patAL_AL);
		new(	patAL_AL^.meaning);
		new(	patAL_AL^.matchedassembler);
			patAL_AL^.meaning^.tag:=reg;
			patAL_AL^.meaning^.index:=regAL_ALcode;
			patAL_AL^.params:=nil;
			patAL_AL^.matchedassembler:=string2printlist('al');
			registers[15].format:=(0+fref+fsigned+0);
			registers[15].printsas:='bl';
			registers[15].permanentlyreserved:=false;
			registers[15].code:=regBL_BLcode;
			registers[15].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+0];
			new(patBL_BL);
		new(	patBL_BL^.meaning);
		new(	patBL_BL^.matchedassembler);
			patBL_BL^.meaning^.tag:=reg;
			patBL_BL^.meaning^.index:=regBL_BLcode;
			patBL_BL^.params:=nil;
			patBL_BL^.matchedassembler:=string2printlist('bl');
			registers[16].format:=(0+fref+fsigned+0);
			registers[16].printsas:='cl';
			registers[16].permanentlyreserved:=false;
			registers[16].code:=regCL_CLcode;
			registers[16].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+0];
			new(patCL_CL);
		new(	patCL_CL^.meaning);
		new(	patCL_CL^.matchedassembler);
			patCL_CL^.meaning^.tag:=reg;
			patCL_CL^.meaning^.index:=regCL_CLcode;
			patCL_CL^.params:=nil;
			patCL_CL^.matchedassembler:=string2printlist('cl');
			registers[17].format:=(0+fref+fsigned+0);
			registers[17].printsas:='dl';
			registers[17].permanentlyreserved:=false;
			registers[17].code:=regDL_DLcode;
			registers[17].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+0];
			new(patDL_DL);
		new(	patDL_DL^.meaning);
		new(	patDL_DL^.matchedassembler);
			patDL_DL^.meaning^.tag:=reg;
			patDL_DL^.meaning^.index:=regDL_DLcode;
			patDL_DL^.params:=nil;
			patDL_DL^.matchedassembler:=string2printlist('dl');
			registers[18].format:=(0+fref+fsigned+0);
			registers[18].printsas:='bh';
			registers[18].permanentlyreserved:=false;
			registers[18].code:=regiBH_BHcode;
			registers[18].basecode:=[(regEBX_EBXcode+1)..(regEBX_EBXcode+1)+0];
			new(patiBH_BH);
		new(	patiBH_BH^.meaning);
		new(	patiBH_BH^.matchedassembler);
			patiBH_BH^.meaning^.tag:=reg;
			patiBH_BH^.meaning^.index:=regiBH_BHcode;
			patiBH_BH^.params:=nil;
			patiBH_BH^.matchedassembler:=string2printlist('bh');
			registers[19].format:=(0+fref+fsigned+0);
			registers[19].printsas:='ch';
			registers[19].permanentlyreserved:=false;
			registers[19].code:=regiCH_CHcode;
			registers[19].basecode:=[(regECX_ECXcode+1)..(regECX_ECXcode+1)+0];
			new(patiCH_CH);
		new(	patiCH_CH^.meaning);
		new(	patiCH_CH^.matchedassembler);
			patiCH_CH^.meaning^.tag:=reg;
			patiCH_CH^.meaning^.index:=regiCH_CHcode;
			patiCH_CH^.params:=nil;
			patiCH_CH^.matchedassembler:=string2printlist('ch');
			registers[20].format:=(0+fref+fsigned+0);
			registers[20].printsas:='dh';
			registers[20].permanentlyreserved:=false;
			registers[20].code:=regiDH_DHcode;
			registers[20].basecode:=[(regEDX_EDXcode+1)..(regEDX_EDXcode+1)+0];
			new(patiDH_DH);
		new(	patiDH_DH^.meaning);
		new(	patiDH_DH^.matchedassembler);
			patiDH_DH^.meaning^.tag:=reg;
			patiDH_DH^.meaning^.index:=regiDH_DHcode;
			patiDH_DH^.params:=nil;
			patiDH_DH^.matchedassembler:=string2printlist('dh');
			registers[21].format:=(0+fref+funsigned+0);
			registers[21].printsas:='bh';
			registers[21].permanentlyreserved:=false;
			registers[21].code:=regBH_BHcode;
			registers[21].basecode:=[(regEBX_EBXcode+1)..(regEBX_EBXcode+1)+0];
			new(patBH_BH);
		new(	patBH_BH^.meaning);
		new(	patBH_BH^.matchedassembler);
			patBH_BH^.meaning^.tag:=reg;
			patBH_BH^.meaning^.index:=regBH_BHcode;
			patBH_BH^.params:=nil;
			patBH_BH^.matchedassembler:=string2printlist('bh');
			registers[22].format:=(0+fref+funsigned+0);
			registers[22].printsas:='ch';
			registers[22].permanentlyreserved:=false;
			registers[22].code:=regCH_CHcode;
			registers[22].basecode:=[(regECX_ECXcode+1)..(regECX_ECXcode+1)+0];
			new(patCH_CH);
		new(	patCH_CH^.meaning);
		new(	patCH_CH^.matchedassembler);
			patCH_CH^.meaning^.tag:=reg;
			patCH_CH^.meaning^.index:=regCH_CHcode;
			patCH_CH^.params:=nil;
			patCH_CH^.matchedassembler:=string2printlist('ch');
			registers[23].format:=(0+fref+funsigned+0);
			registers[23].printsas:='dh';
			registers[23].permanentlyreserved:=false;
			registers[23].code:=regDH_DHcode;
			registers[23].basecode:=[(regEDX_EDXcode+1)..(regEDX_EDXcode+1)+0];
			new(patDH_DH);
		new(	patDH_DH^.meaning);
		new(	patDH_DH^.matchedassembler);
			patDH_DH^.meaning^.tag:=reg;
			patDH_DH^.meaning^.index:=regDH_DHcode;
			patDH_DH^.params:=nil;
			patDH_DH^.matchedassembler:=string2printlist('dh');
			registers[24].format:=(0+fref+funsigned+0);
			registers[24].printsas:='al';
			registers[24].permanentlyreserved:=false;
			registers[24].code:=reguAL_ALcode;
			registers[24].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+0];
			new(patuAL_AL);
		new(	patuAL_AL^.meaning);
		new(	patuAL_AL^.matchedassembler);
			patuAL_AL^.meaning^.tag:=reg;
			patuAL_AL^.meaning^.index:=reguAL_ALcode;
			patuAL_AL^.params:=nil;
			patuAL_AL^.matchedassembler:=string2printlist('al');
			registers[25].format:=(0+fref+funsigned+0);
			registers[25].printsas:='bl';
			registers[25].permanentlyreserved:=false;
			registers[25].code:=reguBL_BLcode;
			registers[25].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+0];
			new(patuBL_BL);
		new(	patuBL_BL^.meaning);
		new(	patuBL_BL^.matchedassembler);
			patuBL_BL^.meaning^.tag:=reg;
			patuBL_BL^.meaning^.index:=reguBL_BLcode;
			patuBL_BL^.params:=nil;
			patuBL_BL^.matchedassembler:=string2printlist('bl');
			registers[26].format:=(0+fref+funsigned+0);
			registers[26].printsas:='cl';
			registers[26].permanentlyreserved:=false;
			registers[26].code:=reguCL_CLcode;
			registers[26].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+0];
			new(patuCL_CL);
		new(	patuCL_CL^.meaning);
		new(	patuCL_CL^.matchedassembler);
			patuCL_CL^.meaning^.tag:=reg;
			patuCL_CL^.meaning^.index:=reguCL_CLcode;
			patuCL_CL^.params:=nil;
			patuCL_CL^.matchedassembler:=string2printlist('cl');
			registers[27].format:=(0+fref+funsigned+0);
			registers[27].printsas:='dl';
			registers[27].permanentlyreserved:=false;
			registers[27].code:=reguDL_DLcode;
			registers[27].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+0];
			new(patuDL_DL);
		new(	patuDL_DL^.meaning);
		new(	patuDL_DL^.matchedassembler);
			patuDL_DL^.meaning^.tag:=reg;
			patuDL_DL^.meaning^.index:=reguDL_DLcode;
			patuDL_DL^.params:=nil;
			patuDL_DL^.matchedassembler:=string2printlist('dl');
			registers[28].format:=(0+fref+0);
			registers[28].printsas:='al';
			registers[28].permanentlyreserved:=false;
			registers[28].code:=regoAL_ALcode;
			registers[28].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+0];
			new(patoAL_AL);
		new(	patoAL_AL^.meaning);
		new(	patoAL_AL^.matchedassembler);
			patoAL_AL^.meaning^.tag:=reg;
			patoAL_AL^.meaning^.index:=regoAL_ALcode;
			patoAL_AL^.params:=nil;
			patoAL_AL^.matchedassembler:=string2printlist('al');
			registers[29].format:=(0+fref+0);
			registers[29].printsas:='bl';
			registers[29].permanentlyreserved:=false;
			registers[29].code:=regoBL_BLcode;
			registers[29].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+0];
			new(patoBL_BL);
		new(	patoBL_BL^.meaning);
		new(	patoBL_BL^.matchedassembler);
			patoBL_BL^.meaning^.tag:=reg;
			patoBL_BL^.meaning^.index:=regoBL_BLcode;
			patoBL_BL^.params:=nil;
			patoBL_BL^.matchedassembler:=string2printlist('bl');
			registers[30].format:=(0+fref+0);
			registers[30].printsas:='cl';
			registers[30].permanentlyreserved:=false;
			registers[30].code:=regoCL_CLcode;
			registers[30].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+0];
			new(patoCL_CL);
		new(	patoCL_CL^.meaning);
		new(	patoCL_CL^.matchedassembler);
			patoCL_CL^.meaning^.tag:=reg;
			patoCL_CL^.meaning^.index:=regoCL_CLcode;
			patoCL_CL^.params:=nil;
			patoCL_CL^.matchedassembler:=string2printlist('cl');
			registers[31].format:=(0+fref+0);
			registers[31].printsas:='dl';
			registers[31].permanentlyreserved:=false;
			registers[31].code:=regoDL_DLcode;
			registers[31].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+0];
			new(patoDL_DL);
		new(	patoDL_DL^.meaning);
		new(	patoDL_DL^.matchedassembler);
			patoDL_DL^.meaning^.tag:=reg;
			patoDL_DL^.meaning^.index:=regoDL_DLcode;
			patoDL_DL^.params:=nil;
			patoDL_DL^.matchedassembler:=string2printlist('dl');
			registers[32].format:=(0+fref+fsigned+1);
			registers[32].printsas:='ax';
			registers[32].permanentlyreserved:=false;
			registers[32].code:=regAX_AXcode;
			registers[32].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+1];
			new(patAX_AX);
		new(	patAX_AX^.meaning);
		new(	patAX_AX^.matchedassembler);
			patAX_AX^.meaning^.tag:=reg;
			patAX_AX^.meaning^.index:=regAX_AXcode;
			patAX_AX^.params:=nil;
			patAX_AX^.matchedassembler:=string2printlist('ax');
			registers[33].format:=(0+fref+fsigned+1);
			registers[33].printsas:='bx';
			registers[33].permanentlyreserved:=false;
			registers[33].code:=regBX_BXcode;
			registers[33].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+1];
			new(patBX_BX);
		new(	patBX_BX^.meaning);
		new(	patBX_BX^.matchedassembler);
			patBX_BX^.meaning^.tag:=reg;
			patBX_BX^.meaning^.index:=regBX_BXcode;
			patBX_BX^.params:=nil;
			patBX_BX^.matchedassembler:=string2printlist('bx');
			registers[34].format:=(0+fref+fsigned+1);
			registers[34].printsas:='dx';
			registers[34].permanentlyreserved:=false;
			registers[34].code:=regDX_DXcode;
			registers[34].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+1];
			new(patDX_DX);
		new(	patDX_DX^.meaning);
		new(	patDX_DX^.matchedassembler);
			patDX_DX^.meaning^.tag:=reg;
			patDX_DX^.meaning^.index:=regDX_DXcode;
			patDX_DX^.params:=nil;
			patDX_DX^.matchedassembler:=string2printlist('dx');
			registers[35].format:=(0+fref+fsigned+1);
			registers[35].printsas:='cx';
			registers[35].permanentlyreserved:=false;
			registers[35].code:=regCX_CXcode;
			registers[35].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+1];
			new(patCX_CX);
		new(	patCX_CX^.meaning);
		new(	patCX_CX^.matchedassembler);
			patCX_CX^.meaning^.tag:=reg;
			patCX_CX^.meaning^.index:=regCX_CXcode;
			patCX_CX^.params:=nil;
			patCX_CX^.matchedassembler:=string2printlist('cx');
			registers[36].format:=(0+fref+funsigned+1);
			registers[36].printsas:='ax';
			registers[36].permanentlyreserved:=false;
			registers[36].code:=reguAX_AXcode;
			registers[36].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+1];
			new(patuAX_AX);
		new(	patuAX_AX^.meaning);
		new(	patuAX_AX^.matchedassembler);
			patuAX_AX^.meaning^.tag:=reg;
			patuAX_AX^.meaning^.index:=reguAX_AXcode;
			patuAX_AX^.params:=nil;
			patuAX_AX^.matchedassembler:=string2printlist('ax');
			registers[37].format:=(0+fref+funsigned+1);
			registers[37].printsas:='bx';
			registers[37].permanentlyreserved:=false;
			registers[37].code:=reguBX_BXcode;
			registers[37].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+1];
			new(patuBX_BX);
		new(	patuBX_BX^.meaning);
		new(	patuBX_BX^.matchedassembler);
			patuBX_BX^.meaning^.tag:=reg;
			patuBX_BX^.meaning^.index:=reguBX_BXcode;
			patuBX_BX^.params:=nil;
			patuBX_BX^.matchedassembler:=string2printlist('bx');
			registers[38].format:=(0+fref+funsigned+1);
			registers[38].printsas:='dx';
			registers[38].permanentlyreserved:=false;
			registers[38].code:=reguDX_DXcode;
			registers[38].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+1];
			new(patuDX_DX);
		new(	patuDX_DX^.meaning);
		new(	patuDX_DX^.matchedassembler);
			patuDX_DX^.meaning^.tag:=reg;
			patuDX_DX^.meaning^.index:=reguDX_DXcode;
			patuDX_DX^.params:=nil;
			patuDX_DX^.matchedassembler:=string2printlist('dx');
			registers[39].format:=(0+fref+funsigned+1);
			registers[39].printsas:='cx';
			registers[39].permanentlyreserved:=false;
			registers[39].code:=reguCX_CXcode;
			registers[39].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+1];
			new(patuCX_CX);
		new(	patuCX_CX^.meaning);
		new(	patuCX_CX^.matchedassembler);
			patuCX_CX^.meaning^.tag:=reg;
			patuCX_CX^.meaning^.index:=reguCX_CXcode;
			patuCX_CX^.params:=nil;
			patuCX_CX^.matchedassembler:=string2printlist('cx');
			registers[40].format:=(0+fref+1);
			registers[40].printsas:='si';
			registers[40].permanentlyreserved:=false;
			registers[40].code:=regSI_SIcode;
			registers[40].basecode:=[(regESI_ESIcode+0)..(regESI_ESIcode+0)+1];
			new(patSI_SI);
		new(	patSI_SI^.meaning);
		new(	patSI_SI^.matchedassembler);
			patSI_SI^.meaning^.tag:=reg;
			patSI_SI^.meaning^.index:=regSI_SIcode;
			patSI_SI^.params:=nil;
			patSI_SI^.matchedassembler:=string2printlist('si');
			registers[41].format:=(0+fref+1);
			registers[41].printsas:='di';
			registers[41].permanentlyreserved:=false;
			registers[41].code:=regDI_DIcode;
			registers[41].basecode:=[(regEDI_EDIcode+0)..(regEDI_EDIcode+0)+1];
			new(patDI_DI);
		new(	patDI_DI^.meaning);
		new(	patDI_DI^.matchedassembler);
			patDI_DI^.meaning^.tag:=reg;
			patDI_DI^.meaning^.index:=regDI_DIcode;
			patDI_DI^.params:=nil;
			patDI_DI^.matchedassembler:=string2printlist('di');
			new(patmainSTACK_STACK);
		new(	patmainSTACK_STACK^.meaning);
		new(	patmainSTACK_STACK^.matchedassembler);
			patmainSTACK_STACK^.meaning^.tag:=reg;
			patmainSTACK_STACK^.params:=nil;
			patmainSTACK_STACK^.matchedassembler:=string2printlist('mainSTACK');
			regmainSTACK_STACK.format:=(0+fref+fsigned+2);
			patmainSTACK_STACK^.meaning^.tag:=regstack;
			regmainSTACK_STACK.printsas:='mainSTACK';
			regmainSTACK_STACK.depth:= ( 4096 ) ;
			patmainSTACK_STACK^.meaning^.stackdetails:=regmainSTACK_STACK;
		alternatives[0]:=patEDI_EDI;
		alternatives[1]:=patESI_ESI;
		alternatives[2]:=patEBX_EBX;
		alternatives[3]:=patEBP_EBP;
		alternatives[4]:=patESP_ESP;
		alternatives[5]:=patEAX_EAX;
		alternatives[6]:=patEDX_EDX;
		alternatives[7]:=patECX_ECX;
		lastalt:=7;
		new(patindexreg_);
		patindexreg_^.meaning:=pAAlternativesPatterndecl417_AAP417;
		patindexreg_^.matchedassembler:=nil;
		patindexreg_^.params :=nil;
		alternatives[8]:=patEAX_EAX;
		alternatives[9]:=patEDX_EDX;
		alternatives[10]:=patECX_ECX;
		alternatives[11]:=patEBX_EBX;
		lastalt:=11;
		new(pataccumulators_);
		pataccumulators_^.meaning:=pAAlternativesPatterndecl436_AAP436;
		pataccumulators_^.matchedassembler:=nil;
		pataccumulators_^.params :=nil;
		alternatives[12]:=patindexreg_;
		lastalt:=12;
		new(patireg_);
		patireg_^.meaning:=pAAlternativesPatterndecl447_AAP447;
		patireg_^.matchedassembler:=nil;
		patireg_^.params :=nil;
		alternatives[13]:=patEBP_EBP;
		alternatives[14]:=patubx_;
		alternatives[15]:=patudi_;
		alternatives[16]:=patusi_;
		alternatives[17]:=patudx_;
		alternatives[18]:=patESP_ESP;
		alternatives[19]:=patucx_;
		alternatives[20]:=patuax_;
		lastalt:=20;
		new(patureg_);
		patureg_^.meaning:=pAAlternativesPatterndecl452_AAP452;
		patureg_^.matchedassembler:=nil;
		patureg_^.params :=nil;
		alternatives[21]:=patireg_;
		alternatives[22]:=patureg_;
		lastalt:=22;
		new(patreg_);
		patreg_^.meaning:=pAAlternativesPatterndecl471_AAP471;
		patreg_^.matchedassembler:=nil;
		patreg_^.params :=nil;
		alternatives[23]:=patBL_BL;
		alternatives[24]:=patDL_DL;
		alternatives[25]:=patAL_AL;
		alternatives[26]:=patCL_CL;
		alternatives[27]:=patiBH_BH;
		alternatives[28]:=patiDH_DH;
		alternatives[29]:=patiCH_CH;
		lastalt:=29;
		new(patbireg_);
		patbireg_^.meaning:=pAAlternativesPatterndecl478_AAP478;
		patbireg_^.matchedassembler:=nil;
		patbireg_^.params :=nil;
		alternatives[30]:=patBH_BH;
		alternatives[31]:=patDH_DH;
		alternatives[32]:=patuAL_AL;
		alternatives[33]:=patuBL_BL;
		alternatives[34]:=patuDL_DL;
		alternatives[35]:=patuCL_CL;
		alternatives[36]:=patCH_CH;
		lastalt:=36;
		new(patbureg_);
		patbureg_^.meaning:=pAAlternativesPatterndecl495_AAP495;
		patbureg_^.matchedassembler:=nil;
		patbureg_^.params :=nil;
		alternatives[37]:=patoBL_BL;
		alternatives[38]:=patoAL_AL;
		alternatives[39]:=patoDL_DL;
		alternatives[40]:=patoCL_CL;
		lastalt:=40;
		new(patboreg_);
		patboreg_^.meaning:=pAAlternativesPatterndecl512_AAP512;
		patboreg_^.matchedassembler:=nil;
		patboreg_^.params :=nil;
		alternatives[41]:=patAL_AL;
		lastalt:=41;
		new(patbacc_);
		patbacc_^.meaning:=pAAlternativesPatterndecl523_AAP523;
		patbacc_^.matchedassembler:=nil;
		patbacc_^.params :=nil;
		alternatives[42]:=patBL_BL;
		alternatives[43]:=patCL_CL;
		alternatives[44]:=patDL_DL;
		lastalt:=44;
		new(patbnonacc_);
		patbnonacc_^.meaning:=pAAlternativesPatterndecl528_AAP528;
		patbnonacc_^.matchedassembler:=nil;
		patbnonacc_^.params :=nil;
		alternatives[45]:=patbacc_;
		alternatives[46]:=patbireg_;
		alternatives[47]:=patbnonacc_;
		alternatives[48]:=patbureg_;
		alternatives[49]:=patboreg_;
		lastalt:=49;
		new(patbreg_);
		patbreg_^.meaning:=pAAlternativesPatterndecl537_AAP537;
		patbreg_^.matchedassembler:=nil;
		patbreg_^.params :=nil;
		alternatives[50]:=patBX_BX;
		alternatives[51]:=patCX_CX;
		alternatives[52]:=patDX_DX;
		alternatives[53]:=patAX_AX;
		lastalt:=53;
		new(patswreg_);
		patswreg_^.meaning:=pAAlternativesPatterndecl550_AAP550;
		patswreg_^.matchedassembler:=nil;
		patswreg_^.params :=nil;
		alternatives[54]:=patuBX_BX;
		alternatives[55]:=patuCX_CX;
		alternatives[56]:=patuDX_DX;
		lastalt:=56;
		new(patuwreg_);
		patuwreg_^.meaning:=pAAlternativesPatterndecl561_AAP561;
		patuwreg_^.matchedassembler:=nil;
		patuwreg_^.params :=nil;
		alternatives[57]:=patSI_SI;
		alternatives[58]:=patDI_DI;
		lastalt:=58;
		new(patuntypedwreg_);
		patuntypedwreg_^.meaning:=pAAlternativesPatterndecl570_AAP570;
		patuntypedwreg_^.matchedassembler:=nil;
		patuntypedwreg_^.params :=nil;
		alternatives[59]:=patswreg_;
		alternatives[60]:=patuwreg_;
		alternatives[61]:=patuntypedwreg_;
		lastalt:=61;
		new(patwreg_);
		patwreg_^.meaning:=pAAlternativesPatterndecl577_AAP577;
		patwreg_^.matchedassembler:=nil;
		patwreg_^.params :=nil;
		alternatives[62]:=patreg_;
		alternatives[63]:=patwreg_;
		lastalt:=63;
		new(patpushreg_);
		patpushreg_^.meaning:=pAAlternativesPatterndecl586_AAP586;
		patpushreg_^.matchedassembler:=nil;
		patpushreg_^.params :=nil;
		alternatives[64]:=patpushreg_;
		lastalt:=64;
		new(patdpushreg_);
		patdpushreg_^.meaning:=pAAlternativesPatterndecl593_AAP593;
		patdpushreg_^.matchedassembler:=nil;
		patdpushreg_^.params :=nil;
		alternatives[65]:=patbreg_;
		alternatives[66]:=patwreg_;
		alternatives[67]:=patreg_;
		lastalt:=67;
		new(patanyreg_);
		patanyreg_^.meaning:=pAAlternativesPatterndecl598_AAP598;
		patanyreg_^.matchedassembler:=nil;
		patanyreg_^.params :=nil;
		alternatives[68]:=patbireg_;
		alternatives[69]:=patireg_;
		alternatives[70]:=patwreg_;
		alternatives[71]:=patireg_;
		lastalt:=71;
		new(patsignedreg_);
		patsignedreg_^.meaning:=pAAlternativesPatterndecl607_AAP607;
		patsignedreg_^.matchedassembler:=nil;
		patsignedreg_^.params :=nil;
		alternatives[72]:=patbureg_;
		alternatives[73]:=patureg_;
		alternatives[74]:=patwreg_;
		alternatives[75]:=patureg_;
		lastalt:=75;
		new(patunsignedreg_);
		patunsignedreg_^.meaning:=pAAlternativesPatterndecl618_AAP618;
		patunsignedreg_^.matchedassembler:=nil;
		patunsignedreg_^.params :=nil;
		alternatives[76]:=patEAX_EAX;
		lastalt:=76;
		new(patacc_);
		patacc_^.meaning:=pAAlternativesPatterndecl629_AAP629;
		patacc_^.matchedassembler:=nil;
		patacc_^.params :=nil;
		alternatives[77]:=patEDX_EDX;
		lastalt:=77;
		new(patdacc_);
		patdacc_^.meaning:=pAAlternativesPatterndecl634_AAP634;
		patdacc_^.matchedassembler:=nil;
		patdacc_^.params :=nil;
		alternatives[78]:=patAX_AX;
		lastalt:=78;
		new(patwacc_);
		patwacc_^.meaning:=pAAlternativesPatterndecl639_AAP639;
		patwacc_^.matchedassembler:=nil;
		patwacc_^.params :=nil;
		alternatives[79]:=patEBX_EBX;
		lastalt:=79;
		new(patebxacc_);
		patebxacc_^.meaning:=pAAlternativesPatterndecl644_AAP644;
		patebxacc_^.matchedassembler:=nil;
		patebxacc_^.params :=nil;
		alternatives[80]:=patBL_BL;
		lastalt:=80;
		new(patebxbacc_);
		patebxbacc_^.meaning:=pAAlternativesPatterndecl649_AAP649;
		patebxbacc_^.matchedassembler:=nil;
		patebxbacc_^.params :=nil;
		alternatives[81]:=patECX_ECX;
		lastalt:=81;
		new(patecxacc_);
		patecxacc_^.meaning:=pAAlternativesPatterndecl654_AAP654;
		patecxacc_^.matchedassembler:=nil;
		patecxacc_^.params :=nil;
		alternatives[82]:=patCL_CL;
		lastalt:=82;
		new(patecxbacc_);
		patecxbacc_^.meaning:=pAAlternativesPatterndecl659_AAP659;
		patecxbacc_^.matchedassembler:=nil;
		patecxbacc_^.params :=nil;
		alternatives[83]:=patucx_;
		lastalt:=83;
		new(patecxuacc_);
		patecxuacc_^.meaning:=pAAlternativesPatterndecl664_AAP664;
		patecxuacc_^.matchedassembler:=nil;
		patecxuacc_^.params :=nil;
		alternatives[84]:=patECX_ECX;
		lastalt:=84;
		new(patmodreg_);
		patmodreg_^.meaning:=pAAlternativesPatterndecl669_AAP669;
		patmodreg_^.matchedassembler:=nil;
		patmodreg_^.params :=nil;
		alternatives[85]:=patESI_ESI;
		lastalt:=85;
		new(patsourcereg_);
		patsourcereg_^.meaning:=pAAlternativesPatterndecl674_AAP674;
		patsourcereg_^.matchedassembler:=nil;
		patsourcereg_^.params :=nil;
		alternatives[86]:=patEDI_EDI;
		lastalt:=86;
		new(patdestreg_);
		patdestreg_^.meaning:=pAAlternativesPatterndecl679_AAP679;
		patdestreg_^.matchedassembler:=nil;
		patdestreg_^.params :=nil;
		alternatives[87]:=patECX_ECX;
		lastalt:=87;
		new(patcountreg_);
		patcountreg_^.meaning:=pAAlternativesPatterndecl684_AAP684;
		patcountreg_^.matchedassembler:=nil;
		patcountreg_^.params :=nil;
		alternatives[88]:=patecxbacc_;
		alternatives[89]:=patecxacc_;
		alternatives[90]:=patecxuacc_;
		lastalt:=90;
		new(patshiftcountreg_);
		patshiftcountreg_^.meaning:=pAAlternativesPatterndecl689_AAP689;
		patshiftcountreg_^.matchedassembler:=nil;
		patshiftcountreg_^.params :=nil;
		new(patadd_);
		new(patadd_^.meaning);
		patadd_^.meaning^.tag:=dyadicop;
		patadd_^.meaning^.opname:='+';
		patadd_^.matchedassembler:=string2printlist('add' );
		new(patand_);
		new(patand_^.meaning);
		patand_^.meaning^.tag:=dyadicop;
		patand_^.meaning^.opname:='AND';
		patand_^.matchedassembler:=string2printlist('and' );
		new(pator_);
		new(pator_^.meaning);
		pator_^.meaning^.tag:=dyadicop;
		pator_^.meaning^.opname:='OR';
		pator_^.matchedassembler:=string2printlist('or' );
		new(patxor_);
		new(patxor_^.meaning);
		patxor_^.meaning^.tag:=dyadicop;
		patxor_^.meaning^.opname:='XOR';
		patxor_^.matchedassembler:=string2printlist('xor' );
		new(patsub_);
		new(patsub_^.meaning);
		patsub_^.meaning^.tag:=dyadicop;
		patsub_^.meaning^.opname:='-';
		patsub_^.matchedassembler:=string2printlist('sub' );
		new(patmul_);
		new(patmul_^.meaning);
		patmul_^.meaning^.tag:=dyadicop;
		patmul_^.meaning^.opname:='*';
		patmul_^.matchedassembler:=string2printlist('mul' );
		new(patimul_);
		new(patimul_^.meaning);
		patimul_^.meaning^.tag:=dyadicop;
		patimul_^.meaning^.opname:='*';
		patimul_^.matchedassembler:=string2printlist('imul ' );
		new(patbel_);
		new(patbel_^.meaning);
		patbel_^.meaning^.tag:=dyadicop;
		patbel_^.meaning^.opname:='<';
		patbel_^.matchedassembler:=string2printlist('b' );
		new(patlt_);
		new(patlt_^.meaning);
		patlt_^.meaning^.tag:=dyadicop;
		patlt_^.meaning^.opname:='<';
		patlt_^.matchedassembler:=string2printlist('l' );
		new(patab_);
		new(patab_^.meaning);
		patab_^.meaning^.tag:=dyadicop;
		patab_^.meaning^.opname:='>';
		patab_^.matchedassembler:=string2printlist('a' );
		new(patgt_);
		new(patgt_^.meaning);
		patgt_^.meaning^.tag:=dyadicop;
		patgt_^.meaning^.opname:='>';
		patgt_^.matchedassembler:=string2printlist('g' );
		new(pateq_);
		new(pateq_^.meaning);
		pateq_^.meaning^.tag:=dyadicop;
		pateq_^.meaning^.opname:='=';
		pateq_^.matchedassembler:=string2printlist('z' );
		new(patbe_);
		new(patbe_^.meaning);
		patbe_^.meaning^.tag:=dyadicop;
		patbe_^.meaning^.opname:='<=';
		patbe_^.matchedassembler:=string2printlist('be' );
		new(patle_);
		new(patle_^.meaning);
		patle_^.meaning^.tag:=dyadicop;
		patle_^.meaning^.opname:='<=';
		patle_^.matchedassembler:=string2printlist('le' );
		new(patae_);
		new(patae_^.meaning);
		patae_^.meaning^.tag:=dyadicop;
		patae_^.meaning^.opname:='>=';
		patae_^.matchedassembler:=string2printlist('ae' );
		new(patge_);
		new(patge_^.meaning);
		patge_^.meaning^.tag:=dyadicop;
		patge_^.meaning^.opname:='>=';
		patge_^.matchedassembler:=string2printlist('ge' );
		new(patne_);
		new(patne_^.meaning);
		patne_^.meaning^.tag:=dyadicop;
		patne_^.meaning^.opname:='<>';
		patne_^.matchedassembler:=string2printlist('nz' );
		new(patshiftleft_);
		new(patshiftleft_^.meaning);
		patshiftleft_^.meaning^.tag:=dyadicop;
		patshiftleft_^.meaning^.opname:='<<';
		patshiftleft_^.matchedassembler:=string2printlist('l' );
		new(patshiftright_);
		new(patshiftright_^.meaning);
		patshiftright_^.meaning^.tag:=dyadicop;
		patshiftright_^.meaning^.opname:='>>';
		patshiftright_^.matchedassembler:=string2printlist('r' );
		alternatives[91]:=patne_;
		alternatives[92]:=patge_;
		alternatives[93]:=patle_;
		alternatives[94]:=pateq_;
		alternatives[95]:=patgt_;
		alternatives[96]:=patlt_;
		lastalt:=96;
		new(patcondition_);
		patcondition_^.meaning:=pAAlternativesPatterndecl774_AAP774;
		patcondition_^.matchedassembler:=nil;
		patcondition_^.params :=nil;
		alternatives[97]:=pateq_;
		lastalt:=97;
		new(patequals_);
		patequals_^.meaning:=pAAlternativesPatterndecl789_AAP789;
		patequals_^.matchedassembler:=nil;
		patequals_^.params :=nil;
		alternatives[98]:=patne_;
		alternatives[99]:=patae_;
		alternatives[100]:=patbe_;
		alternatives[101]:=pateq_;
		alternatives[102]:=patab_;
		alternatives[103]:=patbel_;
		lastalt:=103;
		new(patunsignedcondition_);
		patunsignedcondition_^.meaning:=pAAlternativesPatterndecl794_AAP794;
		patunsignedcondition_^.matchedassembler:=nil;
		patunsignedcondition_^.params :=nil;
		alternatives[104]:=patadd_;
		alternatives[105]:=patsub_;
		alternatives[106]:=patimul_;
		alternatives[107]:=patand_;
		alternatives[108]:=pator_;
		alternatives[109]:=patxor_;
		lastalt:=109;
		new(patoperator_);
		patoperator_^.meaning:=pAAlternativesPatterndecl809_AAP809;
		patoperator_^.matchedassembler:=nil;
		patoperator_^.params :=nil;
		alternatives[110]:=patadd_;
		alternatives[111]:=patsub_;
		alternatives[112]:=patand_;
		alternatives[113]:=pator_;
		alternatives[114]:=patxor_;
		lastalt:=114;
		new(patnonmultoperator_);
		patnonmultoperator_^.meaning:=pAAlternativesPatterndecl824_AAP824;
		patnonmultoperator_^.matchedassembler:=nil;
		patnonmultoperator_^.params :=nil;
		alternatives[115]:=patadd_;
		alternatives[116]:=patimul_;
		alternatives[117]:=patand_;
		alternatives[118]:=pator_;
		alternatives[119]:=patxor_;
		lastalt:=119;
		new(patsaddoperator_);
		patsaddoperator_^.meaning:=pAAlternativesPatterndecl837_AAP837;
		patsaddoperator_^.matchedassembler:=nil;
		patsaddoperator_^.params :=nil;
		alternatives[120]:=patshiftleft_;
		alternatives[121]:=patshiftright_;
		lastalt:=121;
		new(patshiftop_);
		patshiftop_^.meaning:=pAAlternativesPatterndecl850_AAP850;
		patshiftop_^.matchedassembler:=nil;
		patshiftop_^.params :=nil;
		alternatives[122]:=patuint32_32;
		alternatives[123]:=patuint8_8;
		alternatives[124]:=patuint16_16;
		lastalt:=124;
		new(patunsigned_);
		patunsigned_^.meaning:=pAAlternativesPatterndecl857_AAP857;
		patunsigned_^.matchedassembler:=nil;
		patunsigned_^.params :=nil;
		alternatives[125]:=patint8_8;
		alternatives[126]:=patint16_16;
		alternatives[127]:=patint32_32;
		lastalt:=127;
		new(patsigned_);
		patsigned_^.meaning:=pAAlternativesPatterndecl872_AAP872;
		patsigned_^.matchedassembler:=nil;
		patsigned_^.params :=nil;
		alternatives[128]:=patint8_8;
		alternatives[129]:=patint16_16;
		alternatives[130]:=patint32_32;
		alternatives[131]:=patuint32_32;
		alternatives[132]:=patuint8_8;
		alternatives[133]:=patuint16_16;
		lastalt:=133;
		new(patint_);
		patint_^.meaning:=pAAlternativesPatterndecl887_AAP887;
		patint_^.matchedassembler:=nil;
		patint_^.params :=nil;
		alternatives[134]:=patieee64_64;
		lastalt:=134;
		new(patdouble_);
		patdouble_^.meaning:=pAAlternativesPatterndecl914_AAP914;
		patdouble_^.matchedassembler:=nil;
		patdouble_^.params :=nil;
		alternatives[135]:=patieee32_32;
		lastalt:=135;
		new(patfloat_);
		patfloat_^.meaning:=pAAlternativesPatterndecl920_AAP920;
		patfloat_^.matchedassembler:=nil;
		patfloat_^.params :=nil;
		alternatives[136]:=patieee64_64;
		alternatives[137]:=patfloat_;
		lastalt:=137;
		new(patreal_);
		patreal_^.meaning:=pAAlternativesPatterndecl926_AAP926;
		patreal_^.matchedassembler:=nil;
		patreal_^.params :=nil;
		alternatives[138]:=patuint8_8;
		alternatives[139]:=patint8_8;
		alternatives[140]:=patoctet_;
		lastalt:=140;
		new(patbyte_);
		patbyte_^.meaning:=pAAlternativesPatterndecl934_AAP934;
		patbyte_^.matchedassembler:=nil;
		patbyte_^.params :=nil;
		alternatives[141]:=patint32_32;
		alternatives[142]:=patuint32_32;
		alternatives[143]:=patword_;
		lastalt:=143;
		new(patword32_32);
		patword32_32^.meaning:=pAAlternativesPatterndecl948_AAP948;
		patword32_32^.matchedassembler:=nil;
		patword32_32^.params :=nil;
		alternatives[144]:=patint16_16;
		alternatives[145]:=patuint16_16;
		alternatives[146]:=pathalfword_;
		lastalt:=146;
		new(patword16_16);
		patword16_16^.meaning:=pAAlternativesPatterndecl962_AAP962;
		patword16_16^.matchedassembler:=nil;
		patword16_16^.params :=nil;
		alternatives[147]:=patbyte_;
		alternatives[148]:=patword16_16;
		alternatives[149]:=patword32_32;
		lastalt:=149;
		new(patwordupto32_32);
		patwordupto32_32^.meaning:=pAAlternativesPatterndecl976_AAP976;
		patwordupto32_32^.matchedassembler:=nil;
		patwordupto32_32^.params :=nil;
		alternatives[150]:=patoctet_;
		alternatives[151]:=patword_;
		lastalt:=151;
		new(patdataformat_);
		patdataformat_^.meaning:=pAAlternativesPatterndecl985_AAP985;
		patdataformat_^.matchedassembler:=nil;
		patdataformat_^.params :=nil;
		alternatives[152]:=patint32_32;
		alternatives[153]:=patuint32_32;
		lastalt:=153;
		new(patlongint_);
		patlongint_^.meaning:=pAAlternativesPatterndecl994_AAP994;
		patlongint_^.matchedassembler:=nil;
		patlongint_^.params :=nil;
		alternatives[154]:=patint32_32;
		alternatives[155]:=patint64_64;
		alternatives[156]:=patint16_16;
		lastalt:=156;
		new(pathiint_);
		pathiint_^.meaning:=pAAlternativesPatterndecl1005_AAP1005;
		pathiint_^.matchedassembler:=nil;
		pathiint_^.params :=nil;
		new(pattwo_);
		pattwo_^.meaning:=pAValueMeaning1022_AVM1022;
		pattwo_^.matchedassembler:=pAAssemblesto1027_AA1027;
		new(pattwo_^.params);
		for i:= 1 to maxparam do pattwo_^.params^[i]:=nil;
		pattwo_^.params^[0]:=pattype_;
		 
		new(patfour_);
		patfour_^.meaning:=pAValueMeaning1036_AVM1036;
		patfour_^.matchedassembler:=pAAssemblesto1041_AA1041;
		new(patfour_^.params);
		for i:= 1 to maxparam do patfour_^.params^[i]:=nil;
		patfour_^.params^[0]:=pattype_;
		 
		new(pateight_);
		pateight_^.meaning:=pAValueMeaning1050_AVM1050;
		pateight_^.matchedassembler:=pAAssemblesto1055_AA1055;
		new(pateight_^.params);
		for i:= 1 to maxparam do pateight_^.params^[i]:=nil;
		pateight_^.params^[0]:=pattype_;
		 
		alternatives[157]:=pattwo_;
		alternatives[158]:=patfour_;
		alternatives[159]:=pateight_;
		lastalt:=159;
		new(patscale_);
		patscale_^.meaning:=pAAlternativesPatterndecl1062_AAP1062;
		patscale_^.matchedassembler:=nil;
		patscale_^.params :=nil;
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patlabelf_);
		patlabelf_^.meaning:=pAValueMeaning1073_AVM1073;
		patlabelf_^.matchedassembler:=pAAssemblesto1076_AA1076;
		new(patlabelf_^.params);
		for i:= 1 to maxparam do patlabelf_^.params^[i]:=nil;
		patlabelf_^.params^[0]:=patlabel_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patsconst_);
		patsconst_^.meaning:=pAValueMeaning1085_AVM1085;
		patsconst_^.matchedassembler:=pAAssemblesto1088_AA1088;
		new(patsconst_^.params);
		for i:= 1 to maxparam do patsconst_^.params^[i]:=nil;
		patsconst_^.params^[0]:=patsigned_;
		 
		alternatives[160]:=patsconst_;
		alternatives[161]:=patlabelf_;
		lastalt:=161;
		new(patlconstf_);
		patlconstf_^.meaning:=pAAlternativesPatterndecl1095_AAP1095;
		patlconstf_^.matchedassembler:=nil;
		patlconstf_^.params :=nil;
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! matches a literal  to the tree at this point*)
		new(patlabelconstf_);
		patlabelconstf_^.meaning:=pAValueMeaning1106_AVM1106;
		patlabelconstf_^.matchedassembler:=pAAssemblesto1113_AA1113;
		new(patlabelconstf_^.params);
		for i:= 1 to maxparam do patlabelconstf_^.params^[i]:=nil;
		patlabelconstf_^.params^[0]:=patlconstf_;
		patlabelconstf_^.params^[1]:=patlconstf_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patconstf_);
		patconstf_^.meaning:=pAValueMeaning1124_AVM1124;
		patconstf_^.matchedassembler:=pAAssemblesto1127_AA1127;
		new(patconstf_^.params);
		for i:= 1 to maxparam do patconstf_^.params^[i]:=nil;
		patconstf_^.params^[0]:=patsigned_;
		 
		alternatives[162]:=patconstf_;
		alternatives[163]:=patlabelf_;
		alternatives[164]:=patlabelconstf_;
		lastalt:=164;
		new(patoffset_);
		patoffset_^.meaning:=pAAlternativesPatterndecl1134_AAP1134;
		patoffset_^.matchedassembler:=nil;
		patoffset_^.params :=nil;
		(*! Matches identifier r  to the tree at this point*)
		new(patregindirf_);
		patregindirf_^.meaning:=pAValueMeaning1145_AVM1145;
		patregindirf_^.matchedassembler:=pAAssemblesto1150_AA1150;
		new(patregindirf_^.params);
		for i:= 1 to maxparam do patregindirf_^.params^[i]:=nil;
		patregindirf_^.params^[0]:=patreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patsimplescaled_);
		patsimplescaled_^.meaning:=pAValueMeaning1161_AVM1161;
		patsimplescaled_^.matchedassembler:=pAAssemblesto1170_AA1170;
		new(patsimplescaled_^.params);
		for i:= 1 to maxparam do patsimplescaled_^.params^[i]:=nil;
		patsimplescaled_^.params^[0]:=patreg_;
		patsimplescaled_^.params^[1]:=patscale_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier o  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patnegcompscaled_);
		patnegcompscaled_^.meaning:=pAValueMeaning1185_AVM1185;
		patnegcompscaled_^.matchedassembler:=pAAssemblesto1198_AA1198;
		new(patnegcompscaled_^.params);
		for i:= 1 to maxparam do patnegcompscaled_^.params^[i]:=nil;
		patnegcompscaled_^.params^[0]:=patreg_;
		patnegcompscaled_^.params^[1]:=patscale_;
		patnegcompscaled_^.params^[2]:=patoffset_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier o  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patcompscaled_);
		patcompscaled_^.meaning:=pAValueMeaning1218_AVM1218;
		patcompscaled_^.matchedassembler:=pAAssemblesto1231_AA1231;
		new(patcompscaled_^.params);
		for i:= 1 to maxparam do patcompscaled_^.params^[i]:=nil;
		patcompscaled_^.params^[0]:=patreg_;
		patcompscaled_^.params^[1]:=patscale_;
		patcompscaled_^.params^[2]:=patoffset_;
		 
		alternatives[165]:=patcompscaled_;
		alternatives[166]:=patnegcompscaled_;
		alternatives[167]:=patsimplescaled_;
		lastalt:=167;
		new(patscaled_);
		patscaled_^.meaning:=pAAlternativesPatterndecl1245_AAP1245;
		patscaled_^.matchedassembler:=nil;
		patscaled_^.params :=nil;
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbaseminusoffsetf_);
		patbaseminusoffsetf_^.meaning:=pAValueMeaning1258_AVM1258;
		patbaseminusoffsetf_^.matchedassembler:=pAAssemblesto1267_AA1267;
		new(patbaseminusoffsetf_^.params);
		for i:= 1 to maxparam do patbaseminusoffsetf_^.params^[i]:=nil;
		patbaseminusoffsetf_^.params^[1]:=patoffset_;
		patbaseminusoffsetf_^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbaseplusoffsetf_);
		patbaseplusoffsetf_^.meaning:=pAValueMeaning1281_AVM1281;
		patbaseplusoffsetf_^.matchedassembler:=pAAssemblesto1290_AA1290;
		new(patbaseplusoffsetf_^.params);
		for i:= 1 to maxparam do patbaseplusoffsetf_^.params^[i]:=nil;
		patbaseplusoffsetf_^.params^[1]:=patoffset_;
		patbaseplusoffsetf_^.params^[0]:=patreg_;
		 
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier offs  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patscaledIndexPlusOffsetf_IPO);
		patscaledIndexPlusOffsetf_IPO^.meaning:=pAValueMeaning1303_AVM1303;
		patscaledIndexPlusOffsetf_IPO^.matchedassembler:=pAAssemblesto1310_AA1310;
		new(patscaledIndexPlusOffsetf_IPO^.params);
		for i:= 1 to maxparam do patscaledIndexPlusOffsetf_IPO^.params^[i]:=nil;
		patscaledIndexPlusOffsetf_IPO^.params^[0]:=patscaled_;
		patscaledIndexPlusOffsetf_IPO^.params^[1]:=patoffset_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbasePlusScaledIndexf_PSI);
		patbasePlusScaledIndexf_PSI^.meaning:=pAValueMeaning1322_AVM1322;
		patbasePlusScaledIndexf_PSI^.matchedassembler:=pAAssemblesto1331_AA1331;
		new(patbasePlusScaledIndexf_PSI^.params);
		for i:= 1 to maxparam do patbasePlusScaledIndexf_PSI^.params^[i]:=nil;
		patbasePlusScaledIndexf_PSI^.params^[0]:=patreg_;
		patbasePlusScaledIndexf_PSI^.params^[1]:=patscaled_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier off  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbasePlusScaledIndexPlusOffsetf_PSIPO);
		patbasePlusScaledIndexPlusOffsetf_PSIPO^.meaning:=pAValueMeaning1347_AVM1347;
		patbasePlusScaledIndexPlusOffsetf_PSIPO^.matchedassembler:=pAAssemblesto1364_AA1364;
		new(patbasePlusScaledIndexPlusOffsetf_PSIPO^.params);
		for i:= 1 to maxparam do patbasePlusScaledIndexPlusOffsetf_PSIPO^.params^[i]:=nil;
		patbasePlusScaledIndexPlusOffsetf_PSIPO^.params^[0]:=patreg_;
		patbasePlusScaledIndexPlusOffsetf_PSIPO^.params^[3]:=patlongint_;
		patbasePlusScaledIndexPlusOffsetf_PSIPO^.params^[1]:=patscaled_;
		patbasePlusScaledIndexPlusOffsetf_PSIPO^.params^[2]:=patoffset_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier off  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbasePlusIndexPlusOffsetf_PIPO);
		patbasePlusIndexPlusOffsetf_PIPO^.meaning:=pAValueMeaning1380_AVM1380;
		patbasePlusIndexPlusOffsetf_PIPO^.matchedassembler:=pAAssemblesto1395_AA1395;
		new(patbasePlusIndexPlusOffsetf_PIPO^.params);
		for i:= 1 to maxparam do patbasePlusIndexPlusOffsetf_PIPO^.params^[i]:=nil;
		patbasePlusIndexPlusOffsetf_PIPO^.params^[1]:=patreg_;
		patbasePlusIndexPlusOffsetf_PIPO^.params^[0]:=patreg_;
		patbasePlusIndexPlusOffsetf_PIPO^.params^[2]:=patoffset_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patbasePlusIndexf_PI);
		patbasePlusIndexf_PI^.meaning:=pAValueMeaning1409_AVM1409;
		patbasePlusIndexf_PI^.matchedassembler:=pAAssemblesto1420_AA1420;
		new(patbasePlusIndexf_PI^.params);
		for i:= 1 to maxparam do patbasePlusIndexf_PI^.params^[i]:=nil;
		patbasePlusIndexf_PI^.params^[1]:=patreg_;
		patbasePlusIndexf_PI^.params^[0]:=patreg_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patdirectf_);
		patdirectf_^.meaning:=pAValueMeaning1431_AVM1431;
		patdirectf_^.matchedassembler:=pAAssemblesto1434_AA1434;
		new(patdirectf_^.params);
		for i:= 1 to maxparam do patdirectf_^.params^[i]:=nil;
		patdirectf_^.params^[0]:=patunsigned_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patudirectf_);
		patudirectf_^.meaning:=pAValueMeaning1443_AVM1443;
		patudirectf_^.matchedassembler:=pAAssemblesto1446_AA1446;
		new(patudirectf_^.params);
		for i:= 1 to maxparam do patudirectf_^.params^[i]:=nil;
		patudirectf_^.params^[0]:=patint_;
		 
		alternatives[168]:=patdirectf_;
		alternatives[169]:=patudirectf_;
		alternatives[170]:=patlabelf_;
		alternatives[171]:=patlabelconstf_;
		alternatives[172]:=patscaledIndexPlusOffsetf_IPO;
		alternatives[173]:=patbasePlusScaledIndexPlusOffsetf_PSIPO;
		alternatives[174]:=patbaseplusoffsetf_;
		alternatives[175]:=patbasePlusIndexPlusOffsetf_PIPO;
		alternatives[176]:=patbasePlusScaledIndexf_PSI;
		alternatives[177]:=patscaledIndexPlusOffsetf_IPO;
		alternatives[178]:=patbaseminusoffsetf_;
		alternatives[179]:=patbasePlusIndexf_PI;
		lastalt:=179;
		new(patuncasteaform_);
		patuncasteaform_^.meaning:=pAAlternativesPatterndecl1453_AAP1453;
		patuncasteaform_^.matchedassembler:=nil;
		patuncasteaform_^.params :=nil;
		(*! Matches identifier f  to the tree at this point*)
	(*! recogises loc in value context *)
		new(pateaform_);
		pateaform_^.meaning:=pAValueMeaning1484_AVM1484;
		pateaform_^.matchedassembler:=pAAssemblesto1491_AA1491;
		new(pateaform_^.params);
		for i:= 1 to maxparam do pateaform_^.params^[i]:=nil;
		pateaform_^.params^[1]:=patlongint_;
		pateaform_^.params^[0]:=patuncasteaform_;
		 
		alternatives[180]:=pateaform_;
		alternatives[181]:=patregindirf_;
		lastalt:=181;
		new(pataddrform_);
		pataddrform_^.meaning:=pAAlternativesPatterndecl1498_AAP1498;
		pataddrform_^.matchedassembler:=nil;
		pataddrform_^.params :=nil;
		(*! Matches identifier f  to the tree at this point*)
	(*! recogises loc in value context *)
	(*! recogises loc in value context *)
		new(patmaddrmode_);
		patmaddrmode_^.meaning:=pAValueMeaning1507_AVM1507;
		patmaddrmode_^.matchedassembler:=pAAssemblesto1512_AA1512;
		new(patmaddrmode_^.params);
		for i:= 1 to maxparam do patmaddrmode_^.params^[i]:=nil;
		patmaddrmode_^.params^[0]:=pataddrform_;
		 
		alternatives[182]:=patmaddrmode_;
		lastalt:=182;
		new(patgmaddrmode_);
		patgmaddrmode_^.meaning:=pAAlternativesPatterndecl1521_AAP1521;
		patgmaddrmode_^.matchedassembler:=nil;
		patgmaddrmode_^.params :=nil;
		(*! matches a literal  to the tree at this point*)
		new(patimmediate_);
		patimmediate_^.meaning:=pAValueMeaning1528_AVM1528;
		patimmediate_^.matchedassembler:=pAAssemblesto1531_AA1531;
		new(patimmediate_^.params);
		for i:= 1 to maxparam do patimmediate_^.params^[i]:=nil;
		patimmediate_^.params^[0]:=patsigned_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patintimmediate_);
		patintimmediate_^.meaning:=pAValueMeaning1540_AVM1540;
		patintimmediate_^.matchedassembler:=pAAssemblesto1543_AA1543;
		new(patintimmediate_^.params);
		for i:= 1 to maxparam do patintimmediate_^.params^[i]:=nil;
		patintimmediate_^.params^[0]:=patint_;
		 
		alternatives[183]:=patlabelf_;
		alternatives[184]:=patmaddrmode_;
		lastalt:=184;
		new(patjumpmode_);
		patjumpmode_^.meaning:=pAAlternativesPatterndecl1550_AAP1550;
		patjumpmode_^.matchedassembler:=nil;
		patjumpmode_^.params :=nil;
		alternatives[185]:=patmaddrmode_;
		alternatives[186]:=patanyreg_;
		lastalt:=186;
		new(pataddrmode_);
		pataddrmode_^.meaning:=pAAlternativesPatterndecl1557_AAP1557;
		pataddrmode_^.matchedassembler:=nil;
		pataddrmode_^.params :=nil;
		alternatives[187]:=patmaddrmode_;
		alternatives[188]:=patbreg_;
		lastalt:=188;
		new(patbaddrmode_);
		patbaddrmode_^.meaning:=pAAlternativesPatterndecl1564_AAP1564;
		patbaddrmode_^.matchedassembler:=nil;
		patbaddrmode_^.params :=nil;
		alternatives[189]:=patmaddrmode_;
		alternatives[190]:=patreg_;
		lastalt:=190;
		new(patwaddrmode_);
		patwaddrmode_^.meaning:=pAAlternativesPatterndecl1571_AAP1571;
		patwaddrmode_^.matchedassembler:=nil;
		patwaddrmode_^.params :=nil;
		alternatives[191]:=patmaddrmode_;
		lastalt:=191;
		new(patwmemdummy_);
		patwmemdummy_^.meaning:=pAAlternativesPatterndecl1578_AAP1578;
		patwmemdummy_^.matchedassembler:=nil;
		patwmemdummy_^.params :=nil;
		(*! Matches identifier r  to the tree at this point*)
		new(patregshift_);
		patregshift_^.meaning:=pAValueMeaning1585_AVM1585;
		patregshift_^.matchedassembler:=pAAssemblesto1590_AA1590;
		new(patregshift_^.params);
		for i:= 1 to maxparam do patregshift_^.params^[i]:=nil;
		patregshift_^.params^[0]:=patshiftcountreg_;
		 
		alternatives[192]:=patimmediate_;
		alternatives[193]:=patregshift_;
		lastalt:=193;
		new(patshiftcount_);
		patshiftcount_^.meaning:=pAAlternativesPatterndecl1597_AAP1597;
		patshiftcount_^.matchedassembler:=nil;
		patshiftcount_^.params :=nil;
		(*! Matches identifier r  to the tree at this point*)
		new(patregaddrop_);
		patregaddrop_^.meaning:=pAValueMeaning1606_AVM1606;
		patregaddrop_^.matchedassembler:=pAAssemblesto1611_AA1611;
		new(patregaddrop_^.params);
		for i:= 1 to maxparam do patregaddrop_^.params^[i]:=nil;
		patregaddrop_^.params^[0]:=pataddrmode_;
		 
		alternatives[194]:=patintimmediate_;
		alternatives[195]:=patmaddrmode_;
		alternatives[196]:=patregaddrop_;
		lastalt:=196;
		new(patregaddrimmediate_);
		patregaddrimmediate_^.meaning:=pAAlternativesPatterndecl1618_AAP1618;
		patregaddrimmediate_^.matchedassembler:=nil;
		patregaddrimmediate_^.params :=nil;
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTACKSTORE_STACKSTORE);
		patSTACKSTORE_STACKSTORE^.meaning:=pAAssignMeaning1628_AAM1628;
		patSTACKSTORE_STACKSTORE^.matchedassembler:=pAAssemblesto1646_AA1646;
		new(patSTACKSTORE_STACKSTORE^.params);
		for i:= 1 to maxparam do patSTACKSTORE_STACKSTORE^.params^[i]:=nil;
		patSTACKSTORE_STACKSTORE^.params^[0]:=patreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref halfword*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTACKWSTORE_STACKWSTORE);
		patSTACKWSTORE_STACKWSTORE^.meaning:=pAAssignMeaning1658_AAM1658;
		patSTACKWSTORE_STACKWSTORE^.matchedassembler:=pAAssemblesto1675_AA1675;
		new(patSTACKWSTORE_STACKWSTORE^.params);
		for i:= 1 to maxparam do patSTACKWSTORE_STACKWSTORE^.params^[i]:=nil;
		patSTACKWSTORE_STACKWSTORE^.params^[0]:=patwreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref octet*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTACKBSTORE_STACKBSTORE);
		patSTACKBSTORE_STACKBSTORE^.meaning:=pAAssignMeaning1685_AAM1685;
		patSTACKBSTORE_STACKBSTORE^.matchedassembler:=pAAssemblesto1702_AA1702;
		new(patSTACKBSTORE_STACKBSTORE^.params);
		for i:= 1 to maxparam do patSTACKBSTORE_STACKBSTORE^.params^[i]:=nil;
		patSTACKBSTORE_STACKBSTORE^.params^[0]:=patbreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic1726_AID1726*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSMLIT_SMLIT);
		patSMLIT_SMLIT^.meaning:=pAValueMeaning1714_AVM1714;
		patSMLIT_SMLIT^.matchedassembler:=pAAssemblesto1733_AA1733;
		new(patSMLIT_SMLIT^.params);
		for i:= 1 to maxparam do patSMLIT_SMLIT^.params^[i]:=nil;
		patSMLIT_SMLIT^.params^[1]:=patoffset_;
		patSMLIT_SMLIT^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSMULIT_SMULIT);
		patSMULIT_SMULIT^.meaning:=pAValueMeaning1745_AVM1745;
		patSMULIT_SMULIT^.matchedassembler:=pAAssemblesto1764_AA1764;
		new(patSMULIT_SMULIT^.params);
		for i:= 1 to maxparam do patSMULIT_SMULIT^.params^[i]:=nil;
		patSMULIT_SMULIT^.params^[1]:=patoffset_;
		patSMULIT_SMULIT^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSADD_SADD);
		patSADD_SADD^.meaning:=pAValueMeaning1774_AVM1774;
		patSADD_SADD^.matchedassembler:=pAAssemblesto1793_AA1793;
		new(patSADD_SADD^.params);
		for i:= 1 to maxparam do patSADD_SADD^.params^[i]:=nil;
		patSADD_SADD^.params^[0]:=patsaddoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic1811_AID1811*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSOP_SOP);
		patSOP_SOP^.meaning:=pAValueMeaning1801_AVM1801;
		patSOP_SOP^.matchedassembler:=pAAssemblesto1820_AA1820;
		new(patSOP_SOP^.params);
		for i:= 1 to maxparam do patSOP_SOP^.params^[i]:=nil;
		patSOP_SOP^.params^[0]:=patsaddoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic1844_AID1844*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSMR_SMR);
		patSMR_SMR^.meaning:=pAValueMeaning1832_AVM1832;
		patSMR_SMR^.matchedassembler:=pAAssemblesto1853_AA1853;
		new(patSMR_SMR^.params);
		for i:= 1 to maxparam do patSMR_SMR^.params^[i]:=nil;
		patSMR_SMR^.params^[1]:=patreg_;
		patSMR_SMR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic1871_AID1871*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSMRSHIFT_SMRSHIFT);
		patSMRSHIFT_SMRSHIFT^.meaning:=pAValueMeaning1865_AVM1865;
		patSMRSHIFT_SMRSHIFT^.matchedassembler:=pAAssemblesto1880_AA1880;
		new(patSMRSHIFT_SMRSHIFT^.params);
		for i:= 1 to maxparam do patSMRSHIFT_SMRSHIFT^.params^[i]:=nil;
		patSMRSHIFT_SMRSHIFT^.params^[1]:=patshiftcountreg_;
		patSMRSHIFT_SMRSHIFT^.params^[0]:=patshiftop_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic1905_AID1905*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patBSMR_BSMR);
		patBSMR_BSMR^.meaning:=pAValueMeaning1894_AVM1894;
		patBSMR_BSMR^.matchedassembler:=pAAssemblesto1914_AA1914;
		new(patBSMR_BSMR^.params);
		for i:= 1 to maxparam do patBSMR_BSMR^.params^[i]:=nil;
		patBSMR_BSMR^.params^[1]:=patbreg_;
		patBSMR_BSMR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSMRADD_SMRADD);
		patSMRADD_SMRADD^.meaning:=pAAssignMeaning1924_AAM1924;
		patSMRADD_SMRADD^.matchedassembler:=pAAssemblesto1944_AA1944;
		new(patSMRADD_SMRADD^.params);
		for i:= 1 to maxparam do patSMRADD_SMRADD^.params^[i]:=nil;
		patSMRADD_SMRADD^.params^[0]:=patreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic1970_AID1970*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSMRP_SMRP);
		patSMRP_SMRP^.meaning:=pAValueMeaning1958_AVM1958;
		patSMRP_SMRP^.matchedassembler:=pAAssemblesto1979_AA1979;
		new(patSMRP_SMRP^.params);
		for i:= 1 to maxparam do patSMRP_SMRP^.params^[i]:=nil;
		patSMRP_SMRP^.params^[1]:=patreg_;
		patSMRP_SMRP^.params^[2]:=pattype_;
		patSMRP_SMRP^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patRPUSH_RPUSH);
		patRPUSH_RPUSH^.meaning:=pAValueMeaning1989_AVM1989;
		patRPUSH_RPUSH^.matchedassembler:=pAAssemblesto1998_AA1998;
		new(patRPUSH_RPUSH^.params);
		for i:= 1 to maxparam do patRPUSH_RPUSH^.params^[i]:=nil;
		patRPUSH_RPUSH^.params^[0]:=patdpushreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patRPUSHE_RPUSHE);
		patRPUSHE_RPUSHE^.meaning:=pAValueMeaning2007_AVM2007;
		patRPUSHE_RPUSHE^.matchedassembler:=pAAssemblesto2024_AA2024;
		new(patRPUSHE_RPUSHE^.params);
		for i:= 1 to maxparam do patRPUSHE_RPUSHE^.params^[i]:=nil;
		patRPUSHE_RPUSHE^.params^[0]:=patureg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patRPOP_RPOP);
		patRPOP_RPOP^.meaning:=pAAssignMeaning2038_AAM2038;
		patRPOP_RPOP^.matchedassembler:=pAAssemblesto2054_AA2054;
		new(patRPOP_RPOP^.params);
		for i:= 1 to maxparam do patRPOP_RPOP^.params^[i]:=nil;
		patRPOP_RPOP^.params^[1]:=pattype_;
		patRPOP_RPOP^.params^[0]:=patdpushreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patBPUSH_BPUSH);
		patBPUSH_BPUSH^.meaning:=pAValueMeaning2063_AVM2063;
		patBPUSH_BPUSH^.matchedassembler:=pAAssemblesto2072_AA2072;
		new(patBPUSH_BPUSH^.params);
		for i:= 1 to maxparam do patBPUSH_BPUSH^.params^[i]:=nil;
		patBPUSH_BPUSH^.params^[0]:=patbureg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patBSPUSH_BSPUSH);
		patBSPUSH_BSPUSH^.meaning:=pAValueMeaning2081_AVM2081;
		patBSPUSH_BSPUSH^.matchedassembler:=pAAssemblesto2096_AA2096;
		new(patBSPUSH_BSPUSH^.params);
		for i:= 1 to maxparam do patBSPUSH_BSPUSH^.params^[i]:=nil;
		patBSPUSH_BSPUSH^.params^[0]:=patbaddrmode_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patBSPOP_BSPOP);
		patBSPOP_BSPOP^.meaning:=pAAssignMeaning2106_AAM2106;
		patBSPOP_BSPOP^.matchedassembler:=pAAssemblesto2114_AA2114;
		new(patBSPOP_BSPOP^.params);
		for i:= 1 to maxparam do patBSPOP_BSPOP^.params^[i]:=nil;
		patBSPOP_BSPOP^.params^[0]:=patbireg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patBPOP_BPOP);
		patBPOP_BPOP^.meaning:=pAAssignMeaning2124_AAM2124;
		patBPOP_BPOP^.matchedassembler:=pAAssemblesto2132_AA2132;
		new(patBPOP_BPOP^.params);
		for i:= 1 to maxparam do patBPOP_BPOP^.params^[i]:=nil;
		patBPOP_BPOP^.params^[0]:=patbureg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref ref t*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patREFPOP_REFPOP);
		patREFPOP_REFPOP^.meaning:=pAAssignMeaning2144_AAM2144;
		patREFPOP_REFPOP^.matchedassembler:=pAAssemblesto2158_AA2158;
		new(patREFPOP_REFPOP^.params);
		for i:= 1 to maxparam do patREFPOP_REFPOP^.params^[i]:=nil;
		patREFPOP_REFPOP^.params^[1]:=pattype_;
		patREFPOP_REFPOP^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patMEMPOP_MEMPOP);
		patMEMPOP_MEMPOP^.meaning:=pAAssignMeaning2167_AAM2167;
		patMEMPOP_MEMPOP^.matchedassembler:=pAAssemblesto2181_AA2181;
		new(patMEMPOP_MEMPOP^.params);
		for i:= 1 to maxparam do patMEMPOP_MEMPOP^.params^[i]:=nil;
		patMEMPOP_MEMPOP^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patLITPUSH_LITPUSH);
		patLITPUSH_LITPUSH^.meaning:=pAValueMeaning2190_AVM2190;
		patLITPUSH_LITPUSH^.matchedassembler:=pAAssemblesto2197_AA2197;
		new(patLITPUSH_LITPUSH^.params);
		for i:= 1 to maxparam do patLITPUSH_LITPUSH^.params^[i]:=nil;
		patLITPUSH_LITPUSH^.params^[0]:=patoffset_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier m  to the tree at this point*)
		new(patMEMPUSH_MEMPUSH);
		patMEMPUSH_MEMPUSH^.meaning:=pAValueMeaning2206_AVM2206;
		patMEMPUSH_MEMPUSH^.matchedassembler:=pAAssemblesto2220_AA2220;
		new(patMEMPUSH_MEMPUSH^.params);
		for i:= 1 to maxparam do patMEMPUSH_MEMPUSH^.params^[i]:=nil;
		patMEMPUSH_MEMPUSH^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ea  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref doubleword*)
		new(patDMEMPUSH_DMEMPUSH);
		patDMEMPUSH_DMEMPUSH^.meaning:=pAValueMeaning2229_AVM2229;
		patDMEMPUSH_DMEMPUSH^.matchedassembler:=pAAssemblesto2250_AA2250;
		new(patDMEMPUSH_DMEMPUSH^.params);
		for i:= 1 to maxparam do patDMEMPUSH_DMEMPUSH^.params^[i]:=nil;
		patDMEMPUSH_DMEMPUSH^.params^[0]:=pateaform_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref t*)
		new(patSTACKLOAD_STACKLOAD);
		patSTACKLOAD_STACKLOAD^.meaning:=pAValueMeaning2262_AVM2262;
		patSTACKLOAD_STACKLOAD^.matchedassembler:=pAAssemblesto2279_AA2279;
		new(patSTACKLOAD_STACKLOAD^.params);
		for i:= 1 to maxparam do patSTACKLOAD_STACKLOAD^.params^[i]:=nil;
		patSTACKLOAD_STACKLOAD^.params^[0]:=patword32_32;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier m  to the tree at this point*)
		new(patREFPUSH_REFPUSH);
		patREFPUSH_REFPUSH^.meaning:=pAValueMeaning2289_AVM2289;
		patREFPUSH_REFPUSH^.matchedassembler:=pAAssemblesto2304_AA2304;
		new(patREFPUSH_REFPUSH^.params);
		for i:= 1 to maxparam do patREFPUSH_REFPUSH^.params^[i]:=nil;
		patREFPUSH_REFPUSH^.params^[0]:=patmaddrmode_;
		patREFPUSH_REFPUSH^.params^[1]:=pattype_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSDEREF_SDEREF);
		patSDEREF_SDEREF^.meaning:=pAValueMeaning2313_AVM2313;
		patSDEREF_SDEREF^.matchedassembler:=pAAssemblesto2330_AA2330;
		new(patSDEREF_SDEREF^.params);
		for i:= 1 to maxparam do patSDEREF_SDEREF^.params^[i]:=nil;
		patSDEREF_SDEREF^.params^[0]:=patint_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD);
		patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD^.meaning:=pAValueMeaning2338_AVM2338;
		patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD^.matchedassembler:=pAAssemblesto2356_AA2356;
		new(patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD^.params);
		for i:= 1 to maxparam do patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD^.params^[i]:=nil;
		patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD^.params^[0]:=patint_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r3  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patSELECT_SELECT);
		patSELECT_SELECT^.meaning:=pAAssignMeaning2370_AAM2370;
		patSELECT_SELECT^.matchedassembler:=pAAssemblesto2414_AA2414;
		new(patSELECT_SELECT^.params);
		for i:= 1 to maxparam do patSELECT_SELECT^.params^[i]:=nil;
		patSELECT_SELECT^.params^[2]:=pataddrmode_;
		patSELECT_SELECT^.params^[1]:=patreg_;
		patSELECT_SELECT^.params^[0]:=patreg_;
		patSELECT_SELECT^.params^[3]:=patwordupto32_32;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patLOAD_LOAD);
		patLOAD_LOAD^.meaning:=pAAssignMeaning2444_AAM2444;
		patLOAD_LOAD^.matchedassembler:=pAAssemblesto2460_AA2460;
		new(patLOAD_LOAD^.params);
		for i:= 1 to maxparam do patLOAD_LOAD^.params^[i]:=nil;
		patLOAD_LOAD^.params^[1]:=patanyreg_;
		patLOAD_LOAD^.params^[2]:=patwordupto32_32;
		patLOAD_LOAD^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVZXB_MOVZXB);
		patMOVZXB_MOVZXB^.meaning:=pAAssignMeaning2475_AAM2475;
		patMOVZXB_MOVZXB^.matchedassembler:=pAAssemblesto2497_AA2497;
		new(patMOVZXB_MOVZXB^.params);
		for i:= 1 to maxparam do patMOVZXB_MOVZXB^.params^[i]:=nil;
		patMOVZXB_MOVZXB^.params^[0]:=patreg_;
		patMOVZXB_MOVZXB^.params^[1]:=patbaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVZXB2_MOVZXB2);
		patMOVZXB2_MOVZXB2^.meaning:=pAAssignMeaning2510_AAM2510;
		patMOVZXB2_MOVZXB2^.matchedassembler:=pAAssemblesto2532_AA2532;
		new(patMOVZXB2_MOVZXB2^.params);
		for i:= 1 to maxparam do patMOVZXB2_MOVZXB2^.params^[i]:=nil;
		patMOVZXB2_MOVZXB2^.params^[0]:=patreg_;
		patMOVZXB2_MOVZXB2^.params^[1]:=patbaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVSXB_MOVSXB);
		patMOVSXB_MOVSXB^.meaning:=pAAssignMeaning2545_AAM2545;
		patMOVSXB_MOVSXB^.matchedassembler:=pAAssemblesto2567_AA2567;
		new(patMOVSXB_MOVSXB^.params);
		for i:= 1 to maxparam do patMOVSXB_MOVSXB^.params^[i]:=nil;
		patMOVSXB_MOVSXB^.params^[0]:=patreg_;
		patMOVSXB_MOVSXB^.params^[1]:=patbaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVZXBW_MOVZXBW);
		patMOVZXBW_MOVZXBW^.meaning:=pAAssignMeaning2580_AAM2580;
		patMOVZXBW_MOVZXBW^.matchedassembler:=pAAssemblesto2590_AA2590;
		new(patMOVZXBW_MOVZXBW^.params);
		for i:= 1 to maxparam do patMOVZXBW_MOVZXBW^.params^[i]:=nil;
		patMOVZXBW_MOVZXBW^.params^[0]:=patuwreg_;
		patMOVZXBW_MOVZXBW^.params^[1]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVSXBW_MOVSXBW);
		patMOVSXBW_MOVSXBW^.meaning:=pAAssignMeaning2603_AAM2603;
		patMOVSXBW_MOVSXBW^.matchedassembler:=pAAssemblesto2613_AA2613;
		new(patMOVSXBW_MOVSXBW^.params);
		for i:= 1 to maxparam do patMOVSXBW_MOVSXBW^.params^[i]:=nil;
		patMOVSXBW_MOVSXBW^.params^[0]:=patswreg_;
		patMOVSXBW_MOVSXBW^.params^[1]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVZXW_MOVZXW);
		patMOVZXW_MOVZXW^.meaning:=pAAssignMeaning2626_AAM2626;
		patMOVZXW_MOVZXW^.matchedassembler:=pAAssemblesto2642_AA2642;
		new(patMOVZXW_MOVZXW^.params);
		for i:= 1 to maxparam do patMOVZXW_MOVZXW^.params^[i]:=nil;
		patMOVZXW_MOVZXW^.params^[0]:=patreg_;
		patMOVZXW_MOVZXW^.params^[1]:=patwreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVSXW_MOVSXW);
		patMOVSXW_MOVSXW^.meaning:=pAAssignMeaning2655_AAM2655;
		patMOVSXW_MOVSXW^.matchedassembler:=pAAssemblesto2671_AA2671;
		new(patMOVSXW_MOVSXW^.params);
		for i:= 1 to maxparam do patMOVSXW_MOVSXW^.params^[i]:=nil;
		patMOVSXW_MOVSXW^.params^[0]:=patreg_;
		patMOVSXW_MOVSXW^.params^[1]:=patwreg_;
		 
		(*! Matches identifier b  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patToBYTE_TBYTE);
		patToBYTE_TBYTE^.meaning:=pAAssignMeaning2684_AAM2684;
		patToBYTE_TBYTE^.matchedassembler:=pAAssemblesto2697_AA2697;
		new(patToBYTE_TBYTE^.params);
		for i:= 1 to maxparam do patToBYTE_TBYTE^.params^[i]:=nil;
		patToBYTE_TBYTE^.params^[1]:=patbreg_;
		patToBYTE_TBYTE^.params^[0]:=patreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref octet*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTOREBR_STOREBR);
		patSTOREBR_STOREBR^.meaning:=pAAssignMeaning2711_AAM2711;
		patSTOREBR_STOREBR^.matchedassembler:=pAAssemblesto2724_AA2724;
		new(patSTOREBR_STOREBR^.params);
		for i:= 1 to maxparam do patSTOREBR_STOREBR^.params^[i]:=nil;
		patSTOREBR_STOREBR^.params^[1]:=patbreg_;
		patSTOREBR_STOREBR^.params^[0]:=patbaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTORER_STORER);
		patSTORER_STORER^.meaning:=pAAssignMeaning2739_AAM2739;
		patSTORER_STORER^.matchedassembler:=pAAssemblesto2751_AA2751;
		new(patSTORER_STORER^.params);
		for i:= 1 to maxparam do patSTORER_STORER^.params^[i]:=nil;
		patSTORER_STORER^.params^[1]:=patreg_;
		patSTORER_STORER^.params^[2]:=patword32_32;
		patSTORER_STORER^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTOREWR_STOREWR);
		patSTOREWR_STOREWR^.meaning:=pAAssignMeaning2768_AAM2768;
		patSTOREWR_STOREWR^.matchedassembler:=pAAssemblesto2780_AA2780;
		new(patSTOREWR_STOREWR^.params);
		for i:= 1 to maxparam do patSTOREWR_STOREWR^.params^[i]:=nil;
		patSTOREWR_STOREWR^.params^[1]:=patwreg_;
		patSTOREWR_STOREWR^.params^[2]:=patword16_16;
		patSTOREWR_STOREWR^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier r3  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r3  to the tree at this point*)
		(*! try to cast to type: ref t*)
		new(patNULMOV_NULMOV);
		patNULMOV_NULMOV^.meaning:=pAAssignMeaning2795_AAM2795;
		patNULMOV_NULMOV^.matchedassembler:=pAAssemblesto2811_AA2811;
		new(patNULMOV_NULMOV^.params);
		for i:= 1 to maxparam do patNULMOV_NULMOV^.params^[i]:=nil;
		patNULMOV_NULMOV^.params^[0]:=patreg_;
		patNULMOV_NULMOV^.params^[1]:=pattype_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! matches a literal  to the tree at this point*)
		new(patSTORELIT_STORELIT);
		patSTORELIT_STORELIT^.meaning:=pAAssignMeaning2825_AAM2825;
		patSTORELIT_STORELIT^.matchedassembler:=pAAssemblesto2839_AA2839;
		new(patSTORELIT_STORELIT^.params);
		for i:= 1 to maxparam do patSTORELIT_STORELIT^.params^[i]:=nil;
		patSTORELIT_STORELIT^.params^[1]:=pattype_;
		patSTORELIT_STORELIT^.params^[2]:=patint_;
		patSTORELIT_STORELIT^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		new(patCLEARREG_CLEARREG);
		patCLEARREG_CLEARREG^.meaning:=pAAssignMeaning2857_AAM2857;
		patCLEARREG_CLEARREG^.matchedassembler:=pAAssemblesto2873_AA2873;
		new(patCLEARREG_CLEARREG^.params);
		for i:= 1 to maxparam do patCLEARREG_CLEARREG^.params^[i]:=nil;
		patCLEARREG_CLEARREG^.params^[1]:=pattype_;
		patCLEARREG_CLEARREG^.params^[2]:=patint_;
		patCLEARREG_CLEARREG^.params^[0]:=patreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic2899_AID2899*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier sm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patRMLIT_RMLIT);
		patRMLIT_RMLIT^.meaning:=pAAssignMeaning2890_AAM2890;
		patRMLIT_RMLIT^.matchedassembler:=pAAssemblesto2910_AA2910;
		new(patRMLIT_RMLIT^.params);
		for i:= 1 to maxparam do patRMLIT_RMLIT^.params^[i]:=nil;
		patRMLIT_RMLIT^.params^[2]:=pattype_;
		patRMLIT_RMLIT^.params^[1]:=pataddrmode_;
		patRMLIT_RMLIT^.params^[3]:=patoffset_;
		patRMLIT_RMLIT^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patINC_INC);
		patINC_INC^.meaning:=pAAssignMeaning2926_AAM2926;
		patINC_INC^.matchedassembler:=pAAssemblesto2944_AA2944;
		new(patINC_INC^.params);
		for i:= 1 to maxparam do patINC_INC^.params^[i]:=nil;
		patINC_INC^.params^[1]:=patint_;
		patINC_INC^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patDEC_DEC);
		patDEC_DEC^.meaning:=pAAssignMeaning2957_AAM2957;
		patDEC_DEC^.matchedassembler:=pAAssemblesto2979_AA2979;
		new(patDEC_DEC^.params);
		for i:= 1 to maxparam do patDEC_DEC^.params^[i]:=nil;
		patDEC_DEC^.params^[1]:=patint_;
		patDEC_DEC^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic3009_AID3009*)
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSHIFT_SHIFT);
		patSHIFT_SHIFT^.meaning:=pAAssignMeaning2996_AAM2996;
		patSHIFT_SHIFT^.matchedassembler:=pAAssemblesto3016_AA3016;
		new(patSHIFT_SHIFT^.params);
		for i:= 1 to maxparam do patSHIFT_SHIFT^.params^[i]:=nil;
		patSHIFT_SHIFT^.params^[3]:=pattype_;
		patSHIFT_SHIFT^.params^[1]:=patshiftcount_;
		patSHIFT_SHIFT^.params^[2]:=patanyreg_;
		patSHIFT_SHIFT^.params^[0]:=patshiftop_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic3044_AID3044*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patRMR_RMR);
		patRMR_RMR^.meaning:=pAAssignMeaning3035_AAM3035;
		patRMR_RMR^.matchedassembler:=pAAssemblesto3061_AA3061;
		new(patRMR_RMR^.params);
		for i:= 1 to maxparam do patRMR_RMR^.params^[i]:=nil;
		patRMR_RMR^.params^[2]:=patanyreg_;
		patRMR_RMR^.params^[3]:=patwordupto32_32;
		patRMR_RMR^.params^[1]:=pataddrmode_;
		patRMR_RMR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic3090_AID3090*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patRMRB_RMRB);
		patRMRB_RMRB^.meaning:=pAAssignMeaning3081_AAM3081;
		patRMRB_RMRB^.matchedassembler:=pAAssemblesto3107_AA3107;
		new(patRMRB_RMRB^.params);
		for i:= 1 to maxparam do patRMRB_RMRB^.params^[i]:=nil;
		patRMRB_RMRB^.params^[2]:=patbreg_;
		patRMRB_RMRB^.params^[3]:=patbyte_;
		patRMRB_RMRB^.params^[1]:=pataddrmode_;
		patRMRB_RMRB^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patADDUSB_ADDUSB);
		patADDUSB_ADDUSB^.meaning:=pAAssignMeaning3125_AAM3125;
		patADDUSB_ADDUSB^.matchedassembler:=pAAssemblesto3145_AA3145;
		new(patADDUSB_ADDUSB^.params);
		for i:= 1 to maxparam do patADDUSB_ADDUSB^.params^[i]:=nil;
		patADDUSB_ADDUSB^.params^[1]:=patbreg_;
		patADDUSB_ADDUSB^.params^[0]:=pataddrmode_;
		patADDUSB_ADDUSB^.params^[2]:=patbreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSUBUSB_SUBUSB);
		patSUBUSB_SUBUSB^.meaning:=pAAssignMeaning3161_AAM3161;
		patSUBUSB_SUBUSB^.matchedassembler:=pAAssemblesto3181_AA3181;
		new(patSUBUSB_SUBUSB^.params);
		for i:= 1 to maxparam do patSUBUSB_SUBUSB^.params^[i]:=nil;
		patSUBUSB_SUBUSB^.params^[0]:=patbreg_;
		patSUBUSB_SUBUSB^.params^[1]:=patbreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patADDSSB_ADDSSB);
		patADDSSB_ADDSSB^.meaning:=pAAssignMeaning3197_AAM3197;
		patADDSSB_ADDSSB^.matchedassembler:=pAAssemblesto3223_AA3223;
		new(patADDSSB_ADDSSB^.params);
		for i:= 1 to maxparam do patADDSSB_ADDSSB^.params^[i]:=nil;
		patADDSSB_ADDSSB^.params^[0]:=patbreg_;
		patADDSSB_ADDSSB^.params^[1]:=patbreg_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patMULTSSB_MULTSSB);
		patMULTSSB_MULTSSB^.meaning:=pAAssignMeaning3241_AAM3241;
		patMULTSSB_MULTSSB^.matchedassembler:=pAAssemblesto3255_AA3255;
		new(patMULTSSB_MULTSSB^.params);
		for i:= 1 to maxparam do patMULTSSB_MULTSSB^.params^[i]:=nil;
		patMULTSSB_MULTSSB^.params^[1]:=patbnonacc_;
		patMULTSSB_MULTSSB^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patMULTSSBAL_MULTSSBAL);
		patMULTSSBAL_MULTSSBAL^.meaning:=pAAssignMeaning3271_AAM3271;
		patMULTSSBAL_MULTSSBAL^.matchedassembler:=pAAssemblesto3285_AA3285;
		new(patMULTSSBAL_MULTSSBAL^.params);
		for i:= 1 to maxparam do patMULTSSBAL_MULTSSBAL^.params^[i]:=nil;
		patMULTSSBAL_MULTSSBAL^.params^[1]:=patbnonacc_;
		patMULTSSBAL_MULTSSBAL^.params^[0]:=patbacc_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSUBSSB_SUBSSB);
		patSUBSSB_SUBSSB^.meaning:=pAAssignMeaning3299_AAM3299;
		patSUBSSB_SUBSSB^.matchedassembler:=pAAssemblesto3325_AA3325;
		new(patSUBSSB_SUBSSB^.params);
		for i:= 1 to maxparam do patSUBSSB_SUBSSB^.params^[i]:=nil;
		patSUBSSB_SUBSSB^.params^[1]:=patbreg_;
		patSUBSSB_SUBSSB^.params^[0]:=pataddrmode_;
		patSUBSSB_SUBSSB^.params^[2]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref uint8*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patUINT8MAX_UINT8MAX);
		patUINT8MAX_UINT8MAX^.meaning:=pAAssignMeaning3343_AAM3343;
		patUINT8MAX_UINT8MAX^.matchedassembler:=pAAssemblesto3369_AA3369;
		new(patUINT8MAX_UINT8MAX^.params);
		for i:= 1 to maxparam do patUINT8MAX_UINT8MAX^.params^[i]:=nil;
		patUINT8MAX_UINT8MAX^.params^[1]:=patbreg_;
		patUINT8MAX_UINT8MAX^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref uint8*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patUINT8MIN_UINT8MIN);
		patUINT8MIN_UINT8MIN^.meaning:=pAAssignMeaning3386_AAM3386;
		patUINT8MIN_UINT8MIN^.matchedassembler:=pAAssemblesto3412_AA3412;
		new(patUINT8MIN_UINT8MIN^.params);
		for i:= 1 to maxparam do patUINT8MIN_UINT8MIN^.params^[i]:=nil;
		patUINT8MIN_UINT8MIN^.params^[1]:=patbreg_;
		patUINT8MIN_UINT8MIN^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int8*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patINT8MAX_INT8MAX);
		patINT8MAX_INT8MAX^.meaning:=pAAssignMeaning3429_AAM3429;
		patINT8MAX_INT8MAX^.matchedassembler:=pAAssemblesto3455_AA3455;
		new(patINT8MAX_INT8MAX^.params);
		for i:= 1 to maxparam do patINT8MAX_INT8MAX^.params^[i]:=nil;
		patINT8MAX_INT8MAX^.params^[1]:=patbreg_;
		patINT8MAX_INT8MAX^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int8*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patINT8MIN_INT8MIN);
		patINT8MIN_INT8MIN^.meaning:=pAAssignMeaning3472_AAM3472;
		patINT8MIN_INT8MIN^.matchedassembler:=pAAssemblesto3498_AA3498;
		new(patINT8MIN_INT8MIN^.params);
		for i:= 1 to maxparam do patINT8MIN_INT8MIN^.params^[i]:=nil;
		patINT8MIN_INT8MIN^.params^[1]:=patbreg_;
		patINT8MIN_INT8MIN^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier ea  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patLEA_LEA);
		patLEA_LEA^.meaning:=pAAssignMeaning3515_AAM3515;
		patLEA_LEA^.matchedassembler:=pAAssemblesto3521_AA3521;
		new(patLEA_LEA^.params);
		for i:= 1 to maxparam do patLEA_LEA^.params^[i]:=nil;
		patLEA_LEA^.params^[0]:=patreg_;
		patLEA_LEA^.params^[1]:=pateaform_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patNOTOP_NOTOP);
		patNOTOP_NOTOP^.meaning:=pAAssignMeaning3535_AAM3535;
		patNOTOP_NOTOP^.matchedassembler:=pAAssemblesto3553_AA3553;
		new(patNOTOP_NOTOP^.params);
		for i:= 1 to maxparam do patNOTOP_NOTOP^.params^[i]:=nil;
		patNOTOP_NOTOP^.params^[1]:=pattype_;
		patNOTOP_NOTOP^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patNegate_N);
		patNegate_N^.meaning:=pAAssignMeaning3566_AAM3566;
		patNegate_N^.matchedassembler:=pAAssemblesto3592_AA3592;
		new(patNegate_N^.params);
		for i:= 1 to maxparam do patNegate_N^.params^[i]:=nil;
		patNegate_N^.params^[0]:=patanyreg_;
		patNegate_N^.params^[1]:=pattype_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patMNegate_MN);
		patMNegate_MN^.meaning:=pAAssignMeaning3604_AAM3604;
		patMNegate_MN^.matchedassembler:=pAAssemblesto3630_AA3630;
		new(patMNegate_MN^.params);
		for i:= 1 to maxparam do patMNegate_MN^.params^[i]:=nil;
		patMNegate_MN^.params^[0]:=patanyreg_;
		patMNegate_MN^.params^[1]:=pattype_;
		 
		(*! Matches identifier r0  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic3651_AID3651*)
		(*! Matches identifier r0  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		new(patRLIT_RLIT);
		patRLIT_RLIT^.meaning:=pAAssignMeaning3646_AAM3646;
		patRLIT_RLIT^.matchedassembler:=pAAssemblesto3658_AA3658;
		new(patRLIT_RLIT^.params);
		for i:= 1 to maxparam do patRLIT_RLIT^.params^[i]:=nil;
		patRLIT_RLIT^.params^[1]:=patpushreg_;
		patRLIT_RLIT^.params^[2]:=pattype_;
		patRLIT_RLIT^.params^[3]:=patsigned_;
		patRLIT_RLIT^.params^[0]:=patoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic3685_AID3685*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! try to cast to type: ref t*)
		new(patRR_RR);
		patRR_RR^.meaning:=pAAssignMeaning3676_AAM3676;
		patRR_RR^.matchedassembler:=pAAssemblesto3710_AA3710;
		new(patRR_RR^.params);
		for i:= 1 to maxparam do patRR_RR^.params^[i]:=nil;
		patRR_RR^.params^[2]:=patanyreg_;
		patRR_RR^.params^[1]:=patanyreg_;
		patRR_RR^.params^[3]:=patint_;
		patRR_RR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic3737_AID3737*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! try to cast to type: ref t*)
		new(patiRR_RR);
		patiRR_RR^.meaning:=pAAssignMeaning3728_AAM3728;
		patiRR_RR^.matchedassembler:=pAAssemblesto3762_AA3762;
		new(patiRR_RR^.params);
		for i:= 1 to maxparam do patiRR_RR^.params^[i]:=nil;
		patiRR_RR^.params^[2]:=patreg_;
		patiRR_RR^.params^[1]:=patreg_;
		patiRR_RR^.params^[3]:=patint_;
		patiRR_RR^.params^[0]:=patoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic3789_AID3789*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patRRM_RRM);
		patRRM_RRM^.meaning:=pAAssignMeaning3780_AAM3780;
		patRRM_RRM^.matchedassembler:=pAAssemblesto3806_AA3806;
		new(patRRM_RRM^.params);
		for i:= 1 to maxparam do patRRM_RRM^.params^[i]:=nil;
		patRRM_RRM^.params^[1]:=patpushreg_;
		patRRM_RRM^.params^[3]:=patint_;
		patRRM_RRM^.params^[2]:=patmaddrmode_;
		patRRM_RRM^.params^[0]:=patoperator_;
		 
		alternatives[197]:=patDH_DH;
		alternatives[198]:=patDL_DL;
		alternatives[199]:=patBH_BH;
		alternatives[200]:=patBL_BL;
		alternatives[201]:=patCH_CH;
		alternatives[202]:=patCL_CL;
		lastalt:=202;
		new(patbnonacreg_);
		patbnonacreg_^.meaning:=pAAlternativesPatterndecl3817_AAP3817;
		patbnonacreg_^.matchedassembler:=nil;
		patbnonacreg_^.params :=nil;
		alternatives[203]:=patAL_AL;
		lastalt:=203;
		new(patbaccreg_);
		patbaccreg_^.meaning:=pAAlternativesPatterndecl3832_AAP3832;
		patbaccreg_^.matchedassembler:=nil;
		patbaccreg_^.params :=nil;
		alternatives[204]:=patmaddrmode_;
		alternatives[205]:=patbaccreg_;
		lastalt:=205;
		new(patbaccregmode_);
		patbaccregmode_^.meaning:=pAAlternativesPatterndecl3837_AAP3837;
		patbaccregmode_^.matchedassembler:=nil;
		patbaccregmode_^.params :=nil;
		alternatives[206]:=patmaddrmode_;
		alternatives[207]:=patbnonacreg_;
		lastalt:=207;
		new(patbnonacregmode_);
		patbnonacregmode_^.meaning:=pAAlternativesPatterndecl3844_AAP3844;
		patbnonacregmode_^.matchedassembler:=nil;
		patbnonacregmode_^.params :=nil;
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patfastBIDIV_BIDIV);
		patfastBIDIV_BIDIV^.meaning:=pAAssignMeaning3854_AAM3854;
		patfastBIDIV_BIDIV^.matchedassembler:=pAAssemblesto3880_AA3880;
		new(patfastBIDIV_BIDIV^.params);
		for i:= 1 to maxparam do patfastBIDIV_BIDIV^.params^[i]:=nil;
		patfastBIDIV_BIDIV^.params^[1]:=patbnonacregmode_;
		patfastBIDIV_BIDIV^.params^[0]:=patbaccreg_;
		 
		(*! Matches identifier r3  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patBIDIV_BIDIV);
		patBIDIV_BIDIV^.meaning:=pAAssignMeaning3895_AAM3895;
		patBIDIV_BIDIV^.matchedassembler:=pAAssemblesto3921_AA3921;
		new(patBIDIV_BIDIV^.params);
		for i:= 1 to maxparam do patBIDIV_BIDIV^.params^[i]:=nil;
		patBIDIV_BIDIV^.params^[2]:=patbaccregmode_;
		patBIDIV_BIDIV^.params^[1]:=patbnonacregmode_;
		patBIDIV_BIDIV^.params^[0]:=patbaccreg_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patBIMUL_BIMUL);
		patBIMUL_BIMUL^.meaning:=pAAssignMeaning3937_AAM3937;
		patBIMUL_BIMUL^.matchedassembler:=pAAssemblesto3963_AA3963;
		new(patBIMUL_BIMUL^.params);
		for i:= 1 to maxparam do patBIMUL_BIMUL^.params^[i]:=nil;
		patBIMUL_BIMUL^.params^[1]:=patbnonacreg_;
		patBIMUL_BIMUL^.params^[0]:=patbaccreg_;
		 
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier a  to the tree at this point*)
		(*! Matches identifier d  to the tree at this point*)
		new(patfastIMUL_IMUL);
		patfastIMUL_IMUL^.meaning:=pAAssignMeaning3977_AAM3977;
		patfastIMUL_IMUL^.matchedassembler:=pAAssemblesto4003_AA4003;
		new(patfastIMUL_IMUL^.params);
		for i:= 1 to maxparam do patfastIMUL_IMUL^.params^[i]:=nil;
		patfastIMUL_IMUL^.params^[0]:=patacc_;
		patfastIMUL_IMUL^.params^[1]:=patdacc_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patIDIV_IDIV);
		patIDIV_IDIV^.meaning:=pAValueMeaning4013_AVM4013;
		patIDIV_IDIV^.matchedassembler:=pAAssemblesto4034_AA4034;
		new(patIDIV_IDIV^.params);
		for i:= 1 to maxparam do patIDIV_IDIV^.params^[i]:=nil;
		patIDIV_IDIV^.params^[1]:=patmodreg_;
		patIDIV_IDIV^.params^[0]:=patacc_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patUDIV_UDIV);
		patUDIV_UDIV^.meaning:=pAValueMeaning4046_AVM4046;
		patUDIV_UDIV^.matchedassembler:=pAAssemblesto4067_AA4067;
		new(patUDIV_UDIV^.params);
		for i:= 1 to maxparam do patUDIV_UDIV^.params^[i]:=nil;
		patUDIV_UDIV^.params^[1]:=patmodreg_;
		patUDIV_UDIV^.params^[0]:=patacc_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		new(patIMULLIT_IMULLIT);
		patIMULLIT_IMULLIT^.meaning:=pAAssignMeaning4081_AAM4081;
		patIMULLIT_IMULLIT^.matchedassembler:=pAAssemblesto4099_AA4099;
		new(patIMULLIT_IMULLIT^.params);
		for i:= 1 to maxparam do patIMULLIT_IMULLIT^.params^[i]:=nil;
		patIMULLIT_IMULLIT^.params^[0]:=patpushreg_;
		patIMULLIT_IMULLIT^.params^[2]:=patsigned_;
		patIMULLIT_IMULLIT^.params^[1]:=pataddrmode_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patIMOD_IMOD);
		patIMOD_IMOD^.meaning:=pAValueMeaning4114_AVM4114;
		patIMOD_IMOD^.matchedassembler:=pAAssemblesto4135_AA4135;
		new(patIMOD_IMOD^.params);
		for i:= 1 to maxparam do patIMOD_IMOD^.params^[i]:=nil;
		patIMOD_IMOD^.params^[1]:=patmodreg_;
		patIMOD_IMOD^.params^[0]:=patacc_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patUMOD_UMOD);
		patUMOD_UMOD^.meaning:=pAValueMeaning4147_AVM4147;
		patUMOD_UMOD^.matchedassembler:=pAAssemblesto4168_AA4168;
		new(patUMOD_UMOD^.params);
		for i:= 1 to maxparam do patUMOD_UMOD^.params^[i]:=nil;
		patUMOD_UMOD^.params^[1]:=patmodreg_;
		patUMOD_UMOD^.params^[0]:=patacc_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patBIMOD_BIMOD);
		patBIMOD_BIMOD^.meaning:=pAAssignMeaning4180_AAM4180;
		patBIMOD_BIMOD^.matchedassembler:=pAAssemblesto4206_AA4206;
		new(patBIMOD_BIMOD^.params);
		for i:= 1 to maxparam do patBIMOD_BIMOD^.params^[i]:=nil;
		patBIMOD_BIMOD^.params^[1]:=patbnonacreg_;
		patBIMOD_BIMOD^.params^[0]:=patbaccreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patMOD2_MOD2);
		patMOD2_MOD2^.meaning:=pAAssignMeaning4220_AAM4220;
		patMOD2_MOD2^.matchedassembler:=pAAssemblesto4234_AA4234;
		new(patMOD2_MOD2^.params);
		for i:= 1 to maxparam do patMOD2_MOD2^.params^[i]:=nil;
		patMOD2_MOD2^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patMOD4_MOD4);
		patMOD4_MOD4^.meaning:=pAAssignMeaning4244_AAM4244;
		patMOD4_MOD4^.matchedassembler:=pAAssemblesto4258_AA4258;
		new(patMOD4_MOD4^.params);
		for i:= 1 to maxparam do patMOD4_MOD4^.params^[i]:=nil;
		patMOD4_MOD4^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patMOD8_MOD8);
		patMOD8_MOD8^.meaning:=pAAssignMeaning4268_AAM4268;
		patMOD8_MOD8^.matchedassembler:=pAAssemblesto4282_AA4282;
		new(patMOD8_MOD8^.params);
		for i:= 1 to maxparam do patMOD8_MOD8^.params^[i]:=nil;
		patMOD8_MOD8^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patDIV8_DIV8);
		patDIV8_DIV8^.meaning:=pAAssignMeaning4292_AAM4292;
		patDIV8_DIV8^.matchedassembler:=pAAssemblesto4312_AA4312;
		new(patDIV8_DIV8^.params);
		for i:= 1 to maxparam do patDIV8_DIV8^.params^[i]:=nil;
		patDIV8_DIV8^.params^[0]:=patureg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patMOD16_MOD16);
		patMOD16_MOD16^.meaning:=pAAssignMeaning4322_AAM4322;
		patMOD16_MOD16^.matchedassembler:=pAAssemblesto4336_AA4336;
		new(patMOD16_MOD16^.params);
		for i:= 1 to maxparam do patMOD16_MOD16^.params^[i]:=nil;
		patMOD16_MOD16^.params^[0]:=patreg_;
		 
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANT_PLANT);
		patPLANT_PLANT^.meaning:=pAValueMeaning4346_AVM4346;
		patPLANT_PLANT^.matchedassembler:=pAAssemblesto4349_AA4349;
		new(patPLANT_PLANT^.params);
		for i:= 1 to maxparam do patPLANT_PLANT^.params^[i]:=nil;
		patPLANT_PLANT^.params^[0]:=patlabel_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTRCONST_PLANTRCONST);
		patPLANTRCONST_PLANTRCONST^.meaning:=pALocMeaning4360_ALM4360;
		patPLANTRCONST_PLANTRCONST^.matchedassembler:=pAAssemblesto4367_AA4367;
		new(patPLANTRCONST_PLANTRCONST^.params);
		for i:= 1 to maxparam do patPLANTRCONST_PLANTRCONST^.params^[i]:=nil;
		patPLANTRCONST_PLANTRCONST^.params^[1]:=pattype_;
		patPLANTRCONST_PLANTRCONST^.params^[0]:=patdouble_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTICONST_PLANTICONST);
		patPLANTICONST_PLANTICONST^.meaning:=pALocMeaning4378_ALM4378;
		patPLANTICONST_PLANTICONST^.matchedassembler:=pAAssemblesto4385_AA4385;
		new(patPLANTICONST_PLANTICONST^.params);
		for i:= 1 to maxparam do patPLANTICONST_PLANTICONST^.params^[i]:=nil;
		patPLANTICONST_PLANTICONST^.params^[1]:=pattype_;
		patPLANTICONST_PLANTICONST^.params^[0]:=patlongint_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTSCONST_PLANTSCONST);
		patPLANTSCONST_PLANTSCONST^.meaning:=pALocMeaning4396_ALM4396;
		patPLANTSCONST_PLANTSCONST^.matchedassembler:=pAAssemblesto4403_AA4403;
		new(patPLANTSCONST_PLANTSCONST^.params);
		for i:= 1 to maxparam do patPLANTSCONST_PLANTSCONST^.params^[i]:=nil;
		patPLANTSCONST_PLANTSCONST^.params^[1]:=pattype_;
		patPLANTSCONST_PLANTSCONST^.params^[0]:=patfloat_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTBCONST_PLANTBCONST);
		patPLANTBCONST_PLANTBCONST^.meaning:=pALocMeaning4414_ALM4414;
		patPLANTBCONST_PLANTBCONST^.matchedassembler:=pAAssemblesto4421_AA4421;
		new(patPLANTBCONST_PLANTBCONST^.params);
		for i:= 1 to maxparam do patPLANTBCONST_PLANTBCONST^.params^[i]:=nil;
		patPLANTBCONST_PLANTBCONST^.params^[1]:=pattype_;
		patPLANTBCONST_PLANTBCONST^.params^[0]:=patbyte_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTWCONST_PLANTWCONST);
		patPLANTWCONST_PLANTWCONST^.meaning:=pALocMeaning4432_ALM4432;
		patPLANTWCONST_PLANTWCONST^.matchedassembler:=pAAssemblesto4439_AA4439;
		new(patPLANTWCONST_PLANTWCONST^.params);
		for i:= 1 to maxparam do patPLANTWCONST_PLANTWCONST^.params^[i]:=nil;
		patPLANTWCONST_PLANTWCONST^.params^[1]:=pattype_;
		patPLANTWCONST_PLANTWCONST^.params^[0]:=patword16_16;
		 
		(*! Matches identifier i  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFAIL_FAIL);
		patFAIL_FAIL^.meaning:=pAFailMeaning4448_AFM4448;
		patFAIL_FAIL^.matchedassembler:=pAAssemblesto4451_AA4451;
		new(patFAIL_FAIL^.params);
		for i:= 1 to maxparam do patFAIL_FAIL^.params^[i]:=nil;
		patFAIL_FAIL^.params^[0]:=patint_;
		 
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patGOTO_GOTO);
		patGOTO_GOTO^.meaning:=pAGotoMeaning4460_AGM4460;
		patGOTO_GOTO^.matchedassembler:=pAAssemblesto4463_AA4463;
		new(patGOTO_GOTO^.params);
		for i:= 1 to maxparam do patGOTO_GOTO^.params^[i]:=nil;
		patGOTO_GOTO^.params^[0]:=patjumpmode_;
		 
(* defds ->public boolean pAIdentifierDyadic4488_AID4488*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFLITGOTO_IFLITGOTO);
		patIFLITGOTO_IFLITGOTO^.meaning:=pAIfMeaning4482_AIM4482;
		patIFLITGOTO_IFLITGOTO^.matchedassembler:=pAAssemblesto4502_AA4502;
		new(patIFLITGOTO_IFLITGOTO^.params);
		for i:= 1 to maxparam do patIFLITGOTO_IFLITGOTO^.params^[i]:=nil;
		patIFLITGOTO_IFLITGOTO^.params^[5]:=patint_;
		patIFLITGOTO_IFLITGOTO^.params^[2]:=patsigned_;
		patIFLITGOTO_IFLITGOTO^.params^[0]:=patlabel_;
		patIFLITGOTO_IFLITGOTO^.params^[1]:=pataddrmode_;
		patIFLITGOTO_IFLITGOTO^.params^[4]:=patsigned_;
		patIFLITGOTO_IFLITGOTO^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic4529_AID4529*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patBIFLITGOTO_BIFLITGOTO);
		patBIFLITGOTO_BIFLITGOTO^.meaning:=pAIfMeaning4527_AIM4527;
		patBIFLITGOTO_BIFLITGOTO^.matchedassembler:=pAAssemblesto4543_AA4543;
		new(patBIFLITGOTO_BIFLITGOTO^.params);
		for i:= 1 to maxparam do patBIFLITGOTO_BIFLITGOTO^.params^[i]:=nil;
		patBIFLITGOTO_BIFLITGOTO^.params^[0]:=patlabel_;
		patBIFLITGOTO_BIFLITGOTO^.params^[2]:=patsigned_;
		patBIFLITGOTO_BIFLITGOTO^.params^[1]:=patbaddrmode_;
		patBIFLITGOTO_BIFLITGOTO^.params^[4]:=patsigned_;
		patBIFLITGOTO_BIFLITGOTO^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic4579_AID4579*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFGOTOB_IFGOTOB);
		patIFGOTOB_IFGOTOB^.meaning:=pAIfMeaning4571_AIM4571;
		patIFGOTOB_IFGOTOB^.matchedassembler:=pAAssemblesto4595_AA4595;
		new(patIFGOTOB_IFGOTOB^.params);
		for i:= 1 to maxparam do patIFGOTOB_IFGOTOB^.params^[i]:=nil;
		patIFGOTOB_IFGOTOB^.params^[5]:=patint_;
		patIFGOTOB_IFGOTOB^.params^[2]:=patregaddrimmediate_;
		patIFGOTOB_IFGOTOB^.params^[0]:=patlabel_;
		patIFGOTOB_IFGOTOB^.params^[1]:=patbireg_;
		patIFGOTOB_IFGOTOB^.params^[4]:=patsigned_;
		patIFGOTOB_IFGOTOB^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic4629_AID4629*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFGOTOW_IFGOTOW);
		patIFGOTOW_IFGOTOW^.meaning:=pAIfMeaning4621_AIM4621;
		patIFGOTOW_IFGOTOW^.matchedassembler:=pAAssemblesto4645_AA4645;
		new(patIFGOTOW_IFGOTOW^.params);
		for i:= 1 to maxparam do patIFGOTOW_IFGOTOW^.params^[i]:=nil;
		patIFGOTOW_IFGOTOW^.params^[5]:=patint_;
		patIFGOTOW_IFGOTOW^.params^[2]:=patregaddrimmediate_;
		patIFGOTOW_IFGOTOW^.params^[0]:=patlabel_;
		patIFGOTOW_IFGOTOW^.params^[1]:=patwreg_;
		patIFGOTOW_IFGOTOW^.params^[4]:=patsigned_;
		patIFGOTOW_IFGOTOW^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic4679_AID4679*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFGOTO_IFGOTO);
		patIFGOTO_IFGOTO^.meaning:=pAIfMeaning4671_AIM4671;
		patIFGOTO_IFGOTO^.matchedassembler:=pAAssemblesto4695_AA4695;
		new(patIFGOTO_IFGOTO^.params);
		for i:= 1 to maxparam do patIFGOTO_IFGOTO^.params^[i]:=nil;
		patIFGOTO_IFGOTO^.params^[5]:=patint_;
		patIFGOTO_IFGOTO^.params^[2]:=patregaddrimmediate_;
		patIFGOTO_IFGOTO^.params^[0]:=patlabel_;
		patIFGOTO_IFGOTO^.params^[1]:=patireg_;
		patIFGOTO_IFGOTO^.params^[4]:=patsigned_;
		patIFGOTO_IFGOTO^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic4729_AID4729*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r3  to the tree at this point*)
		new(patIFASSp6_IFASS6);
		patIFASSp6_IFASS6^.meaning:=pAIfMeaning4723_AIM4723;
		patIFASSp6_IFASS6^.matchedassembler:=pAAssemblesto4760_AA4760;
		new(patIFASSp6_IFASS6^.params);
		for i:= 1 to maxparam do patIFASSp6_IFASS6^.params^[i]:=nil;
		patIFASSp6_IFASS6^.params^[4]:=patmaddrmode_;
		patIFASSp6_IFASS6^.params^[1]:=patregaddrimmediate_;
		patIFASSp6_IFASS6^.params^[0]:=patsignedreg_;
		patIFASSp6_IFASS6^.params^[6]:=pattype_;
		patIFASSp6_IFASS6^.params^[3]:=pattype_;
		patIFASSp6_IFASS6^.params^[5]:=patmaddrmode_;
		patIFASSp6_IFASS6^.params^[2]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic4805_AID4805*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patIFASS_IFASS);
		patIFASS_IFASS^.meaning:=pAIfMeaning4799_AIM4799;
		patIFASS_IFASS^.matchedassembler:=pAAssemblesto4836_AA4836;
		new(patIFASS_IFASS^.params);
		for i:= 1 to maxparam do patIFASS_IFASS^.params^[i]:=nil;
		patIFASS_IFASS^.params^[1]:=patacc_;
		patIFASS_IFASS^.params^[0]:=patsignedreg_;
		patIFASS_IFASS^.params^[3]:=pattype_;
		patIFASS_IFASS^.params^[5]:=pattype_;
		patIFASS_IFASS^.params^[2]:=patmaddrmode_;
		patIFASS_IFASS^.params^[4]:=patequals_;
		 
(* defds ->public boolean pAIdentifierDyadic4881_AID4881*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic4901_AID4901*)
		(*! Matches identifier r3  to the tree at this point*)
		(*! Matches identifier r4  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patANDIFGOTO_ANDIFGOTO);
		patANDIFGOTO_ANDIFGOTO^.meaning:=pAIfMeaning4869_AIM4869;
		patANDIFGOTO_ANDIFGOTO^.matchedassembler:=pAAssemblesto4919_AA4919;
		new(patANDIFGOTO_ANDIFGOTO^.params);
		for i:= 1 to maxparam do patANDIFGOTO_ANDIFGOTO^.params^[i]:=nil;
		patANDIFGOTO_ANDIFGOTO^.params^[7]:=patregaddrimmediate_;
		patANDIFGOTO_ANDIFGOTO^.params^[6]:=patanyreg_;
		patANDIFGOTO_ANDIFGOTO^.params^[2]:=patregaddrimmediate_;
		patANDIFGOTO_ANDIFGOTO^.params^[1]:=patanyreg_;
		patANDIFGOTO_ANDIFGOTO^.params^[0]:=patlabel_;
		patANDIFGOTO_ANDIFGOTO^.params^[8]:=patcondition_;
		patANDIFGOTO_ANDIFGOTO^.params^[9]:=patint_;
		patANDIFGOTO_ANDIFGOTO^.params^[3]:=patcondition_;
		patANDIFGOTO_ANDIFGOTO^.params^[10]:=patint_;
		patANDIFGOTO_ANDIFGOTO^.params^[4]:=patint_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic4955_AID4955*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSET_SET);
		patSET_SET^.meaning:=pAAssignMeaning4950_AAM4950;
		patSET_SET^.matchedassembler:=pAAssemblesto4970_AA4970;
		new(patSET_SET^.params);
		for i:= 1 to maxparam do patSET_SET^.params^[i]:=nil;
		patSET_SET^.params^[1]:=patsignedreg_;
		patSET_SET^.params^[4]:=patsigned_;
		patSET_SET^.params^[3]:=patbreg_;
		patSET_SET^.params^[2]:=patregaddrimmediate_;
		patSET_SET^.params^[0]:=patcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic5003_AID5003*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSETU_SETU);
		patSETU_SETU^.meaning:=pAAssignMeaning4998_AAM4998;
		patSETU_SETU^.matchedassembler:=pAAssemblesto5018_AA5018;
		new(patSETU_SETU^.params);
		for i:= 1 to maxparam do patSETU_SETU^.params^[i]:=nil;
		patSETU_SETU^.params^[1]:=patureg_;
		patSETU_SETU^.params^[4]:=patunsigned_;
		patSETU_SETU^.params^[3]:=patbreg_;
		patSETU_SETU^.params^[2]:=patregaddrimmediate_;
		patSETU_SETU^.params^[0]:=patunsignedcondition_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFBOOL_IFBOOL);
		patIFBOOL_IFBOOL^.meaning:=pAIfMeaning5040_AIM5040;
		patIFBOOL_IFBOOL^.matchedassembler:=pAAssemblesto5054_AA5054;
		new(patIFBOOL_IFBOOL^.params);
		for i:= 1 to maxparam do patIFBOOL_IFBOOL^.params^[i]:=nil;
		patIFBOOL_IFBOOL^.params^[0]:=patlabel_;
		patIFBOOL_IFBOOL^.params^[1]:=patbreg_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		new(patBOUND0_BOUND0);
		patBOUND0_BOUND0^.meaning:=pAIfMeaning5069_AIM5069;
		patBOUND0_BOUND0^.matchedassembler:=pAAssemblesto5123_AA5123;
		new(patBOUND0_BOUND0^.params);
		for i:= 1 to maxparam do patBOUND0_BOUND0^.params^[i]:=nil;
		patBOUND0_BOUND0^.params^[1]:=patreg_;
		patBOUND0_BOUND0^.params^[0]:=patreg_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		new(patBOUND4_BOUND4);
		patBOUND4_BOUND4^.meaning:=pAIfMeaning5137_AIM5137;
		patBOUND4_BOUND4^.matchedassembler:=pAAssemblesto5197_AA5197;
		new(patBOUND4_BOUND4^.params);
		for i:= 1 to maxparam do patBOUND4_BOUND4^.params^[i]:=nil;
		patBOUND4_BOUND4^.params^[1]:=patreg_;
		patBOUND4_BOUND4^.params^[0]:=patreg_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		new(patBOUND16_BOUND16);
		patBOUND16_BOUND16^.meaning:=pAIfMeaning5211_AIM5211;
		patBOUND16_BOUND16^.matchedassembler:=pAAssemblesto5271_AA5271;
		new(patBOUND16_BOUND16^.params);
		for i:= 1 to maxparam do patBOUND16_BOUND16^.params^[i]:=nil;
		patBOUND16_BOUND16^.params^[1]:=patreg_;
		patBOUND16_BOUND16^.params^[0]:=patreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFIN_IFIN);
		patIFIN_IFIN^.meaning:=pAIfMeaning5287_AIM5287;
		patIFIN_IFIN^.matchedassembler:=pAAssemblesto5327_AA5327;
		new(patIFIN_IFIN^.params);
		for i:= 1 to maxparam do patIFIN_IFIN^.params^[i]:=nil;
		patIFIN_IFIN^.params^[2]:=patlabel_;
		patIFIN_IFIN^.params^[1]:=patreg_;
		patIFIN_IFIN^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r2  to the tree at this point*)
		new(patTESTIN_TESTIN);
		patTESTIN_TESTIN^.meaning:=pAAssignMeaning5344_AAM5344;
		patTESTIN_TESTIN^.matchedassembler:=pAAssemblesto5378_AA5378;
		new(patTESTIN_TESTIN^.params);
		for i:= 1 to maxparam do patTESTIN_TESTIN^.params^[i]:=nil;
		patTESTIN_TESTIN^.params^[1]:=patreg_;
		patTESTIN_TESTIN^.params^[0]:=patreg_;
		patTESTIN_TESTIN^.params^[2]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref uint8*)
		(*! Matches identifier r1  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r2  to the tree at this point*)
		new(patBTS_BTS);
		patBTS_BTS^.meaning:=pAAssignMeaning5397_AAM5397;
		patBTS_BTS^.matchedassembler:=pAAssemblesto5439_AA5439;
		new(patBTS_BTS^.params);
		for i:= 1 to maxparam do patBTS_BTS^.params^[i]:=nil;
		patBTS_BTS^.params^[1]:=patreg_;
		patBTS_BTS^.params^[0]:=patreg_;
		 
		(*! Matches identifier m1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier s  to the tree at this point*)
		(*! Matches identifier di  to the tree at this point*)
		(*! Matches identifier m1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier si  to the tree at this point*)
		(*! Matches identifier m1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! try to cast to type: ref int32*)
		new(patREPMOVSD_REPMOVSD);
		patREPMOVSD_REPMOVSD^.meaning:=pAForMeaning5456_AFM5456;
		patREPMOVSD_REPMOVSD^.matchedassembler:=pAAssemblesto5541_AA5541;
		new(patREPMOVSD_REPMOVSD^.params);
		for i:= 1 to maxparam do patREPMOVSD_REPMOVSD^.params^[i]:=nil;
		patREPMOVSD_REPMOVSD^.params^[2]:=patsourcereg_;
		patREPMOVSD_REPMOVSD^.params^[1]:=patmaddrmode_;
		patREPMOVSD_REPMOVSD^.params^[0]:=patcountreg_;
		patREPMOVSD_REPMOVSD^.params^[3]:=patdestreg_;
		 
		(*! Matches identifier m1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier s  to the tree at this point*)
		(*! Matches identifier di  to the tree at this point*)
		(*! Matches identifier m1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! try to cast to type: ref octet*)
		(*! Matches identifier si  to the tree at this point*)
		(*! Matches identifier m1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! try to cast to type: ref octet*)
		new(patREPMOVSB_REPMOVSB);
		patREPMOVSB_REPMOVSB^.meaning:=pAForMeaning5555_AFM5555;
		patREPMOVSB_REPMOVSB^.matchedassembler:=pAAssemblesto5626_AA5626;
		new(patREPMOVSB_REPMOVSB^.params);
		for i:= 1 to maxparam do patREPMOVSB_REPMOVSB^.params^[i]:=nil;
		patREPMOVSB_REPMOVSB^.params^[2]:=patsourcereg_;
		patREPMOVSB_REPMOVSB^.params^[1]:=patmaddrmode_;
		patREPMOVSB_REPMOVSB^.params^[0]:=patcountreg_;
		patREPMOVSB_REPMOVSB^.params^[3]:=patdestreg_;
		 
			new(patST_ST);
		new(	patST_ST^.meaning);
		new(	patST_ST^.matchedassembler);
			patST_ST^.meaning^.tag:=reg;
			patST_ST^.params:=nil;
			patST_ST^.matchedassembler:=string2printlist('ST');
			regST_ST.format:=(0+fref+freal+3);
			patST_ST^.meaning^.tag:=regstack;
			regST_ST.printsas:='ST';
			regST_ST.depth:= ( 8 ) ;
			patST_ST^.meaning^.stackdetails:=regST_ST;
		alternatives[208]:=patieee32_32;
		alternatives[209]:=patieee64_64;
		lastalt:=209;
		new(patanyreal_);
		patanyreal_^.meaning:=pAAlternativesPatterndecl5643_AAP5643;
		patanyreal_^.matchedassembler:=nil;
		patanyreal_^.params :=nil;
		new(patfdiv_);
		new(patfdiv_^.meaning);
		patfdiv_^.meaning^.tag:=dyadicop;
		patfdiv_^.meaning^.opname:='div';
		patfdiv_^.matchedassembler:=string2printlist('div' );
		new(patfrem_);
		new(patfrem_^.meaning);
		patfrem_^.meaning^.tag:=dyadicop;
		patfrem_^.meaning^.opname:='MOD';
		patfrem_^.matchedassembler:=string2printlist('prem' );
		alternatives[210]:=patadd_;
		alternatives[211]:=patsub_;
		alternatives[212]:=patmul_;
		alternatives[213]:=patfdiv_;
		lastalt:=213;
		new(patfoperator_);
		patfoperator_^.meaning:=pAAlternativesPatterndecl5660_AAP5660;
		patfoperator_^.matchedassembler:=nil;
		patfoperator_^.params :=nil;
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfround_);
		patfround_^.meaning:=pAValueMeaning5673_AVM5673;
		patfround_^.matchedassembler:=pAAssemblesto5684_AA5684;
		new(patfround_^.params);
		for i:= 1 to maxparam do patfround_^.params^[i]:=nil;
		patfround_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfsqrt_);
		patfsqrt_^.meaning:=pAValueMeaning5693_AVM5693;
		patfsqrt_^.matchedassembler:=pAAssemblesto5708_AA5708;
		new(patfsqrt_^.params);
		for i:= 1 to maxparam do patfsqrt_^.params^[i]:=nil;
		patfsqrt_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfsin_);
		patfsin_^.meaning:=pAValueMeaning5717_AVM5717;
		patfsin_^.matchedassembler:=pAAssemblesto5732_AA5732;
		new(patfsin_^.params);
		for i:= 1 to maxparam do patfsin_^.params^[i]:=nil;
		patfsin_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfcos_);
		patfcos_^.meaning:=pAValueMeaning5741_AVM5741;
		patfcos_^.matchedassembler:=pAAssemblesto5756_AA5756;
		new(patfcos_^.params);
		for i:= 1 to maxparam do patfcos_^.params^[i]:=nil;
		patfcos_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfln_);
		patfln_^.meaning:=pAValueMeaning5765_AVM5765;
		patfln_^.matchedassembler:=pAAssemblesto5780_AA5780;
		new(patfln_^.params);
		for i:= 1 to maxparam do patfln_^.params^[i]:=nil;
		patfln_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfptan_);
		patfptan_^.meaning:=pAValueMeaning5789_AVM5789;
		patfptan_^.matchedassembler:=pAAssemblesto5804_AA5804;
		new(patfptan_^.params);
		for i:= 1 to maxparam do patfptan_^.params^[i]:=nil;
		patfptan_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfabs_);
		patfabs_^.meaning:=pAValueMeaning5813_AVM5813;
		patfabs_^.matchedassembler:=pAAssemblesto5828_AA5828;
		new(patfabs_^.params);
		for i:= 1 to maxparam do patfabs_^.params^[i]:=nil;
		patfabs_^.params^[0]:=pattype_;
		 
		alternatives[214]:=patfround_;
		alternatives[215]:=patfsqrt_;
		alternatives[216]:=patfsin_;
		alternatives[217]:=patfcos_;
		alternatives[218]:=patfptan_;
		alternatives[219]:=patfln_;
		alternatives[220]:=patfabs_;
		lastalt:=220;
		new(patfmoperator_);
		patfmoperator_^.meaning:=pAAlternativesPatterndecl5835_AAP5835;
		patfmoperator_^.matchedassembler:=nil;
		patfmoperator_^.params :=nil;
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier b2  to the tree at this point*)
		new(patRDIVB_RDIVB);
		patRDIVB_RDIVB^.meaning:=pAAssignMeaning5855_AAM5855;
		patRDIVB_RDIVB^.matchedassembler:=pAAssemblesto5869_AA5869;
		new(patRDIVB_RDIVB^.params);
		for i:= 1 to maxparam do patRDIVB_RDIVB^.params^[i]:=nil;
		patRDIVB_RDIVB^.params^[1]:=patbaddrmode_;
		patRDIVB_RDIVB^.params^[0]:=patbreg_;
		 
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier b2  to the tree at this point*)
		new(patRMULTB_RMULTB);
		patRMULTB_RMULTB^.meaning:=pAAssignMeaning5882_AAM5882;
		patRMULTB_RMULTB^.matchedassembler:=pAAssemblesto5896_AA5896;
		new(patRMULTB_RMULTB^.params);
		for i:= 1 to maxparam do patRMULTB_RMULTB^.params^[i]:=nil;
		patRMULTB_RMULTB^.params^[1]:=patbaddrmode_;
		patRMULTB_RMULTB^.params^[0]:=patbreg_;
		 
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFISTB_FISTB);
		patFISTB_FISTB^.meaning:=pAAssignMeaning5907_AAM5907;
		patFISTB_FISTB^.matchedassembler:=pAAssemblesto5915_AA5915;
		new(patFISTB_FISTB^.params);
		for i:= 1 to maxparam do patFISTB_FISTB^.params^[i]:=nil;
		patFISTB_FISTB^.params^[0]:=patbreg_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier b2  to the tree at this point*)
		new(patFILDB_FILDB);
		patFILDB_FILDB^.meaning:=pAValueMeaning5924_AVM5924;
		patFILDB_FILDB^.matchedassembler:=pAAssemblesto5939_AA5939;
		new(patFILDB_FILDB^.params);
		for i:= 1 to maxparam do patFILDB_FILDB^.params^[i]:=nil;
		patFILDB_FILDB^.params^[0]:=patbaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patFILDR_FILDR);
		patFILDR_FILDR^.meaning:=pAValueMeaning5948_AVM5948;
		patFILDR_FILDR^.matchedassembler:=pAAssemblesto5963_AA5963;
		new(patFILDR_FILDR^.params);
		for i:= 1 to maxparam do patFILDR_FILDR^.params^[i]:=nil;
		patFILDR_FILDR^.params^[0]:=patreg_;
		 
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFSTR_FSTR);
		patFSTR_FSTR^.meaning:=pAAssignMeaning5973_AAM5973;
		patFSTR_FSTR^.matchedassembler:=pAAssemblesto5986_AA5986;
		new(patFSTR_FSTR^.params);
		for i:= 1 to maxparam do patFSTR_FSTR^.params^[i]:=nil;
		patFSTR_FSTR^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFSTRF_FSTRF);
		patFSTRF_FSTRF^.meaning:=pAAssignMeaning5995_AAM5995;
		patFSTRF_FSTRF^.matchedassembler:=pAAssemblesto6008_AA6008;
		new(patFSTRF_FSTRF^.params);
		for i:= 1 to maxparam do patFSTRF_FSTRF^.params^[i]:=nil;
		patFSTRF_FSTRF^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFLOATMS_FLOATMS);
		patFLOATMS_FLOATMS^.meaning:=pAValueMeaning6017_AVM6017;
		patFLOATMS_FLOATMS^.matchedassembler:=pAAssemblesto6032_AA6032;
		new(patFLOATMS_FLOATMS^.params);
		for i:= 1 to maxparam do patFLOATMS_FLOATMS^.params^[i]:=nil;
		patFLOATMS_FLOATMS^.params^[0]:=patanyreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patEXTENDMS_EXTENDMS);
		patEXTENDMS_EXTENDMS^.meaning:=pAValueMeaning6040_AVM6040;
		patEXTENDMS_EXTENDMS^.matchedassembler:=pAAssemblesto6063_AA6063;
		new(patEXTENDMS_EXTENDMS^.params);
		for i:= 1 to maxparam do patEXTENDMS_EXTENDMS^.params^[i]:=nil;
		patEXTENDMS_EXTENDMS^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPOPMS_FPOPMS);
		patFPOPMS_FPOPMS^.meaning:=pAValueMeaning6071_AVM6071;
		patFPOPMS_FPOPMS^.matchedassembler:=pAAssemblesto6085_AA6085;
		new(patFPOPMS_FPOPMS^.params);
		for i:= 1 to maxparam do patFPOPMS_FPOPMS^.params^[i]:=nil;
		patFPOPMS_FPOPMS^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPOPMSI64_FPOPMSI64);
		patFPOPMSI64_FPOPMSI64^.meaning:=pAValueMeaning6093_AVM6093;
		patFPOPMSI64_FPOPMSI64^.matchedassembler:=pAAssemblesto6108_AA6108;
		new(patFPOPMSI64_FPOPMSI64^.params);
		for i:= 1 to maxparam do patFPOPMSI64_FPOPMSI64^.params^[i]:=nil;
		patFPOPMSI64_FPOPMSI64^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patDPOPMS_DPOPMS);
		patDPOPMS_DPOPMS^.meaning:=pAValueMeaning6116_AVM6116;
		patDPOPMS_DPOPMS^.matchedassembler:=pAAssemblesto6130_AA6130;
		new(patDPOPMS_DPOPMS^.params);
		for i:= 1 to maxparam do patDPOPMS_DPOPMS^.params^[i]:=nil;
		patDPOPMS_DPOPMS^.params^[0]:=pattype_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPUSHD_FPUSHD);
		patFPUSHD_FPUSHD^.meaning:=pAValueMeaning6138_AVM6138;
		patFPUSHD_FPUSHD^.matchedassembler:=pAAssemblesto6152_AA6152;
		new(patFPUSHD_FPUSHD^.params);
		for i:= 1 to maxparam do patFPUSHD_FPUSHD^.params^[i]:=nil;
		patFPUSHD_FPUSHD^.params^[0]:=pattype_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPUSHF_FPUSHF);
		patFPUSHF_FPUSHF^.meaning:=pAValueMeaning6160_AVM6160;
		patFPUSHF_FPUSHF^.matchedassembler:=pAAssemblesto6174_AA6174;
		new(patFPUSHF_FPUSHF^.params);
		for i:= 1 to maxparam do patFPUSHF_FPUSHF^.params^[i]:=nil;
		patFPUSHF_FPUSHF^.params^[0]:=pattype_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref i*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFISTR_FISTR);
		patFISTR_FISTR^.meaning:=pAAssignMeaning6184_AAM6184;
		patFISTR_FISTR^.matchedassembler:=pAAssemblesto6200_AA6200;
		new(patFISTR_FISTR^.params);
		for i:= 1 to maxparam do patFISTR_FISTR^.params^[i]:=nil;
		patFISTR_FISTR^.params^[0]:=patwmemdummy_;
		patFISTR_FISTR^.params^[1]:=pathiint_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPUSHI_FPUSHI);
		patFPUSHI_FPUSHI^.meaning:=pAValueMeaning6211_AVM6211;
		patFPUSHI_FPUSHI^.matchedassembler:=pAAssemblesto6226_AA6226;
		new(patFPUSHI_FPUSHI^.params);
		for i:= 1 to maxparam do patFPUSHI_FPUSHI^.params^[i]:=nil;
		patFPUSHI_FPUSHI^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		new(patFLD_FLD);
		patFLD_FLD^.meaning:=pAValueMeaning6234_AVM6234;
		patFLD_FLD^.matchedassembler:=pAAssemblesto6248_AA6248;
		new(patFLD_FLD^.params);
		for i:= 1 to maxparam do patFLD_FLD^.params^[i]:=nil;
		patFLD_FLD^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		new(patFLDF_FLDF);
		patFLDF_FLDF^.meaning:=pAValueMeaning6257_AVM6257;
		patFLDF_FLDF^.matchedassembler:=pAAssemblesto6271_AA6271;
		new(patFLDF_FLDF^.params);
		for i:= 1 to maxparam do patFLDF_FLDF^.params^[i]:=nil;
		patFLDF_FLDF^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref i*)
		new(patFILD_FILD);
		patFILD_FILD^.meaning:=pAValueMeaning6284_AVM6284;
		patFILD_FILD^.matchedassembler:=pAAssemblesto6297_AA6297;
		new(patFILD_FILD^.params);
		for i:= 1 to maxparam do patFILD_FILD^.params^[i]:=nil;
		patFILD_FILD^.params^[0]:=patwmemdummy_;
		patFILD_FILD^.params^[2]:=pathiint_;
		patFILD_FILD^.params^[1]:=patreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref i*)
		new(patFILDF_FILDF);
		patFILDF_FILDF^.meaning:=pAValueMeaning6312_AVM6312;
		patFILDF_FILDF^.matchedassembler:=pAAssemblesto6327_AA6327;
		new(patFILDF_FILDF^.params);
		for i:= 1 to maxparam do patFILDF_FILDF^.params^[i]:=nil;
		patFILDF_FILDF^.params^[0]:=patmaddrmode_;
		patFILDF_FILDF^.params^[2]:=pathiint_;
		patFILDF_FILDF^.params^[1]:=patreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFILDIP_FILDIP);
		patFILDIP_FILDIP^.meaning:=pAValueMeaning6338_AVM6338;
		patFILDIP_FILDIP^.matchedassembler:=pAAssemblesto6353_AA6353;
		new(patFILDIP_FILDIP^.params);
		for i:= 1 to maxparam do patFILDIP_FILDIP^.params^[i]:=nil;
		patFILDIP_FILDIP^.params^[0]:=patreal_;
		 
		new(patflt_);
		new(patflt_^.meaning);
		patflt_^.meaning^.tag:=dyadicop;
		patflt_^.meaning^.opname:='<';
		patflt_^.matchedassembler:=string2printlist('c' );
		new(patfgt_);
		new(patfgt_^.meaning);
		patfgt_^.meaning^.tag:=dyadicop;
		patfgt_^.meaning^.opname:='>';
		patfgt_^.matchedassembler:=string2printlist('nc' );
		new(patfeq_);
		new(patfeq_^.meaning);
		patfeq_^.meaning^.tag:=dyadicop;
		patfeq_^.meaning^.opname:='=';
		patfeq_^.matchedassembler:=string2printlist('z' );
		new(patfle_);
		new(patfle_^.meaning);
		patfle_^.meaning^.tag:=dyadicop;
		patfle_^.meaning^.opname:='<=';
		patfle_^.matchedassembler:=string2printlist('na' );
		new(patfge_);
		new(patfge_^.meaning);
		patfge_^.meaning^.tag:=dyadicop;
		patfge_^.meaning^.opname:='>=';
		patfge_^.matchedassembler:=string2printlist('ae' );
		new(patfne_);
		new(patfne_^.meaning);
		patfne_^.meaning^.tag:=dyadicop;
		patfne_^.meaning^.opname:='<>';
		patfne_^.matchedassembler:=string2printlist('nz' );
		alternatives[221]:=patfne_;
		alternatives[222]:=patfge_;
		alternatives[223]:=patfle_;
		alternatives[224]:=patfeq_;
		alternatives[225]:=patfgt_;
		alternatives[226]:=patflt_;
		lastalt:=226;
		new(patfcondition_);
		patfcondition_^.meaning:=pAAlternativesPatterndecl6384_AAP6384;
		patfcondition_^.matchedassembler:=nil;
		patfcondition_^.params :=nil;
(* defds ->public boolean pAIdentifierDyadic6412_AID6412*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patp6FIFGOTO_6FIFGOTO);
		patp6FIFGOTO_6FIFGOTO^.meaning:=pAIfMeaning6406_AIM6406;
		patp6FIFGOTO_6FIFGOTO^.matchedassembler:=pAAssemblesto6424_AA6424;
		new(patp6FIFGOTO_6FIFGOTO^.params);
		for i:= 1 to maxparam do patp6FIFGOTO_6FIFGOTO^.params^[i]:=nil;
		patp6FIFGOTO_6FIFGOTO^.params^[1]:=patmaddrmode_;
		patp6FIFGOTO_6FIFGOTO^.params^[0]:=patlabel_;
		patp6FIFGOTO_6FIFGOTO^.params^[3]:=patint_;
		patp6FIFGOTO_6FIFGOTO^.params^[2]:=patfcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic6447_AID6447*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFIFGOTO_FIFGOTO);
		patFIFGOTO_FIFGOTO^.meaning:=pAIfMeaning6441_AIM6441;
		patFIFGOTO_FIFGOTO^.matchedassembler:=pAAssemblesto6464_AA6464;
		new(patFIFGOTO_FIFGOTO^.params);
		for i:= 1 to maxparam do patFIFGOTO_FIFGOTO^.params^[i]:=nil;
		patFIFGOTO_FIFGOTO^.params^[1]:=patmaddrmode_;
		patFIFGOTO_FIFGOTO^.params^[0]:=patlabel_;
		patFIFGOTO_FIFGOTO^.params^[3]:=patint_;
		patFIFGOTO_FIFGOTO^.params^[2]:=patfcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic6487_AID6487*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFIFGOTOgeneral_FIFGOTO);
		patFIFGOTOgeneral_FIFGOTO^.meaning:=pAIfMeaning6481_AIM6481;
		patFIFGOTOgeneral_FIFGOTO^.matchedassembler:=pAAssemblesto6499_AA6499;
		new(patFIFGOTOgeneral_FIFGOTO^.params);
		for i:= 1 to maxparam do patFIFGOTOgeneral_FIFGOTO^.params^[i]:=nil;
		patFIFGOTOgeneral_FIFGOTO^.params^[0]:=patlabel_;
		patFIFGOTOgeneral_FIFGOTO^.params^[2]:=patint_;
		patFIFGOTOgeneral_FIFGOTO^.params^[1]:=patfcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref int8*)
(* defds ->public boolean pAIdentifierDyadic6529_AID6529*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFSET_FSET);
		patFSET_FSET^.meaning:=pAAssignMeaning6512_AAM6512;
		patFSET_FSET^.matchedassembler:=pAAssemblesto6538_AA6538;
		new(patFSET_FSET^.params);
		for i:= 1 to maxparam do patFSET_FSET^.params^[i]:=nil;
		patFSET_FSET^.params^[1]:=patbreg_;
		patFSET_FSET^.params^[0]:=patfcondition_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier op  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMOP_FMOP);
		patFMOP_FMOP^.meaning:=pAValueMeaning6553_AVM6553;
		patFMOP_FMOP^.matchedassembler:=pAAssemblesto6560_AA6560;
		new(patFMOP_FMOP^.params);
		for i:= 1 to maxparam do patFMOP_FMOP^.params^[i]:=nil;
		patFMOP_FMOP^.params^[0]:=patfmoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFCHS_FCHS);
		patFCHS_FCHS^.meaning:=pAValueMeaning6568_AVM6568;
		patFCHS_FCHS^.matchedassembler:=pAAssemblesto6595_AA6595;
		new(patFCHS_FCHS^.params);
		for i:= 1 to maxparam do patFCHS_FCHS^.params^[i]:=nil;
		patFCHS_FCHS^.params^[0]:=patreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! matches a literal  to the tree at this point*)
		new(patFLOADLIT_FLOADLIT);
		patFLOADLIT_FLOADLIT^.meaning:=pAValueMeaning6603_AVM6603;
		patFLOADLIT_FLOADLIT^.matchedassembler:=pAAssemblesto6610_AA6610;
		new(patFLOADLIT_FLOADLIT^.params);
		for i:= 1 to maxparam do patFLOADLIT_FLOADLIT^.params^[i]:=nil;
		patFLOADLIT_FLOADLIT^.params^[0]:=patfloat_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! matches a literal  to the tree at this point*)
		new(patFLOADDLIT_FLOADDLIT);
		patFLOADDLIT_FLOADDLIT^.meaning:=pAValueMeaning6621_AVM6621;
		patFLOADDLIT_FLOADDLIT^.matchedassembler:=pAAssemblesto6632_AA6632;
		new(patFLOADDLIT_FLOADDLIT^.params);
		for i:= 1 to maxparam do patFLOADDLIT_FLOADDLIT^.params^[i]:=nil;
		patFLOADDLIT_FLOADDLIT^.params^[1]:=patanyreal_;
		patFLOADDLIT_FLOADDLIT^.params^[0]:=patreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! matches a literal  to the tree at this point*)
		new(patFILOADLIT_FILOADLIT);
		patFILOADLIT_FILOADLIT^.meaning:=pAValueMeaning6643_AVM6643;
		patFILOADLIT_FILOADLIT^.matchedassembler:=pAAssemblesto6654_AA6654;
		new(patFILOADLIT_FILOADLIT^.params);
		for i:= 1 to maxparam do patFILOADLIT_FILOADLIT^.params^[i]:=nil;
		patFILOADLIT_FILOADLIT^.params^[1]:=patreal_;
		patFILOADLIT_FILOADLIT^.params^[0]:=pathiint_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic6671_AID6671*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		new(patFOP_FOP);
		patFOP_FOP^.meaning:=pAValueMeaning6665_AVM6665;
		patFOP_FOP^.matchedassembler:=pAAssemblesto6685_AA6685;
		new(patFOP_FOP^.params);
		for i:= 1 to maxparam do patFOP_FOP^.params^[i]:=nil;
		patFOP_FOP^.params^[0]:=patmaddrmode_;
		patFOP_FOP^.params^[1]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic6710_AID6710*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref t*)
		new(patFOPF_FOPF);
		patFOPF_FOPF^.meaning:=pAValueMeaning6700_AVM6700;
		patFOPF_FOPF^.matchedassembler:=pAAssemblesto6727_AA6727;
		new(patFOPF_FOPF^.params);
		for i:= 1 to maxparam do patFOPF_FOPF^.params^[i]:=nil;
		patFOPF_FOPF^.params^[0]:=patmaddrmode_;
		patFOPF_FOPF^.params^[2]:=patreal_;
		patFOPF_FOPF^.params^[1]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic6748_AID6748*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		new(patFOPI_FOPI);
		patFOPI_FOPI^.meaning:=pAValueMeaning6742_AVM6742;
		patFOPI_FOPI^.matchedassembler:=pAAssemblesto6759_AA6759;
		new(patFOPI_FOPI^.params);
		for i:= 1 to maxparam do patFOPI_FOPI^.params^[i]:=nil;
		patFOPI_FOPI^.params^[0]:=patmaddrmode_;
		patFOPI_FOPI^.params^[1]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic6778_AID6778*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		new(patFOPII_FOPII);
		patFOPII_FOPII^.meaning:=pAValueMeaning6772_AVM6772;
		patFOPII_FOPII^.matchedassembler:=pAAssemblesto6787_AA6787;
		new(patFOPII_FOPII^.params);
		for i:= 1 to maxparam do patFOPII_FOPII^.params^[i]:=nil;
		patFOPII_FOPII^.params^[0]:=patmaddrmode_;
		patFOPII_FOPII^.params^[1]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic6806_AID6806*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patReversePolishFOP_RPFOP);
		patReversePolishFOP_RPFOP^.meaning:=pAValueMeaning6800_AVM6800;
		patReversePolishFOP_RPFOP^.matchedassembler:=pAAssemblesto6815_AA6815;
		new(patReversePolishFOP_RPFOP^.params);
		for i:= 1 to maxparam do patReversePolishFOP_RPFOP^.params^[i]:=nil;
		patReversePolishFOP_RPFOP^.params^[1]:=patreal_;
		patReversePolishFOP_RPFOP^.params^[0]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMAXp6_FMAX6);
		patFMAXp6_FMAX6^.meaning:=pAValueMeaning6826_AVM6826;
		patFMAXp6_FMAX6^.matchedassembler:=pAAssemblesto6841_AA6841;
		new(patFMAXp6_FMAX6^.params);
		for i:= 1 to maxparam do patFMAXp6_FMAX6^.params^[i]:=nil;
		patFMAXp6_FMAX6^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patMAXp6_MAX6);
		patMAXp6_MAX6^.meaning:=pAAssignMeaning6851_AAM6851;
		patMAXp6_MAX6^.matchedassembler:=pAAssemblesto6871_AA6871;
		new(patMAXp6_MAX6^.params);
		for i:= 1 to maxparam do patMAXp6_MAX6^.params^[i]:=nil;
		patMAXp6_MAX6^.params^[1]:=patreg_;
		patMAXp6_MAX6^.params^[0]:=patreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patMINp6_MIN6);
		patMINp6_MIN6^.meaning:=pAAssignMeaning6888_AAM6888;
		patMINp6_MIN6^.matchedassembler:=pAAssemblesto6908_AA6908;
		new(patMINp6_MIN6^.params);
		for i:= 1 to maxparam do patMINp6_MIN6^.params^[i]:=nil;
		patMINp6_MIN6^.params^[1]:=patreg_;
		patMINp6_MIN6^.params^[0]:=patreg_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMINp6_FMIN6);
		patFMINp6_FMIN6^.meaning:=pAValueMeaning6923_AVM6923;
		patFMINp6_FMIN6^.matchedassembler:=pAAssemblesto6938_AA6938;
		new(patFMINp6_FMIN6^.params);
		for i:= 1 to maxparam do patFMINp6_FMIN6^.params^[i]:=nil;
		patFMINp6_FMIN6^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMAX_FMAX);
		patFMAX_FMAX^.meaning:=pAValueMeaning6946_AVM6946;
		patFMAX_FMAX^.matchedassembler:=pAAssemblesto6961_AA6961;
		new(patFMAX_FMAX^.params);
		for i:= 1 to maxparam do patFMAX_FMAX^.params^[i]:=nil;
		patFMAX_FMAX^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMIN_FMIN);
		patFMIN_FMIN^.meaning:=pAValueMeaning6969_AVM6969;
		patFMIN_FMIN^.matchedassembler:=pAAssemblesto6984_AA6984;
		new(patFMIN_FMIN^.params);
		for i:= 1 to maxparam do patFMIN_FMIN^.params^[i]:=nil;
		patFMIN_FMIN^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPREM_FPREM);
		patFPREM_FPREM^.meaning:=pAValueMeaning6992_AVM6992;
		patFPREM_FPREM^.matchedassembler:=pAAssemblesto7012_AA7012;
		new(patFPREM_FPREM^.params);
		for i:= 1 to maxparam do patFPREM_FPREM^.params^[i]:=nil;
		patFPREM_FPREM^.params^[0]:=patint_;
		 
			new(patMM0_MM0);
		new(	patMM0_MM0^.meaning);
		new(	patMM0_MM0^.matchedassembler);
			patMM0_MM0^.meaning^.tag:=reg;
			patMM0_MM0^.meaning^.index:=regMM0_MM0code;
			patMM0_MM0^.params:=nil;
			patMM0_MM0^.matchedassembler:=string2printlist('MM0');
			registers[regMM0_MM0code].format:=(0+fref+3);
			registers[regMM0_MM0code].printsas:='MM0';
			registers[regMM0_MM0code].permanentlyreserved:=false;
			registers[regMM0_MM0code].code:=regMM0_MM0code;
			registers[regMM0_MM0code].basecode:=[32..39];
			new(patMM1_MM1);
		new(	patMM1_MM1^.meaning);
		new(	patMM1_MM1^.matchedassembler);
			patMM1_MM1^.meaning^.tag:=reg;
			patMM1_MM1^.meaning^.index:=regMM1_MM1code;
			patMM1_MM1^.params:=nil;
			patMM1_MM1^.matchedassembler:=string2printlist('MM1');
			registers[regMM1_MM1code].format:=(0+fref+3);
			registers[regMM1_MM1code].printsas:='MM1';
			registers[regMM1_MM1code].permanentlyreserved:=false;
			registers[regMM1_MM1code].code:=regMM1_MM1code;
			registers[regMM1_MM1code].basecode:=[40..47];
			new(patMM2_MM2);
		new(	patMM2_MM2^.meaning);
		new(	patMM2_MM2^.matchedassembler);
			patMM2_MM2^.meaning^.tag:=reg;
			patMM2_MM2^.meaning^.index:=regMM2_MM2code;
			patMM2_MM2^.params:=nil;
			patMM2_MM2^.matchedassembler:=string2printlist('MM2');
			registers[regMM2_MM2code].format:=(0+fref+3);
			registers[regMM2_MM2code].printsas:='MM2';
			registers[regMM2_MM2code].permanentlyreserved:=false;
			registers[regMM2_MM2code].code:=regMM2_MM2code;
			registers[regMM2_MM2code].basecode:=[48..55];
			new(patMM3_MM3);
		new(	patMM3_MM3^.meaning);
		new(	patMM3_MM3^.matchedassembler);
			patMM3_MM3^.meaning^.tag:=reg;
			patMM3_MM3^.meaning^.index:=regMM3_MM3code;
			patMM3_MM3^.params:=nil;
			patMM3_MM3^.matchedassembler:=string2printlist('MM3');
			registers[regMM3_MM3code].format:=(0+fref+3);
			registers[regMM3_MM3code].printsas:='MM3';
			registers[regMM3_MM3code].permanentlyreserved:=false;
			registers[regMM3_MM3code].code:=regMM3_MM3code;
			registers[regMM3_MM3code].basecode:=[56..63];
			new(patMM4_MM4);
		new(	patMM4_MM4^.meaning);
		new(	patMM4_MM4^.matchedassembler);
			patMM4_MM4^.meaning^.tag:=reg;
			patMM4_MM4^.meaning^.index:=regMM4_MM4code;
			patMM4_MM4^.params:=nil;
			patMM4_MM4^.matchedassembler:=string2printlist('MM4');
			registers[regMM4_MM4code].format:=(0+fref+3);
			registers[regMM4_MM4code].printsas:='MM4';
			registers[regMM4_MM4code].permanentlyreserved:=false;
			registers[regMM4_MM4code].code:=regMM4_MM4code;
			registers[regMM4_MM4code].basecode:=[64..71];
			new(patMM7_MM7);
		new(	patMM7_MM7^.meaning);
		new(	patMM7_MM7^.matchedassembler);
			patMM7_MM7^.meaning^.tag:=reg;
			patMM7_MM7^.meaning^.index:=regMM7_MM7code;
			patMM7_MM7^.params:=nil;
			patMM7_MM7^.matchedassembler:=string2printlist('MM7');
			registers[regMM7_MM7code].format:=(0+fref+3);
			registers[regMM7_MM7code].printsas:='MM7';
			registers[regMM7_MM7code].permanentlyreserved:=true;
			registers[regMM7_MM7code].code:=regMM7_MM7code;
			registers[regMM7_MM7code].basecode:=[72..79];
			new(patMM5_MM5);
		new(	patMM5_MM5^.meaning);
		new(	patMM5_MM5^.matchedassembler);
			patMM5_MM5^.meaning^.tag:=reg;
			patMM5_MM5^.meaning^.index:=regMM5_MM5code;
			patMM5_MM5^.params:=nil;
			patMM5_MM5^.matchedassembler:=string2printlist('MM5');
			registers[regMM5_MM5code].format:=(0+fref+3);
			registers[regMM5_MM5code].printsas:='MM5';
			registers[regMM5_MM5code].permanentlyreserved:=true;
			registers[regMM5_MM5code].code:=regMM5_MM5code;
			registers[regMM5_MM5code].basecode:=[80..87];
			new(patMM6_MM6);
		new(	patMM6_MM6^.meaning);
		new(	patMM6_MM6^.matchedassembler);
			patMM6_MM6^.meaning^.tag:=reg;
			patMM6_MM6^.meaning^.index:=regMM6_MM6code;
			patMM6_MM6^.params:=nil;
			patMM6_MM6^.matchedassembler:=string2printlist('MM6');
			registers[regMM6_MM6code].format:=(0+fref+3);
			registers[regMM6_MM6code].printsas:='MM6';
			registers[regMM6_MM6code].permanentlyreserved:=true;
			registers[regMM6_MM6code].code:=regMM6_MM6code;
			registers[regMM6_MM6code].basecode:=[88..95];
			registers[50].format:=(0+fref+2);
			registers[50].printsas:='MM0';
			registers[50].permanentlyreserved:=false;
			registers[50].code:=regMM0L_MM0Lcode;
			registers[50].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+3];
			new(patMM0L_MM0L);
		new(	patMM0L_MM0L^.meaning);
		new(	patMM0L_MM0L^.matchedassembler);
			patMM0L_MM0L^.meaning^.tag:=reg;
			patMM0L_MM0L^.meaning^.index:=regMM0L_MM0Lcode;
			patMM0L_MM0L^.params:=nil;
			patMM0L_MM0L^.matchedassembler:=string2printlist('MM0');
			registers[51].format:=(0+fref+2);
			registers[51].printsas:='MM1';
			registers[51].permanentlyreserved:=false;
			registers[51].code:=regMM1L_MM1Lcode;
			registers[51].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+3];
			new(patMM1L_MM1L);
		new(	patMM1L_MM1L^.meaning);
		new(	patMM1L_MM1L^.matchedassembler);
			patMM1L_MM1L^.meaning^.tag:=reg;
			patMM1L_MM1L^.meaning^.index:=regMM1L_MM1Lcode;
			patMM1L_MM1L^.params:=nil;
			patMM1L_MM1L^.matchedassembler:=string2printlist('MM1');
			registers[52].format:=(0+fref+2);
			registers[52].printsas:='MM2';
			registers[52].permanentlyreserved:=false;
			registers[52].code:=regMM2L_MM2Lcode;
			registers[52].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+3];
			new(patMM2L_MM2L);
		new(	patMM2L_MM2L^.meaning);
		new(	patMM2L_MM2L^.matchedassembler);
			patMM2L_MM2L^.meaning^.tag:=reg;
			patMM2L_MM2L^.meaning^.index:=regMM2L_MM2Lcode;
			patMM2L_MM2L^.params:=nil;
			patMM2L_MM2L^.matchedassembler:=string2printlist('MM2');
			registers[53].format:=(0+fref+2);
			registers[53].printsas:='MM3';
			registers[53].permanentlyreserved:=false;
			registers[53].code:=regMM3L_MM3Lcode;
			registers[53].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+3];
			new(patMM3L_MM3L);
		new(	patMM3L_MM3L^.meaning);
		new(	patMM3L_MM3L^.matchedassembler);
			patMM3L_MM3L^.meaning^.tag:=reg;
			patMM3L_MM3L^.meaning^.index:=regMM3L_MM3Lcode;
			patMM3L_MM3L^.params:=nil;
			patMM3L_MM3L^.matchedassembler:=string2printlist('MM3');
			registers[54].format:=(0+fref+2);
			registers[54].printsas:='MM4';
			registers[54].permanentlyreserved:=false;
			registers[54].code:=regMM4L_MM4Lcode;
			registers[54].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+3];
			new(patMM4L_MM4L);
		new(	patMM4L_MM4L^.meaning);
		new(	patMM4L_MM4L^.matchedassembler);
			patMM4L_MM4L^.meaning^.tag:=reg;
			patMM4L_MM4L^.meaning^.index:=regMM4L_MM4Lcode;
			patMM4L_MM4L^.params:=nil;
			patMM4L_MM4L^.matchedassembler:=string2printlist('MM4');
			registers[55].format:=(0+fref+2);
			registers[55].printsas:='MM5';
			registers[55].permanentlyreserved:=false;
			registers[55].code:=regMM5L_MM5Lcode;
			registers[55].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+3];
			new(patMM5L_MM5L);
		new(	patMM5L_MM5L^.meaning);
		new(	patMM5L_MM5L^.matchedassembler);
			patMM5L_MM5L^.meaning^.tag:=reg;
			patMM5L_MM5L^.meaning^.index:=regMM5L_MM5Lcode;
			patMM5L_MM5L^.params:=nil;
			patMM5L_MM5L^.matchedassembler:=string2printlist('MM5');
			registers[56].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[56].printsas:='MM0';
			registers[56].permanentlyreserved:=false;
			registers[56].code:=regMM016_MM016code;
			registers[56].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+7];
			new(patMM016_MM016);
		new(	patMM016_MM016^.meaning);
		new(	patMM016_MM016^.matchedassembler);
			patMM016_MM016^.meaning^.tag:=reg;
			patMM016_MM016^.meaning^.index:=regMM016_MM016code;
			patMM016_MM016^.params:=nil;
			patMM016_MM016^.matchedassembler:=string2printlist('MM0');
			registers[57].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[57].printsas:='MM1';
			registers[57].permanentlyreserved:=false;
			registers[57].code:=regMM116_MM116code;
			registers[57].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+7];
			new(patMM116_MM116);
		new(	patMM116_MM116^.meaning);
		new(	patMM116_MM116^.matchedassembler);
			patMM116_MM116^.meaning^.tag:=reg;
			patMM116_MM116^.meaning^.index:=regMM116_MM116code;
			patMM116_MM116^.params:=nil;
			patMM116_MM116^.matchedassembler:=string2printlist('MM1');
			registers[58].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[58].printsas:='MM2';
			registers[58].permanentlyreserved:=false;
			registers[58].code:=regMM216_MM216code;
			registers[58].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+7];
			new(patMM216_MM216);
		new(	patMM216_MM216^.meaning);
		new(	patMM216_MM216^.matchedassembler);
			patMM216_MM216^.meaning^.tag:=reg;
			patMM216_MM216^.meaning^.index:=regMM216_MM216code;
			patMM216_MM216^.params:=nil;
			patMM216_MM216^.matchedassembler:=string2printlist('MM2');
			registers[59].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[59].printsas:='MM3';
			registers[59].permanentlyreserved:=false;
			registers[59].code:=regMM316_MM316code;
			registers[59].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+7];
			new(patMM316_MM316);
		new(	patMM316_MM316^.meaning);
		new(	patMM316_MM316^.matchedassembler);
			patMM316_MM316^.meaning^.tag:=reg;
			patMM316_MM316^.meaning^.index:=regMM316_MM316code;
			patMM316_MM316^.params:=nil;
			patMM316_MM316^.matchedassembler:=string2printlist('MM3');
			registers[60].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[60].printsas:='MM4';
			registers[60].permanentlyreserved:=false;
			registers[60].code:=regMM416_MM416code;
			registers[60].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+7];
			new(patMM416_MM416);
		new(	patMM416_MM416^.meaning);
		new(	patMM416_MM416^.matchedassembler);
			patMM416_MM416^.meaning^.tag:=reg;
			patMM416_MM416^.meaning^.index:=regMM416_MM416code;
			patMM416_MM416^.params:=nil;
			patMM416_MM416^.matchedassembler:=string2printlist('MM4');
			registers[61].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[61].printsas:='MM5';
			registers[61].permanentlyreserved:=false;
			registers[61].code:=regMM516_MM516code;
			registers[61].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+7];
			new(patMM516_MM516);
		new(	patMM516_MM516^.meaning);
		new(	patMM516_MM516^.matchedassembler);
			patMM516_MM516^.meaning^.tag:=reg;
			patMM516_MM516^.meaning^.index:=regMM516_MM516code;
			patMM516_MM516^.params:=nil;
			patMM516_MM516^.matchedassembler:=string2printlist('MM5');
			registers[62].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[62].printsas:='MM0';
			registers[62].permanentlyreserved:=false;
			registers[62].code:=regMM032_MM032code;
			registers[62].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+7];
			new(patMM032_MM032);
		new(	patMM032_MM032^.meaning);
		new(	patMM032_MM032^.matchedassembler);
			patMM032_MM032^.meaning^.tag:=reg;
			patMM032_MM032^.meaning^.index:=regMM032_MM032code;
			patMM032_MM032^.params:=nil;
			patMM032_MM032^.matchedassembler:=string2printlist('MM0');
			registers[63].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[63].printsas:='MM1';
			registers[63].permanentlyreserved:=false;
			registers[63].code:=regMM132_MM132code;
			registers[63].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+7];
			new(patMM132_MM132);
		new(	patMM132_MM132^.meaning);
		new(	patMM132_MM132^.matchedassembler);
			patMM132_MM132^.meaning^.tag:=reg;
			patMM132_MM132^.meaning^.index:=regMM132_MM132code;
			patMM132_MM132^.params:=nil;
			patMM132_MM132^.matchedassembler:=string2printlist('MM1');
			registers[64].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[64].printsas:='MM2';
			registers[64].permanentlyreserved:=false;
			registers[64].code:=regMM232_MM232code;
			registers[64].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+7];
			new(patMM232_MM232);
		new(	patMM232_MM232^.meaning);
		new(	patMM232_MM232^.matchedassembler);
			patMM232_MM232^.meaning^.tag:=reg;
			patMM232_MM232^.meaning^.index:=regMM232_MM232code;
			patMM232_MM232^.params:=nil;
			patMM232_MM232^.matchedassembler:=string2printlist('MM2');
			registers[65].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[65].printsas:='MM3';
			registers[65].permanentlyreserved:=false;
			registers[65].code:=regMM332_MM332code;
			registers[65].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+7];
			new(patMM332_MM332);
		new(	patMM332_MM332^.meaning);
		new(	patMM332_MM332^.matchedassembler);
			patMM332_MM332^.meaning^.tag:=reg;
			patMM332_MM332^.meaning^.index:=regMM332_MM332code;
			patMM332_MM332^.params:=nil;
			patMM332_MM332^.matchedassembler:=string2printlist('MM3');
			registers[66].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[66].printsas:='MM4';
			registers[66].permanentlyreserved:=false;
			registers[66].code:=regMM432_MM432code;
			registers[66].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+7];
			new(patMM432_MM432);
		new(	patMM432_MM432^.meaning);
		new(	patMM432_MM432^.matchedassembler);
			patMM432_MM432^.meaning^.tag:=reg;
			patMM432_MM432^.meaning^.index:=regMM432_MM432code;
			patMM432_MM432^.params:=nil;
			patMM432_MM432^.matchedassembler:=string2printlist('MM4');
			registers[67].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[67].printsas:='MM5';
			registers[67].permanentlyreserved:=false;
			registers[67].code:=regMM532_MM532code;
			registers[67].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+7];
			new(patMM532_MM532);
		new(	patMM532_MM532^.meaning);
		new(	patMM532_MM532^.matchedassembler);
			patMM532_MM532^.meaning^.tag:=reg;
			patMM532_MM532^.meaning^.index:=regMM532_MM532code;
			patMM532_MM532^.params:=nil;
			patMM532_MM532^.matchedassembler:=string2printlist('MM5');
			registers[68].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[68].printsas:='MM0';
			registers[68].permanentlyreserved:=false;
			registers[68].code:=regMM08_MM08code;
			registers[68].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+7];
			new(patMM08_MM08);
		new(	patMM08_MM08^.meaning);
		new(	patMM08_MM08^.matchedassembler);
			patMM08_MM08^.meaning^.tag:=reg;
			patMM08_MM08^.meaning^.index:=regMM08_MM08code;
			patMM08_MM08^.params:=nil;
			patMM08_MM08^.matchedassembler:=string2printlist('MM0');
			registers[69].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[69].printsas:='MM1';
			registers[69].permanentlyreserved:=false;
			registers[69].code:=regMM18_MM18code;
			registers[69].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+7];
			new(patMM18_MM18);
		new(	patMM18_MM18^.meaning);
		new(	patMM18_MM18^.matchedassembler);
			patMM18_MM18^.meaning^.tag:=reg;
			patMM18_MM18^.meaning^.index:=regMM18_MM18code;
			patMM18_MM18^.params:=nil;
			patMM18_MM18^.matchedassembler:=string2printlist('MM1');
			registers[70].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[70].printsas:='MM2';
			registers[70].permanentlyreserved:=false;
			registers[70].code:=regMM28_MM28code;
			registers[70].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+7];
			new(patMM28_MM28);
		new(	patMM28_MM28^.meaning);
		new(	patMM28_MM28^.matchedassembler);
			patMM28_MM28^.meaning^.tag:=reg;
			patMM28_MM28^.meaning^.index:=regMM28_MM28code;
			patMM28_MM28^.params:=nil;
			patMM28_MM28^.matchedassembler:=string2printlist('MM2');
			registers[71].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[71].printsas:='MM3';
			registers[71].permanentlyreserved:=false;
			registers[71].code:=regMM38_MM38code;
			registers[71].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+7];
			new(patMM38_MM38);
		new(	patMM38_MM38^.meaning);
		new(	patMM38_MM38^.matchedassembler);
			patMM38_MM38^.meaning^.tag:=reg;
			patMM38_MM38^.meaning^.index:=regMM38_MM38code;
			patMM38_MM38^.params:=nil;
			patMM38_MM38^.matchedassembler:=string2printlist('MM3');
			registers[72].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[72].printsas:='MM4';
			registers[72].permanentlyreserved:=false;
			registers[72].code:=regMM48_MM48code;
			registers[72].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+7];
			new(patMM48_MM48);
		new(	patMM48_MM48^.meaning);
		new(	patMM48_MM48^.matchedassembler);
			patMM48_MM48^.meaning^.tag:=reg;
			patMM48_MM48^.meaning^.index:=regMM48_MM48code;
			patMM48_MM48^.params:=nil;
			patMM48_MM48^.matchedassembler:=string2printlist('MM4');
			registers[73].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[73].printsas:='MM5';
			registers[73].permanentlyreserved:=false;
			registers[73].code:=regMM58_MM58code;
			registers[73].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+7];
			new(patMM58_MM58);
		new(	patMM58_MM58^.meaning);
		new(	patMM58_MM58^.matchedassembler);
			patMM58_MM58^.meaning^.tag:=reg;
			patMM58_MM58^.meaning^.index:=regMM58_MM58code;
			patMM58_MM58^.params:=nil;
			patMM58_MM58^.matchedassembler:=string2printlist('MM5');
		alternatives[227]:=patMM48_MM48;
		alternatives[228]:=patMM38_MM38;
		alternatives[229]:=patMM58_MM58;
		alternatives[230]:=patMM08_MM08;
		alternatives[231]:=patMM18_MM18;
		alternatives[232]:=patMM28_MM28;
		lastalt:=232;
		new(patim8reg_8);
		patim8reg_8^.meaning:=pAAlternativesPatterndecl7341_AAP7341;
		patim8reg_8^.matchedassembler:=nil;
		patim8reg_8^.params :=nil;
		alternatives[233]:=patMM432_MM432;
		alternatives[234]:=patMM332_MM332;
		alternatives[235]:=patMM532_MM532;
		alternatives[236]:=patMM032_MM032;
		alternatives[237]:=patMM132_MM132;
		alternatives[238]:=patMM232_MM232;
		lastalt:=238;
		new(patim2reg_2);
		patim2reg_2^.meaning:=pAAlternativesPatterndecl7356_AAP7356;
		patim2reg_2^.matchedassembler:=nil;
		patim2reg_2^.params :=nil;
		alternatives[239]:=patMM416_MM416;
		alternatives[240]:=patMM316_MM316;
		alternatives[241]:=patMM516_MM516;
		alternatives[242]:=patMM016_MM016;
		alternatives[243]:=patMM116_MM116;
		alternatives[244]:=patMM216_MM216;
		lastalt:=244;
		new(patim4reg_4);
		patim4reg_4^.meaning:=pAAlternativesPatterndecl7371_AAP7371;
		patim4reg_4^.matchedassembler:=nil;
		patim4reg_4^.params :=nil;
		alternatives[245]:=patMM1_MM1;
		alternatives[246]:=patMM3_MM3;
		alternatives[247]:=patMM4_MM4;
		alternatives[248]:=patMM5_MM5;
		alternatives[249]:=patMM2_MM2;
		alternatives[250]:=patMM0_MM0;
		alternatives[251]:=patMM7_MM7;
		alternatives[252]:=patMM6_MM6;
		lastalt:=252;
		new(patuntypedmreg_);
		patuntypedmreg_^.meaning:=pAAlternativesPatterndecl7386_AAP7386;
		patuntypedmreg_^.matchedassembler:=nil;
		patuntypedmreg_^.params :=nil;
		alternatives[253]:=patMM1L_MM1L;
		alternatives[254]:=patMM3L_MM3L;
		alternatives[255]:=patMM4L_MM4L;
		alternatives[256]:=patMM2L_MM2L;
		alternatives[257]:=patMM0L_MM0L;
		alternatives[258]:=patMM5L_MM5L;
		lastalt:=258;
		new(patwmreg_);
		patwmreg_^.meaning:=pAAlternativesPatterndecl7405_AAP7405;
		patwmreg_^.matchedassembler:=nil;
		patwmreg_^.params :=nil;
		alternatives[259]:=patMM1L_MM1L;
		alternatives[260]:=patMM3L_MM3L;
		alternatives[261]:=patMM4L_MM4L;
		alternatives[262]:=patMM2L_MM2L;
		alternatives[263]:=patMM0L_MM0L;
		alternatives[264]:=patMM5L_MM5L;
		lastalt:=264;
		new(patlmreg_);
		patlmreg_^.meaning:=pAAlternativesPatterndecl7420_AAP7420;
		patlmreg_^.matchedassembler:=nil;
		patlmreg_^.params :=nil;
		alternatives[265]:=patim4reg_4;
		alternatives[266]:=patim8reg_8;
		alternatives[267]:=patim2reg_2;
		alternatives[268]:=patuntypedmreg_;
		lastalt:=268;
		new(patmreg_);
		patmreg_^.meaning:=pAAlternativesPatterndecl7435_AAP7435;
		patmreg_^.matchedassembler:=nil;
		patmreg_^.params :=nil;
		alternatives[269]:=patmaddrmode_;
		alternatives[270]:=patmreg_;
		lastalt:=270;
		new(patmrmaddrmode_);
		patmrmaddrmode_^.meaning:=pAAlternativesPatterndecl7446_AAP7446;
		patmrmaddrmode_^.matchedassembler:=nil;
		patmrmaddrmode_^.params :=nil;
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPMULLW_PMULLW);
		patPMULLW_PMULLW^.meaning:=pAAssignMeaning7456_AAM7456;
		patPMULLW_PMULLW^.matchedassembler:=pAAssemblesto7500_AA7500;
		new(patPMULLW_PMULLW^.params);
		for i:= 1 to maxparam do patPMULLW_PMULLW^.params^[i]:=nil;
		patPMULLW_PMULLW^.params^[0]:=patim4reg_4;
		patPMULLW_PMULLW^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m1  to the tree at this point*)
		(*! Matches identifier m2  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPMULLSSB_PMULLSSB);
		patPMULLSSB_PMULLSSB^.meaning:=pAAssignMeaning7515_AAM7515;
		patPMULLSSB_PMULLSSB^.matchedassembler:=pAAssemblesto7559_AA7559;
		new(patPMULLSSB_PMULLSSB^.params);
		for i:= 1 to maxparam do patPMULLSSB_PMULLSSB^.params^[i]:=nil;
		patPMULLSSB_PMULLSSB^.params^[1]:=patmrmaddrmode_;
		patPMULLSSB_PMULLSSB^.params^[0]:=patim8reg_8;
		patPMULLSSB_PMULLSSB^.params^[2]:=patmrmaddrmode_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier m  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patMMXPUSH_MMXPUSH);
		patMMXPUSH_MMXPUSH^.meaning:=pAValueMeaning7594_AVM7594;
		patMMXPUSH_MMXPUSH^.matchedassembler:=pAAssemblesto7601_AA7601;
		new(patMMXPUSH_MMXPUSH^.params);
		for i:= 1 to maxparam do patMMXPUSH_MMXPUSH^.params^[i]:=nil;
		patMMXPUSH_MMXPUSH^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patMMXPOP_MMXPOP);
		patMMXPOP_MMXPOP^.meaning:=pAAssignMeaning7610_AAM7610;
		patMMXPOP_MMXPOP^.matchedassembler:=pAAssemblesto7618_AA7618;
		new(patMMXPOP_MMXPOP^.params);
		for i:= 1 to maxparam do patMMXPOP_MMXPOP^.params^[i]:=nil;
		patMMXPOP_MMXPOP^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 2 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDD_PADDD);
		patPADDD_PADDD^.meaning:=pAAssignMeaning7630_AAM7630;
		patPADDD_PADDD^.matchedassembler:=pAAssemblesto7684_AA7684;
		new(patPADDD_PADDD^.params);
		for i:= 1 to maxparam do patPADDD_PADDD^.params^[i]:=nil;
		patPADDD_PADDD^.params^[0]:=patmreg_;
		patPADDD_PADDD^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 4 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDW_PADDW);
		patPADDW_PADDW^.meaning:=pAAssignMeaning7697_AAM7697;
		patPADDW_PADDW^.matchedassembler:=pAAssemblesto7751_AA7751;
		new(patPADDW_PADDW^.params);
		for i:= 1 to maxparam do patPADDW_PADDW^.params^[i]:=nil;
		patPADDW_PADDW^.params^[0]:=patim4reg_4;
		patPADDW_PADDW^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDB_PADDB);
		patPADDB_PADDB^.meaning:=pAAssignMeaning7764_AAM7764;
		patPADDB_PADDB^.matchedassembler:=pAAssemblesto7818_AA7818;
		new(patPADDB_PADDB^.params);
		for i:= 1 to maxparam do patPADDB_PADDB^.params^[i]:=nil;
		patPADDB_PADDB^.params^[0]:=patim8reg_8;
		patPADDB_PADDB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref octet vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patCMPEQB_CMPEQB);
		patCMPEQB_CMPEQB^.meaning:=pAAssignMeaning7831_AAM7831;
		patCMPEQB_CMPEQB^.matchedassembler:=pAAssemblesto7881_AA7881;
		new(patCMPEQB_CMPEQB^.params);
		for i:= 1 to maxparam do patCMPEQB_CMPEQB^.params^[i]:=nil;
		patCMPEQB_CMPEQB^.params^[0]:=patmreg_;
		patCMPEQB_CMPEQB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref octet vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patCMPGTB_CMPGTB);
		patCMPGTB_CMPGTB^.meaning:=pAAssignMeaning7894_AAM7894;
		patCMPGTB_CMPGTB^.matchedassembler:=pAAssemblesto7944_AA7944;
		new(patCMPGTB_CMPGTB^.params);
		for i:= 1 to maxparam do patCMPGTB_CMPGTB^.params^[i]:=nil;
		patCMPGTB_CMPGTB^.params^[0]:=patmreg_;
		patCMPGTB_CMPGTB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref octet vector ( 8 )*)
		(*! Matches identifier ma  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		new(patCMPGTBR_CMPGTBR);
		patCMPGTBR_CMPGTBR^.meaning:=pAAssignMeaning7957_AAM7957;
		patCMPGTBR_CMPGTBR^.matchedassembler:=pAAssemblesto8007_AA8007;
		new(patCMPGTBR_CMPGTBR^.params);
		for i:= 1 to maxparam do patCMPGTBR_CMPGTBR^.params^[i]:=nil;
		patCMPGTBR_CMPGTBR^.params^[0]:=patmreg_;
		patCMPGTBR_CMPGTBR^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDUB_PADDUB);
		patPADDUB_PADDUB^.meaning:=pAAssignMeaning8020_AAM8020;
		patPADDUB_PADDUB^.matchedassembler:=pAAssemblesto8074_AA8074;
		new(patPADDUB_PADDUB^.params);
		for i:= 1 to maxparam do patPADDUB_PADDUB^.params^[i]:=nil;
		patPADDUB_PADDUB^.params^[0]:=patmreg_;
		patPADDUB_PADDUB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDSB_PADDSB);
		patPADDSB_PADDSB^.meaning:=pAAssignMeaning8087_AAM8087;
		patPADDSB_PADDSB^.matchedassembler:=pAAssemblesto8121_AA8121;
		new(patPADDSB_PADDSB^.params);
		for i:= 1 to maxparam do patPADDSB_PADDSB^.params^[i]:=nil;
		patPADDSB_PADDSB^.params^[0]:=patim8reg_8;
		patPADDSB_PADDSB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m2  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDSB3_PADDSB3);
		patPADDSB3_PADDSB3^.meaning:=pAAssignMeaning8136_AAM8136;
		patPADDSB3_PADDSB3^.matchedassembler:=pAAssemblesto8170_AA8170;
		new(patPADDSB3_PADDSB3^.params);
		for i:= 1 to maxparam do patPADDSB3_PADDSB3^.params^[i]:=nil;
		patPADDSB3_PADDSB3^.params^[0]:=patim8reg_8;
		patPADDSB3_PADDSB3^.params^[1]:=patim8reg_8;
		patPADDSB3_PADDSB3^.params^[2]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDUSB_PADDUSB);
		patPADDUSB_PADDUSB^.meaning:=pAAssignMeaning8187_AAM8187;
		patPADDUSB_PADDUSB^.matchedassembler:=pAAssemblesto8241_AA8241;
		new(patPADDUSB_PADDUSB^.params);
		for i:= 1 to maxparam do patPADDUSB_PADDUSB^.params^[i]:=nil;
		patPADDUSB_PADDUSB^.params^[0]:=patmreg_;
		patPADDUSB_PADDUSB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSPADDUSB_SPADDUSB);
		patSPADDUSB_SPADDUSB^.meaning:=pAAssignMeaning8252_AAM8252;
		patSPADDUSB_SPADDUSB^.matchedassembler:=pAAssemblesto8306_AA8306;
		new(patSPADDUSB_SPADDUSB^.params);
		for i:= 1 to maxparam do patSPADDUSB_SPADDUSB^.params^[i]:=nil;
		patSPADDUSB_SPADDUSB^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSPADDUB_SPADDUB);
		patSPADDUB_SPADDUB^.meaning:=pAAssignMeaning8318_AAM8318;
		patSPADDUB_SPADDUB^.matchedassembler:=pAAssemblesto8372_AA8372;
		new(patSPADDUB_SPADDUB^.params);
		for i:= 1 to maxparam do patSPADDUB_SPADDUB^.params^[i]:=nil;
		patSPADDUB_SPADDUB^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSPADDSB_SPADDSB);
		patSPADDSB_SPADDSB^.meaning:=pAAssignMeaning8384_AAM8384;
		patSPADDSB_SPADDSB^.matchedassembler:=pAAssemblesto8428_AA8428;
		new(patSPADDSB_SPADDSB^.params);
		for i:= 1 to maxparam do patSPADDSB_SPADDSB^.params^[i]:=nil;
		patSPADDSB_SPADDSB^.params^[0]:=patim8reg_8;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 2 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSPSUBD_SPSUBD);
		patSPSUBD_SPSUBD^.meaning:=pAAssignMeaning8440_AAM8440;
		patSPSUBD_SPSUBD^.matchedassembler:=pAAssemblesto8494_AA8494;
		new(patSPSUBD_SPSUBD^.params);
		for i:= 1 to maxparam do patSPSUBD_SPSUBD^.params^[i]:=nil;
		patSPSUBD_SPSUBD^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 4 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBW_PSUBW);
		patPSUBW_PSUBW^.meaning:=pAAssignMeaning8506_AAM8506;
		patPSUBW_PSUBW^.matchedassembler:=pAAssemblesto8560_AA8560;
		new(patPSUBW_PSUBW^.params);
		for i:= 1 to maxparam do patPSUBW_PSUBW^.params^[i]:=nil;
		patPSUBW_PSUBW^.params^[0]:=patim4reg_4;
		patPSUBW_PSUBW^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBB_PSUBB);
		patPSUBB_PSUBB^.meaning:=pAAssignMeaning8573_AAM8573;
		patPSUBB_PSUBB^.matchedassembler:=pAAssemblesto8627_AA8627;
		new(patPSUBB_PSUBB^.params);
		for i:= 1 to maxparam do patPSUBB_PSUBB^.params^[i]:=nil;
		patPSUBB_PSUBB^.params^[0]:=patim8reg_8;
		patPSUBB_PSUBB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBUB_PSUBUB);
		patPSUBUB_PSUBUB^.meaning:=pAAssignMeaning8640_AAM8640;
		patPSUBUB_PSUBUB^.matchedassembler:=pAAssemblesto8694_AA8694;
		new(patPSUBUB_PSUBUB^.params);
		for i:= 1 to maxparam do patPSUBUB_PSUBUB^.params^[i]:=nil;
		patPSUBUB_PSUBUB^.params^[0]:=patmreg_;
		patPSUBUB_PSUBUB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBSB_PSUBSB);
		patPSUBSB_PSUBSB^.meaning:=pAAssignMeaning8707_AAM8707;
		patPSUBSB_PSUBSB^.matchedassembler:=pAAssemblesto8761_AA8761;
		new(patPSUBSB_PSUBSB^.params);
		for i:= 1 to maxparam do patPSUBSB_PSUBSB^.params^[i]:=nil;
		patPSUBSB_PSUBSB^.params^[0]:=patim8reg_8;
		patPSUBSB_PSUBSB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBUSB_PSUBUSB);
		patPSUBUSB_PSUBUSB^.meaning:=pAAssignMeaning8774_AAM8774;
		patPSUBUSB_PSUBUSB^.matchedassembler:=pAAssemblesto8828_AA8828;
		new(patPSUBUSB_PSUBUSB^.params);
		for i:= 1 to maxparam do patPSUBUSB_PSUBUSB^.params^[i]:=nil;
		patPSUBUSB_PSUBUSB^.params^[0]:=patmreg_;
		patPSUBUSB_PSUBUSB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPAND_PAND);
		patPAND_PAND^.meaning:=pAAssignMeaning8841_AAM8841;
		patPAND_PAND^.matchedassembler:=pAAssemblesto8855_AA8855;
		new(patPAND_PAND^.params);
		for i:= 1 to maxparam do patPAND_PAND^.params^[i]:=nil;
		patPAND_PAND^.params^[0]:=patmreg_;
		patPAND_PAND^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		new(patPANDN_PANDN);
		patPANDN_PANDN^.meaning:=pAAssignMeaning8868_AAM8868;
		patPANDN_PANDN^.matchedassembler:=pAAssemblesto8884_AA8884;
		new(patPANDN_PANDN^.params);
		for i:= 1 to maxparam do patPANDN_PANDN^.params^[i]:=nil;
		patPANDN_PANDN^.params^[0]:=patmreg_;
		patPANDN_PANDN^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPOR_POR);
		patPOR_POR^.meaning:=pAAssignMeaning8897_AAM8897;
		patPOR_POR^.matchedassembler:=pAAssemblesto8911_AA8911;
		new(patPOR_POR^.params);
		for i:= 1 to maxparam do patPOR_POR^.params^[i]:=nil;
		patPOR_POR^.params^[0]:=patmreg_;
		patPOR_POR^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref word*)
		(*! Matches identifier m  to the tree at this point*)
		new(patMOVDS_MOVDS);
		patMOVDS_MOVDS^.meaning:=pAAssignMeaning8924_AAM8924;
		patMOVDS_MOVDS^.matchedassembler:=pAAssemblesto8937_AA8937;
		new(patMOVDS_MOVDS^.params);
		for i:= 1 to maxparam do patMOVDS_MOVDS^.params^[i]:=nil;
		patMOVDS_MOVDS^.params^[1]:=patwmreg_;
		patMOVDS_MOVDS^.params^[0]:=patwaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVDL_MOVDL);
		patMOVDL_MOVDL^.meaning:=pAAssignMeaning8950_AAM8950;
		patMOVDL_MOVDL^.matchedassembler:=pAAssemblesto8963_AA8963;
		new(patMOVDL_MOVDL^.params);
		for i:= 1 to maxparam do patMOVDL_MOVDL^.params^[i]:=nil;
		patMOVDL_MOVDL^.params^[1]:=patwmreg_;
		patMOVDL_MOVDL^.params^[0]:=patwaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVOCTUINTL_MOVOCTUINTL);
		patMOVOCTUINTL_MOVOCTUINTL^.meaning:=pAAssignMeaning8976_AAM8976;
		patMOVOCTUINTL_MOVOCTUINTL^.matchedassembler:=pAAssemblesto8994_AA8994;
		new(patMOVOCTUINTL_MOVOCTUINTL^.params);
		for i:= 1 to maxparam do patMOVOCTUINTL_MOVOCTUINTL^.params^[i]:=nil;
		patMOVOCTUINTL_MOVOCTUINTL^.params^[1]:=patmreg_;
		patMOVOCTUINTL_MOVOCTUINTL^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref doubleword*)
		(*! Matches identifier m  to the tree at this point*)
		new(patMOVQS_MOVQS);
		patMOVQS_MOVQS^.meaning:=pAAssignMeaning9007_AAM9007;
		patMOVQS_MOVQS^.matchedassembler:=pAAssemblesto9020_AA9020;
		new(patMOVQS_MOVQS^.params);
		for i:= 1 to maxparam do patMOVQS_MOVQS^.params^[i]:=nil;
		patMOVQS_MOVQS^.params^[1]:=patmreg_;
		patMOVQS_MOVQS^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref doubleword*)
		(*! Matches identifier m  to the tree at this point*)
		new(patMOVQR_MOVQR);
		patMOVQR_MOVQR^.meaning:=pAAssignMeaning9033_AAM9033;
		patMOVQR_MOVQR^.matchedassembler:=pAAssemblesto9046_AA9046;
		new(patMOVQR_MOVQR^.params);
		for i:= 1 to maxparam do patMOVQR_MOVQR^.params^[i]:=nil;
		patMOVQR_MOVQR^.params^[1]:=patmreg_;
		patMOVQR_MOVQR^.params^[0]:=patmreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		new(patMOVOCTUINTS_MOVOCTUINTS);
		patMOVOCTUINTS_MOVOCTUINTS^.meaning:=pAAssignMeaning9059_AAM9059;
		patMOVOCTUINTS_MOVOCTUINTS^.matchedassembler:=pAAssemblesto9077_AA9077;
		new(patMOVOCTUINTS_MOVOCTUINTS^.params);
		for i:= 1 to maxparam do patMOVOCTUINTS_MOVOCTUINTS^.params^[i]:=nil;
		patMOVOCTUINTS_MOVOCTUINTS^.params^[1]:=patmreg_;
		patMOVOCTUINTS_MOVOCTUINTS^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVQL_MOVQL);
		patMOVQL_MOVQL^.meaning:=pAAssignMeaning9090_AAM9090;
		patMOVQL_MOVQL^.matchedassembler:=pAAssemblesto9103_AA9103;
		new(patMOVQL_MOVQL^.params);
		for i:= 1 to maxparam do patMOVQL_MOVQL^.params^[i]:=nil;
		patMOVQL_MOVQL^.params^[1]:=patmreg_;
		patMOVQL_MOVQL^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVQLR_MOVQLR);
		patMOVQLR_MOVQLR^.meaning:=pAAssignMeaning9116_AAM9116;
		patMOVQLR_MOVQLR^.matchedassembler:=pAAssemblesto9124_AA9124;
		new(patMOVQLR_MOVQLR^.params);
		for i:= 1 to maxparam do patMOVQLR_MOVQLR^.params^[i]:=nil;
		patMOVQLR_MOVQLR^.params^[1]:=patim8reg_8;
		patMOVQLR_MOVQLR^.params^[0]:=patim8reg_8;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patREP2_REP2);
		patREP2_REP2^.meaning:=pAAssignMeaning9137_AAM9137;
		patREP2_REP2^.matchedassembler:=pAAssemblesto9151_AA9151;
		new(patREP2_REP2^.params);
		for i:= 1 to maxparam do patREP2_REP2^.params^[i]:=nil;
		patREP2_REP2^.params^[0]:=patmreg_;
		patREP2_REP2^.params^[1]:=patreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patREP4_REP4);
		patREP4_REP4^.meaning:=pAAssignMeaning9167_AAM9167;
		patREP4_REP4^.matchedassembler:=pAAssemblesto9181_AA9181;
		new(patREP4_REP4^.params);
		for i:= 1 to maxparam do patREP4_REP4^.params^[i]:=nil;
		patREP4_REP4^.params^[0]:=patmreg_;
		patREP4_REP4^.params^[1]:=patwreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patREP8_REP8);
		patREP8_REP8^.meaning:=pAAssignMeaning9201_AAM9201;
		patREP8_REP8^.matchedassembler:=pAAssemblesto9215_AA9215;
		new(patREP8_REP8^.params);
		for i:= 1 to maxparam do patREP8_REP8^.params^[i]:=nil;
		patREP8_REP8^.params^[0]:=patmreg_;
		patREP8_REP8^.params^[1]:=patbreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 4 )*)
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref int32 vector ( 4 )*)
		new(patPACKSSDW_PACKSSDW);
		patPACKSSDW_PACKSSDW^.meaning:=pAAssignMeaning9231_AAM9231;
		patPACKSSDW_PACKSSDW^.matchedassembler:=pAAssemblesto9261_AA9261;
		new(patPACKSSDW_PACKSSDW^.params);
		for i:= 1 to maxparam do patPACKSSDW_PACKSSDW^.params^[i]:=nil;
		patPACKSSDW_PACKSSDW^.params^[1]:=patmreg_;
		patPACKSSDW_PACKSSDW^.params^[0]:=patreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref int16 vector ( 8 )*)
		new(patPACKSSWB_PACKSSWB);
		patPACKSSWB_PACKSSWB^.meaning:=pAAssignMeaning9279_AAM9279;
		patPACKSSWB_PACKSSWB^.matchedassembler:=pAAssemblesto9309_AA9309;
		new(patPACKSSWB_PACKSSWB^.params);
		for i:= 1 to maxparam do patPACKSSWB_PACKSSWB^.params^[i]:=nil;
		patPACKSSWB_PACKSSWB^.params^[1]:=patim8reg_8;
		patPACKSSWB_PACKSSWB^.params^[0]:=patreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref int16 vector ( 8 )*)
		new(patPACKUSWB_PACKUSWB);
		patPACKUSWB_PACKUSWB^.meaning:=pAAssignMeaning9327_AAM9327;
		patPACKUSWB_PACKUSWB^.matchedassembler:=pAAssemblesto9357_AA9357;
		new(patPACKUSWB_PACKUSWB^.params);
		for i:= 1 to maxparam do patPACKUSWB_PACKUSWB^.params^[i]:=nil;
		patPACKUSWB_PACKUSWB^.params^[1]:=patmreg_;
		patPACKUSWB_PACKUSWB^.params^[0]:=patreg_;
		 
		lastreg:=maxbasereg;
		lastinstruction:=183;
		  instructionsetorder[0]:= patIFLITGOTO_IFLITGOTO;
		  instructionsetorder[1]:= patLOAD_LOAD;
		  instructionsetorder[2]:= patMOVZXB_MOVZXB;
		  instructionsetorder[3]:= patMOVSXB_MOVSXB;
		  instructionsetorder[4]:= patMOVZXW_MOVZXW;
		  instructionsetorder[5]:= patMOVSXW_MOVSXW;
		  instructionsetorder[6]:= patMOVZXB2_MOVZXB2;
		  instructionsetorder[7]:= patMOVZXBW_MOVZXBW;
		  instructionsetorder[8]:= patMOVSXBW_MOVSXBW;
		  instructionsetorder[9]:= patCLEARREG_CLEARREG;
		  instructionsetorder[10]:= patSTORELIT_STORELIT;
		  instructionsetorder[11]:= patLEA_LEA;
		  instructionsetorder[12]:= patINC_INC;
		  instructionsetorder[13]:= patRMLIT_RMLIT;
		  instructionsetorder[14]:= patRMR_RMR;
		  instructionsetorder[15]:= patDEC_DEC;
		  instructionsetorder[16]:= patIMULLIT_IMULLIT;
		  instructionsetorder[17]:= patBIMUL_BIMUL;
		  instructionsetorder[18]:= patRLIT_RLIT;
		  instructionsetorder[19]:= patRRM_RRM;
		  instructionsetorder[20]:= patRMRB_RMRB;
		  instructionsetorder[21]:= patiRR_RR;
		  instructionsetorder[22]:= patRR_RR;
		  instructionsetorder[23]:= patDIV8_DIV8;
		  instructionsetorder[24]:= patIDIV_IDIV;
		  instructionsetorder[25]:= patfastBIDIV_BIDIV;
		  instructionsetorder[26]:= patBIDIV_BIDIV;
		  instructionsetorder[27]:= patUDIV_UDIV;
		  instructionsetorder[28]:= patMOD2_MOD2;
		  instructionsetorder[29]:= patMOD4_MOD4;
		  instructionsetorder[30]:= patMOD8_MOD8;
		  instructionsetorder[31]:= patMOD16_MOD16;
		  instructionsetorder[32]:= patIMOD_IMOD;
		  instructionsetorder[33]:= patUMOD_UMOD;
		  instructionsetorder[34]:= patfastIMUL_IMUL;
		  instructionsetorder[35]:= patNegate_N;
		  instructionsetorder[36]:= patNOTOP_NOTOP;
		  instructionsetorder[37]:= patMNegate_MN;
		  instructionsetorder[38]:= patBTS_BTS;
		  instructionsetorder[39]:= patTESTIN_TESTIN;
		  instructionsetorder[40]:= patSHIFT_SHIFT;
		  instructionsetorder[41]:= patUINT8MAX_UINT8MAX;
		  instructionsetorder[42]:= patUINT8MIN_UINT8MIN;
		  instructionsetorder[43]:= patINT8MAX_INT8MAX;
		  instructionsetorder[44]:= patINT8MIN_INT8MIN;
		  instructionsetorder[45]:= patSELECT_SELECT;
		  instructionsetorder[46]:= patPLANT_PLANT;
		  instructionsetorder[47]:= patLITPUSH_LITPUSH;
		  instructionsetorder[48]:= patMEMPUSH_MEMPUSH;
		  instructionsetorder[49]:= patSET_SET;
		  instructionsetorder[50]:= patSETU_SETU;
		  instructionsetorder[51]:= patToBYTE_TBYTE;
		  instructionsetorder[52]:= patIFASS_IFASS;
		  instructionsetorder[53]:= patANDIFGOTO_ANDIFGOTO;
		  instructionsetorder[54]:= patIFLITGOTO_IFLITGOTO;
		  instructionsetorder[55]:= patBIFLITGOTO_BIFLITGOTO;
		  instructionsetorder[56]:= patIFIN_IFIN;
		  instructionsetorder[57]:= patIFGOTO_IFGOTO;
		  instructionsetorder[58]:= patIFGOTOB_IFGOTOB;
		  instructionsetorder[59]:= patIFGOTOW_IFGOTOW;
		  instructionsetorder[60]:= patGOTO_GOTO;
		  instructionsetorder[61]:= patFAIL_FAIL;
		  instructionsetorder[62]:= patBOUND4_BOUND4;
		  instructionsetorder[63]:= patBOUND0_BOUND0;
		  instructionsetorder[64]:= patBOUND16_BOUND16;
		  instructionsetorder[65]:= patPLANTBCONST_PLANTBCONST;
		  instructionsetorder[66]:= patPLANTWCONST_PLANTWCONST;
		  instructionsetorder[67]:= patPLANTICONST_PLANTICONST;
		  instructionsetorder[68]:= patPLANTRCONST_PLANTRCONST;
		  instructionsetorder[69]:= patPLANTSCONST_PLANTSCONST;
		  instructionsetorder[70]:= patREPMOVSB_REPMOVSB;
		  instructionsetorder[71]:= patREPMOVSD_REPMOVSD;
		  instructionsetorder[72]:= patADDUSB_ADDUSB;
		  instructionsetorder[73]:= patSUBUSB_SUBUSB;
		  instructionsetorder[74]:= patADDSSB_ADDSSB;
		  instructionsetorder[75]:= patSUBSSB_SUBSSB;
		  instructionsetorder[76]:= patMULTSSB_MULTSSB;
		  instructionsetorder[77]:= patMULTSSBAL_MULTSSBAL;
		  instructionsetorder[78]:= patRPUSH_RPUSH;
		  instructionsetorder[79]:= patREFPUSH_REFPUSH;
		  instructionsetorder[80]:= patSDEREF_SDEREF;
		  instructionsetorder[81]:= patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD;
		  instructionsetorder[82]:= patIFBOOL_IFBOOL;
		  instructionsetorder[83]:= patSMLIT_SMLIT;
		  instructionsetorder[84]:= patSMRP_SMRP;
		  instructionsetorder[85]:= patSADD_SADD;
		  instructionsetorder[86]:= patSMULIT_SMULIT;
		  instructionsetorder[87]:= patSMRADD_SMRADD;
		  instructionsetorder[88]:= patSOP_SOP;
		  instructionsetorder[89]:= patSMR_SMR;
		  instructionsetorder[90]:= patBSMR_BSMR;
		  instructionsetorder[91]:= patSTOREWR_STOREWR;
		  instructionsetorder[92]:= patSTORER_STORER;
		  instructionsetorder[93]:= patSTOREBR_STOREBR;
		  instructionsetorder[94]:= patSTACKLOAD_STACKLOAD;
		  instructionsetorder[95]:= patREFPOP_REFPOP;
		  instructionsetorder[96]:= patMEMPOP_MEMPOP;
		  instructionsetorder[97]:= patBPOP_BPOP;
		  instructionsetorder[98]:= patBSPOP_BSPOP;
		  instructionsetorder[99]:= patBSPUSH_BSPUSH;
		  instructionsetorder[100]:= patDMEMPUSH_DMEMPUSH;
		  instructionsetorder[101]:= patRPUSHE_RPUSHE;
		  instructionsetorder[102]:= patBPUSH_BPUSH;
		  instructionsetorder[103]:= patSTACKSTORE_STACKSTORE;
		  instructionsetorder[104]:= patSTACKWSTORE_STACKWSTORE;
		  instructionsetorder[105]:= patSTACKBSTORE_STACKBSTORE;
		  instructionsetorder[106]:= patRPOP_RPOP;
		  instructionsetorder[107]:= patSMRSHIFT_SMRSHIFT;
		  instructionsetorder[108]:= patFCHS_FCHS;
		  instructionsetorder[109]:= patFOPF_FOPF;
		  instructionsetorder[110]:= patFLOADLIT_FLOADLIT;
		  instructionsetorder[111]:= patFILOADLIT_FILOADLIT;
		  instructionsetorder[112]:= patFMAX_FMAX;
		  instructionsetorder[113]:= patFMIN_FMIN;
		  instructionsetorder[114]:= patFLD_FLD;
		  instructionsetorder[115]:= patFLDF_FLDF;
		  instructionsetorder[116]:= patFILDF_FILDF;
		  instructionsetorder[117]:= patFILD_FILD;
		  instructionsetorder[118]:= patFILDF_FILDF;
		  instructionsetorder[119]:= patFLOADDLIT_FLOADDLIT;
		  instructionsetorder[120]:= patFILDB_FILDB;
		  instructionsetorder[121]:= patFILDR_FILDR;
		  instructionsetorder[122]:= patReversePolishFOP_RPFOP;
		  instructionsetorder[123]:= patFMOP_FMOP;
		  instructionsetorder[124]:= patFPREM_FPREM;
		  instructionsetorder[125]:= patFOP_FOP;
		  instructionsetorder[126]:= patFOPI_FOPI;
		  instructionsetorder[127]:= patFOPII_FOPII;
		  instructionsetorder[128]:= patRMULTB_RMULTB;
		  instructionsetorder[129]:= patFPOPMSI64_FPOPMSI64;
		  instructionsetorder[130]:= patFISTR_FISTR;
		  instructionsetorder[131]:= patFSTR_FSTR;
		  instructionsetorder[132]:= patFSTRF_FSTRF;
		  instructionsetorder[133]:= patFLOATMS_FLOATMS;
		  instructionsetorder[134]:= patFILDIP_FILDIP;
		  instructionsetorder[135]:= patEXTENDMS_EXTENDMS;
		  instructionsetorder[136]:= patFIFGOTO_FIFGOTO;
		  instructionsetorder[137]:= patFIFGOTOgeneral_FIFGOTO;
		  instructionsetorder[138]:= patFSET_FSET;
		  instructionsetorder[139]:= patDPOPMS_DPOPMS;
		  instructionsetorder[140]:= patFPOPMS_FPOPMS;
		  instructionsetorder[141]:= patFISTB_FISTB;
		  instructionsetorder[142]:= patFPUSHI_FPUSHI;
		  instructionsetorder[143]:= patFPUSHD_FPUSHD;
		  instructionsetorder[144]:= patFPUSHF_FPUSHF;
		  instructionsetorder[145]:= patPADDD_PADDD;
		  instructionsetorder[146]:= patPADDW_PADDW;
		  instructionsetorder[147]:= patPADDB_PADDB;
		  instructionsetorder[148]:= patPADDSB_PADDSB;
		  instructionsetorder[149]:= patPADDSB3_PADDSB3;
		  instructionsetorder[150]:= patPADDUSB_PADDUSB;
		  instructionsetorder[151]:= patPADDUB_PADDUB;
		  instructionsetorder[152]:= patSPADDSB_SPADDSB;
		  instructionsetorder[153]:= patSPADDUSB_SPADDUSB;
		  instructionsetorder[154]:= patSPADDUB_SPADDUB;
		  instructionsetorder[155]:= patPACKSSDW_PACKSSDW;
		  instructionsetorder[156]:= patPACKSSWB_PACKSSWB;
		  instructionsetorder[157]:= patPACKUSWB_PACKUSWB;
		  instructionsetorder[158]:= patCMPEQB_CMPEQB;
		  instructionsetorder[159]:= patCMPGTB_CMPGTB;
		  instructionsetorder[160]:= patCMPGTBR_CMPGTBR;
		  instructionsetorder[161]:= patSPSUBD_SPSUBD;
		  instructionsetorder[162]:= patPSUBW_PSUBW;
		  instructionsetorder[163]:= patPSUBB_PSUBB;
		  instructionsetorder[164]:= patPSUBSB_PSUBSB;
		  instructionsetorder[165]:= patPSUBUSB_PSUBUSB;
		  instructionsetorder[166]:= patPSUBUB_PSUBUB;
		  instructionsetorder[167]:= patPOR_POR;
		  instructionsetorder[168]:= patPAND_PAND;
		  instructionsetorder[169]:= patPANDN_PANDN;
		  instructionsetorder[170]:= patPMULLSSB_PMULLSSB;
		  instructionsetorder[171]:= patPMULLW_PMULLW;
		  instructionsetorder[172]:= patMOVDS_MOVDS;
		  instructionsetorder[173]:= patMOVDL_MOVDL;
		  instructionsetorder[174]:= patMOVQS_MOVQS;
		  instructionsetorder[175]:= patMOVQL_MOVQL;
		  instructionsetorder[176]:= patMOVQLR_MOVQLR;
		  instructionsetorder[177]:= patMOVOCTUINTS_MOVOCTUINTS;
		  instructionsetorder[178]:= patMOVOCTUINTL_MOVOCTUINTL;
		  instructionsetorder[179]:= patREP2_REP2;
		  instructionsetorder[180]:= patREP4_REP4;
		  instructionsetorder[181]:= patREP8_REP8;
		  instructionsetorder[182]:= patMMXPUSH_MMXPUSH;
		  instructionsetorder[183]:= patMOVQR_MOVQR;
		{ generated by Ilcp }
		fp:=regEBP_EBPcode;registers[fp].permanentlyreserved:=true;
		{ initialises the flags declared in the cpu description }
		flags[realLitSupported]:= 0;
			lastalt:=282;
		end.

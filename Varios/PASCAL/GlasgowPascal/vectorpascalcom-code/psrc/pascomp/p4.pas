		unit P4;
 interface uses ilcp;
		{$i P400.pas }
		{$i P401.pas }
		{$i P402.pas }
		{$i P403.pas }
		{$i P412.pas }
		implementation 
		{$i P410.pas }
		{$i P411.pas }
		{$i P413.pas }
		begin
		 predecp;
		alternatives[0]:=patword_;
		alternatives[1]:=pathalfword_;
		alternatives[2]:=patoctet_;
		lastalt:=2;
		new(patoplen_);
		patoplen_^.meaning:=pAAlternativesPatterndecl67_AAP67;
		patoplen_^.matchedassembler:=nil;
		patoplen_^.params :=nil;
			new(patEADX_EADX);
		new(	patEADX_EADX^.meaning);
		new(	patEADX_EADX^.matchedassembler);
			patEADX_EADX^.meaning^.tag:=reg;
			patEADX_EADX^.meaning^.index:=regEADX_EADXcode;
			patEADX_EADX^.params:=nil;
			patEADX_EADX^.matchedassembler:=string2printlist('eadx');
			registers[regEADX_EADXcode].format:=(0+fref+fsigned+3);
			registers[regEADX_EADXcode].printsas:='eadx';
			registers[regEADX_EADXcode].permanentlyreserved:=false;
			registers[regEADX_EADXcode].code:=regEADX_EADXcode;
			registers[regEADX_EADXcode].basecode:=[0..7];
			registers[1].format:=(0+fref+fsigned+2);
			registers[1].printsas:='eax';
			registers[1].permanentlyreserved:=false;
			registers[1].code:=regEAX_EAXcode;
			registers[1].basecode:=[(regEADX_EADXcode+0)..(regEADX_EADXcode+0)+3];
			new(patEAX_EAX);
		new(	patEAX_EAX^.meaning);
		new(	patEAX_EAX^.matchedassembler);
			patEAX_EAX^.meaning^.tag:=reg;
			patEAX_EAX^.meaning^.index:=regEAX_EAXcode;
			patEAX_EAX^.params:=nil;
			patEAX_EAX^.matchedassembler:=string2printlist('eax');
			registers[2].format:=(0+fref+fsigned+2);
			registers[2].printsas:='edx';
			registers[2].permanentlyreserved:=false;
			registers[2].code:=regEDX_EDXcode;
			registers[2].basecode:=[(regEADX_EADXcode+4)..(regEADX_EADXcode+4)+3];
			new(patEDX_EDX);
		new(	patEDX_EDX^.meaning);
		new(	patEDX_EDX^.matchedassembler);
			patEDX_EDX^.meaning^.tag:=reg;
			patEDX_EDX^.meaning^.index:=regEDX_EDXcode;
			patEDX_EDX^.params:=nil;
			patEDX_EDX^.matchedassembler:=string2printlist('edx');
			registers[3].format:=(0+fref+funsigned+3);
			registers[3].printsas:='eadx';
			registers[3].permanentlyreserved:=false;
			registers[3].code:=regEADXu_EADXcode;
			registers[3].basecode:=[(regEADX_EADXcode+0)..(regEADX_EADXcode+0)+7];
			new(patEADXu_EADX);
		new(	patEADXu_EADX^.meaning);
		new(	patEADXu_EADX^.matchedassembler);
			patEADXu_EADX^.meaning^.tag:=reg;
			patEADXu_EADX^.meaning^.index:=regEADXu_EADXcode;
			patEADXu_EADX^.params:=nil;
			patEADXu_EADX^.matchedassembler:=string2printlist('eadx');
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
			registers[regECX_ECXcode].basecode:=[8..11];
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
			registers[regEBX_EBXcode].basecode:=[12..15];
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
			registers[regEBP_EBPcode].basecode:=[16..19];
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
			registers[regESP_ESPcode].basecode:=[20..23];
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
			registers[regESI_ESIcode].basecode:=[24..27];
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
			registers[regEDI_EDIcode].basecode:=[28..31];
			registers[10].format:=(0+fref+funsigned+2);
			registers[10].printsas:='eax';
			registers[10].permanentlyreserved:=false;
			registers[10].code:=reguax_code;
			registers[10].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+3];
			new(patuax_);
		new(	patuax_^.meaning);
		new(	patuax_^.matchedassembler);
			patuax_^.meaning^.tag:=reg;
			patuax_^.meaning^.index:=reguax_code;
			patuax_^.params:=nil;
			patuax_^.matchedassembler:=string2printlist('eax');
			registers[11].format:=(0+fref+funsigned+2);
			registers[11].printsas:='ecx';
			registers[11].permanentlyreserved:=false;
			registers[11].code:=regucx_code;
			registers[11].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+3];
			new(patucx_);
		new(	patucx_^.meaning);
		new(	patucx_^.matchedassembler);
			patucx_^.meaning^.tag:=reg;
			patucx_^.meaning^.index:=regucx_code;
			patucx_^.params:=nil;
			patucx_^.matchedassembler:=string2printlist('ecx');
			registers[12].format:=(0+fref+funsigned+2);
			registers[12].printsas:='ebx';
			registers[12].permanentlyreserved:=false;
			registers[12].code:=regubx_code;
			registers[12].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+3];
			new(patubx_);
		new(	patubx_^.meaning);
		new(	patubx_^.matchedassembler);
			patubx_^.meaning^.tag:=reg;
			patubx_^.meaning^.index:=regubx_code;
			patubx_^.params:=nil;
			patubx_^.matchedassembler:=string2printlist('ebx');
			registers[13].format:=(0+fref+funsigned+2);
			registers[13].printsas:='esi';
			registers[13].permanentlyreserved:=false;
			registers[13].code:=regusi_code;
			registers[13].basecode:=[(regESI_ESIcode+0)..(regESI_ESIcode+0)+3];
			new(patusi_);
		new(	patusi_^.meaning);
		new(	patusi_^.matchedassembler);
			patusi_^.meaning^.tag:=reg;
			patusi_^.meaning^.index:=regusi_code;
			patusi_^.params:=nil;
			patusi_^.matchedassembler:=string2printlist('esi');
			registers[14].format:=(0+fref+funsigned+2);
			registers[14].printsas:='edi';
			registers[14].permanentlyreserved:=false;
			registers[14].code:=regudi_code;
			registers[14].basecode:=[(regEDI_EDIcode+0)..(regEDI_EDIcode+0)+3];
			new(patudi_);
		new(	patudi_^.meaning);
		new(	patudi_^.matchedassembler);
			patudi_^.meaning^.tag:=reg;
			patudi_^.meaning^.index:=regudi_code;
			patudi_^.params:=nil;
			patudi_^.matchedassembler:=string2printlist('edi');
			registers[15].format:=(0+fref+funsigned+2);
			registers[15].printsas:='edx';
			registers[15].permanentlyreserved:=false;
			registers[15].code:=regudx_code;
			registers[15].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+3];
			new(patudx_);
		new(	patudx_^.meaning);
		new(	patudx_^.matchedassembler);
			patudx_^.meaning^.tag:=reg;
			patudx_^.meaning^.index:=regudx_code;
			patudx_^.params:=nil;
			patudx_^.matchedassembler:=string2printlist('edx');
			registers[16].format:=(0+fref+fsigned+0);
			registers[16].printsas:='al';
			registers[16].permanentlyreserved:=false;
			registers[16].code:=regAL_ALcode;
			registers[16].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+0];
			new(patAL_AL);
		new(	patAL_AL^.meaning);
		new(	patAL_AL^.matchedassembler);
			patAL_AL^.meaning^.tag:=reg;
			patAL_AL^.meaning^.index:=regAL_ALcode;
			patAL_AL^.params:=nil;
			patAL_AL^.matchedassembler:=string2printlist('al');
			registers[17].format:=(0+fref+fsigned+0);
			registers[17].printsas:='bl';
			registers[17].permanentlyreserved:=false;
			registers[17].code:=regBL_BLcode;
			registers[17].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+0];
			new(patBL_BL);
		new(	patBL_BL^.meaning);
		new(	patBL_BL^.matchedassembler);
			patBL_BL^.meaning^.tag:=reg;
			patBL_BL^.meaning^.index:=regBL_BLcode;
			patBL_BL^.params:=nil;
			patBL_BL^.matchedassembler:=string2printlist('bl');
			registers[18].format:=(0+fref+fsigned+0);
			registers[18].printsas:='cl';
			registers[18].permanentlyreserved:=false;
			registers[18].code:=regCL_CLcode;
			registers[18].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+0];
			new(patCL_CL);
		new(	patCL_CL^.meaning);
		new(	patCL_CL^.matchedassembler);
			patCL_CL^.meaning^.tag:=reg;
			patCL_CL^.meaning^.index:=regCL_CLcode;
			patCL_CL^.params:=nil;
			patCL_CL^.matchedassembler:=string2printlist('cl');
			registers[19].format:=(0+fref+fsigned+0);
			registers[19].printsas:='dl';
			registers[19].permanentlyreserved:=false;
			registers[19].code:=regDL_DLcode;
			registers[19].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+0];
			new(patDL_DL);
		new(	patDL_DL^.meaning);
		new(	patDL_DL^.matchedassembler);
			patDL_DL^.meaning^.tag:=reg;
			patDL_DL^.meaning^.index:=regDL_DLcode;
			patDL_DL^.params:=nil;
			patDL_DL^.matchedassembler:=string2printlist('dl');
			registers[20].format:=(0+fref+fsigned+0);
			registers[20].printsas:='bh';
			registers[20].permanentlyreserved:=false;
			registers[20].code:=regiBH_BHcode;
			registers[20].basecode:=[(regEBX_EBXcode+1)..(regEBX_EBXcode+1)+0];
			new(patiBH_BH);
		new(	patiBH_BH^.meaning);
		new(	patiBH_BH^.matchedassembler);
			patiBH_BH^.meaning^.tag:=reg;
			patiBH_BH^.meaning^.index:=regiBH_BHcode;
			patiBH_BH^.params:=nil;
			patiBH_BH^.matchedassembler:=string2printlist('bh');
			registers[21].format:=(0+fref+fsigned+0);
			registers[21].printsas:='ch';
			registers[21].permanentlyreserved:=false;
			registers[21].code:=regiCH_CHcode;
			registers[21].basecode:=[(regECX_ECXcode+1)..(regECX_ECXcode+1)+0];
			new(patiCH_CH);
		new(	patiCH_CH^.meaning);
		new(	patiCH_CH^.matchedassembler);
			patiCH_CH^.meaning^.tag:=reg;
			patiCH_CH^.meaning^.index:=regiCH_CHcode;
			patiCH_CH^.params:=nil;
			patiCH_CH^.matchedassembler:=string2printlist('ch');
			registers[22].format:=(0+fref+fsigned+0);
			registers[22].printsas:='dh';
			registers[22].permanentlyreserved:=false;
			registers[22].code:=regiDH_DHcode;
			registers[22].basecode:=[(regEDX_EDXcode+1)..(regEDX_EDXcode+1)+0];
			new(patiDH_DH);
		new(	patiDH_DH^.meaning);
		new(	patiDH_DH^.matchedassembler);
			patiDH_DH^.meaning^.tag:=reg;
			patiDH_DH^.meaning^.index:=regiDH_DHcode;
			patiDH_DH^.params:=nil;
			patiDH_DH^.matchedassembler:=string2printlist('dh');
			registers[23].format:=(0+fref+funsigned+0);
			registers[23].printsas:='bh';
			registers[23].permanentlyreserved:=false;
			registers[23].code:=regBH_BHcode;
			registers[23].basecode:=[(regEBX_EBXcode+1)..(regEBX_EBXcode+1)+0];
			new(patBH_BH);
		new(	patBH_BH^.meaning);
		new(	patBH_BH^.matchedassembler);
			patBH_BH^.meaning^.tag:=reg;
			patBH_BH^.meaning^.index:=regBH_BHcode;
			patBH_BH^.params:=nil;
			patBH_BH^.matchedassembler:=string2printlist('bh');
			registers[24].format:=(0+fref+funsigned+0);
			registers[24].printsas:='ch';
			registers[24].permanentlyreserved:=false;
			registers[24].code:=regCH_CHcode;
			registers[24].basecode:=[(regECX_ECXcode+1)..(regECX_ECXcode+1)+0];
			new(patCH_CH);
		new(	patCH_CH^.meaning);
		new(	patCH_CH^.matchedassembler);
			patCH_CH^.meaning^.tag:=reg;
			patCH_CH^.meaning^.index:=regCH_CHcode;
			patCH_CH^.params:=nil;
			patCH_CH^.matchedassembler:=string2printlist('ch');
			registers[25].format:=(0+fref+funsigned+0);
			registers[25].printsas:='dh';
			registers[25].permanentlyreserved:=false;
			registers[25].code:=regDH_DHcode;
			registers[25].basecode:=[(regEDX_EDXcode+1)..(regEDX_EDXcode+1)+0];
			new(patDH_DH);
		new(	patDH_DH^.meaning);
		new(	patDH_DH^.matchedassembler);
			patDH_DH^.meaning^.tag:=reg;
			patDH_DH^.meaning^.index:=regDH_DHcode;
			patDH_DH^.params:=nil;
			patDH_DH^.matchedassembler:=string2printlist('dh');
			registers[26].format:=(0+fref+funsigned+0);
			registers[26].printsas:='al';
			registers[26].permanentlyreserved:=false;
			registers[26].code:=reguAL_ALcode;
			registers[26].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+0];
			new(patuAL_AL);
		new(	patuAL_AL^.meaning);
		new(	patuAL_AL^.matchedassembler);
			patuAL_AL^.meaning^.tag:=reg;
			patuAL_AL^.meaning^.index:=reguAL_ALcode;
			patuAL_AL^.params:=nil;
			patuAL_AL^.matchedassembler:=string2printlist('al');
			registers[27].format:=(0+fref+funsigned+0);
			registers[27].printsas:='bl';
			registers[27].permanentlyreserved:=false;
			registers[27].code:=reguBL_BLcode;
			registers[27].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+0];
			new(patuBL_BL);
		new(	patuBL_BL^.meaning);
		new(	patuBL_BL^.matchedassembler);
			patuBL_BL^.meaning^.tag:=reg;
			patuBL_BL^.meaning^.index:=reguBL_BLcode;
			patuBL_BL^.params:=nil;
			patuBL_BL^.matchedassembler:=string2printlist('bl');
			registers[28].format:=(0+fref+funsigned+0);
			registers[28].printsas:='cl';
			registers[28].permanentlyreserved:=false;
			registers[28].code:=reguCL_CLcode;
			registers[28].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+0];
			new(patuCL_CL);
		new(	patuCL_CL^.meaning);
		new(	patuCL_CL^.matchedassembler);
			patuCL_CL^.meaning^.tag:=reg;
			patuCL_CL^.meaning^.index:=reguCL_CLcode;
			patuCL_CL^.params:=nil;
			patuCL_CL^.matchedassembler:=string2printlist('cl');
			registers[29].format:=(0+fref+funsigned+0);
			registers[29].printsas:='dl';
			registers[29].permanentlyreserved:=false;
			registers[29].code:=reguDL_DLcode;
			registers[29].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+0];
			new(patuDL_DL);
		new(	patuDL_DL^.meaning);
		new(	patuDL_DL^.matchedassembler);
			patuDL_DL^.meaning^.tag:=reg;
			patuDL_DL^.meaning^.index:=reguDL_DLcode;
			patuDL_DL^.params:=nil;
			patuDL_DL^.matchedassembler:=string2printlist('dl');
			registers[30].format:=(0+fref+0);
			registers[30].printsas:='al';
			registers[30].permanentlyreserved:=false;
			registers[30].code:=regoAL_ALcode;
			registers[30].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+0];
			new(patoAL_AL);
		new(	patoAL_AL^.meaning);
		new(	patoAL_AL^.matchedassembler);
			patoAL_AL^.meaning^.tag:=reg;
			patoAL_AL^.meaning^.index:=regoAL_ALcode;
			patoAL_AL^.params:=nil;
			patoAL_AL^.matchedassembler:=string2printlist('al');
			registers[31].format:=(0+fref+0);
			registers[31].printsas:='bl';
			registers[31].permanentlyreserved:=false;
			registers[31].code:=regoBL_BLcode;
			registers[31].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+0];
			new(patoBL_BL);
		new(	patoBL_BL^.meaning);
		new(	patoBL_BL^.matchedassembler);
			patoBL_BL^.meaning^.tag:=reg;
			patoBL_BL^.meaning^.index:=regoBL_BLcode;
			patoBL_BL^.params:=nil;
			patoBL_BL^.matchedassembler:=string2printlist('bl');
			registers[32].format:=(0+fref+0);
			registers[32].printsas:='cl';
			registers[32].permanentlyreserved:=false;
			registers[32].code:=regoCL_CLcode;
			registers[32].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+0];
			new(patoCL_CL);
		new(	patoCL_CL^.meaning);
		new(	patoCL_CL^.matchedassembler);
			patoCL_CL^.meaning^.tag:=reg;
			patoCL_CL^.meaning^.index:=regoCL_CLcode;
			patoCL_CL^.params:=nil;
			patoCL_CL^.matchedassembler:=string2printlist('cl');
			registers[33].format:=(0+fref+0);
			registers[33].printsas:='dl';
			registers[33].permanentlyreserved:=false;
			registers[33].code:=regoDL_DLcode;
			registers[33].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+0];
			new(patoDL_DL);
		new(	patoDL_DL^.meaning);
		new(	patoDL_DL^.matchedassembler);
			patoDL_DL^.meaning^.tag:=reg;
			patoDL_DL^.meaning^.index:=regoDL_DLcode;
			patoDL_DL^.params:=nil;
			patoDL_DL^.matchedassembler:=string2printlist('dl');
			registers[34].format:=(0+fref+fsigned+1);
			registers[34].printsas:='ax';
			registers[34].permanentlyreserved:=false;
			registers[34].code:=regAX_AXcode;
			registers[34].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+1];
			new(patAX_AX);
		new(	patAX_AX^.meaning);
		new(	patAX_AX^.matchedassembler);
			patAX_AX^.meaning^.tag:=reg;
			patAX_AX^.meaning^.index:=regAX_AXcode;
			patAX_AX^.params:=nil;
			patAX_AX^.matchedassembler:=string2printlist('ax');
			registers[35].format:=(0+fref+fsigned+1);
			registers[35].printsas:='bx';
			registers[35].permanentlyreserved:=false;
			registers[35].code:=regBX_BXcode;
			registers[35].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+1];
			new(patBX_BX);
		new(	patBX_BX^.meaning);
		new(	patBX_BX^.matchedassembler);
			patBX_BX^.meaning^.tag:=reg;
			patBX_BX^.meaning^.index:=regBX_BXcode;
			patBX_BX^.params:=nil;
			patBX_BX^.matchedassembler:=string2printlist('bx');
			registers[36].format:=(0+fref+fsigned+1);
			registers[36].printsas:='dx';
			registers[36].permanentlyreserved:=false;
			registers[36].code:=regDX_DXcode;
			registers[36].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+1];
			new(patDX_DX);
		new(	patDX_DX^.meaning);
		new(	patDX_DX^.matchedassembler);
			patDX_DX^.meaning^.tag:=reg;
			patDX_DX^.meaning^.index:=regDX_DXcode;
			patDX_DX^.params:=nil;
			patDX_DX^.matchedassembler:=string2printlist('dx');
			registers[37].format:=(0+fref+fsigned+1);
			registers[37].printsas:='cx';
			registers[37].permanentlyreserved:=false;
			registers[37].code:=regCX_CXcode;
			registers[37].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+1];
			new(patCX_CX);
		new(	patCX_CX^.meaning);
		new(	patCX_CX^.matchedassembler);
			patCX_CX^.meaning^.tag:=reg;
			patCX_CX^.meaning^.index:=regCX_CXcode;
			patCX_CX^.params:=nil;
			patCX_CX^.matchedassembler:=string2printlist('cx');
			registers[38].format:=(0+fref+funsigned+1);
			registers[38].printsas:='ax';
			registers[38].permanentlyreserved:=false;
			registers[38].code:=reguAX_AXcode;
			registers[38].basecode:=[(regEAX_EAXcode+0)..(regEAX_EAXcode+0)+1];
			new(patuAX_AX);
		new(	patuAX_AX^.meaning);
		new(	patuAX_AX^.matchedassembler);
			patuAX_AX^.meaning^.tag:=reg;
			patuAX_AX^.meaning^.index:=reguAX_AXcode;
			patuAX_AX^.params:=nil;
			patuAX_AX^.matchedassembler:=string2printlist('ax');
			registers[39].format:=(0+fref+funsigned+1);
			registers[39].printsas:='bx';
			registers[39].permanentlyreserved:=false;
			registers[39].code:=reguBX_BXcode;
			registers[39].basecode:=[(regEBX_EBXcode+0)..(regEBX_EBXcode+0)+1];
			new(patuBX_BX);
		new(	patuBX_BX^.meaning);
		new(	patuBX_BX^.matchedassembler);
			patuBX_BX^.meaning^.tag:=reg;
			patuBX_BX^.meaning^.index:=reguBX_BXcode;
			patuBX_BX^.params:=nil;
			patuBX_BX^.matchedassembler:=string2printlist('bx');
			registers[40].format:=(0+fref+funsigned+1);
			registers[40].printsas:='dx';
			registers[40].permanentlyreserved:=false;
			registers[40].code:=reguDX_DXcode;
			registers[40].basecode:=[(regEDX_EDXcode+0)..(regEDX_EDXcode+0)+1];
			new(patuDX_DX);
		new(	patuDX_DX^.meaning);
		new(	patuDX_DX^.matchedassembler);
			patuDX_DX^.meaning^.tag:=reg;
			patuDX_DX^.meaning^.index:=reguDX_DXcode;
			patuDX_DX^.params:=nil;
			patuDX_DX^.matchedassembler:=string2printlist('dx');
			registers[41].format:=(0+fref+funsigned+1);
			registers[41].printsas:='cx';
			registers[41].permanentlyreserved:=false;
			registers[41].code:=reguCX_CXcode;
			registers[41].basecode:=[(regECX_ECXcode+0)..(regECX_ECXcode+0)+1];
			new(patuCX_CX);
		new(	patuCX_CX^.meaning);
		new(	patuCX_CX^.matchedassembler);
			patuCX_CX^.meaning^.tag:=reg;
			patuCX_CX^.meaning^.index:=reguCX_CXcode;
			patuCX_CX^.params:=nil;
			patuCX_CX^.matchedassembler:=string2printlist('cx');
			registers[42].format:=(0+fref+1);
			registers[42].printsas:='si';
			registers[42].permanentlyreserved:=false;
			registers[42].code:=regSI_SIcode;
			registers[42].basecode:=[(regESI_ESIcode+0)..(regESI_ESIcode+0)+1];
			new(patSI_SI);
		new(	patSI_SI^.meaning);
		new(	patSI_SI^.matchedassembler);
			patSI_SI^.meaning^.tag:=reg;
			patSI_SI^.meaning^.index:=regSI_SIcode;
			patSI_SI^.params:=nil;
			patSI_SI^.matchedassembler:=string2printlist('si');
			registers[43].format:=(0+fref+1);
			registers[43].printsas:='di';
			registers[43].permanentlyreserved:=false;
			registers[43].code:=regDI_DIcode;
			registers[43].basecode:=[(regEDI_EDIcode+0)..(regEDI_EDIcode+0)+1];
			new(patDI_DI);
		new(	patDI_DI^.meaning);
		new(	patDI_DI^.matchedassembler);
			patDI_DI^.meaning^.tag:=reg;
			patDI_DI^.meaning^.index:=regDI_DIcode;
			patDI_DI^.params:=nil;
			patDI_DI^.matchedassembler:=string2printlist('di');
			new(patregutil0_0);
		new(	patregutil0_0^.meaning);
		new(	patregutil0_0^.matchedassembler);
			patregutil0_0^.meaning^.tag:=reg;
			patregutil0_0^.meaning^.index:=regregutil0_0code;
			patregutil0_0^.params:=nil;
			patregutil0_0^.matchedassembler:=string2printlist('dword[regutil0]');
			registers[regregutil0_0code].format:=(0+fref+2);
			registers[regregutil0_0code].printsas:='dword[regutil0]';
			registers[regregutil0_0code].permanentlyreserved:=false;
			registers[regregutil0_0code].code:=regregutil0_0code;
			registers[regregutil0_0code].basecode:=[32..35];
			new(patregutil1_1);
		new(	patregutil1_1^.meaning);
		new(	patregutil1_1^.matchedassembler);
			patregutil1_1^.meaning^.tag:=reg;
			patregutil1_1^.meaning^.index:=regregutil1_1code;
			patregutil1_1^.params:=nil;
			patregutil1_1^.matchedassembler:=string2printlist('dword[regutil1]');
			registers[regregutil1_1code].format:=(0+fref+2);
			registers[regregutil1_1code].printsas:='dword[regutil1]';
			registers[regregutil1_1code].permanentlyreserved:=false;
			registers[regregutil1_1code].code:=regregutil1_1code;
			registers[regregutil1_1code].basecode:=[36..39];
			registers[46].format:=(0+fref+fsigned+2);
			registers[46].printsas:='dword[regutil0]';
			registers[46].permanentlyreserved:=false;
			registers[46].code:=regrui0_0code;
			registers[46].basecode:=[(regregutil0_0code+0)..(regregutil0_0code+0)+3];
			new(patrui0_0);
		new(	patrui0_0^.meaning);
		new(	patrui0_0^.matchedassembler);
			patrui0_0^.meaning^.tag:=reg;
			patrui0_0^.meaning^.index:=regrui0_0code;
			patrui0_0^.params:=nil;
			patrui0_0^.matchedassembler:=string2printlist('dword[regutil0]');
			registers[47].format:=(0+fref+fsigned+2);
			registers[47].printsas:='dword[regutil0]';
			registers[47].permanentlyreserved:=false;
			registers[47].code:=regrui1_1code;
			registers[47].basecode:=[(regregutil1_1code+0)..(regregutil1_1code+0)+3];
			new(patrui1_1);
		new(	patrui1_1^.meaning);
		new(	patrui1_1^.matchedassembler);
			patrui1_1^.meaning^.tag:=reg;
			patrui1_1^.meaning^.index:=regrui1_1code;
			patrui1_1^.params:=nil;
			patrui1_1^.matchedassembler:=string2printlist('dword[regutil0]');
		alternatives[3]:=patregutil0_0;
		alternatives[4]:=patregutil1_1;
		lastalt:=4;
		new(patrug_);
		patrug_^.meaning:=pAAlternativesPatterndecl482_AAP482;
		patrug_^.matchedassembler:=nil;
		patrug_^.params :=nil;
		alternatives[5]:=patrui0_0;
		alternatives[6]:=patrui1_1;
		lastalt:=6;
		new(patrui_);
		patrui_^.meaning:=pAAlternativesPatterndecl489_AAP489;
		patrui_^.matchedassembler:=nil;
		patrui_^.params :=nil;
		alternatives[7]:=patrui_;
		alternatives[8]:=patrug_;
		lastalt:=8;
		new(patru_);
		patru_^.meaning:=pAAlternativesPatterndecl496_AAP496;
		patru_^.matchedassembler:=nil;
		patru_^.params :=nil;
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
		alternatives[9]:=patEDI_EDI;
		alternatives[10]:=patESI_ESI;
		alternatives[11]:=patEBX_EBX;
		alternatives[12]:=patEBP_EBP;
		alternatives[13]:=patESP_ESP;
		alternatives[14]:=patEAX_EAX;
		alternatives[15]:=patEDX_EDX;
		alternatives[16]:=patECX_ECX;
		lastalt:=16;
		new(patindexreg_);
		patindexreg_^.meaning:=pAAlternativesPatterndecl514_AAP514;
		patindexreg_^.matchedassembler:=nil;
		patindexreg_^.params :=nil;
		alternatives[17]:=patEAX_EAX;
		alternatives[18]:=patEDX_EDX;
		alternatives[19]:=patECX_ECX;
		alternatives[20]:=patEBX_EBX;
		lastalt:=20;
		new(pataccumulators_);
		pataccumulators_^.meaning:=pAAlternativesPatterndecl533_AAP533;
		pataccumulators_^.matchedassembler:=nil;
		pataccumulators_^.params :=nil;
		alternatives[21]:=patindexreg_;
		lastalt:=21;
		new(patireg_);
		patireg_^.meaning:=pAAlternativesPatterndecl544_AAP544;
		patireg_^.matchedassembler:=nil;
		patireg_^.params :=nil;
		alternatives[22]:=patubx_;
		alternatives[23]:=patudi_;
		alternatives[24]:=patusi_;
		alternatives[25]:=patudx_;
		alternatives[26]:=patESP_ESP;
		alternatives[27]:=patucx_;
		alternatives[28]:=patEBP_EBP;
		alternatives[29]:=patuax_;
		lastalt:=29;
		new(patureg_);
		patureg_^.meaning:=pAAlternativesPatterndecl549_AAP549;
		patureg_^.matchedassembler:=nil;
		patureg_^.params :=nil;
		alternatives[30]:=patireg_;
		alternatives[31]:=patureg_;
		lastalt:=31;
		new(patreg_);
		patreg_^.meaning:=pAAlternativesPatterndecl568_AAP568;
		patreg_^.matchedassembler:=nil;
		patreg_^.params :=nil;
		alternatives[32]:=patBL_BL;
		alternatives[33]:=patDL_DL;
		alternatives[34]:=patAL_AL;
		alternatives[35]:=patiBH_BH;
		alternatives[36]:=patiDH_DH;
		alternatives[37]:=patiCH_CH;
		alternatives[38]:=patCL_CL;
		lastalt:=38;
		new(patbireg_);
		patbireg_^.meaning:=pAAlternativesPatterndecl575_AAP575;
		patbireg_^.matchedassembler:=nil;
		patbireg_^.params :=nil;
		alternatives[39]:=patBH_BH;
		alternatives[40]:=patDH_DH;
		alternatives[41]:=patuAL_AL;
		alternatives[42]:=patuBL_BL;
		alternatives[43]:=patuDL_DL;
		alternatives[44]:=patuCL_CL;
		alternatives[45]:=patCH_CH;
		lastalt:=45;
		new(patbureg_);
		patbureg_^.meaning:=pAAlternativesPatterndecl592_AAP592;
		patbureg_^.matchedassembler:=nil;
		patbureg_^.params :=nil;
		alternatives[46]:=patoBL_BL;
		alternatives[47]:=patoAL_AL;
		alternatives[48]:=patoDL_DL;
		alternatives[49]:=patoCL_CL;
		lastalt:=49;
		new(patboreg_);
		patboreg_^.meaning:=pAAlternativesPatterndecl609_AAP609;
		patboreg_^.matchedassembler:=nil;
		patboreg_^.params :=nil;
		alternatives[50]:=patAL_AL;
		lastalt:=50;
		new(patbacc_);
		patbacc_^.meaning:=pAAlternativesPatterndecl620_AAP620;
		patbacc_^.matchedassembler:=nil;
		patbacc_^.params :=nil;
		alternatives[51]:=patBL_BL;
		alternatives[52]:=patCL_CL;
		alternatives[53]:=patDL_DL;
		lastalt:=53;
		new(patbnonacc_);
		patbnonacc_^.meaning:=pAAlternativesPatterndecl625_AAP625;
		patbnonacc_^.matchedassembler:=nil;
		patbnonacc_^.params :=nil;
		alternatives[54]:=patbireg_;
		alternatives[55]:=patbnonacc_;
		alternatives[56]:=patbureg_;
		alternatives[57]:=patboreg_;
		alternatives[58]:=patbacc_;
		lastalt:=58;
		new(patbreg_);
		patbreg_^.meaning:=pAAlternativesPatterndecl634_AAP634;
		patbreg_^.matchedassembler:=nil;
		patbreg_^.params :=nil;
		alternatives[59]:=patBX_BX;
		alternatives[60]:=patCX_CX;
		alternatives[61]:=patDX_DX;
		alternatives[62]:=patAX_AX;
		lastalt:=62;
		new(patswreg_);
		patswreg_^.meaning:=pAAlternativesPatterndecl647_AAP647;
		patswreg_^.matchedassembler:=nil;
		patswreg_^.params :=nil;
		alternatives[63]:=patuBX_BX;
		alternatives[64]:=patuCX_CX;
		alternatives[65]:=patuDX_DX;
		lastalt:=65;
		new(patuwreg_);
		patuwreg_^.meaning:=pAAlternativesPatterndecl658_AAP658;
		patuwreg_^.matchedassembler:=nil;
		patuwreg_^.params :=nil;
		alternatives[66]:=patSI_SI;
		alternatives[67]:=patDI_DI;
		lastalt:=67;
		new(patuntypedwreg_);
		patuntypedwreg_^.meaning:=pAAlternativesPatterndecl667_AAP667;
		patuntypedwreg_^.matchedassembler:=nil;
		patuntypedwreg_^.params :=nil;
		alternatives[68]:=patswreg_;
		alternatives[69]:=patuwreg_;
		alternatives[70]:=patuntypedwreg_;
		lastalt:=70;
		new(patwreg_);
		patwreg_^.meaning:=pAAlternativesPatterndecl674_AAP674;
		patwreg_^.matchedassembler:=nil;
		patwreg_^.params :=nil;
		alternatives[71]:=patreg_;
		alternatives[72]:=patwreg_;
		lastalt:=72;
		new(patpushreg_);
		patpushreg_^.meaning:=pAAlternativesPatterndecl683_AAP683;
		patpushreg_^.matchedassembler:=nil;
		patpushreg_^.params :=nil;
		alternatives[73]:=patreg_;
		lastalt:=73;
		new(patdpushreg_);
		patdpushreg_^.meaning:=pAAlternativesPatterndecl690_AAP690;
		patdpushreg_^.matchedassembler:=nil;
		patdpushreg_^.params :=nil;
		alternatives[74]:=patbreg_;
		alternatives[75]:=patwreg_;
		alternatives[76]:=patreg_;
		lastalt:=76;
		new(patanyreg_);
		patanyreg_^.meaning:=pAAlternativesPatterndecl695_AAP695;
		patanyreg_^.matchedassembler:=nil;
		patanyreg_^.params :=nil;
		alternatives[77]:=patbireg_;
		alternatives[78]:=patswreg_;
		alternatives[79]:=patireg_;
		lastalt:=79;
		new(patsignedreg_);
		patsignedreg_^.meaning:=pAAlternativesPatterndecl704_AAP704;
		patsignedreg_^.matchedassembler:=nil;
		patsignedreg_^.params :=nil;
		alternatives[80]:=patbureg_;
		alternatives[81]:=patureg_;
		alternatives[82]:=patuwreg_;
		alternatives[83]:=patureg_;
		lastalt:=83;
		new(patunsignedreg_);
		patunsignedreg_^.meaning:=pAAlternativesPatterndecl713_AAP713;
		patunsignedreg_^.matchedassembler:=nil;
		patunsignedreg_^.params :=nil;
		alternatives[84]:=patEAX_EAX;
		lastalt:=84;
		new(patacc_);
		patacc_^.meaning:=pAAlternativesPatterndecl724_AAP724;
		patacc_^.matchedassembler:=nil;
		patacc_^.params :=nil;
		alternatives[85]:=patEADX_EADX;
		lastalt:=85;
		new(patqacc_);
		patqacc_^.meaning:=pAAlternativesPatterndecl729_AAP729;
		patqacc_^.matchedassembler:=nil;
		patqacc_^.params :=nil;
		alternatives[86]:=patEDX_EDX;
		lastalt:=86;
		new(patdacc_);
		patdacc_^.meaning:=pAAlternativesPatterndecl734_AAP734;
		patdacc_^.matchedassembler:=nil;
		patdacc_^.params :=nil;
		alternatives[87]:=patAX_AX;
		lastalt:=87;
		new(patwacc_);
		patwacc_^.meaning:=pAAlternativesPatterndecl739_AAP739;
		patwacc_^.matchedassembler:=nil;
		patwacc_^.params :=nil;
		alternatives[88]:=patEBX_EBX;
		lastalt:=88;
		new(patebxacc_);
		patebxacc_^.meaning:=pAAlternativesPatterndecl744_AAP744;
		patebxacc_^.matchedassembler:=nil;
		patebxacc_^.params :=nil;
		alternatives[89]:=patBL_BL;
		lastalt:=89;
		new(patebxbacc_);
		patebxbacc_^.meaning:=pAAlternativesPatterndecl749_AAP749;
		patebxbacc_^.matchedassembler:=nil;
		patebxbacc_^.params :=nil;
		alternatives[90]:=patECX_ECX;
		lastalt:=90;
		new(patecxacc_);
		patecxacc_^.meaning:=pAAlternativesPatterndecl754_AAP754;
		patecxacc_^.matchedassembler:=nil;
		patecxacc_^.params :=nil;
		alternatives[91]:=patCL_CL;
		lastalt:=91;
		new(patecxbacc_);
		patecxbacc_^.meaning:=pAAlternativesPatterndecl759_AAP759;
		patecxbacc_^.matchedassembler:=nil;
		patecxbacc_^.params :=nil;
		alternatives[92]:=patucx_;
		lastalt:=92;
		new(patecxuacc_);
		patecxuacc_^.meaning:=pAAlternativesPatterndecl764_AAP764;
		patecxuacc_^.matchedassembler:=nil;
		patecxuacc_^.params :=nil;
		alternatives[93]:=patECX_ECX;
		lastalt:=93;
		new(patmodreg_);
		patmodreg_^.meaning:=pAAlternativesPatterndecl769_AAP769;
		patmodreg_^.matchedassembler:=nil;
		patmodreg_^.params :=nil;
		alternatives[94]:=patESI_ESI;
		lastalt:=94;
		new(patsourcereg_);
		patsourcereg_^.meaning:=pAAlternativesPatterndecl774_AAP774;
		patsourcereg_^.matchedassembler:=nil;
		patsourcereg_^.params :=nil;
		alternatives[95]:=patEDI_EDI;
		lastalt:=95;
		new(patdestreg_);
		patdestreg_^.meaning:=pAAlternativesPatterndecl779_AAP779;
		patdestreg_^.matchedassembler:=nil;
		patdestreg_^.params :=nil;
		alternatives[96]:=patECX_ECX;
		lastalt:=96;
		new(patcountreg_);
		patcountreg_^.meaning:=pAAlternativesPatterndecl784_AAP784;
		patcountreg_^.matchedassembler:=nil;
		patcountreg_^.params :=nil;
		alternatives[97]:=patEADXu_EADX;
		lastalt:=97;
		new(pateadxu_);
		pateadxu_^.meaning:=pAAlternativesPatterndecl789_AAP789;
		pateadxu_^.matchedassembler:=nil;
		pateadxu_^.params :=nil;
		alternatives[98]:=patecxbacc_;
		alternatives[99]:=patecxacc_;
		alternatives[100]:=patecxuacc_;
		lastalt:=100;
		new(patshiftcountreg_);
		patshiftcountreg_^.meaning:=pAAlternativesPatterndecl794_AAP794;
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
		alternatives[101]:=patne_;
		alternatives[102]:=patge_;
		alternatives[103]:=patle_;
		alternatives[104]:=pateq_;
		alternatives[105]:=patgt_;
		alternatives[106]:=patlt_;
		lastalt:=106;
		new(patcondition_);
		patcondition_^.meaning:=pAAlternativesPatterndecl879_AAP879;
		patcondition_^.matchedassembler:=nil;
		patcondition_^.params :=nil;
		alternatives[107]:=pateq_;
		lastalt:=107;
		new(patequals_);
		patequals_^.meaning:=pAAlternativesPatterndecl894_AAP894;
		patequals_^.matchedassembler:=nil;
		patequals_^.params :=nil;
		alternatives[108]:=patne_;
		alternatives[109]:=pateq_;
		lastalt:=109;
		new(pateqcondition_);
		pateqcondition_^.meaning:=pAAlternativesPatterndecl899_AAP899;
		pateqcondition_^.matchedassembler:=nil;
		pateqcondition_^.params :=nil;
		alternatives[110]:=patne_;
		alternatives[111]:=patae_;
		alternatives[112]:=patbe_;
		alternatives[113]:=pateq_;
		alternatives[114]:=patab_;
		alternatives[115]:=patbel_;
		lastalt:=115;
		new(patunsignedcondition_);
		patunsignedcondition_^.meaning:=pAAlternativesPatterndecl906_AAP906;
		patunsignedcondition_^.matchedassembler:=nil;
		patunsignedcondition_^.params :=nil;
		alternatives[116]:=patadd_;
		alternatives[117]:=patsub_;
		alternatives[118]:=patimul_;
		alternatives[119]:=patand_;
		alternatives[120]:=pator_;
		alternatives[121]:=patxor_;
		lastalt:=121;
		new(patoperator_);
		patoperator_^.meaning:=pAAlternativesPatterndecl921_AAP921;
		patoperator_^.matchedassembler:=nil;
		patoperator_^.params :=nil;
		alternatives[122]:=patand_;
		alternatives[123]:=pator_;
		alternatives[124]:=patxor_;
		lastalt:=124;
		new(patlogoperator_);
		patlogoperator_^.meaning:=pAAlternativesPatterndecl936_AAP936;
		patlogoperator_^.matchedassembler:=nil;
		patlogoperator_^.params :=nil;
		alternatives[125]:=patadd_;
		alternatives[126]:=patsub_;
		alternatives[127]:=patlogoperator_;
		lastalt:=127;
		new(patnonmultoperator_);
		patnonmultoperator_^.meaning:=pAAlternativesPatterndecl945_AAP945;
		patnonmultoperator_^.matchedassembler:=nil;
		patnonmultoperator_^.params :=nil;
		alternatives[128]:=patadd_;
		alternatives[129]:=patimul_;
		alternatives[130]:=patand_;
		alternatives[131]:=pator_;
		alternatives[132]:=patxor_;
		lastalt:=132;
		new(patsaddoperator_);
		patsaddoperator_^.meaning:=pAAlternativesPatterndecl954_AAP954;
		patsaddoperator_^.matchedassembler:=nil;
		patsaddoperator_^.params :=nil;
		alternatives[133]:=patshiftleft_;
		alternatives[134]:=patshiftright_;
		lastalt:=134;
		new(patshiftop_);
		patshiftop_^.meaning:=pAAlternativesPatterndecl967_AAP967;
		patshiftop_^.matchedassembler:=nil;
		patshiftop_^.params :=nil;
		alternatives[135]:=patuint32_32;
		alternatives[136]:=patuint8_8;
		alternatives[137]:=patuint16_16;
		lastalt:=137;
		new(patunsigned_);
		patunsigned_^.meaning:=pAAlternativesPatterndecl974_AAP974;
		patunsigned_^.matchedassembler:=nil;
		patunsigned_^.params :=nil;
		alternatives[138]:=patint8_8;
		alternatives[139]:=patint16_16;
		alternatives[140]:=patint32_32;
		lastalt:=140;
		new(patsigned_);
		patsigned_^.meaning:=pAAlternativesPatterndecl989_AAP989;
		patsigned_^.matchedassembler:=nil;
		patsigned_^.params :=nil;
		alternatives[141]:=patint8_8;
		alternatives[142]:=patint16_16;
		alternatives[143]:=patint32_32;
		alternatives[144]:=patuint32_32;
		alternatives[145]:=patuint8_8;
		alternatives[146]:=patuint16_16;
		lastalt:=146;
		new(patint_);
		patint_^.meaning:=pAAlternativesPatterndecl1004_AAP1004;
		patint_^.matchedassembler:=nil;
		patint_^.params :=nil;
		alternatives[147]:=patieee64_64;
		lastalt:=147;
		new(patdouble_);
		patdouble_^.meaning:=pAAlternativesPatterndecl1031_AAP1031;
		patdouble_^.matchedassembler:=nil;
		patdouble_^.params :=nil;
		alternatives[148]:=patieee32_32;
		lastalt:=148;
		new(patfloat_);
		patfloat_^.meaning:=pAAlternativesPatterndecl1037_AAP1037;
		patfloat_^.matchedassembler:=nil;
		patfloat_^.params :=nil;
		alternatives[149]:=patieee64_64;
		alternatives[150]:=patfloat_;
		lastalt:=150;
		new(patreal_);
		patreal_^.meaning:=pAAlternativesPatterndecl1043_AAP1043;
		patreal_^.matchedassembler:=nil;
		patreal_^.params :=nil;
		alternatives[151]:=patuint8_8;
		alternatives[152]:=patint8_8;
		alternatives[153]:=patoctet_;
		lastalt:=153;
		new(patbyte_);
		patbyte_^.meaning:=pAAlternativesPatterndecl1051_AAP1051;
		patbyte_^.matchedassembler:=nil;
		patbyte_^.params :=nil;
		alternatives[154]:=patint32_32;
		alternatives[155]:=patuint32_32;
		alternatives[156]:=patword_;
		lastalt:=156;
		new(patword32_32);
		patword32_32^.meaning:=pAAlternativesPatterndecl1065_AAP1065;
		patword32_32^.matchedassembler:=nil;
		patword32_32^.params :=nil;
		alternatives[157]:=patint16_16;
		alternatives[158]:=patuint16_16;
		alternatives[159]:=pathalfword_;
		lastalt:=159;
		new(patword16_16);
		patword16_16^.meaning:=pAAlternativesPatterndecl1079_AAP1079;
		patword16_16^.matchedassembler:=nil;
		patword16_16^.params :=nil;
		alternatives[160]:=patbyte_;
		alternatives[161]:=patword16_16;
		alternatives[162]:=patword32_32;
		lastalt:=162;
		new(patwordupto32_32);
		patwordupto32_32^.meaning:=pAAlternativesPatterndecl1093_AAP1093;
		patwordupto32_32^.matchedassembler:=nil;
		patwordupto32_32^.params :=nil;
		alternatives[163]:=patoctet_;
		alternatives[164]:=patword_;
		lastalt:=164;
		new(patdataformat_);
		patdataformat_^.meaning:=pAAlternativesPatterndecl1102_AAP1102;
		patdataformat_^.matchedassembler:=nil;
		patdataformat_^.params :=nil;
		alternatives[165]:=patint32_32;
		alternatives[166]:=patuint32_32;
		lastalt:=166;
		new(patlongint_);
		patlongint_^.meaning:=pAAlternativesPatterndecl1111_AAP1111;
		patlongint_^.matchedassembler:=nil;
		patlongint_^.params :=nil;
		alternatives[167]:=patint32_32;
		alternatives[168]:=patint64_64;
		alternatives[169]:=patint16_16;
		lastalt:=169;
		new(pathiint_);
		pathiint_^.meaning:=pAAlternativesPatterndecl1122_AAP1122;
		pathiint_^.matchedassembler:=nil;
		pathiint_^.params :=nil;
		new(pattwo_);
		pattwo_^.meaning:=pAValueMeaning1139_AVM1139;
		pattwo_^.matchedassembler:=pAAssemblesto1144_AA1144;
		new(pattwo_^.params);
		for i:= 1 to maxparam do pattwo_^.params^[i]:=nil;
		pattwo_^.params^[0]:=pattype_;
		 
		new(patfour_);
		patfour_^.meaning:=pAValueMeaning1153_AVM1153;
		patfour_^.matchedassembler:=pAAssemblesto1158_AA1158;
		new(patfour_^.params);
		for i:= 1 to maxparam do patfour_^.params^[i]:=nil;
		patfour_^.params^[0]:=pattype_;
		 
		new(pateight_);
		pateight_^.meaning:=pAValueMeaning1167_AVM1167;
		pateight_^.matchedassembler:=pAAssemblesto1172_AA1172;
		new(pateight_^.params);
		for i:= 1 to maxparam do pateight_^.params^[i]:=nil;
		pateight_^.params^[0]:=pattype_;
		 
		alternatives[170]:=patint64_64;
		alternatives[171]:=patuint64_64;
		lastalt:=171;
		new(patinteger64_64);
		patinteger64_64^.meaning:=pAAlternativesPatterndecl1179_AAP1179;
		patinteger64_64^.matchedassembler:=nil;
		patinteger64_64^.params :=nil;
		alternatives[172]:=pattwo_;
		alternatives[173]:=patfour_;
		alternatives[174]:=pateight_;
		lastalt:=174;
		new(patscale_);
		patscale_^.meaning:=pAAlternativesPatterndecl1190_AAP1190;
		patscale_^.matchedassembler:=nil;
		patscale_^.params :=nil;
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patlabelf_);
		patlabelf_^.meaning:=pAValueMeaning1201_AVM1201;
		patlabelf_^.matchedassembler:=pAAssemblesto1204_AA1204;
		new(patlabelf_^.params);
		for i:= 1 to maxparam do patlabelf_^.params^[i]:=nil;
		patlabelf_^.params^[0]:=patlabel_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patsconst_);
		patsconst_^.meaning:=pAValueMeaning1213_AVM1213;
		patsconst_^.matchedassembler:=pAAssemblesto1216_AA1216;
		new(patsconst_^.params);
		for i:= 1 to maxparam do patsconst_^.params^[i]:=nil;
		patsconst_^.params^[0]:=patsigned_;
		 
		alternatives[175]:=patsconst_;
		alternatives[176]:=patlabelf_;
		lastalt:=176;
		new(patlconstf_);
		patlconstf_^.meaning:=pAAlternativesPatterndecl1223_AAP1223;
		patlconstf_^.matchedassembler:=nil;
		patlconstf_^.params :=nil;
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patlabelconstf_);
		patlabelconstf_^.meaning:=pAValueMeaning1234_AVM1234;
		patlabelconstf_^.matchedassembler:=pAAssemblesto1241_AA1241;
		new(patlabelconstf_^.params);
		for i:= 1 to maxparam do patlabelconstf_^.params^[i]:=nil;
		patlabelconstf_^.params^[0]:=patlconstf_;
		patlabelconstf_^.params^[1]:=patlconstf_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patconstf_);
		patconstf_^.meaning:=pAValueMeaning1252_AVM1252;
		patconstf_^.matchedassembler:=pAAssemblesto1255_AA1255;
		new(patconstf_^.params);
		for i:= 1 to maxparam do patconstf_^.params^[i]:=nil;
		patconstf_^.params^[0]:=patsigned_;
		 
		alternatives[177]:=patconstf_;
		alternatives[178]:=patlabelf_;
		alternatives[179]:=patlabelconstf_;
		lastalt:=179;
		new(patoffset_);
		patoffset_^.meaning:=pAAlternativesPatterndecl1262_AAP1262;
		patoffset_^.matchedassembler:=nil;
		patoffset_^.params :=nil;
		(*! Matches identifier r  to the tree at this point*)
		new(patregindirf_);
		patregindirf_^.meaning:=pAValueMeaning1273_AVM1273;
		patregindirf_^.matchedassembler:=pAAssemblesto1278_AA1278;
		new(patregindirf_^.params);
		for i:= 1 to maxparam do patregindirf_^.params^[i]:=nil;
		patregindirf_^.params^[0]:=patreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patsimplescaled_);
		patsimplescaled_^.meaning:=pAValueMeaning1289_AVM1289;
		patsimplescaled_^.matchedassembler:=pAAssemblesto1298_AA1298;
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
		patnegcompscaled_^.meaning:=pAValueMeaning1313_AVM1313;
		patnegcompscaled_^.matchedassembler:=pAAssemblesto1326_AA1326;
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
		patcompscaled_^.meaning:=pAValueMeaning1346_AVM1346;
		patcompscaled_^.matchedassembler:=pAAssemblesto1359_AA1359;
		new(patcompscaled_^.params);
		for i:= 1 to maxparam do patcompscaled_^.params^[i]:=nil;
		patcompscaled_^.params^[0]:=patreg_;
		patcompscaled_^.params^[1]:=patscale_;
		patcompscaled_^.params^[2]:=patoffset_;
		 
		alternatives[180]:=patcompscaled_;
		alternatives[181]:=patnegcompscaled_;
		alternatives[182]:=patsimplescaled_;
		lastalt:=182;
		new(patscaled_);
		patscaled_^.meaning:=pAAlternativesPatterndecl1373_AAP1373;
		patscaled_^.matchedassembler:=nil;
		patscaled_^.params :=nil;
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbaseminusoffsetf_);
		patbaseminusoffsetf_^.meaning:=pAValueMeaning1386_AVM1386;
		patbaseminusoffsetf_^.matchedassembler:=pAAssemblesto1395_AA1395;
		new(patbaseminusoffsetf_^.params);
		for i:= 1 to maxparam do patbaseminusoffsetf_^.params^[i]:=nil;
		patbaseminusoffsetf_^.params^[1]:=patoffset_;
		patbaseminusoffsetf_^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbaseplusoffsetf_);
		patbaseplusoffsetf_^.meaning:=pAValueMeaning1409_AVM1409;
		patbaseplusoffsetf_^.matchedassembler:=pAAssemblesto1418_AA1418;
		new(patbaseplusoffsetf_^.params);
		for i:= 1 to maxparam do patbaseplusoffsetf_^.params^[i]:=nil;
		patbaseplusoffsetf_^.params^[1]:=patoffset_;
		patbaseplusoffsetf_^.params^[0]:=patreg_;
		 
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier offs  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patscaledIndexPlusOffsetf_IPO);
		patscaledIndexPlusOffsetf_IPO^.meaning:=pAValueMeaning1431_AVM1431;
		patscaledIndexPlusOffsetf_IPO^.matchedassembler:=pAAssemblesto1438_AA1438;
		new(patscaledIndexPlusOffsetf_IPO^.params);
		for i:= 1 to maxparam do patscaledIndexPlusOffsetf_IPO^.params^[i]:=nil;
		patscaledIndexPlusOffsetf_IPO^.params^[0]:=patscaled_;
		patscaledIndexPlusOffsetf_IPO^.params^[1]:=patoffset_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbasePlusScaledIndexf_PSI);
		patbasePlusScaledIndexf_PSI^.meaning:=pAValueMeaning1450_AVM1450;
		patbasePlusScaledIndexf_PSI^.matchedassembler:=pAAssemblesto1459_AA1459;
		new(patbasePlusScaledIndexf_PSI^.params);
		for i:= 1 to maxparam do patbasePlusScaledIndexf_PSI^.params^[i]:=nil;
		patbasePlusScaledIndexf_PSI^.params^[0]:=patreg_;
		patbasePlusScaledIndexf_PSI^.params^[1]:=patscaled_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier off  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patbasePlusScaledIndexPlusOffsetf_PSIPO);
		patbasePlusScaledIndexPlusOffsetf_PSIPO^.meaning:=pAValueMeaning1475_AVM1475;
		patbasePlusScaledIndexPlusOffsetf_PSIPO^.matchedassembler:=pAAssemblesto1488_AA1488;
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
		patbasePlusIndexPlusOffsetf_PIPO^.meaning:=pAValueMeaning1504_AVM1504;
		patbasePlusIndexPlusOffsetf_PIPO^.matchedassembler:=pAAssemblesto1519_AA1519;
		new(patbasePlusIndexPlusOffsetf_PIPO^.params);
		for i:= 1 to maxparam do patbasePlusIndexPlusOffsetf_PIPO^.params^[i]:=nil;
		patbasePlusIndexPlusOffsetf_PIPO^.params^[1]:=patreg_;
		patbasePlusIndexPlusOffsetf_PIPO^.params^[0]:=patreg_;
		patbasePlusIndexPlusOffsetf_PIPO^.params^[2]:=patoffset_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patbasePlusIndexf_PI);
		patbasePlusIndexf_PI^.meaning:=pAValueMeaning1533_AVM1533;
		patbasePlusIndexf_PI^.matchedassembler:=pAAssemblesto1544_AA1544;
		new(patbasePlusIndexf_PI^.params);
		for i:= 1 to maxparam do patbasePlusIndexf_PI^.params^[i]:=nil;
		patbasePlusIndexf_PI^.params^[1]:=patreg_;
		patbasePlusIndexf_PI^.params^[0]:=patreg_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patdirectf_);
		patdirectf_^.meaning:=pAValueMeaning1555_AVM1555;
		patdirectf_^.matchedassembler:=pAAssemblesto1558_AA1558;
		new(patdirectf_^.params);
		for i:= 1 to maxparam do patdirectf_^.params^[i]:=nil;
		patdirectf_^.params^[0]:=patunsigned_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patudirectf_);
		patudirectf_^.meaning:=pAValueMeaning1567_AVM1567;
		patudirectf_^.matchedassembler:=pAAssemblesto1570_AA1570;
		new(patudirectf_^.params);
		for i:= 1 to maxparam do patudirectf_^.params^[i]:=nil;
		patudirectf_^.params^[0]:=patint_;
		 
		alternatives[183]:=patoffset_;
		alternatives[184]:=patbaseplusoffsetf_;
		alternatives[185]:=patregindirf_;
		lastalt:=185;
		new(patriscaddr_);
		patriscaddr_^.meaning:=pAAlternativesPatterndecl1577_AAP1577;
		patriscaddr_^.matchedassembler:=nil;
		patriscaddr_^.params :=nil;
		alternatives[186]:=patdirectf_;
		alternatives[187]:=patudirectf_;
		alternatives[188]:=patlabelf_;
		alternatives[189]:=patlabelconstf_;
		alternatives[190]:=patbasePlusScaledIndexPlusOffsetf_PSIPO;
		alternatives[191]:=patscaledIndexPlusOffsetf_IPO;
		alternatives[192]:=patbasePlusScaledIndexf_PSI;
		alternatives[193]:=patscaledIndexPlusOffsetf_IPO;
		alternatives[194]:=patbaseplusoffsetf_;
		alternatives[195]:=patbasePlusIndexPlusOffsetf_PIPO;
		alternatives[196]:=patbaseminusoffsetf_;
		alternatives[197]:=patbasePlusIndexf_PI;
		lastalt:=197;
		new(patuncasteaform_);
		patuncasteaform_^.meaning:=pAAlternativesPatterndecl1586_AAP1586;
		patuncasteaform_^.matchedassembler:=nil;
		patuncasteaform_^.params :=nil;
		(*! Matches identifier f  to the tree at this point*)
	(*! recogises loc in value context *)
		new(pateaform_);
		pateaform_^.meaning:=pAValueMeaning1617_AVM1617;
		pateaform_^.matchedassembler:=pAAssemblesto1624_AA1624;
		new(pateaform_^.params);
		for i:= 1 to maxparam do pateaform_^.params^[i]:=nil;
		pateaform_^.params^[1]:=patlongint_;
		pateaform_^.params^[0]:=patuncasteaform_;
		 
		alternatives[198]:=pateaform_;
		alternatives[199]:=patregindirf_;
		lastalt:=199;
		new(pataddrform_);
		pataddrform_^.meaning:=pAAlternativesPatterndecl1631_AAP1631;
		pataddrform_^.matchedassembler:=nil;
		pataddrform_^.params :=nil;
		(*! Matches identifier f  to the tree at this point*)
	(*! recogises loc in value context *)
	(*! recogises loc in value context *)
		new(patmaddrmode_);
		patmaddrmode_^.meaning:=pAValueMeaning1640_AVM1640;
		patmaddrmode_^.matchedassembler:=pAAssemblesto1645_AA1645;
		new(patmaddrmode_^.params);
		for i:= 1 to maxparam do patmaddrmode_^.params^[i]:=nil;
		patmaddrmode_^.params^[0]:=pataddrform_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
	(*! recogises loc in value context *)
		new(patmemrisc_);
		patmemrisc_^.meaning:=pAValueMeaning1656_AVM1656;
		patmemrisc_^.matchedassembler:=pAAssemblesto1661_AA1661;
		new(patmemrisc_^.params);
		for i:= 1 to maxparam do patmemrisc_^.params^[i]:=nil;
		patmemrisc_^.params^[0]:=patriscaddr_;
		 
		alternatives[200]:=patmaddrmode_;
		alternatives[201]:=patru_;
		lastalt:=201;
		new(patgmaddrmode_);
		patgmaddrmode_^.meaning:=pAAlternativesPatterndecl1670_AAP1670;
		patgmaddrmode_^.matchedassembler:=nil;
		patgmaddrmode_^.params :=nil;
		(*! matches a literal  to the tree at this point*)
		new(patimmediate_);
		patimmediate_^.meaning:=pAValueMeaning1679_AVM1679;
		patimmediate_^.matchedassembler:=pAAssemblesto1682_AA1682;
		new(patimmediate_^.params);
		for i:= 1 to maxparam do patimmediate_^.params^[i]:=nil;
		patimmediate_^.params^[0]:=patsigned_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patintimmediate_);
		patintimmediate_^.meaning:=pAValueMeaning1691_AVM1691;
		patintimmediate_^.matchedassembler:=pAAssemblesto1694_AA1694;
		new(patintimmediate_^.params);
		for i:= 1 to maxparam do patintimmediate_^.params^[i]:=nil;
		patintimmediate_^.params^[0]:=patint_;
		 
		(*! matches a literal  to the tree at this point*)
		new(patuimmediate_);
		patuimmediate_^.meaning:=pAValueMeaning1703_AVM1703;
		patuimmediate_^.matchedassembler:=pAAssemblesto1706_AA1706;
		new(patuimmediate_^.params);
		for i:= 1 to maxparam do patuimmediate_^.params^[i]:=nil;
		patuimmediate_^.params^[0]:=patunsigned_;
		 
		alternatives[202]:=patlabelf_;
		alternatives[203]:=patmaddrmode_;
		lastalt:=203;
		new(patjumpmode_);
		patjumpmode_^.meaning:=pAAlternativesPatterndecl1713_AAP1713;
		patjumpmode_^.matchedassembler:=nil;
		patjumpmode_^.params :=nil;
		alternatives[204]:=patmaddrmode_;
		alternatives[205]:=patanyreg_;
		lastalt:=205;
		new(pataddrmode_);
		pataddrmode_^.meaning:=pAAlternativesPatterndecl1720_AAP1720;
		pataddrmode_^.matchedassembler:=nil;
		pataddrmode_^.params :=nil;
		alternatives[206]:=patmaddrmode_;
		alternatives[207]:=patuwreg_;
		lastalt:=207;
		new(patuwaddrmode_);
		patuwaddrmode_^.meaning:=pAAlternativesPatterndecl1727_AAP1727;
		patuwaddrmode_^.matchedassembler:=nil;
		patuwaddrmode_^.params :=nil;
		alternatives[208]:=patmaddrmode_;
		alternatives[209]:=patureg_;
		lastalt:=209;
		new(patuaddrmode_);
		patuaddrmode_^.meaning:=pAAlternativesPatterndecl1734_AAP1734;
		patuaddrmode_^.matchedassembler:=nil;
		patuaddrmode_^.params :=nil;
		alternatives[210]:=patmaddrmode_;
		alternatives[211]:=patbreg_;
		lastalt:=211;
		new(patbaddrmode_);
		patbaddrmode_^.meaning:=pAAlternativesPatterndecl1741_AAP1741;
		patbaddrmode_^.matchedassembler:=nil;
		patbaddrmode_^.params :=nil;
		alternatives[212]:=patmaddrmode_;
		alternatives[213]:=patreg_;
		lastalt:=213;
		new(patwaddrmode_);
		patwaddrmode_^.meaning:=pAAlternativesPatterndecl1748_AAP1748;
		patwaddrmode_^.matchedassembler:=nil;
		patwaddrmode_^.params :=nil;
		alternatives[214]:=patmaddrmode_;
		alternatives[215]:=patru_;
		lastalt:=215;
		new(patwmemdummy_);
		patwmemdummy_^.meaning:=pAAlternativesPatterndecl1755_AAP1755;
		patwmemdummy_^.matchedassembler:=nil;
		patwmemdummy_^.params :=nil;
		(*! Matches identifier r  to the tree at this point*)
		new(patregshift_);
		patregshift_^.meaning:=pAValueMeaning1764_AVM1764;
		patregshift_^.matchedassembler:=pAAssemblesto1769_AA1769;
		new(patregshift_^.params);
		for i:= 1 to maxparam do patregshift_^.params^[i]:=nil;
		patregshift_^.params^[0]:=patshiftcountreg_;
		 
		alternatives[216]:=patimmediate_;
		alternatives[217]:=patregshift_;
		lastalt:=217;
		new(patshiftcount_);
		patshiftcount_^.meaning:=pAAlternativesPatterndecl1776_AAP1776;
		patshiftcount_^.matchedassembler:=nil;
		patshiftcount_^.params :=nil;
		(*! Matches identifier r  to the tree at this point*)
		new(patregaddrop_);
		patregaddrop_^.meaning:=pAValueMeaning1785_AVM1785;
		patregaddrop_^.matchedassembler:=pAAssemblesto1790_AA1790;
		new(patregaddrop_^.params);
		for i:= 1 to maxparam do patregaddrop_^.params^[i]:=nil;
		patregaddrop_^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier r  to the tree at this point*)
		new(patuwregaddrop_);
		patuwregaddrop_^.meaning:=pAValueMeaning1799_AVM1799;
		patuwregaddrop_^.matchedassembler:=pAAssemblesto1804_AA1804;
		new(patuwregaddrop_^.params);
		for i:= 1 to maxparam do patuwregaddrop_^.params^[i]:=nil;
		patuwregaddrop_^.params^[0]:=patuwaddrmode_;
		 
		alternatives[218]:=patintimmediate_;
		alternatives[219]:=patmaddrmode_;
		alternatives[220]:=patregaddrop_;
		alternatives[221]:=patru_;
		lastalt:=221;
		new(patregaddrimmediate_);
		patregaddrimmediate_^.meaning:=pAAlternativesPatterndecl1811_AAP1811;
		patregaddrimmediate_^.matchedassembler:=nil;
		patregaddrimmediate_^.params :=nil;
		alternatives[222]:=patuimmediate_;
		alternatives[223]:=patuwregaddrop_;
		lastalt:=223;
		new(patuwregaddrimmediate_);
		patuwregaddrimmediate_^.meaning:=pAAlternativesPatterndecl1822_AAP1822;
		patuwregaddrimmediate_^.matchedassembler:=nil;
		patuwregaddrimmediate_^.params :=nil;
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTACKSTORE_STACKSTORE);
		patSTACKSTORE_STACKSTORE^.meaning:=pAAssignMeaning1830_AAM1830;
		patSTACKSTORE_STACKSTORE^.matchedassembler:=pAAssemblesto1852_AA1852;
		new(patSTACKSTORE_STACKSTORE^.params);
		for i:= 1 to maxparam do patSTACKSTORE_STACKSTORE^.params^[i]:=nil;
		patSTACKSTORE_STACKSTORE^.params^[0]:=patreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref halfword*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTACKWSTORE_STACKWSTORE);
		patSTACKWSTORE_STACKWSTORE^.meaning:=pAAssignMeaning1864_AAM1864;
		patSTACKWSTORE_STACKWSTORE^.matchedassembler:=pAAssemblesto1885_AA1885;
		new(patSTACKWSTORE_STACKWSTORE^.params);
		for i:= 1 to maxparam do patSTACKWSTORE_STACKWSTORE^.params^[i]:=nil;
		patSTACKWSTORE_STACKWSTORE^.params^[0]:=patwreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref octet*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTACKBSTORE_STACKBSTORE);
		patSTACKBSTORE_STACKBSTORE^.meaning:=pAAssignMeaning1895_AAM1895;
		patSTACKBSTORE_STACKBSTORE^.matchedassembler:=pAAssemblesto1916_AA1916;
		new(patSTACKBSTORE_STACKBSTORE^.params);
		for i:= 1 to maxparam do patSTACKBSTORE_STACKBSTORE^.params^[i]:=nil;
		patSTACKBSTORE_STACKBSTORE^.params^[0]:=patbreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic1940_AID1940*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSMLIT_SMLIT);
		patSMLIT_SMLIT^.meaning:=pAValueMeaning1928_AVM1928;
		patSMLIT_SMLIT^.matchedassembler:=pAAssemblesto1951_AA1951;
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
		patSMULIT_SMULIT^.meaning:=pAValueMeaning1963_AVM1963;
		patSMULIT_SMULIT^.matchedassembler:=pAAssemblesto1986_AA1986;
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
		patSADD_SADD^.meaning:=pAValueMeaning1996_AVM1996;
		patSADD_SADD^.matchedassembler:=pAAssemblesto2019_AA2019;
		new(patSADD_SADD^.params);
		for i:= 1 to maxparam do patSADD_SADD^.params^[i]:=nil;
		patSADD_SADD^.params^[0]:=patsaddoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic2037_AID2037*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSOP_SOP);
		patSOP_SOP^.meaning:=pAValueMeaning2027_AVM2027;
		patSOP_SOP^.matchedassembler:=pAAssemblesto2050_AA2050;
		new(patSOP_SOP^.params);
		for i:= 1 to maxparam do patSOP_SOP^.params^[i]:=nil;
		patSOP_SOP^.params^[0]:=patsaddoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic2074_AID2074*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSMR_SMR);
		patSMR_SMR^.meaning:=pAValueMeaning2062_AVM2062;
		patSMR_SMR^.matchedassembler:=pAAssemblesto2089_AA2089;
		new(patSMR_SMR^.params);
		for i:= 1 to maxparam do patSMR_SMR^.params^[i]:=nil;
		patSMR_SMR^.params^[1]:=patreg_;
		patSMR_SMR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic2107_AID2107*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSMRSHIFT_SMRSHIFT);
		patSMRSHIFT_SMRSHIFT^.meaning:=pAValueMeaning2101_AVM2101;
		patSMRSHIFT_SMRSHIFT^.matchedassembler:=pAAssemblesto2120_AA2120;
		new(patSMRSHIFT_SMRSHIFT^.params);
		for i:= 1 to maxparam do patSMRSHIFT_SMRSHIFT^.params^[i]:=nil;
		patSMRSHIFT_SMRSHIFT^.params^[1]:=patshiftcountreg_;
		patSMRSHIFT_SMRSHIFT^.params^[0]:=patshiftop_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic2145_AID2145*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patBSMR_BSMR);
		patBSMR_BSMR^.meaning:=pAValueMeaning2134_AVM2134;
		patBSMR_BSMR^.matchedassembler:=pAAssemblesto2158_AA2158;
		new(patBSMR_BSMR^.params);
		for i:= 1 to maxparam do patBSMR_BSMR^.params^[i]:=nil;
		patBSMR_BSMR^.params^[1]:=patbreg_;
		patBSMR_BSMR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSMRADD_SMRADD);
		patSMRADD_SMRADD^.meaning:=pAAssignMeaning2168_AAM2168;
		patSMRADD_SMRADD^.matchedassembler:=pAAssemblesto2190_AA2190;
		new(patSMRADD_SMRADD^.params);
		for i:= 1 to maxparam do patSMRADD_SMRADD^.params^[i]:=nil;
		patSMRADD_SMRADD^.params^[0]:=patreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic2216_AID2216*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSMRP_SMRP);
		patSMRP_SMRP^.meaning:=pAValueMeaning2204_AVM2204;
		patSMRP_SMRP^.matchedassembler:=pAAssemblesto2231_AA2231;
		new(patSMRP_SMRP^.params);
		for i:= 1 to maxparam do patSMRP_SMRP^.params^[i]:=nil;
		patSMRP_SMRP^.params^[1]:=patreg_;
		patSMRP_SMRP^.params^[2]:=pattype_;
		patSMRP_SMRP^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patRPUSH_RPUSH);
		patRPUSH_RPUSH^.meaning:=pAValueMeaning2241_AVM2241;
		patRPUSH_RPUSH^.matchedassembler:=pAAssemblesto2250_AA2250;
		new(patRPUSH_RPUSH^.params);
		for i:= 1 to maxparam do patRPUSH_RPUSH^.params^[i]:=nil;
		patRPUSH_RPUSH^.params^[0]:=patdpushreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patRPUSHE_RPUSHE);
		patRPUSHE_RPUSHE^.meaning:=pAValueMeaning2261_AVM2261;
		patRPUSHE_RPUSHE^.matchedassembler:=pAAssemblesto2276_AA2276;
		new(patRPUSHE_RPUSHE^.params);
		for i:= 1 to maxparam do patRPUSHE_RPUSHE^.params^[i]:=nil;
		patRPUSHE_RPUSHE^.params^[1]:=patinteger64_64;
		patRPUSHE_RPUSHE^.params^[0]:=patureg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPOPEADXu_POPEADX);
		patPOPEADXu_POPEADX^.meaning:=pAAssignMeaning2290_AAM2290;
		patPOPEADXu_POPEADX^.matchedassembler:=pAAssemblesto2302_AA2302;
		new(patPOPEADXu_POPEADX^.params);
		for i:= 1 to maxparam do patPOPEADXu_POPEADX^.params^[i]:=nil;
		patPOPEADXu_POPEADX^.params^[0]:=pattype_;
		patPOPEADXu_POPEADX^.params^[1]:=pateadxu_;
		 
		(*! Matches identifier d  to the tree at this point*)
		(*! try to cast to type: ref uint64*)
		(*! Matches identifier r  to the tree at this point*)
		new(patSTOREAXDu_STOREAXD);
		patSTOREAXDu_STOREAXD^.meaning:=pAAssignMeaning2312_AAM2312;
		patSTOREAXDu_STOREAXD^.matchedassembler:=pAAssemblesto2330_AA2330;
		new(patSTOREAXDu_STOREAXD^.params);
		for i:= 1 to maxparam do patSTOREAXDu_STOREAXD^.params^[i]:=nil;
		patSTOREAXDu_STOREAXD^.params^[0]:=pateadxu_;
		patSTOREAXDu_STOREAXD^.params^[1]:=patdestreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patRPOP_RPOP);
		patRPOP_RPOP^.meaning:=pAAssignMeaning2344_AAM2344;
		patRPOP_RPOP^.matchedassembler:=pAAssemblesto2358_AA2358;
		new(patRPOP_RPOP^.params);
		for i:= 1 to maxparam do patRPOP_RPOP^.params^[i]:=nil;
		patRPOP_RPOP^.params^[1]:=pattype_;
		patRPOP_RPOP^.params^[0]:=patdpushreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patBPUSH_BPUSH);
		patBPUSH_BPUSH^.meaning:=pAValueMeaning2367_AVM2367;
		patBPUSH_BPUSH^.matchedassembler:=pAAssemblesto2376_AA2376;
		new(patBPUSH_BPUSH^.params);
		for i:= 1 to maxparam do patBPUSH_BPUSH^.params^[i]:=nil;
		patBPUSH_BPUSH^.params^[0]:=patbureg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patBSPUSH_BSPUSH);
		patBSPUSH_BSPUSH^.meaning:=pAValueMeaning2385_AVM2385;
		patBSPUSH_BSPUSH^.matchedassembler:=pAAssemblesto2400_AA2400;
		new(patBSPUSH_BSPUSH^.params);
		for i:= 1 to maxparam do patBSPUSH_BSPUSH^.params^[i]:=nil;
		patBSPUSH_BSPUSH^.params^[0]:=patbaddrmode_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patBSPOP_BSPOP);
		patBSPOP_BSPOP^.meaning:=pAAssignMeaning2410_AAM2410;
		patBSPOP_BSPOP^.matchedassembler:=pAAssemblesto2421_AA2421;
		new(patBSPOP_BSPOP^.params);
		for i:= 1 to maxparam do patBSPOP_BSPOP^.params^[i]:=nil;
		patBSPOP_BSPOP^.params^[0]:=patbireg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patBPOP_BPOP);
		patBPOP_BPOP^.meaning:=pAAssignMeaning2431_AAM2431;
		patBPOP_BPOP^.matchedassembler:=pAAssemblesto2442_AA2442;
		new(patBPOP_BPOP^.params);
		for i:= 1 to maxparam do patBPOP_BPOP^.params^[i]:=nil;
		patBPOP_BPOP^.params^[0]:=patbureg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref ref t*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patREFPOP_REFPOP);
		patREFPOP_REFPOP^.meaning:=pAAssignMeaning2456_AAM2456;
		patREFPOP_REFPOP^.matchedassembler:=pAAssemblesto2474_AA2474;
		new(patREFPOP_REFPOP^.params);
		for i:= 1 to maxparam do patREFPOP_REFPOP^.params^[i]:=nil;
		patREFPOP_REFPOP^.params^[1]:=pattype_;
		patREFPOP_REFPOP^.params^[2]:=pattype_;
		patREFPOP_REFPOP^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref ref t*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patWPOP_WPOP);
		patWPOP_WPOP^.meaning:=pAAssignMeaning2485_AAM2485;
		patWPOP_WPOP^.matchedassembler:=pAAssemblesto2502_AA2502;
		new(patWPOP_WPOP^.params);
		for i:= 1 to maxparam do patWPOP_WPOP^.params^[i]:=nil;
		patWPOP_WPOP^.params^[1]:=pattype_;
		patWPOP_WPOP^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patMEMPOP_MEMPOP);
		patMEMPOP_MEMPOP^.meaning:=pAAssignMeaning2511_AAM2511;
		patMEMPOP_MEMPOP^.matchedassembler:=pAAssemblesto2529_AA2529;
		new(patMEMPOP_MEMPOP^.params);
		for i:= 1 to maxparam do patMEMPOP_MEMPOP^.params^[i]:=nil;
		patMEMPOP_MEMPOP^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patLITPUSH_LITPUSH);
		patLITPUSH_LITPUSH^.meaning:=pAValueMeaning2538_AVM2538;
		patLITPUSH_LITPUSH^.matchedassembler:=pAAssemblesto2545_AA2545;
		new(patLITPUSH_LITPUSH^.params);
		for i:= 1 to maxparam do patLITPUSH_LITPUSH^.params^[i]:=nil;
		patLITPUSH_LITPUSH^.params^[0]:=patoffset_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier m  to the tree at this point*)
		new(patMEMPUSH_MEMPUSH);
		patMEMPUSH_MEMPUSH^.meaning:=pAValueMeaning2554_AVM2554;
		patMEMPUSH_MEMPUSH^.matchedassembler:=pAAssemblesto2568_AA2568;
		new(patMEMPUSH_MEMPUSH^.params);
		for i:= 1 to maxparam do patMEMPUSH_MEMPUSH^.params^[i]:=nil;
		patMEMPUSH_MEMPUSH^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ea  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref doubleword*)
		new(patDMEMPUSH_DMEMPUSH);
		patDMEMPUSH_DMEMPUSH^.meaning:=pAValueMeaning2577_AVM2577;
		patDMEMPUSH_DMEMPUSH^.matchedassembler:=pAAssemblesto2598_AA2598;
		new(patDMEMPUSH_DMEMPUSH^.params);
		for i:= 1 to maxparam do patDMEMPUSH_DMEMPUSH^.params^[i]:=nil;
		patDMEMPUSH_DMEMPUSH^.params^[0]:=pateaform_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref t*)
		new(patSTACKLOAD_STACKLOAD);
		patSTACKLOAD_STACKLOAD^.meaning:=pAValueMeaning2610_AVM2610;
		patSTACKLOAD_STACKLOAD^.matchedassembler:=pAAssemblesto2631_AA2631;
		new(patSTACKLOAD_STACKLOAD^.params);
		for i:= 1 to maxparam do patSTACKLOAD_STACKLOAD^.params^[i]:=nil;
		patSTACKLOAD_STACKLOAD^.params^[0]:=patword32_32;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier m  to the tree at this point*)
		new(patREFPUSH_REFPUSH);
		patREFPUSH_REFPUSH^.meaning:=pAValueMeaning2641_AVM2641;
		patREFPUSH_REFPUSH^.matchedassembler:=pAAssemblesto2656_AA2656;
		new(patREFPUSH_REFPUSH^.params);
		for i:= 1 to maxparam do patREFPUSH_REFPUSH^.params^[i]:=nil;
		patREFPUSH_REFPUSH^.params^[0]:=patmaddrmode_;
		patREFPUSH_REFPUSH^.params^[1]:=pattype_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSDEREF_SDEREF);
		patSDEREF_SDEREF^.meaning:=pAValueMeaning2665_AVM2665;
		patSDEREF_SDEREF^.matchedassembler:=pAAssemblesto2686_AA2686;
		new(patSDEREF_SDEREF^.params);
		for i:= 1 to maxparam do patSDEREF_SDEREF^.params^[i]:=nil;
		patSDEREF_SDEREF^.params^[0]:=patint_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD);
		patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD^.meaning:=pAValueMeaning2694_AVM2694;
		patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD^.matchedassembler:=pAAssemblesto2716_AA2716;
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
		patSELECT_SELECT^.meaning:=pAAssignMeaning2730_AAM2730;
		patSELECT_SELECT^.matchedassembler:=pAAssemblesto2774_AA2774;
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
		patLOAD_LOAD^.meaning:=pAAssignMeaning2804_AAM2804;
		patLOAD_LOAD^.matchedassembler:=pAAssemblesto2820_AA2820;
		new(patLOAD_LOAD^.params);
		for i:= 1 to maxparam do patLOAD_LOAD^.params^[i]:=nil;
		patLOAD_LOAD^.params^[1]:=patreg_;
		patLOAD_LOAD^.params^[2]:=patword32_32;
		patLOAD_LOAD^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patLOADW_LOADW);
		patLOADW_LOADW^.meaning:=pAAssignMeaning2837_AAM2837;
		patLOADW_LOADW^.matchedassembler:=pAAssemblesto2853_AA2853;
		new(patLOADW_LOADW^.params);
		for i:= 1 to maxparam do patLOADW_LOADW^.params^[i]:=nil;
		patLOADW_LOADW^.params^[1]:=patwreg_;
		patLOADW_LOADW^.params^[2]:=patword16_16;
		patLOADW_LOADW^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patLOADB_LOADB);
		patLOADB_LOADB^.meaning:=pAAssignMeaning2868_AAM2868;
		patLOADB_LOADB^.matchedassembler:=pAAssemblesto2881_AA2881;
		new(patLOADB_LOADB^.params);
		for i:= 1 to maxparam do patLOADB_LOADB^.params^[i]:=nil;
		patLOADB_LOADB^.params^[1]:=patbreg_;
		patLOADB_LOADB^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVZXB_MOVZXB);
		patMOVZXB_MOVZXB^.meaning:=pAAssignMeaning2895_AAM2895;
		patMOVZXB_MOVZXB^.matchedassembler:=pAAssemblesto2911_AA2911;
		new(patMOVZXB_MOVZXB^.params);
		for i:= 1 to maxparam do patMOVZXB_MOVZXB^.params^[i]:=nil;
		patMOVZXB_MOVZXB^.params^[0]:=patreg_;
		patMOVZXB_MOVZXB^.params^[1]:=patbaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVZXB2_MOVZXB2);
		patMOVZXB2_MOVZXB2^.meaning:=pAAssignMeaning2924_AAM2924;
		patMOVZXB2_MOVZXB2^.matchedassembler:=pAAssemblesto2940_AA2940;
		new(patMOVZXB2_MOVZXB2^.params);
		for i:= 1 to maxparam do patMOVZXB2_MOVZXB2^.params^[i]:=nil;
		patMOVZXB2_MOVZXB2^.params^[0]:=patreg_;
		patMOVZXB2_MOVZXB2^.params^[1]:=patbaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVSXB_MOVSXB);
		patMOVSXB_MOVSXB^.meaning:=pAAssignMeaning2953_AAM2953;
		patMOVSXB_MOVSXB^.matchedassembler:=pAAssemblesto2975_AA2975;
		new(patMOVSXB_MOVSXB^.params);
		for i:= 1 to maxparam do patMOVSXB_MOVSXB^.params^[i]:=nil;
		patMOVSXB_MOVSXB^.params^[0]:=patreg_;
		patMOVSXB_MOVSXB^.params^[1]:=patbaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVZXBW_MOVZXBW);
		patMOVZXBW_MOVZXBW^.meaning:=pAAssignMeaning2988_AAM2988;
		patMOVZXBW_MOVZXBW^.matchedassembler:=pAAssemblesto3004_AA3004;
		new(patMOVZXBW_MOVZXBW^.params);
		for i:= 1 to maxparam do patMOVZXBW_MOVZXBW^.params^[i]:=nil;
		patMOVZXBW_MOVZXBW^.params^[0]:=patuwreg_;
		patMOVZXBW_MOVZXBW^.params^[1]:=patbaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVSXBW_MOVSXBW);
		patMOVSXBW_MOVSXBW^.meaning:=pAAssignMeaning3017_AAM3017;
		patMOVSXBW_MOVSXBW^.matchedassembler:=pAAssemblesto3027_AA3027;
		new(patMOVSXBW_MOVSXBW^.params);
		for i:= 1 to maxparam do patMOVSXBW_MOVSXBW^.params^[i]:=nil;
		patMOVSXBW_MOVSXBW^.params^[0]:=patswreg_;
		patMOVSXBW_MOVSXBW^.params^[1]:=patbaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVZXW_MOVZXW);
		patMOVZXW_MOVZXW^.meaning:=pAAssignMeaning3040_AAM3040;
		patMOVZXW_MOVZXW^.matchedassembler:=pAAssemblesto3056_AA3056;
		new(patMOVZXW_MOVZXW^.params);
		for i:= 1 to maxparam do patMOVZXW_MOVZXW^.params^[i]:=nil;
		patMOVZXW_MOVZXW^.params^[0]:=patreg_;
		patMOVZXW_MOVZXW^.params^[1]:=patuwaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVSXW_MOVSXW);
		patMOVSXW_MOVSXW^.meaning:=pAAssignMeaning3069_AAM3069;
		patMOVSXW_MOVSXW^.matchedassembler:=pAAssemblesto3085_AA3085;
		new(patMOVSXW_MOVSXW^.params);
		for i:= 1 to maxparam do patMOVSXW_MOVSXW^.params^[i]:=nil;
		patMOVSXW_MOVSXW^.params^[0]:=patreg_;
		patMOVSXW_MOVSXW^.params^[1]:=patwreg_;
		 
		(*! Matches identifier b  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patToBYTE_TBYTE);
		patToBYTE_TBYTE^.meaning:=pAAssignMeaning3098_AAM3098;
		patToBYTE_TBYTE^.matchedassembler:=pAAssemblesto3111_AA3111;
		new(patToBYTE_TBYTE^.params);
		for i:= 1 to maxparam do patToBYTE_TBYTE^.params^[i]:=nil;
		patToBYTE_TBYTE^.params^[1]:=patbreg_;
		patToBYTE_TBYTE^.params^[0]:=patreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref octet*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTOREBR_STOREBR);
		patSTOREBR_STOREBR^.meaning:=pAAssignMeaning3125_AAM3125;
		patSTOREBR_STOREBR^.matchedassembler:=pAAssemblesto3138_AA3138;
		new(patSTOREBR_STOREBR^.params);
		for i:= 1 to maxparam do patSTOREBR_STOREBR^.params^[i]:=nil;
		patSTOREBR_STOREBR^.params^[1]:=patbreg_;
		patSTOREBR_STOREBR^.params^[0]:=patbaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTORER_STORER);
		patSTORER_STORER^.meaning:=pAAssignMeaning3153_AAM3153;
		patSTORER_STORER^.matchedassembler:=pAAssemblesto3165_AA3165;
		new(patSTORER_STORER^.params);
		for i:= 1 to maxparam do patSTORER_STORER^.params^[i]:=nil;
		patSTORER_STORER^.params^[1]:=patreg_;
		patSTORER_STORER^.params^[2]:=patword32_32;
		patSTORER_STORER^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTOREWR_STOREWR);
		patSTOREWR_STOREWR^.meaning:=pAAssignMeaning3182_AAM3182;
		patSTOREWR_STOREWR^.matchedassembler:=pAAssemblesto3194_AA3194;
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
		patNULMOV_NULMOV^.meaning:=pAAssignMeaning3209_AAM3209;
		patNULMOV_NULMOV^.matchedassembler:=pAAssemblesto3225_AA3225;
		new(patNULMOV_NULMOV^.params);
		for i:= 1 to maxparam do patNULMOV_NULMOV^.params^[i]:=nil;
		patNULMOV_NULMOV^.params^[0]:=patreg_;
		patNULMOV_NULMOV^.params^[1]:=pattype_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! matches a literal  to the tree at this point*)
		new(patSTORELIT_STORELIT);
		patSTORELIT_STORELIT^.meaning:=pAAssignMeaning3239_AAM3239;
		patSTORELIT_STORELIT^.matchedassembler:=pAAssemblesto3253_AA3253;
		new(patSTORELIT_STORELIT^.params);
		for i:= 1 to maxparam do patSTORELIT_STORELIT^.params^[i]:=nil;
		patSTORELIT_STORELIT^.params^[1]:=pattype_;
		patSTORELIT_STORELIT^.params^[2]:=patint_;
		patSTORELIT_STORELIT^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		new(patCLEARREG_CLEARREG);
		patCLEARREG_CLEARREG^.meaning:=pAAssignMeaning3271_AAM3271;
		patCLEARREG_CLEARREG^.matchedassembler:=pAAssemblesto3287_AA3287;
		new(patCLEARREG_CLEARREG^.params);
		for i:= 1 to maxparam do patCLEARREG_CLEARREG^.params^[i]:=nil;
		patCLEARREG_CLEARREG^.params^[1]:=pattype_;
		patCLEARREG_CLEARREG^.params^[2]:=patint_;
		patCLEARREG_CLEARREG^.params^[0]:=patreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic3313_AID3313*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier sm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patRMLIT_RMLIT);
		patRMLIT_RMLIT^.meaning:=pAAssignMeaning3304_AAM3304;
		patRMLIT_RMLIT^.matchedassembler:=pAAssemblesto3324_AA3324;
		new(patRMLIT_RMLIT^.params);
		for i:= 1 to maxparam do patRMLIT_RMLIT^.params^[i]:=nil;
		patRMLIT_RMLIT^.params^[2]:=pattype_;
		patRMLIT_RMLIT^.params^[1]:=pataddrmode_;
		patRMLIT_RMLIT^.params^[3]:=patoffset_;
		patRMLIT_RMLIT^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic3353_AID3353*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier sm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patMLIT_MLIT);
		patMLIT_MLIT^.meaning:=pAAssignMeaning3344_AAM3344;
		patMLIT_MLIT^.matchedassembler:=pAAssemblesto3364_AA3364;
		new(patMLIT_MLIT^.params);
		for i:= 1 to maxparam do patMLIT_MLIT^.params^[i]:=nil;
		patMLIT_MLIT^.params^[2]:=pattype_;
		patMLIT_MLIT^.params^[1]:=patmaddrmode_;
		patMLIT_MLIT^.params^[3]:=patoffset_;
		patMLIT_MLIT^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patINC_INC);
		patINC_INC^.meaning:=pAAssignMeaning3380_AAM3380;
		patINC_INC^.matchedassembler:=pAAssemblesto3398_AA3398;
		new(patINC_INC^.params);
		for i:= 1 to maxparam do patINC_INC^.params^[i]:=nil;
		patINC_INC^.params^[1]:=patint_;
		patINC_INC^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patDEC_DEC);
		patDEC_DEC^.meaning:=pAAssignMeaning3411_AAM3411;
		patDEC_DEC^.matchedassembler:=pAAssemblesto3433_AA3433;
		new(patDEC_DEC^.params);
		for i:= 1 to maxparam do patDEC_DEC^.params^[i]:=nil;
		patDEC_DEC^.params^[1]:=patint_;
		patDEC_DEC^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic3459_AID3459*)
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier s  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSHIFT_SHIFT);
		patSHIFT_SHIFT^.meaning:=pAAssignMeaning3450_AAM3450;
		patSHIFT_SHIFT^.matchedassembler:=pAAssemblesto3466_AA3466;
		new(patSHIFT_SHIFT^.params);
		for i:= 1 to maxparam do patSHIFT_SHIFT^.params^[i]:=nil;
		patSHIFT_SHIFT^.params^[3]:=pattype_;
		patSHIFT_SHIFT^.params^[1]:=patshiftcount_;
		patSHIFT_SHIFT^.params^[2]:=patanyreg_;
		patSHIFT_SHIFT^.params^[0]:=patshiftop_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic3494_AID3494*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patRMR_RMR);
		patRMR_RMR^.meaning:=pAAssignMeaning3485_AAM3485;
		patRMR_RMR^.matchedassembler:=pAAssemblesto3511_AA3511;
		new(patRMR_RMR^.params);
		for i:= 1 to maxparam do patRMR_RMR^.params^[i]:=nil;
		patRMR_RMR^.params^[2]:=patanyreg_;
		patRMR_RMR^.params^[3]:=patwordupto32_32;
		patRMR_RMR^.params^[1]:=patmaddrmode_;
		patRMR_RMR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patADDRMR_ADDRMR);
		patADDRMR_ADDRMR^.meaning:=pAAssignMeaning3531_AAM3531;
		patADDRMR_ADDRMR^.matchedassembler:=pAAssemblesto3557_AA3557;
		new(patADDRMR_ADDRMR^.params);
		for i:= 1 to maxparam do patADDRMR_ADDRMR^.params^[i]:=nil;
		patADDRMR_ADDRMR^.params^[2]:=patanyreg_;
		patADDRMR_ADDRMR^.params^[3]:=patwordupto32_32;
		patADDRMR_ADDRMR^.params^[1]:=patmaddrmode_;
		patADDRMR_ADDRMR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
(* defds ->public boolean pAIdentifierDyadic3585_AID3585*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patRMRB_RMRB);
		patRMRB_RMRB^.meaning:=pAAssignMeaning3576_AAM3576;
		patRMRB_RMRB^.matchedassembler:=pAAssemblesto3602_AA3602;
		new(patRMRB_RMRB^.params);
		for i:= 1 to maxparam do patRMRB_RMRB^.params^[i]:=nil;
		patRMRB_RMRB^.params^[2]:=patbreg_;
		patRMRB_RMRB^.params^[3]:=patbyte_;
		patRMRB_RMRB^.params^[1]:=pataddrmode_;
		patRMRB_RMRB^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patnulbass_);
		patnulbass_^.meaning:=pAAssignMeaning3618_AAM3618;
		patnulbass_^.matchedassembler:=pAAssemblesto3634_AA3634;
		new(patnulbass_^.params);
		for i:= 1 to maxparam do patnulbass_^.params^[i]:=nil;
		patnulbass_^.params^[0]:=patbreg_;
		patnulbass_^.params^[1]:=patbyte_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patADDUSB_ADDUSB);
		patADDUSB_ADDUSB^.meaning:=pAAssignMeaning3646_AAM3646;
		patADDUSB_ADDUSB^.matchedassembler:=pAAssemblesto3666_AA3666;
		new(patADDUSB_ADDUSB^.params);
		for i:= 1 to maxparam do patADDUSB_ADDUSB^.params^[i]:=nil;
		patADDUSB_ADDUSB^.params^[1]:=patbreg_;
		patADDUSB_ADDUSB^.params^[0]:=pataddrmode_;
		patADDUSB_ADDUSB^.params^[2]:=patbreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSUBUSB_SUBUSB);
		patSUBUSB_SUBUSB^.meaning:=pAAssignMeaning3682_AAM3682;
		patSUBUSB_SUBUSB^.matchedassembler:=pAAssemblesto3702_AA3702;
		new(patSUBUSB_SUBUSB^.params);
		for i:= 1 to maxparam do patSUBUSB_SUBUSB^.params^[i]:=nil;
		patSUBUSB_SUBUSB^.params^[0]:=patbreg_;
		patSUBUSB_SUBUSB^.params^[1]:=patbreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patADDSSB_ADDSSB);
		patADDSSB_ADDSSB^.meaning:=pAAssignMeaning3718_AAM3718;
		patADDSSB_ADDSSB^.matchedassembler:=pAAssemblesto3744_AA3744;
		new(patADDSSB_ADDSSB^.params);
		for i:= 1 to maxparam do patADDSSB_ADDSSB^.params^[i]:=nil;
		patADDSSB_ADDSSB^.params^[0]:=patbreg_;
		patADDSSB_ADDSSB^.params^[1]:=patbreg_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patMULTSSB_MULTSSB);
		patMULTSSB_MULTSSB^.meaning:=pAAssignMeaning3762_AAM3762;
		patMULTSSB_MULTSSB^.matchedassembler:=pAAssemblesto3776_AA3776;
		new(patMULTSSB_MULTSSB^.params);
		for i:= 1 to maxparam do patMULTSSB_MULTSSB^.params^[i]:=nil;
		patMULTSSB_MULTSSB^.params^[1]:=patbnonacc_;
		patMULTSSB_MULTSSB^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patMULTSSBAL_MULTSSBAL);
		patMULTSSBAL_MULTSSBAL^.meaning:=pAAssignMeaning3792_AAM3792;
		patMULTSSBAL_MULTSSBAL^.matchedassembler:=pAAssemblesto3806_AA3806;
		new(patMULTSSBAL_MULTSSBAL^.params);
		for i:= 1 to maxparam do patMULTSSBAL_MULTSSBAL^.params^[i]:=nil;
		patMULTSSBAL_MULTSSBAL^.params^[1]:=patbnonacc_;
		patMULTSSBAL_MULTSSBAL^.params^[0]:=patbacc_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSUBSSB_SUBSSB);
		patSUBSSB_SUBSSB^.meaning:=pAAssignMeaning3820_AAM3820;
		patSUBSSB_SUBSSB^.matchedassembler:=pAAssemblesto3846_AA3846;
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
		patUINT8MAX_UINT8MAX^.meaning:=pAAssignMeaning3864_AAM3864;
		patUINT8MAX_UINT8MAX^.matchedassembler:=pAAssemblesto3890_AA3890;
		new(patUINT8MAX_UINT8MAX^.params);
		for i:= 1 to maxparam do patUINT8MAX_UINT8MAX^.params^[i]:=nil;
		patUINT8MAX_UINT8MAX^.params^[1]:=patbreg_;
		patUINT8MAX_UINT8MAX^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patINTMAX_INTMAX);
		patINTMAX_INTMAX^.meaning:=pAAssignMeaning3907_AAM3907;
		patINTMAX_INTMAX^.matchedassembler:=pAAssemblesto3921_AA3921;
		new(patINTMAX_INTMAX^.params);
		for i:= 1 to maxparam do patINTMAX_INTMAX^.params^[i]:=nil;
		patINTMAX_INTMAX^.params^[1]:=patreg_;
		patINTMAX_INTMAX^.params^[0]:=patreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patINTABS_INTABS);
		patINTABS_INTABS^.meaning:=pAAssignMeaning3936_AAM3936;
		patINTABS_INTABS^.matchedassembler:=pAAssemblesto3946_AA3946;
		new(patINTABS_INTABS^.params);
		for i:= 1 to maxparam do patINTABS_INTABS^.params^[i]:=nil;
		patINTABS_INTABS^.params^[0]:=patreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref uint8*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patUINT8MIN_UINT8MIN);
		patUINT8MIN_UINT8MIN^.meaning:=pAAssignMeaning3959_AAM3959;
		patUINT8MIN_UINT8MIN^.matchedassembler:=pAAssemblesto3985_AA3985;
		new(patUINT8MIN_UINT8MIN^.params);
		for i:= 1 to maxparam do patUINT8MIN_UINT8MIN^.params^[i]:=nil;
		patUINT8MIN_UINT8MIN^.params^[1]:=patbreg_;
		patUINT8MIN_UINT8MIN^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int8*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patINT8MAX_INT8MAX);
		patINT8MAX_INT8MAX^.meaning:=pAAssignMeaning4002_AAM4002;
		patINT8MAX_INT8MAX^.matchedassembler:=pAAssemblesto4028_AA4028;
		new(patINT8MAX_INT8MAX^.params);
		for i:= 1 to maxparam do patINT8MAX_INT8MAX^.params^[i]:=nil;
		patINT8MAX_INT8MAX^.params^[1]:=patbreg_;
		patINT8MAX_INT8MAX^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int8*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patINT8MIN_INT8MIN);
		patINT8MIN_INT8MIN^.meaning:=pAAssignMeaning4045_AAM4045;
		patINT8MIN_INT8MIN^.matchedassembler:=pAAssemblesto4071_AA4071;
		new(patINT8MIN_INT8MIN^.params);
		for i:= 1 to maxparam do patINT8MIN_INT8MIN^.params^[i]:=nil;
		patINT8MIN_INT8MIN^.params^[1]:=patbreg_;
		patINT8MIN_INT8MIN^.params^[0]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier ea  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patLEA_LEA);
		patLEA_LEA^.meaning:=pAAssignMeaning4088_AAM4088;
		patLEA_LEA^.matchedassembler:=pAAssemblesto4094_AA4094;
		new(patLEA_LEA^.params);
		for i:= 1 to maxparam do patLEA_LEA^.params^[i]:=nil;
		patLEA_LEA^.params^[0]:=patreg_;
		patLEA_LEA^.params^[1]:=pateaform_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patNOTOP_NOTOP);
		patNOTOP_NOTOP^.meaning:=pAAssignMeaning4108_AAM4108;
		patNOTOP_NOTOP^.matchedassembler:=pAAssemblesto4126_AA4126;
		new(patNOTOP_NOTOP^.params);
		for i:= 1 to maxparam do patNOTOP_NOTOP^.params^[i]:=nil;
		patNOTOP_NOTOP^.params^[1]:=pattype_;
		patNOTOP_NOTOP^.params^[0]:=pataddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patNegate_N);
		patNegate_N^.meaning:=pAAssignMeaning4139_AAM4139;
		patNegate_N^.matchedassembler:=pAAssemblesto4165_AA4165;
		new(patNegate_N^.params);
		for i:= 1 to maxparam do patNegate_N^.params^[i]:=nil;
		patNegate_N^.params^[0]:=patanyreg_;
		patNegate_N^.params^[1]:=pattype_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patMNegate_MN);
		patMNegate_MN^.meaning:=pAAssignMeaning4177_AAM4177;
		patMNegate_MN^.matchedassembler:=pAAssemblesto4203_AA4203;
		new(patMNegate_MN^.params);
		for i:= 1 to maxparam do patMNegate_MN^.params^[i]:=nil;
		patMNegate_MN^.params^[0]:=patanyreg_;
		patMNegate_MN^.params^[1]:=pattype_;
		 
		(*! Matches identifier r0  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic4224_AID4224*)
		(*! Matches identifier r0  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		new(patRLIT_RLIT);
		patRLIT_RLIT^.meaning:=pAAssignMeaning4219_AAM4219;
		patRLIT_RLIT^.matchedassembler:=pAAssemblesto4231_AA4231;
		new(patRLIT_RLIT^.params);
		for i:= 1 to maxparam do patRLIT_RLIT^.params^[i]:=nil;
		patRLIT_RLIT^.params^[1]:=patpushreg_;
		patRLIT_RLIT^.params^[2]:=pattype_;
		patRLIT_RLIT^.params^[3]:=patsigned_;
		patRLIT_RLIT^.params^[0]:=patoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic4258_AID4258*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patRRD_RRD);
		patRRD_RRD^.meaning:=pAAssignMeaning4247_AAM4247;
		patRRD_RRD^.matchedassembler:=pAAssemblesto4267_AA4267;
		new(patRRD_RRD^.params);
		for i:= 1 to maxparam do patRRD_RRD^.params^[i]:=nil;
		patRRD_RRD^.params^[2]:=patindexreg_;
		patRRD_RRD^.params^[1]:=patindexreg_;
		patRRD_RRD^.params^[0]:=patoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic4295_AID4295*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patRR_RR);
		patRR_RR^.meaning:=pAAssignMeaning4286_AAM4286;
		patRR_RR^.matchedassembler:=pAAssemblesto4316_AA4316;
		new(patRR_RR^.params);
		for i:= 1 to maxparam do patRR_RR^.params^[i]:=nil;
		patRR_RR^.params^[2]:=patanyreg_;
		patRR_RR^.params^[1]:=patanyreg_;
		patRR_RR^.params^[3]:=patint_;
		patRR_RR^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref t*)
		new(patRRPLUS_RRPLUS);
		patRRPLUS_RRPLUS^.meaning:=pAAssignMeaning4333_AAM4333;
		patRRPLUS_RRPLUS^.matchedassembler:=pAAssemblesto4367_AA4367;
		new(patRRPLUS_RRPLUS^.params);
		for i:= 1 to maxparam do patRRPLUS_RRPLUS^.params^[i]:=nil;
		patRRPLUS_RRPLUS^.params^[1]:=patmaddrmode_;
		patRRPLUS_RRPLUS^.params^[0]:=patanyreg_;
		patRRPLUS_RRPLUS^.params^[2]:=patint_;
		 
		(*! Matches identifier r1  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic4393_AID4393*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patRRM_RRM);
		patRRM_RRM^.meaning:=pAAssignMeaning4384_AAM4384;
		patRRM_RRM^.matchedassembler:=pAAssemblesto4410_AA4410;
		new(patRRM_RRM^.params);
		for i:= 1 to maxparam do patRRM_RRM^.params^[i]:=nil;
		patRRM_RRM^.params^[1]:=patpushreg_;
		patRRM_RRM^.params^[3]:=patint_;
		patRRM_RRM^.params^[2]:=patmaddrmode_;
		patRRM_RRM^.params^[0]:=patoperator_;
		 
		alternatives[224]:=patDH_DH;
		alternatives[225]:=patDL_DL;
		alternatives[226]:=patBH_BH;
		alternatives[227]:=patBL_BL;
		alternatives[228]:=patCH_CH;
		alternatives[229]:=patCL_CL;
		lastalt:=229;
		new(patbnonacreg_);
		patbnonacreg_^.meaning:=pAAlternativesPatterndecl4421_AAP4421;
		patbnonacreg_^.matchedassembler:=nil;
		patbnonacreg_^.params :=nil;
		alternatives[230]:=patAL_AL;
		lastalt:=230;
		new(patbaccreg_);
		patbaccreg_^.meaning:=pAAlternativesPatterndecl4436_AAP4436;
		patbaccreg_^.matchedassembler:=nil;
		patbaccreg_^.params :=nil;
		alternatives[231]:=patmaddrmode_;
		alternatives[232]:=patbaccreg_;
		lastalt:=232;
		new(patbaccregmode_);
		patbaccregmode_^.meaning:=pAAlternativesPatterndecl4441_AAP4441;
		patbaccregmode_^.matchedassembler:=nil;
		patbaccregmode_^.params :=nil;
		alternatives[233]:=patmaddrmode_;
		alternatives[234]:=patbnonacreg_;
		lastalt:=234;
		new(patbnonacregmode_);
		patbnonacregmode_^.meaning:=pAAlternativesPatterndecl4448_AAP4448;
		patbnonacregmode_^.matchedassembler:=nil;
		patbnonacregmode_^.params :=nil;
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patfastBIDIV_BIDIV);
		patfastBIDIV_BIDIV^.meaning:=pAAssignMeaning4458_AAM4458;
		patfastBIDIV_BIDIV^.matchedassembler:=pAAssemblesto4484_AA4484;
		new(patfastBIDIV_BIDIV^.params);
		for i:= 1 to maxparam do patfastBIDIV_BIDIV^.params^[i]:=nil;
		patfastBIDIV_BIDIV^.params^[1]:=patbnonacregmode_;
		patfastBIDIV_BIDIV^.params^[0]:=patbaccreg_;
		 
		(*! Matches identifier r3  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patBIDIV_BIDIV);
		patBIDIV_BIDIV^.meaning:=pAAssignMeaning4499_AAM4499;
		patBIDIV_BIDIV^.matchedassembler:=pAAssemblesto4525_AA4525;
		new(patBIDIV_BIDIV^.params);
		for i:= 1 to maxparam do patBIDIV_BIDIV^.params^[i]:=nil;
		patBIDIV_BIDIV^.params^[2]:=patbaccregmode_;
		patBIDIV_BIDIV^.params^[1]:=patbnonacregmode_;
		patBIDIV_BIDIV^.params^[0]:=patbaccreg_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patBIMUL_BIMUL);
		patBIMUL_BIMUL^.meaning:=pAAssignMeaning4541_AAM4541;
		patBIMUL_BIMUL^.matchedassembler:=pAAssemblesto4567_AA4567;
		new(patBIMUL_BIMUL^.params);
		for i:= 1 to maxparam do patBIMUL_BIMUL^.params^[i]:=nil;
		patBIMUL_BIMUL^.params^[1]:=patbnonacreg_;
		patBIMUL_BIMUL^.params^[0]:=patbaccreg_;
		 
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier a  to the tree at this point*)
		(*! Matches identifier d  to the tree at this point*)
		new(patfastIMUL_IMUL);
		patfastIMUL_IMUL^.meaning:=pAAssignMeaning4581_AAM4581;
		patfastIMUL_IMUL^.matchedassembler:=pAAssemblesto4607_AA4607;
		new(patfastIMUL_IMUL^.params);
		for i:= 1 to maxparam do patfastIMUL_IMUL^.params^[i]:=nil;
		patfastIMUL_IMUL^.params^[0]:=patacc_;
		patfastIMUL_IMUL^.params^[1]:=patdacc_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patCDQ_CDQ);
		patCDQ_CDQ^.meaning:=pAAssignMeaning4617_AAM4617;
		patCDQ_CDQ^.matchedassembler:=pAAssemblesto4627_AA4627;
		new(patCDQ_CDQ^.params);
		for i:= 1 to maxparam do patCDQ_CDQ^.params^[i]:=nil;
		patCDQ_CDQ^.params^[1]:=patacc_;
		patCDQ_CDQ^.params^[0]:=patqacc_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r3  to the tree at this point*)
		new(patIDIV_IDIV);
		patIDIV_IDIV^.meaning:=pAAssignMeaning4639_AAM4639;
		patIDIV_IDIV^.matchedassembler:=pAAssemblesto4653_AA4653;
		new(patIDIV_IDIV^.params);
		for i:= 1 to maxparam do patIDIV_IDIV^.params^[i]:=nil;
		patIDIV_IDIV^.params^[2]:=patindexreg_;
		patIDIV_IDIV^.params^[1]:=patqacc_;
		patIDIV_IDIV^.params^[0]:=patacc_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r3  to the tree at this point*)
		new(patRIDIV_RIDIV);
		patRIDIV_RIDIV^.meaning:=pAAssignMeaning4666_AAM4666;
		patRIDIV_RIDIV^.matchedassembler:=pAAssemblesto4680_AA4680;
		new(patRIDIV_RIDIV^.params);
		for i:= 1 to maxparam do patRIDIV_RIDIV^.params^[i]:=nil;
		patRIDIV_RIDIV^.params^[2]:=patindexreg_;
		patRIDIV_RIDIV^.params^[1]:=patqacc_;
		patRIDIV_RIDIV^.params^[0]:=patindexreg_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patSIDIV_SIDIV);
		patSIDIV_SIDIV^.meaning:=pAValueMeaning4694_AVM4694;
		patSIDIV_SIDIV^.matchedassembler:=pAAssemblesto4715_AA4715;
		new(patSIDIV_SIDIV^.params);
		for i:= 1 to maxparam do patSIDIV_SIDIV^.params^[i]:=nil;
		patSIDIV_SIDIV^.params^[1]:=patmodreg_;
		patSIDIV_SIDIV^.params^[0]:=patacc_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patUDIV_UDIV);
		patUDIV_UDIV^.meaning:=pAValueMeaning4727_AVM4727;
		patUDIV_UDIV^.matchedassembler:=pAAssemblesto4748_AA4748;
		new(patUDIV_UDIV^.params);
		for i:= 1 to maxparam do patUDIV_UDIV^.params^[i]:=nil;
		patUDIV_UDIV^.params^[1]:=patmodreg_;
		patUDIV_UDIV^.params^[0]:=patacc_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		new(patIMULLIT_IMULLIT);
		patIMULLIT_IMULLIT^.meaning:=pAAssignMeaning4762_AAM4762;
		patIMULLIT_IMULLIT^.matchedassembler:=pAAssemblesto4780_AA4780;
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
		patIMOD_IMOD^.meaning:=pAValueMeaning4795_AVM4795;
		patIMOD_IMOD^.matchedassembler:=pAAssemblesto4816_AA4816;
		new(patIMOD_IMOD^.params);
		for i:= 1 to maxparam do patIMOD_IMOD^.params^[i]:=nil;
		patIMOD_IMOD^.params^[1]:=patmodreg_;
		patIMOD_IMOD^.params^[0]:=patacc_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patUMOD_UMOD);
		patUMOD_UMOD^.meaning:=pAValueMeaning4828_AVM4828;
		patUMOD_UMOD^.matchedassembler:=pAAssemblesto4849_AA4849;
		new(patUMOD_UMOD^.params);
		for i:= 1 to maxparam do patUMOD_UMOD^.params^[i]:=nil;
		patUMOD_UMOD^.params^[1]:=patmodreg_;
		patUMOD_UMOD^.params^[0]:=patacc_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patBIMOD_BIMOD);
		patBIMOD_BIMOD^.meaning:=pAAssignMeaning4861_AAM4861;
		patBIMOD_BIMOD^.matchedassembler:=pAAssemblesto4887_AA4887;
		new(patBIMOD_BIMOD^.params);
		for i:= 1 to maxparam do patBIMOD_BIMOD^.params^[i]:=nil;
		patBIMOD_BIMOD^.params^[1]:=patbnonacreg_;
		patBIMOD_BIMOD^.params^[0]:=patbaccreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patMOD2_MOD2);
		patMOD2_MOD2^.meaning:=pAAssignMeaning4901_AAM4901;
		patMOD2_MOD2^.matchedassembler:=pAAssemblesto4915_AA4915;
		new(patMOD2_MOD2^.params);
		for i:= 1 to maxparam do patMOD2_MOD2^.params^[i]:=nil;
		patMOD2_MOD2^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patMOD4_MOD4);
		patMOD4_MOD4^.meaning:=pAAssignMeaning4925_AAM4925;
		patMOD4_MOD4^.matchedassembler:=pAAssemblesto4939_AA4939;
		new(patMOD4_MOD4^.params);
		for i:= 1 to maxparam do patMOD4_MOD4^.params^[i]:=nil;
		patMOD4_MOD4^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patMOD8_MOD8);
		patMOD8_MOD8^.meaning:=pAAssignMeaning4949_AAM4949;
		patMOD8_MOD8^.matchedassembler:=pAAssemblesto4963_AA4963;
		new(patMOD8_MOD8^.params);
		for i:= 1 to maxparam do patMOD8_MOD8^.params^[i]:=nil;
		patMOD8_MOD8^.params^[0]:=patreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patDIV8_DIV8);
		patDIV8_DIV8^.meaning:=pAAssignMeaning4973_AAM4973;
		patDIV8_DIV8^.matchedassembler:=pAAssemblesto4993_AA4993;
		new(patDIV8_DIV8^.params);
		for i:= 1 to maxparam do patDIV8_DIV8^.params^[i]:=nil;
		patDIV8_DIV8^.params^[0]:=patureg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patMOD16_MOD16);
		patMOD16_MOD16^.meaning:=pAAssignMeaning5003_AAM5003;
		patMOD16_MOD16^.matchedassembler:=pAAssemblesto5017_AA5017;
		new(patMOD16_MOD16^.params);
		for i:= 1 to maxparam do patMOD16_MOD16^.params^[i]:=nil;
		patMOD16_MOD16^.params^[0]:=patreg_;
		 
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANT_PLANT);
		patPLANT_PLANT^.meaning:=pAValueMeaning5027_AVM5027;
		patPLANT_PLANT^.matchedassembler:=pAAssemblesto5030_AA5030;
		new(patPLANT_PLANT^.params);
		for i:= 1 to maxparam do patPLANT_PLANT^.params^[i]:=nil;
		patPLANT_PLANT^.params^[0]:=patlabel_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTRCONST_PLANTRCONST);
		patPLANTRCONST_PLANTRCONST^.meaning:=pALocMeaning5041_ALM5041;
		patPLANTRCONST_PLANTRCONST^.matchedassembler:=pAAssemblesto5048_AA5048;
		new(patPLANTRCONST_PLANTRCONST^.params);
		for i:= 1 to maxparam do patPLANTRCONST_PLANTRCONST^.params^[i]:=nil;
		patPLANTRCONST_PLANTRCONST^.params^[1]:=pattype_;
		patPLANTRCONST_PLANTRCONST^.params^[0]:=patdouble_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTICONST_PLANTICONST);
		patPLANTICONST_PLANTICONST^.meaning:=pALocMeaning5059_ALM5059;
		patPLANTICONST_PLANTICONST^.matchedassembler:=pAAssemblesto5066_AA5066;
		new(patPLANTICONST_PLANTICONST^.params);
		for i:= 1 to maxparam do patPLANTICONST_PLANTICONST^.params^[i]:=nil;
		patPLANTICONST_PLANTICONST^.params^[1]:=pattype_;
		patPLANTICONST_PLANTICONST^.params^[0]:=patlongint_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTSCONST_PLANTSCONST);
		patPLANTSCONST_PLANTSCONST^.meaning:=pALocMeaning5077_ALM5077;
		patPLANTSCONST_PLANTSCONST^.matchedassembler:=pAAssemblesto5084_AA5084;
		new(patPLANTSCONST_PLANTSCONST^.params);
		for i:= 1 to maxparam do patPLANTSCONST_PLANTSCONST^.params^[i]:=nil;
		patPLANTSCONST_PLANTSCONST^.params^[1]:=pattype_;
		patPLANTSCONST_PLANTSCONST^.params^[0]:=patfloat_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTBCONST_PLANTBCONST);
		patPLANTBCONST_PLANTBCONST^.meaning:=pALocMeaning5095_ALM5095;
		patPLANTBCONST_PLANTBCONST^.matchedassembler:=pAAssemblesto5102_AA5102;
		new(patPLANTBCONST_PLANTBCONST^.params);
		for i:= 1 to maxparam do patPLANTBCONST_PLANTBCONST^.params^[i]:=nil;
		patPLANTBCONST_PLANTBCONST^.params^[1]:=pattype_;
		patPLANTBCONST_PLANTBCONST^.params^[0]:=patbyte_;
		 
		(*! Matches identifier r  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patPLANTWCONST_PLANTWCONST);
		patPLANTWCONST_PLANTWCONST^.meaning:=pALocMeaning5113_ALM5113;
		patPLANTWCONST_PLANTWCONST^.matchedassembler:=pAAssemblesto5120_AA5120;
		new(patPLANTWCONST_PLANTWCONST^.params);
		for i:= 1 to maxparam do patPLANTWCONST_PLANTWCONST^.params^[i]:=nil;
		patPLANTWCONST_PLANTWCONST^.params^[1]:=pattype_;
		patPLANTWCONST_PLANTWCONST^.params^[0]:=patword16_16;
		 
		(*! Matches identifier i  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFAIL_FAIL);
		patFAIL_FAIL^.meaning:=pAFailMeaning5129_AFM5129;
		patFAIL_FAIL^.matchedassembler:=pAAssemblesto5132_AA5132;
		new(patFAIL_FAIL^.params);
		for i:= 1 to maxparam do patFAIL_FAIL^.params^[i]:=nil;
		patFAIL_FAIL^.params^[0]:=patint_;
		 
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patGOTO_GOTO);
		patGOTO_GOTO^.meaning:=pAGotoMeaning5141_AGM5141;
		patGOTO_GOTO^.matchedassembler:=pAAssemblesto5144_AA5144;
		new(patGOTO_GOTO^.params);
		for i:= 1 to maxparam do patGOTO_GOTO^.params^[i]:=nil;
		patGOTO_GOTO^.params^[0]:=patjumpmode_;
		 
(* defds ->public boolean pAIdentifierDyadic5169_AID5169*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFLITGOTO_IFLITGOTO);
		patIFLITGOTO_IFLITGOTO^.meaning:=pAIfMeaning5163_AIM5163;
		patIFLITGOTO_IFLITGOTO^.matchedassembler:=pAAssemblesto5183_AA5183;
		new(patIFLITGOTO_IFLITGOTO^.params);
		for i:= 1 to maxparam do patIFLITGOTO_IFLITGOTO^.params^[i]:=nil;
		patIFLITGOTO_IFLITGOTO^.params^[5]:=patint_;
		patIFLITGOTO_IFLITGOTO^.params^[2]:=patsigned_;
		patIFLITGOTO_IFLITGOTO^.params^[0]:=patlabel_;
		patIFLITGOTO_IFLITGOTO^.params^[1]:=pataddrmode_;
		patIFLITGOTO_IFLITGOTO^.params^[4]:=patsigned_;
		patIFLITGOTO_IFLITGOTO^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic5216_AID5216*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFULITGOTO_IFULITGOTO);
		patIFULITGOTO_IFULITGOTO^.meaning:=pAIfMeaning5210_AIM5210;
		patIFULITGOTO_IFULITGOTO^.matchedassembler:=pAAssemblesto5234_AA5234;
		new(patIFULITGOTO_IFULITGOTO^.params);
		for i:= 1 to maxparam do patIFULITGOTO_IFULITGOTO^.params^[i]:=nil;
		patIFULITGOTO_IFULITGOTO^.params^[5]:=patint_;
		patIFULITGOTO_IFULITGOTO^.params^[2]:=patunsigned_;
		patIFULITGOTO_IFULITGOTO^.params^[0]:=patlabel_;
		patIFULITGOTO_IFULITGOTO^.params^[1]:=pataddrmode_;
		patIFULITGOTO_IFULITGOTO^.params^[4]:=patunsigned_;
		patIFULITGOTO_IFULITGOTO^.params^[3]:=patunsignedcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic5261_AID5261*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patBIFLITGOTO_BIFLITGOTO);
		patBIFLITGOTO_BIFLITGOTO^.meaning:=pAIfMeaning5259_AIM5259;
		patBIFLITGOTO_BIFLITGOTO^.matchedassembler:=pAAssemblesto5275_AA5275;
		new(patBIFLITGOTO_BIFLITGOTO^.params);
		for i:= 1 to maxparam do patBIFLITGOTO_BIFLITGOTO^.params^[i]:=nil;
		patBIFLITGOTO_BIFLITGOTO^.params^[0]:=patlabel_;
		patBIFLITGOTO_BIFLITGOTO^.params^[2]:=patsigned_;
		patBIFLITGOTO_BIFLITGOTO^.params^[1]:=patbaddrmode_;
		patBIFLITGOTO_BIFLITGOTO^.params^[4]:=patsigned_;
		patBIFLITGOTO_BIFLITGOTO^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic5311_AID5311*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFGOTOB_IFGOTOB);
		patIFGOTOB_IFGOTOB^.meaning:=pAIfMeaning5303_AIM5303;
		patIFGOTOB_IFGOTOB^.matchedassembler:=pAAssemblesto5327_AA5327;
		new(patIFGOTOB_IFGOTOB^.params);
		for i:= 1 to maxparam do patIFGOTOB_IFGOTOB^.params^[i]:=nil;
		patIFGOTOB_IFGOTOB^.params^[5]:=patint_;
		patIFGOTOB_IFGOTOB^.params^[2]:=patregaddrimmediate_;
		patIFGOTOB_IFGOTOB^.params^[0]:=patlabel_;
		patIFGOTOB_IFGOTOB^.params^[1]:=patbireg_;
		patIFGOTOB_IFGOTOB^.params^[4]:=patsigned_;
		patIFGOTOB_IFGOTOB^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic5361_AID5361*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFGOTOW_IFGOTOW);
		patIFGOTOW_IFGOTOW^.meaning:=pAIfMeaning5353_AIM5353;
		patIFGOTOW_IFGOTOW^.matchedassembler:=pAAssemblesto5377_AA5377;
		new(patIFGOTOW_IFGOTOW^.params);
		for i:= 1 to maxparam do patIFGOTOW_IFGOTOW^.params^[i]:=nil;
		patIFGOTOW_IFGOTOW^.params^[5]:=patint_;
		patIFGOTOW_IFGOTOW^.params^[2]:=patregaddrimmediate_;
		patIFGOTOW_IFGOTOW^.params^[0]:=patlabel_;
		patIFGOTOW_IFGOTOW^.params^[1]:=patwreg_;
		patIFGOTOW_IFGOTOW^.params^[4]:=patsigned_;
		patIFGOTOW_IFGOTOW^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic5411_AID5411*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFGOTO_IFGOTO);
		patIFGOTO_IFGOTO^.meaning:=pAIfMeaning5403_AIM5403;
		patIFGOTO_IFGOTO^.matchedassembler:=pAAssemblesto5427_AA5427;
		new(patIFGOTO_IFGOTO^.params);
		for i:= 1 to maxparam do patIFGOTO_IFGOTO^.params^[i]:=nil;
		patIFGOTO_IFGOTO^.params^[5]:=patint_;
		patIFGOTO_IFGOTO^.params^[2]:=patregaddrimmediate_;
		patIFGOTO_IFGOTO^.params^[0]:=patlabel_;
		patIFGOTO_IFGOTO^.params^[1]:=patireg_;
		patIFGOTO_IFGOTO^.params^[4]:=patsigned_;
		patIFGOTO_IFGOTO^.params^[3]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic5461_AID5461*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFUGOTO_IFUGOTO);
		patIFUGOTO_IFUGOTO^.meaning:=pAIfMeaning5453_AIM5453;
		patIFUGOTO_IFUGOTO^.matchedassembler:=pAAssemblesto5473_AA5473;
		new(patIFUGOTO_IFUGOTO^.params);
		for i:= 1 to maxparam do patIFUGOTO_IFUGOTO^.params^[i]:=nil;
		patIFUGOTO_IFUGOTO^.params^[5]:=patint_;
		patIFUGOTO_IFUGOTO^.params^[2]:=patureg_;
		patIFUGOTO_IFUGOTO^.params^[0]:=patlabel_;
		patIFUGOTO_IFUGOTO^.params^[1]:=patureg_;
		patIFUGOTO_IFUGOTO^.params^[4]:=patsigned_;
		patIFUGOTO_IFUGOTO^.params^[3]:=patunsignedcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic5507_AID5507*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r3  to the tree at this point*)
		new(patIFASSp6_IFASS6);
		patIFASSp6_IFASS6^.meaning:=pAIfMeaning5501_AIM5501;
		patIFASSp6_IFASS6^.matchedassembler:=pAAssemblesto5538_AA5538;
		new(patIFASSp6_IFASS6^.params);
		for i:= 1 to maxparam do patIFASSp6_IFASS6^.params^[i]:=nil;
		patIFASSp6_IFASS6^.params^[4]:=patmaddrmode_;
		patIFASSp6_IFASS6^.params^[1]:=patregaddrimmediate_;
		patIFASSp6_IFASS6^.params^[0]:=patsignedreg_;
		patIFASSp6_IFASS6^.params^[6]:=pattype_;
		patIFASSp6_IFASS6^.params^[3]:=pattype_;
		patIFASSp6_IFASS6^.params^[5]:=patmaddrmode_;
		patIFASSp6_IFASS6^.params^[2]:=patcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic5583_AID5583*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref t*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patIFASS_IFASS);
		patIFASS_IFASS^.meaning:=pAIfMeaning5577_AIM5577;
		patIFASS_IFASS^.matchedassembler:=pAAssemblesto5614_AA5614;
		new(patIFASS_IFASS^.params);
		for i:= 1 to maxparam do patIFASS_IFASS^.params^[i]:=nil;
		patIFASS_IFASS^.params^[1]:=patacc_;
		patIFASS_IFASS^.params^[0]:=patsignedreg_;
		patIFASS_IFASS^.params^[3]:=pattype_;
		patIFASS_IFASS^.params^[5]:=pattype_;
		patIFASS_IFASS^.params^[2]:=patmaddrmode_;
		patIFASS_IFASS^.params^[4]:=patequals_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic5646_AID5646*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSET_SET);
		patSET_SET^.meaning:=pAAssignMeaning5637_AAM5637;
		patSET_SET^.matchedassembler:=pAAssemblesto5663_AA5663;
		new(patSET_SET^.params);
		for i:= 1 to maxparam do patSET_SET^.params^[i]:=nil;
		patSET_SET^.params^[5]:=patbyte_;
		patSET_SET^.params^[1]:=patreg_;
		patSET_SET^.params^[4]:=patsigned_;
		patSET_SET^.params^[3]:=patbreg_;
		patSET_SET^.params^[2]:=patreg_;
		patSET_SET^.params^[0]:=patcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic5696_AID5696*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSETU_SETU);
		patSETU_SETU^.meaning:=pAAssignMeaning5691_AAM5691;
		patSETU_SETU^.matchedassembler:=pAAssemblesto5711_AA5711;
		new(patSETU_SETU^.params);
		for i:= 1 to maxparam do patSETU_SETU^.params^[i]:=nil;
		patSETU_SETU^.params^[1]:=patureg_;
		patSETU_SETU^.params^[4]:=patunsigned_;
		patSETU_SETU^.params^[3]:=patbreg_;
		patSETU_SETU^.params^[2]:=patureg_;
		patSETU_SETU^.params^[0]:=patunsignedcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic5750_AID5750*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSETW_SETW);
		patSETW_SETW^.meaning:=pAAssignMeaning5741_AAM5741;
		patSETW_SETW^.matchedassembler:=pAAssemblesto5769_AA5769;
		new(patSETW_SETW^.params);
		for i:= 1 to maxparam do patSETW_SETW^.params^[i]:=nil;
		patSETW_SETW^.params^[5]:=patbyte_;
		patSETW_SETW^.params^[1]:=patwreg_;
		patSETW_SETW^.params^[4]:=patsigned_;
		patSETW_SETW^.params^[3]:=patbreg_;
		patSETW_SETW^.params^[2]:=patwreg_;
		patSETW_SETW^.params^[0]:=patcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic5802_AID5802*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSETUW_SETUW);
		patSETUW_SETUW^.meaning:=pAAssignMeaning5797_AAM5797;
		patSETUW_SETUW^.matchedassembler:=pAAssemblesto5819_AA5819;
		new(patSETUW_SETUW^.params);
		for i:= 1 to maxparam do patSETUW_SETUW^.params^[i]:=nil;
		patSETUW_SETUW^.params^[1]:=patuwreg_;
		patSETUW_SETUW^.params^[4]:=patunsigned_;
		patSETUW_SETUW^.params^[3]:=patbreg_;
		patSETUW_SETUW^.params^[2]:=patuwregaddrimmediate_;
		patSETUW_SETUW^.params^[0]:=patunsignedcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic5858_AID5858*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSETB_SETB);
		patSETB_SETB^.meaning:=pAAssignMeaning5849_AAM5849;
		patSETB_SETB^.matchedassembler:=pAAssemblesto5875_AA5875;
		new(patSETB_SETB^.params);
		for i:= 1 to maxparam do patSETB_SETB^.params^[i]:=nil;
		patSETB_SETB^.params^[5]:=patbyte_;
		patSETB_SETB^.params^[1]:=patbireg_;
		patSETB_SETB^.params^[4]:=patsigned_;
		patSETB_SETB^.params^[3]:=patbreg_;
		patSETB_SETB^.params^[2]:=patbireg_;
		patSETB_SETB^.params^[0]:=patcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic5908_AID5908*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSETUB_SETUB);
		patSETUB_SETUB^.meaning:=pAAssignMeaning5903_AAM5903;
		patSETUB_SETUB^.matchedassembler:=pAAssemblesto5925_AA5925;
		new(patSETUB_SETUB^.params);
		for i:= 1 to maxparam do patSETUB_SETUB^.params^[i]:=nil;
		patSETUB_SETUB^.params^[1]:=patbureg_;
		patSETUB_SETUB^.params^[4]:=patunsigned_;
		patSETUB_SETUB^.params^[3]:=patbreg_;
		patSETUB_SETUB^.params^[2]:=patbureg_;
		patSETUB_SETUB^.params^[0]:=patunsignedcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic5958_AID5958*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSETeq_SET);
		patSETeq_SET^.meaning:=pAAssignMeaning5953_AAM5953;
		patSETeq_SET^.matchedassembler:=pAAssemblesto5973_AA5973;
		new(patSETeq_SET^.params);
		for i:= 1 to maxparam do patSETeq_SET^.params^[i]:=nil;
		patSETeq_SET^.params^[1]:=patreg_;
		patSETeq_SET^.params^[4]:=patoplen_;
		patSETeq_SET^.params^[3]:=patbreg_;
		patSETeq_SET^.params^[2]:=patregaddrimmediate_;
		patSETeq_SET^.params^[0]:=pateqcondition_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patIFBOOL_IFBOOL);
		patIFBOOL_IFBOOL^.meaning:=pAIfMeaning5995_AIM5995;
		patIFBOOL_IFBOOL^.matchedassembler:=pAAssemblesto6009_AA6009;
		new(patIFBOOL_IFBOOL^.params);
		for i:= 1 to maxparam do patIFBOOL_IFBOOL^.params^[i]:=nil;
		patIFBOOL_IFBOOL^.params^[0]:=patlabel_;
		patIFBOOL_IFBOOL^.params^[1]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! matches a literal  to the tree at this point*)
		new(patBOUNDC_BOUNDC);
		patBOUNDC_BOUNDC^.meaning:=pAIfMeaning6026_AIM6026;
		patBOUNDC_BOUNDC^.matchedassembler:=pAAssemblesto6050_AA6050;
		new(patBOUNDC_BOUNDC^.params);
		for i:= 1 to maxparam do patBOUNDC_BOUNDC^.params^[i]:=nil;
		patBOUNDC_BOUNDC^.params^[0]:=patreg_;
		patBOUNDC_BOUNDC^.params^[1]:=patint_;
		patBOUNDC_BOUNDC^.params^[2]:=patint_;
		 
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		new(patBOUND0_BOUND0);
		patBOUND0_BOUND0^.meaning:=pAIfMeaning6065_AIM6065;
		patBOUND0_BOUND0^.matchedassembler:=pAAssemblesto6119_AA6119;
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
		patBOUND4_BOUND4^.meaning:=pAIfMeaning6133_AIM6133;
		patBOUND4_BOUND4^.matchedassembler:=pAAssemblesto6193_AA6193;
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
		patBOUND16_BOUND16^.meaning:=pAIfMeaning6207_AIM6207;
		patBOUND16_BOUND16^.matchedassembler:=pAAssemblesto6267_AA6267;
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
		patIFIN_IFIN^.meaning:=pAIfMeaning6283_AIM6283;
		patIFIN_IFIN^.matchedassembler:=pAAssemblesto6323_AA6323;
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
		patTESTIN_TESTIN^.meaning:=pAAssignMeaning6342_AAM6342;
		patTESTIN_TESTIN^.matchedassembler:=pAAssemblesto6378_AA6378;
		new(patTESTIN_TESTIN^.params);
		for i:= 1 to maxparam do patTESTIN_TESTIN^.params^[i]:=nil;
		patTESTIN_TESTIN^.params^[1]:=patreg_;
		patTESTIN_TESTIN^.params^[0]:=patreg_;
		patTESTIN_TESTIN^.params^[3]:=pattype_;
		patTESTIN_TESTIN^.params^[2]:=patbreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! try to cast to type: ref uint8*)
		(*! Matches identifier r1  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r2  to the tree at this point*)
		new(patBTS_BTS);
		patBTS_BTS^.meaning:=pAAssignMeaning6397_AAM6397;
		patBTS_BTS^.matchedassembler:=pAAssemblesto6439_AA6439;
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
		patREPMOVSD_REPMOVSD^.meaning:=pAForMeaning6456_AFM6456;
		patREPMOVSD_REPMOVSD^.matchedassembler:=pAAssemblesto6541_AA6541;
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
		patREPMOVSB_REPMOVSB^.meaning:=pAForMeaning6555_AFM6555;
		patREPMOVSB_REPMOVSB^.matchedassembler:=pAAssemblesto6626_AA6626;
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
		alternatives[235]:=patieee32_32;
		alternatives[236]:=patieee64_64;
		lastalt:=236;
		new(patanyreal_);
		patanyreal_^.meaning:=pAAlternativesPatterndecl6643_AAP6643;
		patanyreal_^.matchedassembler:=nil;
		patanyreal_^.params :=nil;
		alternatives[237]:=patanyreal_;
		alternatives[238]:=patint64_64;
		alternatives[239]:=patint32_32;
		lastalt:=239;
		new(patfputype_);
		patfputype_^.meaning:=pAAlternativesPatterndecl6652_AAP6652;
		patfputype_^.matchedassembler:=nil;
		patfputype_^.params :=nil;
		alternatives[240]:=patint32_32;
		alternatives[241]:=patint16_16;
		alternatives[242]:=patint64_64;
		lastalt:=242;
		new(patfpuint_);
		patfpuint_^.meaning:=pAAlternativesPatterndecl6665_AAP6665;
		patfpuint_^.matchedassembler:=nil;
		patfpuint_^.params :=nil;
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
		alternatives[243]:=patadd_;
		alternatives[244]:=patsub_;
		alternatives[245]:=patmul_;
		alternatives[246]:=patfdiv_;
		lastalt:=246;
		new(patfoperator_);
		patfoperator_^.meaning:=pAAlternativesPatterndecl6688_AAP6688;
		patfoperator_^.matchedassembler:=nil;
		patfoperator_^.params :=nil;
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfround_);
		patfround_^.meaning:=pAValueMeaning6703_AVM6703;
		patfround_^.matchedassembler:=pAAssemblesto6716_AA6716;
		new(patfround_^.params);
		for i:= 1 to maxparam do patfround_^.params^[i]:=nil;
		patfround_^.params^[1]:=patfpuint_;
		patfround_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfsqrt_);
		patfsqrt_^.meaning:=pAValueMeaning6725_AVM6725;
		patfsqrt_^.matchedassembler:=pAAssemblesto6738_AA6738;
		new(patfsqrt_^.params);
		for i:= 1 to maxparam do patfsqrt_^.params^[i]:=nil;
		patfsqrt_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfsin_);
		patfsin_^.meaning:=pAValueMeaning6747_AVM6747;
		patfsin_^.matchedassembler:=pAAssemblesto6760_AA6760;
		new(patfsin_^.params);
		for i:= 1 to maxparam do patfsin_^.params^[i]:=nil;
		patfsin_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfcos_);
		patfcos_^.meaning:=pAValueMeaning6769_AVM6769;
		patfcos_^.matchedassembler:=pAAssemblesto6782_AA6782;
		new(patfcos_^.params);
		for i:= 1 to maxparam do patfcos_^.params^[i]:=nil;
		patfcos_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfextend_);
		patfextend_^.meaning:=pAValueMeaning6791_AVM6791;
		patfextend_^.matchedassembler:=pAAssemblesto6808_AA6808;
		new(patfextend_^.params);
		for i:= 1 to maxparam do patfextend_^.params^[i]:=nil;
		patfextend_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfln_);
		patfln_^.meaning:=pAValueMeaning6817_AVM6817;
		patfln_^.matchedassembler:=pAAssemblesto6830_AA6830;
		new(patfln_^.params);
		for i:= 1 to maxparam do patfln_^.params^[i]:=nil;
		patfln_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfptan_);
		patfptan_^.meaning:=pAValueMeaning6839_AVM6839;
		patfptan_^.matchedassembler:=pAAssemblesto6852_AA6852;
		new(patfptan_^.params);
		for i:= 1 to maxparam do patfptan_^.params^[i]:=nil;
		patfptan_^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patfabs_);
		patfabs_^.meaning:=pAValueMeaning6861_AVM6861;
		patfabs_^.matchedassembler:=pAAssemblesto6874_AA6874;
		new(patfabs_^.params);
		for i:= 1 to maxparam do patfabs_^.params^[i]:=nil;
		patfabs_^.params^[0]:=pattype_;
		 
		alternatives[247]:=patfround_;
		alternatives[248]:=patfsqrt_;
		alternatives[249]:=patfsin_;
		alternatives[250]:=patfcos_;
		alternatives[251]:=patfptan_;
		alternatives[252]:=patfln_;
		alternatives[253]:=patfabs_;
		alternatives[254]:=patfextend_;
		lastalt:=254;
		new(patfmoperator_);
		patfmoperator_^.meaning:=pAAlternativesPatterndecl6881_AAP6881;
		patfmoperator_^.matchedassembler:=nil;
		patfmoperator_^.params :=nil;
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier b2  to the tree at this point*)
		new(patRDIVB_RDIVB);
		patRDIVB_RDIVB^.meaning:=pAAssignMeaning6903_AAM6903;
		patRDIVB_RDIVB^.matchedassembler:=pAAssemblesto6917_AA6917;
		new(patRDIVB_RDIVB^.params);
		for i:= 1 to maxparam do patRDIVB_RDIVB^.params^[i]:=nil;
		patRDIVB_RDIVB^.params^[1]:=patbaddrmode_;
		patRDIVB_RDIVB^.params^[0]:=patbreg_;
		 
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier b2  to the tree at this point*)
		new(patRMULTB_RMULTB);
		patRMULTB_RMULTB^.meaning:=pAAssignMeaning6930_AAM6930;
		patRMULTB_RMULTB^.matchedassembler:=pAAssemblesto6944_AA6944;
		new(patRMULTB_RMULTB^.params);
		for i:= 1 to maxparam do patRMULTB_RMULTB^.params^[i]:=nil;
		patRMULTB_RMULTB^.params^[1]:=patbaddrmode_;
		patRMULTB_RMULTB^.params^[0]:=patbreg_;
		 
		(*! Matches identifier b1  to the tree at this point*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFISTB_FISTB);
		patFISTB_FISTB^.meaning:=pAAssignMeaning6955_AAM6955;
		patFISTB_FISTB^.matchedassembler:=pAAssemblesto6973_AA6973;
		new(patFISTB_FISTB^.params);
		for i:= 1 to maxparam do patFISTB_FISTB^.params^[i]:=nil;
		patFISTB_FISTB^.params^[0]:=patbreg_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier b2  to the tree at this point*)
		new(patFILDB_FILDB);
		patFILDB_FILDB^.meaning:=pAValueMeaning6982_AVM6982;
		patFILDB_FILDB^.matchedassembler:=pAAssemblesto6997_AA6997;
		new(patFILDB_FILDB^.params);
		for i:= 1 to maxparam do patFILDB_FILDB^.params^[i]:=nil;
		patFILDB_FILDB^.params^[0]:=patbaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patFILDR_FILDR);
		patFILDR_FILDR^.meaning:=pAValueMeaning7006_AVM7006;
		patFILDR_FILDR^.matchedassembler:=pAAssemblesto7021_AA7021;
		new(patFILDR_FILDR^.params);
		for i:= 1 to maxparam do patFILDR_FILDR^.params^[i]:=nil;
		patFILDR_FILDR^.params^[0]:=patreg_;
		 
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFSTR_FSTR);
		patFSTR_FSTR^.meaning:=pAAssignMeaning7031_AAM7031;
		patFSTR_FSTR^.matchedassembler:=pAAssemblesto7047_AA7047;
		new(patFSTR_FSTR^.params);
		for i:= 1 to maxparam do patFSTR_FSTR^.params^[i]:=nil;
		patFSTR_FSTR^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFSTRF_FSTRF);
		patFSTRF_FSTRF^.meaning:=pAAssignMeaning7056_AAM7056;
		patFSTRF_FSTRF^.matchedassembler:=pAAssemblesto7072_AA7072;
		new(patFSTRF_FSTRF^.params);
		for i:= 1 to maxparam do patFSTRF_FSTRF^.params^[i]:=nil;
		patFSTRF_FSTRF^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFLOATMS_FLOATMS);
		patFLOATMS_FLOATMS^.meaning:=pAValueMeaning7083_AVM7083;
		patFLOATMS_FLOATMS^.matchedassembler:=pAAssemblesto7100_AA7100;
		new(patFLOATMS_FLOATMS^.params);
		for i:= 1 to maxparam do patFLOATMS_FLOATMS^.params^[i]:=nil;
		patFLOATMS_FLOATMS^.params^[0]:=patanyreal_;
		patFLOATMS_FLOATMS^.params^[1]:=pathiint_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patEXTENDMS_EXTENDMS);
		patEXTENDMS_EXTENDMS^.meaning:=pAValueMeaning7108_AVM7108;
		patEXTENDMS_EXTENDMS^.matchedassembler:=pAAssemblesto7129_AA7129;
		new(patEXTENDMS_EXTENDMS^.params);
		for i:= 1 to maxparam do patEXTENDMS_EXTENDMS^.params^[i]:=nil;
		patEXTENDMS_EXTENDMS^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patEXTENDANY_EXTENDANY);
		patEXTENDANY_EXTENDANY^.meaning:=pAValueMeaning7137_AVM7137;
		patEXTENDANY_EXTENDANY^.matchedassembler:=pAAssemblesto7155_AA7155;
		new(patEXTENDANY_EXTENDANY^.params);
		for i:= 1 to maxparam do patEXTENDANY_EXTENDANY^.params^[i]:=nil;
		patEXTENDANY_EXTENDANY^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPOPMS_FPOPMS);
		patFPOPMS_FPOPMS^.meaning:=pAValueMeaning7163_AVM7163;
		patFPOPMS_FPOPMS^.matchedassembler:=pAAssemblesto7175_AA7175;
		new(patFPOPMS_FPOPMS^.params);
		for i:= 1 to maxparam do patFPOPMS_FPOPMS^.params^[i]:=nil;
		patFPOPMS_FPOPMS^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPOPMSI64_FPOPMSI64);
		patFPOPMSI64_FPOPMSI64^.meaning:=pAValueMeaning7183_AVM7183;
		patFPOPMSI64_FPOPMSI64^.matchedassembler:=pAAssemblesto7196_AA7196;
		new(patFPOPMSI64_FPOPMSI64^.params);
		for i:= 1 to maxparam do patFPOPMSI64_FPOPMSI64^.params^[i]:=nil;
		patFPOPMSI64_FPOPMSI64^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patDPOPMS_DPOPMS);
		patDPOPMS_DPOPMS^.meaning:=pAValueMeaning7204_AVM7204;
		patDPOPMS_DPOPMS^.matchedassembler:=pAAssemblesto7216_AA7216;
		new(patDPOPMS_DPOPMS^.params);
		for i:= 1 to maxparam do patDPOPMS_DPOPMS^.params^[i]:=nil;
		patDPOPMS_DPOPMS^.params^[0]:=pattype_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPUSHD_FPUSHD);
		patFPUSHD_FPUSHD^.meaning:=pAValueMeaning7224_AVM7224;
		patFPUSHD_FPUSHD^.matchedassembler:=pAAssemblesto7236_AA7236;
		new(patFPUSHD_FPUSHD^.params);
		for i:= 1 to maxparam do patFPUSHD_FPUSHD^.params^[i]:=nil;
		patFPUSHD_FPUSHD^.params^[0]:=pattype_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPUSHF_FPUSHF);
		patFPUSHF_FPUSHF^.meaning:=pAValueMeaning7244_AVM7244;
		patFPUSHF_FPUSHF^.matchedassembler:=pAAssemblesto7256_AA7256;
		new(patFPUSHF_FPUSHF^.params);
		for i:= 1 to maxparam do patFPUSHF_FPUSHF^.params^[i]:=nil;
		patFPUSHF_FPUSHF^.params^[0]:=pattype_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref i*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFISTR_FISTR);
		patFISTR_FISTR^.meaning:=pAAssignMeaning7266_AAM7266;
		patFISTR_FISTR^.matchedassembler:=pAAssemblesto7280_AA7280;
		new(patFISTR_FISTR^.params);
		for i:= 1 to maxparam do patFISTR_FISTR^.params^[i]:=nil;
		patFISTR_FISTR^.params^[0]:=patwmemdummy_;
		patFISTR_FISTR^.params^[1]:=pathiint_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPUSHI_FPUSHI);
		patFPUSHI_FPUSHI^.meaning:=pAValueMeaning7291_AVM7291;
		patFPUSHI_FPUSHI^.matchedassembler:=pAAssemblesto7304_AA7304;
		new(patFPUSHI_FPUSHI^.params);
		for i:= 1 to maxparam do patFPUSHI_FPUSHI^.params^[i]:=nil;
		patFPUSHI_FPUSHI^.params^[0]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		new(patFLD_FLD);
		patFLD_FLD^.meaning:=pAValueMeaning7312_AVM7312;
		patFLD_FLD^.matchedassembler:=pAAssemblesto7326_AA7326;
		new(patFLD_FLD^.params);
		for i:= 1 to maxparam do patFLD_FLD^.params^[i]:=nil;
		patFLD_FLD^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		new(patFLDF_FLDF);
		patFLDF_FLDF^.meaning:=pAValueMeaning7335_AVM7335;
		patFLDF_FLDF^.matchedassembler:=pAAssemblesto7349_AA7349;
		new(patFLDF_FLDF^.params);
		for i:= 1 to maxparam do patFLDF_FLDF^.params^[i]:=nil;
		patFLDF_FLDF^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref i*)
		new(patFILD_FILD);
		patFILD_FILD^.meaning:=pAValueMeaning7362_AVM7362;
		patFILD_FILD^.matchedassembler:=pAAssemblesto7375_AA7375;
		new(patFILD_FILD^.params);
		for i:= 1 to maxparam do patFILD_FILD^.params^[i]:=nil;
		patFILD_FILD^.params^[0]:=patwmemdummy_;
		patFILD_FILD^.params^[2]:=pathiint_;
		patFILD_FILD^.params^[1]:=patreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		new(patFILDF_FILDF);
		patFILDF_FILDF^.meaning:=pAValueMeaning7391_AVM7391;
		patFILDF_FILDF^.matchedassembler:=pAAssemblesto7406_AA7406;
		new(patFILDF_FILDF^.params);
		for i:= 1 to maxparam do patFILDF_FILDF^.params^[i]:=nil;
		patFILDF_FILDF^.params^[0]:=patmaddrmode_;
		patFILDF_FILDF^.params^[2]:=pathiint_;
		patFILDF_FILDF^.params^[1]:=patreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patFLOATLDR_FLOATLDR);
		patFLOATLDR_FLOATLDR^.meaning:=pAValueMeaning7420_AVM7420;
		patFLOATLDR_FLOATLDR^.matchedassembler:=pAAssemblesto7441_AA7441;
		new(patFLOATLDR_FLOATLDR^.params);
		for i:= 1 to maxparam do patFLOATLDR_FLOATLDR^.params^[i]:=nil;
		patFLOATLDR_FLOATLDR^.params^[1]:=patanyreal_;
		patFLOATLDR_FLOATLDR^.params^[0]:=patreg_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFILDIP_FILDIP);
		patFILDIP_FILDIP^.meaning:=pAValueMeaning7451_AVM7451;
		patFILDIP_FILDIP^.matchedassembler:=pAAssemblesto7464_AA7464;
		new(patFILDIP_FILDIP^.params);
		for i:= 1 to maxparam do patFILDIP_FILDIP^.params^[i]:=nil;
		patFILDIP_FILDIP^.params^[0]:=patreal_;
		 
		new(patflt_);
		new(patflt_^.meaning);
		patflt_^.meaning^.tag:=dyadicop;
		patflt_^.meaning^.opname:='<';
		patflt_^.matchedassembler:=string2printlist('b' );
		new(patfgt_);
		new(patfgt_^.meaning);
		patfgt_^.meaning^.tag:=dyadicop;
		patfgt_^.meaning^.opname:='>';
		patfgt_^.matchedassembler:=string2printlist('a' );
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
		alternatives[255]:=patfne_;
		alternatives[256]:=patfge_;
		alternatives[257]:=patfle_;
		alternatives[258]:=patfeq_;
		alternatives[259]:=patfgt_;
		alternatives[260]:=patflt_;
		lastalt:=260;
		new(patfcondition_);
		patfcondition_^.meaning:=pAAlternativesPatterndecl7495_AAP7495;
		patfcondition_^.matchedassembler:=nil;
		patfcondition_^.params :=nil;
		alternatives[261]:=patieee32_32;
		alternatives[262]:=patieee64_64;
		alternatives[263]:=patint32_32;
		alternatives[264]:=patint64_64;
		lastalt:=264;
		new(patfpuval_);
		patfpuval_^.meaning:=pAAlternativesPatterndecl7510_AAP7510;
		patfpuval_^.matchedassembler:=nil;
		patfpuval_^.params :=nil;
(* defds ->public boolean pAIdentifierDyadic7542_AID7542*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patp6FIFGOTO_6FIFGOTO);
		patp6FIFGOTO_6FIFGOTO^.meaning:=pAIfMeaning7536_AIM7536;
		patp6FIFGOTO_6FIFGOTO^.matchedassembler:=pAAssemblesto7558_AA7558;
		new(patp6FIFGOTO_6FIFGOTO^.params);
		for i:= 1 to maxparam do patp6FIFGOTO_6FIFGOTO^.params^[i]:=nil;
		patp6FIFGOTO_6FIFGOTO^.params^[1]:=patmaddrmode_;
		patp6FIFGOTO_6FIFGOTO^.params^[0]:=patlabel_;
		patp6FIFGOTO_6FIFGOTO^.params^[3]:=patint_;
		patp6FIFGOTO_6FIFGOTO^.params^[4]:=patfpuval_;
		patp6FIFGOTO_6FIFGOTO^.params^[2]:=patfcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic7583_AID7583*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFIFGOTO_FIFGOTO);
		patFIFGOTO_FIFGOTO^.meaning:=pAIfMeaning7577_AIM7577;
		patFIFGOTO_FIFGOTO^.matchedassembler:=pAAssemblesto7602_AA7602;
		new(patFIFGOTO_FIFGOTO^.params);
		for i:= 1 to maxparam do patFIFGOTO_FIFGOTO^.params^[i]:=nil;
		patFIFGOTO_FIFGOTO^.params^[1]:=patmaddrmode_;
		patFIFGOTO_FIFGOTO^.params^[0]:=patlabel_;
		patFIFGOTO_FIFGOTO^.params^[3]:=patint_;
		patFIFGOTO_FIFGOTO^.params^[4]:=patfpuval_;
		patFIFGOTO_FIFGOTO^.params^[2]:=patfcondition_;
		 
(* defds ->public boolean pAIdentifierDyadic7627_AID7627*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFIFGOTOgeneral_FIFGOTO);
		patFIFGOTOgeneral_FIFGOTO^.meaning:=pAIfMeaning7621_AIM7621;
		patFIFGOTOgeneral_FIFGOTO^.matchedassembler:=pAAssemblesto7643_AA7643;
		new(patFIFGOTOgeneral_FIFGOTO^.params);
		for i:= 1 to maxparam do patFIFGOTOgeneral_FIFGOTO^.params^[i]:=nil;
		patFIFGOTOgeneral_FIFGOTO^.params^[0]:=patlabel_;
		patFIFGOTOgeneral_FIFGOTO^.params^[2]:=patint_;
		patFIFGOTOgeneral_FIFGOTO^.params^[3]:=patfpuval_;
		patFIFGOTOgeneral_FIFGOTO^.params^[1]:=patfcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref int8*)
(* defds ->public boolean pAIdentifierDyadic7675_AID7675*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFSET_FSET);
		patFSET_FSET^.meaning:=pAAssignMeaning7658_AAM7658;
		patFSET_FSET^.matchedassembler:=pAAssemblesto7688_AA7688;
		new(patFSET_FSET^.params);
		for i:= 1 to maxparam do patFSET_FSET^.params^[i]:=nil;
		patFSET_FSET^.params^[2]:=patfpuval_;
		patFSET_FSET^.params^[1]:=patbreg_;
		patFSET_FSET^.params^[0]:=patfcondition_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier op  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMOP_FMOP);
		patFMOP_FMOP^.meaning:=pAValueMeaning7703_AVM7703;
		patFMOP_FMOP^.matchedassembler:=pAAssemblesto7710_AA7710;
		new(patFMOP_FMOP^.params);
		for i:= 1 to maxparam do patFMOP_FMOP^.params^[i]:=nil;
		patFMOP_FMOP^.params^[0]:=patfmoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFCHS_FCHS);
		patFCHS_FCHS^.meaning:=pAValueMeaning7718_AVM7718;
		patFCHS_FCHS^.matchedassembler:=pAAssemblesto7743_AA7743;
		new(patFCHS_FCHS^.params);
		for i:= 1 to maxparam do patFCHS_FCHS^.params^[i]:=nil;
		patFCHS_FCHS^.params^[0]:=patreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! matches a literal  to the tree at this point*)
		new(patFLOADLIT_FLOADLIT);
		patFLOADLIT_FLOADLIT^.meaning:=pAValueMeaning7751_AVM7751;
		patFLOADLIT_FLOADLIT^.matchedassembler:=pAAssemblesto7758_AA7758;
		new(patFLOADLIT_FLOADLIT^.params);
		for i:= 1 to maxparam do patFLOADLIT_FLOADLIT^.params^[i]:=nil;
		patFLOADLIT_FLOADLIT^.params^[0]:=patfloat_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! matches a literal  to the tree at this point*)
		new(patFLOADDLIT_FLOADDLIT);
		patFLOADDLIT_FLOADDLIT^.meaning:=pAValueMeaning7769_AVM7769;
		patFLOADDLIT_FLOADDLIT^.matchedassembler:=pAAssemblesto7780_AA7780;
		new(patFLOADDLIT_FLOADDLIT^.params);
		for i:= 1 to maxparam do patFLOADDLIT_FLOADDLIT^.params^[i]:=nil;
		patFLOADDLIT_FLOADDLIT^.params^[1]:=patanyreal_;
		patFLOADDLIT_FLOADDLIT^.params^[0]:=patreal_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! matches a literal  to the tree at this point*)
		new(patFILOADLIT_FILOADLIT);
		patFILOADLIT_FILOADLIT^.meaning:=pAValueMeaning7791_AVM7791;
		patFILOADLIT_FILOADLIT^.matchedassembler:=pAAssemblesto7802_AA7802;
		new(patFILOADLIT_FILOADLIT^.params);
		for i:= 1 to maxparam do patFILOADLIT_FILOADLIT^.params^[i]:=nil;
		patFILOADLIT_FILOADLIT^.params^[1]:=patfputype_;
		patFILOADLIT_FILOADLIT^.params^[0]:=pathiint_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic7819_AID7819*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		new(patFOP_FOP);
		patFOP_FOP^.meaning:=pAValueMeaning7813_AVM7813;
		patFOP_FOP^.matchedassembler:=pAAssemblesto7836_AA7836;
		new(patFOP_FOP^.params);
		for i:= 1 to maxparam do patFOP_FOP^.params^[i]:=nil;
		patFOP_FOP^.params^[0]:=patmaddrmode_;
		patFOP_FOP^.params^[1]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic7861_AID7861*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		(*! try to cast to type: ref t*)
		new(patFOPF_FOPF);
		patFOPF_FOPF^.meaning:=pAValueMeaning7851_AVM7851;
		patFOPF_FOPF^.matchedassembler:=pAAssemblesto7880_AA7880;
		new(patFOPF_FOPF^.params);
		for i:= 1 to maxparam do patFOPF_FOPF^.params^[i]:=nil;
		patFOPF_FOPF^.params^[0]:=patmaddrmode_;
		patFOPF_FOPF^.params^[2]:=patreal_;
		patFOPF_FOPF^.params^[1]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic7903_AID7903*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		new(patFOPI_FOPI);
		patFOPI_FOPI^.meaning:=pAValueMeaning7897_AVM7897;
		patFOPI_FOPI^.matchedassembler:=pAAssemblesto7916_AA7916;
		new(patFOPI_FOPI^.params);
		for i:= 1 to maxparam do patFOPI_FOPI^.params^[i]:=nil;
		patFOPI_FOPI^.params^[0]:=patmaddrmode_;
		patFOPI_FOPI^.params^[2]:=patfputype_;
		patFOPI_FOPI^.params^[1]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic7937_AID7937*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier a  to the tree at this point*)
		new(patFOPII_FOPII);
		patFOPII_FOPII^.meaning:=pAValueMeaning7931_AVM7931;
		patFOPII_FOPII^.matchedassembler:=pAAssemblesto7948_AA7948;
		new(patFOPII_FOPII^.params);
		for i:= 1 to maxparam do patFOPII_FOPII^.params^[i]:=nil;
		patFOPII_FOPII^.params^[0]:=patmaddrmode_;
		patFOPII_FOPII^.params^[2]:=patfputype_;
		patFOPII_FOPII^.params^[1]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
(* defds ->public boolean pAIdentifierDyadic7971_AID7971*)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patReversePolishFOP_RPFOP);
		patReversePolishFOP_RPFOP^.meaning:=pAValueMeaning7961_AVM7961;
		patReversePolishFOP_RPFOP^.matchedassembler:=pAAssemblesto7984_AA7984;
		new(patReversePolishFOP_RPFOP^.params);
		for i:= 1 to maxparam do patReversePolishFOP_RPFOP^.params^[i]:=nil;
		patReversePolishFOP_RPFOP^.params^[1]:=patfputype_;
		patReversePolishFOP_RPFOP^.params^[0]:=patfoperator_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMAXp6_FMAX6);
		patFMAXp6_FMAX6^.meaning:=pAValueMeaning7997_AVM7997;
		patFMAXp6_FMAX6^.matchedassembler:=pAAssemblesto8016_AA8016;
		new(patFMAXp6_FMAX6^.params);
		for i:= 1 to maxparam do patFMAXp6_FMAX6^.params^[i]:=nil;
		patFMAXp6_FMAX6^.params^[0]:=patmaddrmode_;
		patFMAXp6_FMAX6^.params^[1]:=pattype_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patMAXp6_MAX6);
		patMAXp6_MAX6^.meaning:=pAAssignMeaning8026_AAM8026;
		patMAXp6_MAX6^.matchedassembler:=pAAssemblesto8046_AA8046;
		new(patMAXp6_MAX6^.params);
		for i:= 1 to maxparam do patMAXp6_MAX6^.params^[i]:=nil;
		patMAXp6_MAX6^.params^[1]:=patreg_;
		patMAXp6_MAX6^.params^[0]:=patreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patMINp6_MIN6);
		patMINp6_MIN6^.meaning:=pAAssignMeaning8063_AAM8063;
		patMINp6_MIN6^.matchedassembler:=pAAssemblesto8083_AA8083;
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
		patFMINp6_FMIN6^.meaning:=pAValueMeaning8100_AVM8100;
		patFMINp6_FMIN6^.matchedassembler:=pAAssemblesto8119_AA8119;
		new(patFMINp6_FMIN6^.params);
		for i:= 1 to maxparam do patFMINp6_FMIN6^.params^[i]:=nil;
		patFMINp6_FMIN6^.params^[0]:=patmaddrmode_;
		patFMINp6_FMIN6^.params^[1]:=pattype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMAX_FMAX);
		patFMAX_FMAX^.meaning:=pAValueMeaning8129_AVM8129;
		patFMAX_FMAX^.matchedassembler:=pAAssemblesto8152_AA8152;
		new(patFMAX_FMAX^.params);
		for i:= 1 to maxparam do patFMAX_FMAX^.params^[i]:=nil;
		patFMAX_FMAX^.params^[0]:=patmaddrmode_;
		patFMAX_FMAX^.params^[1]:=patfputype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFMIN_FMIN);
		patFMIN_FMIN^.meaning:=pAValueMeaning8162_AVM8162;
		patFMIN_FMIN^.matchedassembler:=pAAssemblesto8185_AA8185;
		new(patFMIN_FMIN^.params);
		for i:= 1 to maxparam do patFMIN_FMIN^.params^[i]:=nil;
		patFMIN_FMIN^.params^[0]:=patmaddrmode_;
		patFMIN_FMIN^.params^[1]:=patfputype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPREM_FPREM);
		patFPREM_FPREM^.meaning:=pAValueMeaning8193_AVM8193;
		patFPREM_FPREM^.matchedassembler:=pAAssemblesto8216_AA8216;
		new(patFPREM_FPREM^.params);
		for i:= 1 to maxparam do patFPREM_FPREM^.params^[i]:=nil;
		patFPREM_FPREM^.params^[0]:=patfputype_;
		 
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier ST  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patFPREMu_FPREM);
		patFPREMu_FPREM^.meaning:=pAValueMeaning8224_AVM8224;
		patFPREMu_FPREM^.matchedassembler:=pAAssemblesto8247_AA8247;
		new(patFPREMu_FPREM^.params);
		for i:= 1 to maxparam do patFPREMu_FPREM^.params^[i]:=nil;
		patFPREMu_FPREM^.params^[0]:=patint_;
		 
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
			registers[regMM0_MM0code].basecode:=[40..47];
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
			registers[regMM1_MM1code].basecode:=[48..55];
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
			registers[regMM2_MM2code].basecode:=[56..63];
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
			registers[regMM3_MM3code].basecode:=[64..71];
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
			registers[regMM4_MM4code].basecode:=[72..79];
			registers[53].format:=(0+fref+funsigned+3);
			registers[53].printsas:='MM1';
			registers[53].permanentlyreserved:=false;
			registers[53].code:=regMM1U_MM1Ucode;
			registers[53].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+7];
			new(patMM1U_MM1U);
		new(	patMM1U_MM1U^.meaning);
		new(	patMM1U_MM1U^.matchedassembler);
			patMM1U_MM1U^.meaning^.tag:=reg;
			patMM1U_MM1U^.meaning^.index:=regMM1U_MM1Ucode;
			patMM1U_MM1U^.params:=nil;
			patMM1U_MM1U^.matchedassembler:=string2printlist('MM1');
			registers[54].format:=(0+fref+fsigned+3);
			registers[54].printsas:='MM1';
			registers[54].permanentlyreserved:=false;
			registers[54].code:=regMM1I_MM1Icode;
			registers[54].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+7];
			new(patMM1I_MM1I);
		new(	patMM1I_MM1I^.meaning);
		new(	patMM1I_MM1I^.matchedassembler);
			patMM1I_MM1I^.meaning^.tag:=reg;
			patMM1I_MM1I^.meaning^.index:=regMM1I_MM1Icode;
			patMM1I_MM1I^.params:=nil;
			patMM1I_MM1I^.matchedassembler:=string2printlist('MM1');
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
			registers[regMM7_MM7code].basecode:=[80..87];
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
			registers[regMM5_MM5code].basecode:=[88..95];
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
			registers[regMM6_MM6code].basecode:=[96..103];
			registers[58].format:=(0+fref+2);
			registers[58].printsas:='MM0';
			registers[58].permanentlyreserved:=false;
			registers[58].code:=regMM0L_MM0Lcode;
			registers[58].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+3];
			new(patMM0L_MM0L);
		new(	patMM0L_MM0L^.meaning);
		new(	patMM0L_MM0L^.matchedassembler);
			patMM0L_MM0L^.meaning^.tag:=reg;
			patMM0L_MM0L^.meaning^.index:=regMM0L_MM0Lcode;
			patMM0L_MM0L^.params:=nil;
			patMM0L_MM0L^.matchedassembler:=string2printlist('MM0');
			registers[59].format:=(0+fref+2);
			registers[59].printsas:='MM1';
			registers[59].permanentlyreserved:=false;
			registers[59].code:=regMM1L_MM1Lcode;
			registers[59].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+3];
			new(patMM1L_MM1L);
		new(	patMM1L_MM1L^.meaning);
		new(	patMM1L_MM1L^.matchedassembler);
			patMM1L_MM1L^.meaning^.tag:=reg;
			patMM1L_MM1L^.meaning^.index:=regMM1L_MM1Lcode;
			patMM1L_MM1L^.params:=nil;
			patMM1L_MM1L^.matchedassembler:=string2printlist('MM1');
			registers[60].format:=(0+fref+2);
			registers[60].printsas:='MM2';
			registers[60].permanentlyreserved:=false;
			registers[60].code:=regMM2L_MM2Lcode;
			registers[60].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+3];
			new(patMM2L_MM2L);
		new(	patMM2L_MM2L^.meaning);
		new(	patMM2L_MM2L^.matchedassembler);
			patMM2L_MM2L^.meaning^.tag:=reg;
			patMM2L_MM2L^.meaning^.index:=regMM2L_MM2Lcode;
			patMM2L_MM2L^.params:=nil;
			patMM2L_MM2L^.matchedassembler:=string2printlist('MM2');
			registers[61].format:=(0+fref+2);
			registers[61].printsas:='MM3';
			registers[61].permanentlyreserved:=false;
			registers[61].code:=regMM3L_MM3Lcode;
			registers[61].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+3];
			new(patMM3L_MM3L);
		new(	patMM3L_MM3L^.meaning);
		new(	patMM3L_MM3L^.matchedassembler);
			patMM3L_MM3L^.meaning^.tag:=reg;
			patMM3L_MM3L^.meaning^.index:=regMM3L_MM3Lcode;
			patMM3L_MM3L^.params:=nil;
			patMM3L_MM3L^.matchedassembler:=string2printlist('MM3');
			registers[62].format:=(0+fref+2);
			registers[62].printsas:='MM4';
			registers[62].permanentlyreserved:=false;
			registers[62].code:=regMM4L_MM4Lcode;
			registers[62].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+3];
			new(patMM4L_MM4L);
		new(	patMM4L_MM4L^.meaning);
		new(	patMM4L_MM4L^.matchedassembler);
			patMM4L_MM4L^.meaning^.tag:=reg;
			patMM4L_MM4L^.meaning^.index:=regMM4L_MM4Lcode;
			patMM4L_MM4L^.params:=nil;
			patMM4L_MM4L^.matchedassembler:=string2printlist('MM4');
			registers[63].format:=(0+fref+2);
			registers[63].printsas:='MM1';
			registers[63].permanentlyreserved:=false;
			registers[63].code:=regMM1LU_MM1LUcode;
			registers[63].basecode:=[(regMM1U_MM1Ucode+0)..(regMM1U_MM1Ucode+0)+3];
			new(patMM1LU_MM1LU);
		new(	patMM1LU_MM1LU^.meaning);
		new(	patMM1LU_MM1LU^.matchedassembler);
			patMM1LU_MM1LU^.meaning^.tag:=reg;
			patMM1LU_MM1LU^.meaning^.index:=regMM1LU_MM1LUcode;
			patMM1LU_MM1LU^.params:=nil;
			patMM1LU_MM1LU^.matchedassembler:=string2printlist('MM1');
			registers[64].format:=(0+fref+2);
			registers[64].printsas:='MM1';
			registers[64].permanentlyreserved:=false;
			registers[64].code:=regMM1LI_MM1LIcode;
			registers[64].basecode:=[(regMM1I_MM1Icode+0)..(regMM1I_MM1Icode+0)+3];
			new(patMM1LI_MM1LI);
		new(	patMM1LI_MM1LI^.meaning);
		new(	patMM1LI_MM1LI^.matchedassembler);
			patMM1LI_MM1LI^.meaning^.tag:=reg;
			patMM1LI_MM1LI^.meaning^.index:=regMM1LI_MM1LIcode;
			patMM1LI_MM1LI^.params:=nil;
			patMM1LI_MM1LI^.matchedassembler:=string2printlist('MM1');
			registers[65].format:=(0+fref+2);
			registers[65].printsas:='MM5';
			registers[65].permanentlyreserved:=false;
			registers[65].code:=regMM5L_MM5Lcode;
			registers[65].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+3];
			new(patMM5L_MM5L);
		new(	patMM5L_MM5L^.meaning);
		new(	patMM5L_MM5L^.matchedassembler);
			patMM5L_MM5L^.meaning^.tag:=reg;
			patMM5L_MM5L^.meaning^.index:=regMM5L_MM5Lcode;
			patMM5L_MM5L^.params:=nil;
			patMM5L_MM5L^.matchedassembler:=string2printlist('MM5');
			registers[66].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[66].printsas:='MM0';
			registers[66].permanentlyreserved:=false;
			registers[66].code:=regMM016_MM016code;
			registers[66].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+7];
			new(patMM016_MM016);
		new(	patMM016_MM016^.meaning);
		new(	patMM016_MM016^.matchedassembler);
			patMM016_MM016^.meaning^.tag:=reg;
			patMM016_MM016^.meaning^.index:=regMM016_MM016code;
			patMM016_MM016^.params:=nil;
			patMM016_MM016^.matchedassembler:=string2printlist('MM0');
			registers[67].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[67].printsas:='MM1';
			registers[67].permanentlyreserved:=false;
			registers[67].code:=regMM116_MM116code;
			registers[67].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+7];
			new(patMM116_MM116);
		new(	patMM116_MM116^.meaning);
		new(	patMM116_MM116^.matchedassembler);
			patMM116_MM116^.meaning^.tag:=reg;
			patMM116_MM116^.meaning^.index:=regMM116_MM116code;
			patMM116_MM116^.params:=nil;
			patMM116_MM116^.matchedassembler:=string2printlist('MM1');
			registers[68].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[68].printsas:='MM2';
			registers[68].permanentlyreserved:=false;
			registers[68].code:=regMM216_MM216code;
			registers[68].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+7];
			new(patMM216_MM216);
		new(	patMM216_MM216^.meaning);
		new(	patMM216_MM216^.matchedassembler);
			patMM216_MM216^.meaning^.tag:=reg;
			patMM216_MM216^.meaning^.index:=regMM216_MM216code;
			patMM216_MM216^.params:=nil;
			patMM216_MM216^.matchedassembler:=string2printlist('MM2');
			registers[69].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[69].printsas:='MM3';
			registers[69].permanentlyreserved:=false;
			registers[69].code:=regMM316_MM316code;
			registers[69].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+7];
			new(patMM316_MM316);
		new(	patMM316_MM316^.meaning);
		new(	patMM316_MM316^.matchedassembler);
			patMM316_MM316^.meaning^.tag:=reg;
			patMM316_MM316^.meaning^.index:=regMM316_MM316code;
			patMM316_MM316^.params:=nil;
			patMM316_MM316^.matchedassembler:=string2printlist('MM3');
			registers[70].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[70].printsas:='MM4';
			registers[70].permanentlyreserved:=false;
			registers[70].code:=regMM416_MM416code;
			registers[70].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+7];
			new(patMM416_MM416);
		new(	patMM416_MM416^.meaning);
		new(	patMM416_MM416^.matchedassembler);
			patMM416_MM416^.meaning^.tag:=reg;
			patMM416_MM416^.meaning^.index:=regMM416_MM416code;
			patMM416_MM416^.params:=nil;
			patMM416_MM416^.matchedassembler:=string2printlist('MM4');
			registers[71].format:=(0+fref+fvector+4*fvecmult+fsigned+1);
			registers[71].printsas:='MM5';
			registers[71].permanentlyreserved:=false;
			registers[71].code:=regMM516_MM516code;
			registers[71].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+7];
			new(patMM516_MM516);
		new(	patMM516_MM516^.meaning);
		new(	patMM516_MM516^.matchedassembler);
			patMM516_MM516^.meaning^.tag:=reg;
			patMM516_MM516^.meaning^.index:=regMM516_MM516code;
			patMM516_MM516^.params:=nil;
			patMM516_MM516^.matchedassembler:=string2printlist('MM5');
			registers[72].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[72].printsas:='MM0';
			registers[72].permanentlyreserved:=false;
			registers[72].code:=regMM032_MM032code;
			registers[72].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+7];
			new(patMM032_MM032);
		new(	patMM032_MM032^.meaning);
		new(	patMM032_MM032^.matchedassembler);
			patMM032_MM032^.meaning^.tag:=reg;
			patMM032_MM032^.meaning^.index:=regMM032_MM032code;
			patMM032_MM032^.params:=nil;
			patMM032_MM032^.matchedassembler:=string2printlist('MM0');
			registers[73].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[73].printsas:='MM1';
			registers[73].permanentlyreserved:=false;
			registers[73].code:=regMM132_MM132code;
			registers[73].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+7];
			new(patMM132_MM132);
		new(	patMM132_MM132^.meaning);
		new(	patMM132_MM132^.matchedassembler);
			patMM132_MM132^.meaning^.tag:=reg;
			patMM132_MM132^.meaning^.index:=regMM132_MM132code;
			patMM132_MM132^.params:=nil;
			patMM132_MM132^.matchedassembler:=string2printlist('MM1');
			registers[74].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[74].printsas:='MM2';
			registers[74].permanentlyreserved:=false;
			registers[74].code:=regMM232_MM232code;
			registers[74].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+7];
			new(patMM232_MM232);
		new(	patMM232_MM232^.meaning);
		new(	patMM232_MM232^.matchedassembler);
			patMM232_MM232^.meaning^.tag:=reg;
			patMM232_MM232^.meaning^.index:=regMM232_MM232code;
			patMM232_MM232^.params:=nil;
			patMM232_MM232^.matchedassembler:=string2printlist('MM2');
			registers[75].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[75].printsas:='MM3';
			registers[75].permanentlyreserved:=false;
			registers[75].code:=regMM332_MM332code;
			registers[75].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+7];
			new(patMM332_MM332);
		new(	patMM332_MM332^.meaning);
		new(	patMM332_MM332^.matchedassembler);
			patMM332_MM332^.meaning^.tag:=reg;
			patMM332_MM332^.meaning^.index:=regMM332_MM332code;
			patMM332_MM332^.params:=nil;
			patMM332_MM332^.matchedassembler:=string2printlist('MM3');
			registers[76].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[76].printsas:='MM4';
			registers[76].permanentlyreserved:=false;
			registers[76].code:=regMM432_MM432code;
			registers[76].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+7];
			new(patMM432_MM432);
		new(	patMM432_MM432^.meaning);
		new(	patMM432_MM432^.matchedassembler);
			patMM432_MM432^.meaning^.tag:=reg;
			patMM432_MM432^.meaning^.index:=regMM432_MM432code;
			patMM432_MM432^.params:=nil;
			patMM432_MM432^.matchedassembler:=string2printlist('MM4');
			registers[77].format:=(0+fref+fvector+2*fvecmult+fsigned+2);
			registers[77].printsas:='MM5';
			registers[77].permanentlyreserved:=false;
			registers[77].code:=regMM532_MM532code;
			registers[77].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+7];
			new(patMM532_MM532);
		new(	patMM532_MM532^.meaning);
		new(	patMM532_MM532^.matchedassembler);
			patMM532_MM532^.meaning^.tag:=reg;
			patMM532_MM532^.meaning^.index:=regMM532_MM532code;
			patMM532_MM532^.params:=nil;
			patMM532_MM532^.matchedassembler:=string2printlist('MM5');
			registers[78].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[78].printsas:='MM0';
			registers[78].permanentlyreserved:=false;
			registers[78].code:=regMM08_MM08code;
			registers[78].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+7];
			new(patMM08_MM08);
		new(	patMM08_MM08^.meaning);
		new(	patMM08_MM08^.matchedassembler);
			patMM08_MM08^.meaning^.tag:=reg;
			patMM08_MM08^.meaning^.index:=regMM08_MM08code;
			patMM08_MM08^.params:=nil;
			patMM08_MM08^.matchedassembler:=string2printlist('MM0');
			registers[79].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[79].printsas:='MM1';
			registers[79].permanentlyreserved:=false;
			registers[79].code:=regMM18_MM18code;
			registers[79].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+7];
			new(patMM18_MM18);
		new(	patMM18_MM18^.meaning);
		new(	patMM18_MM18^.matchedassembler);
			patMM18_MM18^.meaning^.tag:=reg;
			patMM18_MM18^.meaning^.index:=regMM18_MM18code;
			patMM18_MM18^.params:=nil;
			patMM18_MM18^.matchedassembler:=string2printlist('MM1');
			registers[80].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[80].printsas:='MM2';
			registers[80].permanentlyreserved:=false;
			registers[80].code:=regMM28_MM28code;
			registers[80].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+7];
			new(patMM28_MM28);
		new(	patMM28_MM28^.meaning);
		new(	patMM28_MM28^.matchedassembler);
			patMM28_MM28^.meaning^.tag:=reg;
			patMM28_MM28^.meaning^.index:=regMM28_MM28code;
			patMM28_MM28^.params:=nil;
			patMM28_MM28^.matchedassembler:=string2printlist('MM2');
			registers[81].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[81].printsas:='MM3';
			registers[81].permanentlyreserved:=false;
			registers[81].code:=regMM38_MM38code;
			registers[81].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+7];
			new(patMM38_MM38);
		new(	patMM38_MM38^.meaning);
		new(	patMM38_MM38^.matchedassembler);
			patMM38_MM38^.meaning^.tag:=reg;
			patMM38_MM38^.meaning^.index:=regMM38_MM38code;
			patMM38_MM38^.params:=nil;
			patMM38_MM38^.matchedassembler:=string2printlist('MM3');
			registers[82].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[82].printsas:='MM4';
			registers[82].permanentlyreserved:=false;
			registers[82].code:=regMM48_MM48code;
			registers[82].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+7];
			new(patMM48_MM48);
		new(	patMM48_MM48^.meaning);
		new(	patMM48_MM48^.matchedassembler);
			patMM48_MM48^.meaning^.tag:=reg;
			patMM48_MM48^.meaning^.index:=regMM48_MM48code;
			patMM48_MM48^.params:=nil;
			patMM48_MM48^.matchedassembler:=string2printlist('MM4');
			registers[83].format:=(0+fref+fvector+8*fvecmult+fsigned+0);
			registers[83].printsas:='MM5';
			registers[83].permanentlyreserved:=false;
			registers[83].code:=regMM58_MM58code;
			registers[83].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+7];
			new(patMM58_MM58);
		new(	patMM58_MM58^.meaning);
		new(	patMM58_MM58^.matchedassembler);
			patMM58_MM58^.meaning^.tag:=reg;
			patMM58_MM58^.meaning^.index:=regMM58_MM58code;
			patMM58_MM58^.params:=nil;
			patMM58_MM58^.matchedassembler:=string2printlist('MM5');
		alternatives[265]:=patMM48_MM48;
		alternatives[266]:=patMM38_MM38;
		alternatives[267]:=patMM58_MM58;
		alternatives[268]:=patMM08_MM08;
		alternatives[269]:=patMM18_MM18;
		alternatives[270]:=patMM28_MM28;
		lastalt:=270;
		new(patim8reg_8);
		patim8reg_8^.meaning:=pAAlternativesPatterndecl8606_AAP8606;
		patim8reg_8^.matchedassembler:=nil;
		patim8reg_8^.params :=nil;
		alternatives[271]:=patMM432_MM432;
		alternatives[272]:=patMM332_MM332;
		alternatives[273]:=patMM532_MM532;
		alternatives[274]:=patMM032_MM032;
		alternatives[275]:=patMM132_MM132;
		alternatives[276]:=patMM232_MM232;
		lastalt:=276;
		new(patim2reg_2);
		patim2reg_2^.meaning:=pAAlternativesPatterndecl8621_AAP8621;
		patim2reg_2^.matchedassembler:=nil;
		patim2reg_2^.params :=nil;
		alternatives[277]:=patMM416_MM416;
		alternatives[278]:=patMM316_MM316;
		alternatives[279]:=patMM516_MM516;
		alternatives[280]:=patMM016_MM016;
		alternatives[281]:=patMM116_MM116;
		alternatives[282]:=patMM216_MM216;
		lastalt:=282;
		new(patim4reg_4);
		patim4reg_4^.meaning:=pAAlternativesPatterndecl8636_AAP8636;
		patim4reg_4^.matchedassembler:=nil;
		patim4reg_4^.params :=nil;
		alternatives[283]:=patMM1_MM1;
		alternatives[284]:=patMM3_MM3;
		alternatives[285]:=patMM4_MM4;
		alternatives[286]:=patMM5_MM5;
		alternatives[287]:=patMM2_MM2;
		alternatives[288]:=patMM0_MM0;
		alternatives[289]:=patMM7_MM7;
		alternatives[290]:=patMM6_MM6;
		lastalt:=290;
		new(patuntypedmreg_);
		patuntypedmreg_^.meaning:=pAAlternativesPatterndecl8651_AAP8651;
		patuntypedmreg_^.matchedassembler:=nil;
		patuntypedmreg_^.params :=nil;
		alternatives[291]:=patMM1L_MM1L;
		alternatives[292]:=patMM3L_MM3L;
		alternatives[293]:=patMM4L_MM4L;
		alternatives[294]:=patMM2L_MM2L;
		alternatives[295]:=patMM0L_MM0L;
		alternatives[296]:=patMM5L_MM5L;
		lastalt:=296;
		new(patlmreg_);
		patlmreg_^.meaning:=pAAlternativesPatterndecl8670_AAP8670;
		patlmreg_^.matchedassembler:=nil;
		patlmreg_^.params :=nil;
		alternatives[297]:=patMM1U_MM1U;
		lastalt:=297;
		new(patumreg_);
		patumreg_^.meaning:=pAAlternativesPatterndecl8685_AAP8685;
		patumreg_^.matchedassembler:=nil;
		patumreg_^.params :=nil;
		alternatives[298]:=patMM1I_MM1I;
		lastalt:=298;
		new(patiMreg_M);
		patiMreg_M^.meaning:=pAAlternativesPatterndecl8690_AAP8690;
		patiMreg_M^.matchedassembler:=nil;
		patiMreg_M^.params :=nil;
		alternatives[299]:=patMM1LI_MM1LI;
		lastalt:=299;
		new(patilmreg_);
		patilmreg_^.meaning:=pAAlternativesPatterndecl8695_AAP8695;
		patilmreg_^.matchedassembler:=nil;
		patilmreg_^.params :=nil;
		alternatives[300]:=patMM1LU_MM1LU;
		lastalt:=300;
		new(patulmreg_);
		patulmreg_^.meaning:=pAAlternativesPatterndecl8700_AAP8700;
		patulmreg_^.matchedassembler:=nil;
		patulmreg_^.params :=nil;
		alternatives[301]:=patlmreg_;
		alternatives[302]:=patulmreg_;
		alternatives[303]:=patilmreg_;
		lastalt:=303;
		new(patwmreg_);
		patwmreg_^.meaning:=pAAlternativesPatterndecl8705_AAP8705;
		patwmreg_^.matchedassembler:=nil;
		patwmreg_^.params :=nil;
		alternatives[304]:=patim2reg_2;
		alternatives[305]:=patuntypedmreg_;
		alternatives[306]:=patumreg_;
		alternatives[307]:=patim4reg_4;
		alternatives[308]:=patim8reg_8;
		alternatives[309]:=patiMreg_M;
		lastalt:=309;
		new(patmreg_);
		patmreg_^.meaning:=pAAlternativesPatterndecl8714_AAP8714;
		patmreg_^.matchedassembler:=nil;
		patmreg_^.params :=nil;
		alternatives[310]:=patmemrisc_;
		alternatives[311]:=patmreg_;
		lastalt:=311;
		new(patmrmaddrmode_);
		patmrmaddrmode_^.meaning:=pAAlternativesPatterndecl8729_AAP8729;
		patmrmaddrmode_^.matchedassembler:=nil;
		patmrmaddrmode_^.params :=nil;
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPMULLW_PMULLW);
		patPMULLW_PMULLW^.meaning:=pAAssignMeaning8739_AAM8739;
		patPMULLW_PMULLW^.matchedassembler:=pAAssemblesto8753_AA8753;
		new(patPMULLW_PMULLW^.params);
		for i:= 1 to maxparam do patPMULLW_PMULLW^.params^[i]:=nil;
		patPMULLW_PMULLW^.params^[0]:=patim4reg_4;
		patPMULLW_PMULLW^.params^[1]:=patim4reg_4;
		 
		(*! Matches identifier m1  to the tree at this point*)
		(*! Matches identifier m1  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPMULLSSB_PMULLSSB);
		patPMULLSSB_PMULLSSB^.meaning:=pAAssignMeaning8768_AAM8768;
		patPMULLSSB_PMULLSSB^.matchedassembler:=pAAssemblesto8812_AA8812;
		new(patPMULLSSB_PMULLSSB^.params);
		for i:= 1 to maxparam do patPMULLSSB_PMULLSSB^.params^[i]:=nil;
		patPMULLSSB_PMULLSSB^.params^[1]:=patmreg_;
		patPMULLSSB_PMULLSSB^.params^[0]:=patim8reg_8;
		patPMULLSSB_PMULLSSB^.params^[2]:=patmrmaddrmode_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier m  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patMMXPUSH_MMXPUSH);
		patMMXPUSH_MMXPUSH^.meaning:=pAValueMeaning8839_AVM8839;
		patMMXPUSH_MMXPUSH^.matchedassembler:=pAAssemblesto8846_AA8846;
		new(patMMXPUSH_MMXPUSH^.params);
		for i:= 1 to maxparam do patMMXPUSH_MMXPUSH^.params^[i]:=nil;
		patMMXPUSH_MMXPUSH^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patMMXPOP_MMXPOP);
		patMMXPOP_MMXPOP^.meaning:=pAAssignMeaning8855_AAM8855;
		patMMXPOP_MMXPOP^.matchedassembler:=pAAssemblesto8866_AA8866;
		new(patMMXPOP_MMXPOP^.params);
		for i:= 1 to maxparam do patMMXPOP_MMXPOP^.params^[i]:=nil;
		patMMXPOP_MMXPOP^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 2 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDD_PADDD);
		patPADDD_PADDD^.meaning:=pAAssignMeaning8878_AAM8878;
		patPADDD_PADDD^.matchedassembler:=pAAssemblesto8932_AA8932;
		new(patPADDD_PADDD^.params);
		for i:= 1 to maxparam do patPADDD_PADDD^.params^[i]:=nil;
		patPADDD_PADDD^.params^[0]:=patmreg_;
		patPADDD_PADDD^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 4 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDW_PADDW);
		patPADDW_PADDW^.meaning:=pAAssignMeaning8945_AAM8945;
		patPADDW_PADDW^.matchedassembler:=pAAssemblesto8999_AA8999;
		new(patPADDW_PADDW^.params);
		for i:= 1 to maxparam do patPADDW_PADDW^.params^[i]:=nil;
		patPADDW_PADDW^.params^[0]:=patim4reg_4;
		patPADDW_PADDW^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDB_PADDB);
		patPADDB_PADDB^.meaning:=pAAssignMeaning9012_AAM9012;
		patPADDB_PADDB^.matchedassembler:=pAAssemblesto9066_AA9066;
		new(patPADDB_PADDB^.params);
		for i:= 1 to maxparam do patPADDB_PADDB^.params^[i]:=nil;
		patPADDB_PADDB^.params^[0]:=patim8reg_8;
		patPADDB_PADDB^.params^[1]:=patmrmaddrmode_;
		 
		new(patmeq_);
		new(patmeq_^.meaning);
		patmeq_^.meaning^.tag:=dyadicop;
		patmeq_^.meaning^.opname:='=';
		patmeq_^.matchedassembler:=string2printlist('eq' );
		new(patmgt_);
		new(patmgt_^.meaning);
		patmgt_^.meaning^.tag:=dyadicop;
		patmgt_^.meaning^.opname:='>';
		patmgt_^.matchedassembler:=string2printlist('gt' );
		alternatives[312]:=patmeq_;
		alternatives[313]:=patmgt_;
		lastalt:=313;
		new(patmcondition_);
		patmcondition_^.meaning:=pAAlternativesPatterndecl9084_AAP9084;
		patmcondition_^.matchedassembler:=nil;
		patmcondition_^.params :=nil;
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref octet vector ( 8 )*)
(* defds ->public boolean pAIdentifierDyadic9119_AID9119*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patCMPPB_CMPPB);
		patCMPPB_CMPPB^.meaning:=pAAssignMeaning9096_AAM9096;
		patCMPPB_CMPPB^.matchedassembler:=pAAssemblesto9146_AA9146;
		new(patCMPPB_CMPPB^.params);
		for i:= 1 to maxparam do patCMPPB_CMPPB^.params^[i]:=nil;
		patCMPPB_CMPPB^.params^[0]:=patmreg_;
		patCMPPB_CMPPB^.params^[2]:=patmcondition_;
		patCMPPB_CMPPB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref octet vector ( 8 )*)
		(*! Matches identifier ma  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		new(patCMPPBR_CMPPBR);
		patCMPPBR_CMPPBR^.meaning:=pAAssignMeaning9163_AAM9163;
		patCMPPBR_CMPPBR^.matchedassembler:=pAAssemblesto9213_AA9213;
		new(patCMPPBR_CMPPBR^.params);
		for i:= 1 to maxparam do patCMPPBR_CMPPBR^.params^[i]:=nil;
		patCMPPBR_CMPPBR^.params^[0]:=patmreg_;
		patCMPPBR_CMPPBR^.params^[2]:=patmcondition_;
		patCMPPBR_CMPPBR^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic9245_AID9245*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patCMPPW_CMPPW);
		patCMPPW_CMPPW^.meaning:=pAAssignMeaning9228_AAM9228;
		patCMPPW_CMPPW^.matchedassembler:=pAAssemblesto9254_AA9254;
		new(patCMPPW_CMPPW^.params);
		for i:= 1 to maxparam do patCMPPW_CMPPW^.params^[i]:=nil;
		patCMPPW_CMPPW^.params^[0]:=patim4reg_4;
		patCMPPW_CMPPW^.params^[2]:=patmcondition_;
		patCMPPW_CMPPW^.params^[1]:=patim4reg_4;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		new(patCMPPWR_CMPPWR);
		patCMPPWR_CMPPWR^.meaning:=pAAssignMeaning9271_AAM9271;
		patCMPPWR_CMPPWR^.matchedassembler:=pAAssemblesto9297_AA9297;
		new(patCMPPWR_CMPPWR^.params);
		for i:= 1 to maxparam do patCMPPWR_CMPPWR^.params^[i]:=nil;
		patCMPPWR_CMPPWR^.params^[0]:=patim4reg_4;
		patCMPPWR_CMPPWR^.params^[2]:=patmcondition_;
		patCMPPWR_CMPPWR^.params^[1]:=patim4reg_4;
		 
		(*! Matches identifier m  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic9329_AID9329*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patCMPPD_CMPPD);
		patCMPPD_CMPPD^.meaning:=pAAssignMeaning9312_AAM9312;
		patCMPPD_CMPPD^.matchedassembler:=pAAssemblesto9338_AA9338;
		new(patCMPPD_CMPPD^.params);
		for i:= 1 to maxparam do patCMPPD_CMPPD^.params^[i]:=nil;
		patCMPPD_CMPPD^.params^[0]:=patim2reg_2;
		patCMPPD_CMPPD^.params^[2]:=patmcondition_;
		patCMPPD_CMPPD^.params^[1]:=patim2reg_2;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		new(patCMPPDR_CMPPDR);
		patCMPPDR_CMPPDR^.meaning:=pAAssignMeaning9355_AAM9355;
		patCMPPDR_CMPPDR^.matchedassembler:=pAAssemblesto9381_AA9381;
		new(patCMPPDR_CMPPDR^.params);
		for i:= 1 to maxparam do patCMPPDR_CMPPDR^.params^[i]:=nil;
		patCMPPDR_CMPPDR^.params^[0]:=patim2reg_2;
		patCMPPDR_CMPPDR^.params^[2]:=patmcondition_;
		patCMPPDR_CMPPDR^.params^[1]:=patim2reg_2;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDUB_PADDUB);
		patPADDUB_PADDUB^.meaning:=pAAssignMeaning9394_AAM9394;
		patPADDUB_PADDUB^.matchedassembler:=pAAssemblesto9448_AA9448;
		new(patPADDUB_PADDUB^.params);
		for i:= 1 to maxparam do patPADDUB_PADDUB^.params^[i]:=nil;
		patPADDUB_PADDUB^.params^[0]:=patmreg_;
		patPADDUB_PADDUB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDSB_PADDSB);
		patPADDSB_PADDSB^.meaning:=pAAssignMeaning9461_AAM9461;
		patPADDSB_PADDSB^.matchedassembler:=pAAssemblesto9495_AA9495;
		new(patPADDSB_PADDSB^.params);
		for i:= 1 to maxparam do patPADDSB_PADDSB^.params^[i]:=nil;
		patPADDSB_PADDSB^.params^[0]:=patim8reg_8;
		patPADDSB_PADDSB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m2  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPADDSB3_PADDSB3);
		patPADDSB3_PADDSB3^.meaning:=pAAssignMeaning9510_AAM9510;
		patPADDSB3_PADDSB3^.matchedassembler:=pAAssemblesto9544_AA9544;
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
		patPADDUSB_PADDUSB^.meaning:=pAAssignMeaning9561_AAM9561;
		patPADDUSB_PADDUSB^.matchedassembler:=pAAssemblesto9615_AA9615;
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
		patSPADDUSB_SPADDUSB^.meaning:=pAAssignMeaning9626_AAM9626;
		patSPADDUSB_SPADDUSB^.matchedassembler:=pAAssemblesto9676_AA9676;
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
		patSPADDUB_SPADDUB^.meaning:=pAAssignMeaning9688_AAM9688;
		patSPADDUB_SPADDUB^.matchedassembler:=pAAssemblesto9738_AA9738;
		new(patSPADDUB_SPADDUB^.params);
		for i:= 1 to maxparam do patSPADDUB_SPADDUB^.params^[i]:=nil;
		patSPADDUB_SPADDUB^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSPADDSB_SPADDSB);
		patSPADDSB_SPADDSB^.meaning:=pAAssignMeaning9750_AAM9750;
		patSPADDSB_SPADDSB^.matchedassembler:=pAAssemblesto9790_AA9790;
		new(patSPADDSB_SPADDSB^.params);
		for i:= 1 to maxparam do patSPADDSB_SPADDSB^.params^[i]:=nil;
		patSPADDSB_SPADDSB^.params^[0]:=patim8reg_8;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 2 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSPSUBD_SPSUBD);
		patSPSUBD_SPSUBD^.meaning:=pAAssignMeaning9802_AAM9802;
		patSPSUBD_SPSUBD^.matchedassembler:=pAAssemblesto9854_AA9854;
		new(patSPSUBD_SPSUBD^.params);
		for i:= 1 to maxparam do patSPSUBD_SPSUBD^.params^[i]:=nil;
		patSPSUBD_SPSUBD^.params^[0]:=patmreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 4 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBW_PSUBW);
		patPSUBW_PSUBW^.meaning:=pAAssignMeaning9866_AAM9866;
		patPSUBW_PSUBW^.matchedassembler:=pAAssemblesto9920_AA9920;
		new(patPSUBW_PSUBW^.params);
		for i:= 1 to maxparam do patPSUBW_PSUBW^.params^[i]:=nil;
		patPSUBW_PSUBW^.params^[0]:=patim4reg_4;
		patPSUBW_PSUBW^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBB_PSUBB);
		patPSUBB_PSUBB^.meaning:=pAAssignMeaning9933_AAM9933;
		patPSUBB_PSUBB^.matchedassembler:=pAAssemblesto9987_AA9987;
		new(patPSUBB_PSUBB^.params);
		for i:= 1 to maxparam do patPSUBB_PSUBB^.params^[i]:=nil;
		patPSUBB_PSUBB^.params^[0]:=patim8reg_8;
		patPSUBB_PSUBB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBUB_PSUBUB);
		patPSUBUB_PSUBUB^.meaning:=pAAssignMeaning10000_AAM10000;
		patPSUBUB_PSUBUB^.matchedassembler:=pAAssemblesto10054_AA10054;
		new(patPSUBUB_PSUBUB^.params);
		for i:= 1 to maxparam do patPSUBUB_PSUBUB^.params^[i]:=nil;
		patPSUBUB_PSUBUB^.params^[0]:=patmreg_;
		patPSUBUB_PSUBUB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBSB_PSUBSB);
		patPSUBSB_PSUBSB^.meaning:=pAAssignMeaning10067_AAM10067;
		patPSUBSB_PSUBSB^.matchedassembler:=pAAssemblesto10121_AA10121;
		new(patPSUBSB_PSUBSB^.params);
		for i:= 1 to maxparam do patPSUBSB_PSUBSB^.params^[i]:=nil;
		patPSUBSB_PSUBSB^.params^[0]:=patim8reg_8;
		patPSUBSB_PSUBSB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPSUBUSB_PSUBUSB);
		patPSUBUSB_PSUBUSB^.meaning:=pAAssignMeaning10134_AAM10134;
		patPSUBUSB_PSUBUSB^.matchedassembler:=pAAssemblesto10188_AA10188;
		new(patPSUBUSB_PSUBUSB^.params);
		for i:= 1 to maxparam do patPSUBUSB_PSUBUSB^.params^[i]:=nil;
		patPSUBUSB_PSUBUSB^.params^[0]:=patmreg_;
		patPSUBUSB_PSUBUSB^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPAND_PAND);
		patPAND_PAND^.meaning:=pAAssignMeaning10201_AAM10201;
		patPAND_PAND^.matchedassembler:=pAAssemblesto10215_AA10215;
		new(patPAND_PAND^.params);
		for i:= 1 to maxparam do patPAND_PAND^.params^[i]:=nil;
		patPAND_PAND^.params^[0]:=patmreg_;
		patPAND_PAND^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		new(patPANDN_PANDN);
		patPANDN_PANDN^.meaning:=pAAssignMeaning10228_AAM10228;
		patPANDN_PANDN^.matchedassembler:=pAAssemblesto10244_AA10244;
		new(patPANDN_PANDN^.params);
		for i:= 1 to maxparam do patPANDN_PANDN^.params^[i]:=nil;
		patPANDN_PANDN^.params^[0]:=patmreg_;
		patPANDN_PANDN^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patPOR_POR);
		patPOR_POR^.meaning:=pAAssignMeaning10257_AAM10257;
		patPOR_POR^.matchedassembler:=pAAssemblesto10271_AA10271;
		new(patPOR_POR^.params);
		for i:= 1 to maxparam do patPOR_POR^.params^[i]:=nil;
		patPOR_POR^.params^[0]:=patmreg_;
		patPOR_POR^.params^[1]:=patmrmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref word*)
		(*! Matches identifier m  to the tree at this point*)
		new(patMOVDS_MOVDS);
		patMOVDS_MOVDS^.meaning:=pAAssignMeaning10284_AAM10284;
		patMOVDS_MOVDS^.matchedassembler:=pAAssemblesto10297_AA10297;
		new(patMOVDS_MOVDS^.params);
		for i:= 1 to maxparam do patMOVDS_MOVDS^.params^[i]:=nil;
		patMOVDS_MOVDS^.params^[1]:=patwmreg_;
		patMOVDS_MOVDS^.params^[0]:=patwaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVDL_MOVDL);
		patMOVDL_MOVDL^.meaning:=pAAssignMeaning10310_AAM10310;
		patMOVDL_MOVDL^.matchedassembler:=pAAssemblesto10323_AA10323;
		new(patMOVDL_MOVDL^.params);
		for i:= 1 to maxparam do patMOVDL_MOVDL^.params^[i]:=nil;
		patMOVDL_MOVDL^.params^[1]:=patwmreg_;
		patMOVDL_MOVDL^.params^[0]:=patwaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVOCTUINTL_MOVOCTUINTL);
		patMOVOCTUINTL_MOVOCTUINTL^.meaning:=pAAssignMeaning10336_AAM10336;
		patMOVOCTUINTL_MOVOCTUINTL^.matchedassembler:=pAAssemblesto10354_AA10354;
		new(patMOVOCTUINTL_MOVOCTUINTL^.params);
		for i:= 1 to maxparam do patMOVOCTUINTL_MOVOCTUINTL^.params^[i]:=nil;
		patMOVOCTUINTL_MOVOCTUINTL^.params^[1]:=patmreg_;
		patMOVOCTUINTL_MOVOCTUINTL^.params^[0]:=patmemrisc_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref doubleword*)
		(*! Matches identifier m  to the tree at this point*)
		new(patMOVQS_MOVQS);
		patMOVQS_MOVQS^.meaning:=pAAssignMeaning10367_AAM10367;
		patMOVQS_MOVQS^.matchedassembler:=pAAssemblesto10380_AA10380;
		new(patMOVQS_MOVQS^.params);
		for i:= 1 to maxparam do patMOVQS_MOVQS^.params^[i]:=nil;
		patMOVQS_MOVQS^.params^[1]:=patmreg_;
		patMOVQS_MOVQS^.params^[0]:=patmemrisc_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref doubleword*)
		(*! Matches identifier m  to the tree at this point*)
		new(patMOVQR_MOVQR);
		patMOVQR_MOVQR^.meaning:=pAAssignMeaning10393_AAM10393;
		patMOVQR_MOVQR^.matchedassembler:=pAAssemblesto10406_AA10406;
		new(patMOVQR_MOVQR^.params);
		for i:= 1 to maxparam do patMOVQR_MOVQR^.params^[i]:=nil;
		patMOVQR_MOVQR^.params^[1]:=patmreg_;
		patMOVQR_MOVQR^.params^[0]:=patmreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
		(*! Matches identifier m  to the tree at this point*)
		new(patMOVOCTUINTS_MOVOCTUINTS);
		patMOVOCTUINTS_MOVOCTUINTS^.meaning:=pAAssignMeaning10419_AAM10419;
		patMOVOCTUINTS_MOVOCTUINTS^.matchedassembler:=pAAssemblesto10437_AA10437;
		new(patMOVOCTUINTS_MOVOCTUINTS^.params);
		for i:= 1 to maxparam do patMOVOCTUINTS_MOVOCTUINTS^.params^[i]:=nil;
		patMOVOCTUINTS_MOVOCTUINTS^.params^[1]:=patmreg_;
		patMOVOCTUINTS_MOVOCTUINTS^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVQL_MOVQL);
		patMOVQL_MOVQL^.meaning:=pAAssignMeaning10450_AAM10450;
		patMOVQL_MOVQL^.matchedassembler:=pAAssemblesto10463_AA10463;
		new(patMOVQL_MOVQL^.params);
		for i:= 1 to maxparam do patMOVQL_MOVQL^.params^[i]:=nil;
		patMOVQL_MOVQL^.params^[1]:=patmreg_;
		patMOVQL_MOVQL^.params^[0]:=patmemrisc_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVQLR_MOVQLR);
		patMOVQLR_MOVQLR^.meaning:=pAAssignMeaning10476_AAM10476;
		patMOVQLR_MOVQLR^.matchedassembler:=pAAssemblesto10484_AA10484;
		new(patMOVQLR_MOVQLR^.params);
		for i:= 1 to maxparam do patMOVQLR_MOVQLR^.params^[i]:=nil;
		patMOVQLR_MOVQLR^.params^[1]:=patim8reg_8;
		patMOVQLR_MOVQLR^.params^[0]:=patim8reg_8;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patREP2_REP2);
		patREP2_REP2^.meaning:=pAAssignMeaning10497_AAM10497;
		patREP2_REP2^.matchedassembler:=pAAssemblesto10511_AA10511;
		new(patREP2_REP2^.params);
		for i:= 1 to maxparam do patREP2_REP2^.params^[i]:=nil;
		patREP2_REP2^.params^[0]:=patmreg_;
		patREP2_REP2^.params^[1]:=patreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patREP4_REP4);
		patREP4_REP4^.meaning:=pAAssignMeaning10527_AAM10527;
		patREP4_REP4^.matchedassembler:=pAAssemblesto10541_AA10541;
		new(patREP4_REP4^.params);
		for i:= 1 to maxparam do patREP4_REP4^.params^[i]:=nil;
		patREP4_REP4^.params^[0]:=patmreg_;
		patREP4_REP4^.params^[1]:=patwreg_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patREP8_REP8);
		patREP8_REP8^.meaning:=pAAssignMeaning10561_AAM10561;
		patREP8_REP8^.matchedassembler:=pAAssemblesto10575_AA10575;
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
		patPACKSSDW_PACKSSDW^.meaning:=pAAssignMeaning10591_AAM10591;
		patPACKSSDW_PACKSSDW^.matchedassembler:=pAAssemblesto10621_AA10621;
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
		patPACKSSWB_PACKSSWB^.meaning:=pAAssignMeaning10639_AAM10639;
		patPACKSSWB_PACKSSWB^.matchedassembler:=pAAssemblesto10669_AA10669;
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
		patPACKUSWB_PACKUSWB^.meaning:=pAAssignMeaning10687_AAM10687;
		patPACKUSWB_PACKUSWB^.matchedassembler:=pAAssemblesto10717_AA10717;
		new(patPACKUSWB_PACKUSWB^.params);
		for i:= 1 to maxparam do patPACKUSWB_PACKUSWB^.params^[i]:=nil;
		patPACKUSWB_PACKUSWB^.params^[1]:=patmreg_;
		patPACKUSWB_PACKUSWB^.params^[0]:=patreg_;
		 
			new(patXMM0_XMM0);
		new(	patXMM0_XMM0^.meaning);
		new(	patXMM0_XMM0^.matchedassembler);
			patXMM0_XMM0^.meaning^.tag:=reg;
			patXMM0_XMM0^.meaning^.index:=regXMM0_XMM0code;
			patXMM0_XMM0^.params:=nil;
			patXMM0_XMM0^.matchedassembler:=string2printlist('XMM0');
			registers[regXMM0_XMM0code].format:=(0+fref+4);
			registers[regXMM0_XMM0code].printsas:='XMM0';
			registers[regXMM0_XMM0code].permanentlyreserved:=false;
			registers[regXMM0_XMM0code].code:=regXMM0_XMM0code;
			registers[regXMM0_XMM0code].basecode:=[104..119];
			registers[85].format:=(0+fref+freal+2);
			registers[85].printsas:='xmm0';
			registers[85].permanentlyreserved:=false;
			registers[85].code:=regXMM00_XMM00code;
			registers[85].basecode:=[(regXMM0_XMM0code+0)..(regXMM0_XMM0code+0)+3];
			new(patXMM00_XMM00);
		new(	patXMM00_XMM00^.meaning);
		new(	patXMM00_XMM00^.matchedassembler);
			patXMM00_XMM00^.meaning^.tag:=reg;
			patXMM00_XMM00^.meaning^.index:=regXMM00_XMM00code;
			patXMM00_XMM00^.params:=nil;
			patXMM00_XMM00^.matchedassembler:=string2printlist('xmm0');
			registers[86].format:=(0+fref+freal+3);
			registers[86].printsas:='xmm0';
			registers[86].permanentlyreserved:=false;
			registers[86].code:=regXMM0R64_XMM0R64code;
			registers[86].basecode:=[(regXMM0_XMM0code+0)..(regXMM0_XMM0code+0)+7];
			new(patXMM0R64_XMM0R64);
		new(	patXMM0R64_XMM0R64^.meaning);
		new(	patXMM0R64_XMM0R64^.matchedassembler);
			patXMM0R64_XMM0R64^.meaning^.tag:=reg;
			patXMM0R64_XMM0R64^.meaning^.index:=regXMM0R64_XMM0R64code;
			patXMM0R64_XMM0R64^.params:=nil;
			patXMM0R64_XMM0R64^.matchedassembler:=string2printlist('xmm0');
			registers[87].format:=(0+fref+fvector+4*fvecmult+freal+2);
			registers[87].printsas:='XMM0';
			registers[87].permanentlyreserved:=false;
			registers[87].code:=regXMM0R324_XMM0R324code;
			registers[87].basecode:=[(regXMM0_XMM0code+0)..(regXMM0_XMM0code+0)+15];
			new(patXMM0R324_XMM0R324);
		new(	patXMM0R324_XMM0R324^.meaning);
		new(	patXMM0R324_XMM0R324^.matchedassembler);
			patXMM0R324_XMM0R324^.meaning^.tag:=reg;
			patXMM0R324_XMM0R324^.meaning^.index:=regXMM0R324_XMM0R324code;
			patXMM0R324_XMM0R324^.params:=nil;
			patXMM0R324_XMM0R324^.matchedassembler:=string2printlist('XMM0');
			registers[88].format:=(0+fref+fvector+2*fvecmult+freal+3);
			registers[88].printsas:='XMM0';
			registers[88].permanentlyreserved:=false;
			registers[88].code:=regXMM0R642_XMM0R642code;
			registers[88].basecode:=[(regXMM0_XMM0code+0)..(regXMM0_XMM0code+0)+15];
			new(patXMM0R642_XMM0R642);
		new(	patXMM0R642_XMM0R642^.meaning);
		new(	patXMM0R642_XMM0R642^.matchedassembler);
			patXMM0R642_XMM0R642^.meaning^.tag:=reg;
			patXMM0R642_XMM0R642^.meaning^.index:=regXMM0R642_XMM0R642code;
			patXMM0R642_XMM0R642^.params:=nil;
			patXMM0R642_XMM0R642^.matchedassembler:=string2printlist('XMM0');
			new(patXMM1_XMM1);
		new(	patXMM1_XMM1^.meaning);
		new(	patXMM1_XMM1^.matchedassembler);
			patXMM1_XMM1^.meaning^.tag:=reg;
			patXMM1_XMM1^.meaning^.index:=regXMM1_XMM1code;
			patXMM1_XMM1^.params:=nil;
			patXMM1_XMM1^.matchedassembler:=string2printlist('XMM1');
			registers[regXMM1_XMM1code].format:=(0+fref+4);
			registers[regXMM1_XMM1code].printsas:='XMM1';
			registers[regXMM1_XMM1code].permanentlyreserved:=false;
			registers[regXMM1_XMM1code].code:=regXMM1_XMM1code;
			registers[regXMM1_XMM1code].basecode:=[120..135];
			registers[90].format:=(0+fref+freal+2);
			registers[90].printsas:='xmm1';
			registers[90].permanentlyreserved:=false;
			registers[90].code:=regXMM10_XMM10code;
			registers[90].basecode:=[(regXMM1_XMM1code+0)..(regXMM1_XMM1code+0)+3];
			new(patXMM10_XMM10);
		new(	patXMM10_XMM10^.meaning);
		new(	patXMM10_XMM10^.matchedassembler);
			patXMM10_XMM10^.meaning^.tag:=reg;
			patXMM10_XMM10^.meaning^.index:=regXMM10_XMM10code;
			patXMM10_XMM10^.params:=nil;
			patXMM10_XMM10^.matchedassembler:=string2printlist('xmm1');
			registers[91].format:=(0+fref+freal+3);
			registers[91].printsas:='xmm1';
			registers[91].permanentlyreserved:=false;
			registers[91].code:=regXMM1R64_XMM1R64code;
			registers[91].basecode:=[(regXMM1_XMM1code+0)..(regXMM1_XMM1code+0)+7];
			new(patXMM1R64_XMM1R64);
		new(	patXMM1R64_XMM1R64^.meaning);
		new(	patXMM1R64_XMM1R64^.matchedassembler);
			patXMM1R64_XMM1R64^.meaning^.tag:=reg;
			patXMM1R64_XMM1R64^.meaning^.index:=regXMM1R64_XMM1R64code;
			patXMM1R64_XMM1R64^.params:=nil;
			patXMM1R64_XMM1R64^.matchedassembler:=string2printlist('xmm1');
			registers[92].format:=(0+fref+fvector+4*fvecmult+freal+2);
			registers[92].printsas:='XMM1';
			registers[92].permanentlyreserved:=false;
			registers[92].code:=regXMM1R324_XMM1R324code;
			registers[92].basecode:=[(regXMM1_XMM1code+0)..(regXMM1_XMM1code+0)+15];
			new(patXMM1R324_XMM1R324);
		new(	patXMM1R324_XMM1R324^.meaning);
		new(	patXMM1R324_XMM1R324^.matchedassembler);
			patXMM1R324_XMM1R324^.meaning^.tag:=reg;
			patXMM1R324_XMM1R324^.meaning^.index:=regXMM1R324_XMM1R324code;
			patXMM1R324_XMM1R324^.params:=nil;
			patXMM1R324_XMM1R324^.matchedassembler:=string2printlist('XMM1');
			registers[93].format:=(0+fref+fvector+2*fvecmult+freal+3);
			registers[93].printsas:='XMM1';
			registers[93].permanentlyreserved:=false;
			registers[93].code:=regXMM1R642_XMM1R642code;
			registers[93].basecode:=[(regXMM1_XMM1code+0)..(regXMM1_XMM1code+0)+15];
			new(patXMM1R642_XMM1R642);
		new(	patXMM1R642_XMM1R642^.meaning);
		new(	patXMM1R642_XMM1R642^.matchedassembler);
			patXMM1R642_XMM1R642^.meaning^.tag:=reg;
			patXMM1R642_XMM1R642^.meaning^.index:=regXMM1R642_XMM1R642code;
			patXMM1R642_XMM1R642^.params:=nil;
			patXMM1R642_XMM1R642^.matchedassembler:=string2printlist('XMM1');
			new(patXMM2_XMM2);
		new(	patXMM2_XMM2^.meaning);
		new(	patXMM2_XMM2^.matchedassembler);
			patXMM2_XMM2^.meaning^.tag:=reg;
			patXMM2_XMM2^.meaning^.index:=regXMM2_XMM2code;
			patXMM2_XMM2^.params:=nil;
			patXMM2_XMM2^.matchedassembler:=string2printlist('XMM2');
			registers[regXMM2_XMM2code].format:=(0+fref+4);
			registers[regXMM2_XMM2code].printsas:='XMM2';
			registers[regXMM2_XMM2code].permanentlyreserved:=false;
			registers[regXMM2_XMM2code].code:=regXMM2_XMM2code;
			registers[regXMM2_XMM2code].basecode:=[136..151];
			registers[95].format:=(0+fref+freal+2);
			registers[95].printsas:='xmm2';
			registers[95].permanentlyreserved:=false;
			registers[95].code:=regXMM20_XMM20code;
			registers[95].basecode:=[(regXMM2_XMM2code+0)..(regXMM2_XMM2code+0)+3];
			new(patXMM20_XMM20);
		new(	patXMM20_XMM20^.meaning);
		new(	patXMM20_XMM20^.matchedassembler);
			patXMM20_XMM20^.meaning^.tag:=reg;
			patXMM20_XMM20^.meaning^.index:=regXMM20_XMM20code;
			patXMM20_XMM20^.params:=nil;
			patXMM20_XMM20^.matchedassembler:=string2printlist('xmm2');
			registers[96].format:=(0+fref+freal+3);
			registers[96].printsas:='xmm2';
			registers[96].permanentlyreserved:=false;
			registers[96].code:=regXMM2R64_XMM2R64code;
			registers[96].basecode:=[(regXMM2_XMM2code+0)..(regXMM2_XMM2code+0)+7];
			new(patXMM2R64_XMM2R64);
		new(	patXMM2R64_XMM2R64^.meaning);
		new(	patXMM2R64_XMM2R64^.matchedassembler);
			patXMM2R64_XMM2R64^.meaning^.tag:=reg;
			patXMM2R64_XMM2R64^.meaning^.index:=regXMM2R64_XMM2R64code;
			patXMM2R64_XMM2R64^.params:=nil;
			patXMM2R64_XMM2R64^.matchedassembler:=string2printlist('xmm2');
			registers[97].format:=(0+fref+fvector+4*fvecmult+freal+2);
			registers[97].printsas:='XMM2';
			registers[97].permanentlyreserved:=false;
			registers[97].code:=regXMM2R324_XMM2R324code;
			registers[97].basecode:=[(regXMM2_XMM2code+0)..(regXMM2_XMM2code+0)+15];
			new(patXMM2R324_XMM2R324);
		new(	patXMM2R324_XMM2R324^.meaning);
		new(	patXMM2R324_XMM2R324^.matchedassembler);
			patXMM2R324_XMM2R324^.meaning^.tag:=reg;
			patXMM2R324_XMM2R324^.meaning^.index:=regXMM2R324_XMM2R324code;
			patXMM2R324_XMM2R324^.params:=nil;
			patXMM2R324_XMM2R324^.matchedassembler:=string2printlist('XMM2');
			registers[98].format:=(0+fref+fvector+2*fvecmult+freal+3);
			registers[98].printsas:='XMM2';
			registers[98].permanentlyreserved:=false;
			registers[98].code:=regXMM2R642_XMM2R642code;
			registers[98].basecode:=[(regXMM2_XMM2code+0)..(regXMM2_XMM2code+0)+15];
			new(patXMM2R642_XMM2R642);
		new(	patXMM2R642_XMM2R642^.meaning);
		new(	patXMM2R642_XMM2R642^.matchedassembler);
			patXMM2R642_XMM2R642^.meaning^.tag:=reg;
			patXMM2R642_XMM2R642^.meaning^.index:=regXMM2R642_XMM2R642code;
			patXMM2R642_XMM2R642^.params:=nil;
			patXMM2R642_XMM2R642^.matchedassembler:=string2printlist('XMM2');
			new(patXMM3_XMM3);
		new(	patXMM3_XMM3^.meaning);
		new(	patXMM3_XMM3^.matchedassembler);
			patXMM3_XMM3^.meaning^.tag:=reg;
			patXMM3_XMM3^.meaning^.index:=regXMM3_XMM3code;
			patXMM3_XMM3^.params:=nil;
			patXMM3_XMM3^.matchedassembler:=string2printlist('XMM3');
			registers[regXMM3_XMM3code].format:=(0+fref+4);
			registers[regXMM3_XMM3code].printsas:='XMM3';
			registers[regXMM3_XMM3code].permanentlyreserved:=false;
			registers[regXMM3_XMM3code].code:=regXMM3_XMM3code;
			registers[regXMM3_XMM3code].basecode:=[152..167];
			registers[100].format:=(0+fref+freal+2);
			registers[100].printsas:='xmm3';
			registers[100].permanentlyreserved:=false;
			registers[100].code:=regXMM30_XMM30code;
			registers[100].basecode:=[(regXMM3_XMM3code+0)..(regXMM3_XMM3code+0)+3];
			new(patXMM30_XMM30);
		new(	patXMM30_XMM30^.meaning);
		new(	patXMM30_XMM30^.matchedassembler);
			patXMM30_XMM30^.meaning^.tag:=reg;
			patXMM30_XMM30^.meaning^.index:=regXMM30_XMM30code;
			patXMM30_XMM30^.params:=nil;
			patXMM30_XMM30^.matchedassembler:=string2printlist('xmm3');
			registers[101].format:=(0+fref+freal+3);
			registers[101].printsas:='xmm3';
			registers[101].permanentlyreserved:=false;
			registers[101].code:=regXMM3R64_XMM3R64code;
			registers[101].basecode:=[(regXMM3_XMM3code+0)..(regXMM3_XMM3code+0)+7];
			new(patXMM3R64_XMM3R64);
		new(	patXMM3R64_XMM3R64^.meaning);
		new(	patXMM3R64_XMM3R64^.matchedassembler);
			patXMM3R64_XMM3R64^.meaning^.tag:=reg;
			patXMM3R64_XMM3R64^.meaning^.index:=regXMM3R64_XMM3R64code;
			patXMM3R64_XMM3R64^.params:=nil;
			patXMM3R64_XMM3R64^.matchedassembler:=string2printlist('xmm3');
			registers[102].format:=(0+fref+fvector+4*fvecmult+freal+2);
			registers[102].printsas:='XMM3';
			registers[102].permanentlyreserved:=false;
			registers[102].code:=regXMM3R324_XMM3R324code;
			registers[102].basecode:=[(regXMM3_XMM3code+0)..(regXMM3_XMM3code+0)+15];
			new(patXMM3R324_XMM3R324);
		new(	patXMM3R324_XMM3R324^.meaning);
		new(	patXMM3R324_XMM3R324^.matchedassembler);
			patXMM3R324_XMM3R324^.meaning^.tag:=reg;
			patXMM3R324_XMM3R324^.meaning^.index:=regXMM3R324_XMM3R324code;
			patXMM3R324_XMM3R324^.params:=nil;
			patXMM3R324_XMM3R324^.matchedassembler:=string2printlist('XMM3');
			registers[103].format:=(0+fref+fvector+2*fvecmult+freal+3);
			registers[103].printsas:='XMM3';
			registers[103].permanentlyreserved:=false;
			registers[103].code:=regXMM3R642_XMM3R642code;
			registers[103].basecode:=[(regXMM3_XMM3code+0)..(regXMM3_XMM3code+0)+15];
			new(patXMM3R642_XMM3R642);
		new(	patXMM3R642_XMM3R642^.meaning);
		new(	patXMM3R642_XMM3R642^.matchedassembler);
			patXMM3R642_XMM3R642^.meaning^.tag:=reg;
			patXMM3R642_XMM3R642^.meaning^.index:=regXMM3R642_XMM3R642code;
			patXMM3R642_XMM3R642^.params:=nil;
			patXMM3R642_XMM3R642^.matchedassembler:=string2printlist('XMM3');
			new(patXMM4_XMM4);
		new(	patXMM4_XMM4^.meaning);
		new(	patXMM4_XMM4^.matchedassembler);
			patXMM4_XMM4^.meaning^.tag:=reg;
			patXMM4_XMM4^.meaning^.index:=regXMM4_XMM4code;
			patXMM4_XMM4^.params:=nil;
			patXMM4_XMM4^.matchedassembler:=string2printlist('XMM4');
			registers[regXMM4_XMM4code].format:=(0+fref+4);
			registers[regXMM4_XMM4code].printsas:='XMM4';
			registers[regXMM4_XMM4code].permanentlyreserved:=false;
			registers[regXMM4_XMM4code].code:=regXMM4_XMM4code;
			registers[regXMM4_XMM4code].basecode:=[168..183];
			registers[105].format:=(0+fref+freal+2);
			registers[105].printsas:='xmm4';
			registers[105].permanentlyreserved:=false;
			registers[105].code:=regXMM40_XMM40code;
			registers[105].basecode:=[(regXMM4_XMM4code+0)..(regXMM4_XMM4code+0)+3];
			new(patXMM40_XMM40);
		new(	patXMM40_XMM40^.meaning);
		new(	patXMM40_XMM40^.matchedassembler);
			patXMM40_XMM40^.meaning^.tag:=reg;
			patXMM40_XMM40^.meaning^.index:=regXMM40_XMM40code;
			patXMM40_XMM40^.params:=nil;
			patXMM40_XMM40^.matchedassembler:=string2printlist('xmm4');
			registers[106].format:=(0+fref+freal+3);
			registers[106].printsas:='xmm4';
			registers[106].permanentlyreserved:=false;
			registers[106].code:=regXMM4R64_XMM4R64code;
			registers[106].basecode:=[(regXMM4_XMM4code+0)..(regXMM4_XMM4code+0)+7];
			new(patXMM4R64_XMM4R64);
		new(	patXMM4R64_XMM4R64^.meaning);
		new(	patXMM4R64_XMM4R64^.matchedassembler);
			patXMM4R64_XMM4R64^.meaning^.tag:=reg;
			patXMM4R64_XMM4R64^.meaning^.index:=regXMM4R64_XMM4R64code;
			patXMM4R64_XMM4R64^.params:=nil;
			patXMM4R64_XMM4R64^.matchedassembler:=string2printlist('xmm4');
			new(patXMM5_XMM5);
		new(	patXMM5_XMM5^.meaning);
		new(	patXMM5_XMM5^.matchedassembler);
			patXMM5_XMM5^.meaning^.tag:=reg;
			patXMM5_XMM5^.meaning^.index:=regXMM5_XMM5code;
			patXMM5_XMM5^.params:=nil;
			patXMM5_XMM5^.matchedassembler:=string2printlist('XMM5');
			registers[regXMM5_XMM5code].format:=(0+fref+4);
			registers[regXMM5_XMM5code].printsas:='XMM5';
			registers[regXMM5_XMM5code].permanentlyreserved:=false;
			registers[regXMM5_XMM5code].code:=regXMM5_XMM5code;
			registers[regXMM5_XMM5code].basecode:=[184..199];
			registers[108].format:=(0+fref+freal+2);
			registers[108].printsas:='xmm5';
			registers[108].permanentlyreserved:=false;
			registers[108].code:=regXMM50_XMM50code;
			registers[108].basecode:=[(regXMM5_XMM5code+0)..(regXMM5_XMM5code+0)+3];
			new(patXMM50_XMM50);
		new(	patXMM50_XMM50^.meaning);
		new(	patXMM50_XMM50^.matchedassembler);
			patXMM50_XMM50^.meaning^.tag:=reg;
			patXMM50_XMM50^.meaning^.index:=regXMM50_XMM50code;
			patXMM50_XMM50^.params:=nil;
			patXMM50_XMM50^.matchedassembler:=string2printlist('xmm5');
			registers[109].format:=(0+fref+freal+3);
			registers[109].printsas:='xmm5';
			registers[109].permanentlyreserved:=false;
			registers[109].code:=regXMM5R64_XMM5R64code;
			registers[109].basecode:=[(regXMM5_XMM5code+0)..(regXMM5_XMM5code+0)+7];
			new(patXMM5R64_XMM5R64);
		new(	patXMM5R64_XMM5R64^.meaning);
		new(	patXMM5R64_XMM5R64^.matchedassembler);
			patXMM5R64_XMM5R64^.meaning^.tag:=reg;
			patXMM5R64_XMM5R64^.meaning^.index:=regXMM5R64_XMM5R64code;
			patXMM5R64_XMM5R64^.params:=nil;
			patXMM5R64_XMM5R64^.matchedassembler:=string2printlist('xmm5');
			new(patXMM6_XMM6);
		new(	patXMM6_XMM6^.meaning);
		new(	patXMM6_XMM6^.matchedassembler);
			patXMM6_XMM6^.meaning^.tag:=reg;
			patXMM6_XMM6^.meaning^.index:=regXMM6_XMM6code;
			patXMM6_XMM6^.params:=nil;
			patXMM6_XMM6^.matchedassembler:=string2printlist('XMM6');
			registers[regXMM6_XMM6code].format:=(0+fref+4);
			registers[regXMM6_XMM6code].printsas:='XMM6';
			registers[regXMM6_XMM6code].permanentlyreserved:=false;
			registers[regXMM6_XMM6code].code:=regXMM6_XMM6code;
			registers[regXMM6_XMM6code].basecode:=[200..215];
			registers[111].format:=(0+fref+freal+2);
			registers[111].printsas:='xmm6';
			registers[111].permanentlyreserved:=false;
			registers[111].code:=regXMM60_XMM60code;
			registers[111].basecode:=[(regXMM6_XMM6code+0)..(regXMM6_XMM6code+0)+3];
			new(patXMM60_XMM60);
		new(	patXMM60_XMM60^.meaning);
		new(	patXMM60_XMM60^.matchedassembler);
			patXMM60_XMM60^.meaning^.tag:=reg;
			patXMM60_XMM60^.meaning^.index:=regXMM60_XMM60code;
			patXMM60_XMM60^.params:=nil;
			patXMM60_XMM60^.matchedassembler:=string2printlist('xmm6');
			registers[112].format:=(0+fref+freal+3);
			registers[112].printsas:='xmm6';
			registers[112].permanentlyreserved:=false;
			registers[112].code:=regXMM6R64_XMM6R64code;
			registers[112].basecode:=[(regXMM6_XMM6code+0)..(regXMM6_XMM6code+0)+7];
			new(patXMM6R64_XMM6R64);
		new(	patXMM6R64_XMM6R64^.meaning);
		new(	patXMM6R64_XMM6R64^.matchedassembler);
			patXMM6R64_XMM6R64^.meaning^.tag:=reg;
			patXMM6R64_XMM6R64^.meaning^.index:=regXMM6R64_XMM6R64code;
			patXMM6R64_XMM6R64^.params:=nil;
			patXMM6R64_XMM6R64^.matchedassembler:=string2printlist('xmm6');
			new(patXMM7_XMM7);
		new(	patXMM7_XMM7^.meaning);
		new(	patXMM7_XMM7^.matchedassembler);
			patXMM7_XMM7^.meaning^.tag:=reg;
			patXMM7_XMM7^.meaning^.index:=regXMM7_XMM7code;
			patXMM7_XMM7^.params:=nil;
			patXMM7_XMM7^.matchedassembler:=string2printlist('XMM7');
			registers[regXMM7_XMM7code].format:=(0+fref+4);
			registers[regXMM7_XMM7code].printsas:='XMM7';
			registers[regXMM7_XMM7code].permanentlyreserved:=false;
			registers[regXMM7_XMM7code].code:=regXMM7_XMM7code;
			registers[regXMM7_XMM7code].basecode:=[216..231];
			registers[114].format:=(0+fref+freal+2);
			registers[114].printsas:='xmm7';
			registers[114].permanentlyreserved:=false;
			registers[114].code:=regXMM70_XMM70code;
			registers[114].basecode:=[(regXMM7_XMM7code+0)..(regXMM7_XMM7code+0)+3];
			new(patXMM70_XMM70);
		new(	patXMM70_XMM70^.meaning);
		new(	patXMM70_XMM70^.matchedassembler);
			patXMM70_XMM70^.meaning^.tag:=reg;
			patXMM70_XMM70^.meaning^.index:=regXMM70_XMM70code;
			patXMM70_XMM70^.params:=nil;
			patXMM70_XMM70^.matchedassembler:=string2printlist('xmm7');
			registers[115].format:=(0+fref+freal+3);
			registers[115].printsas:='xmm7';
			registers[115].permanentlyreserved:=false;
			registers[115].code:=regXMM7R64_XMM7R64code;
			registers[115].basecode:=[(regXMM7_XMM7code+0)..(regXMM7_XMM7code+0)+7];
			new(patXMM7R64_XMM7R64);
		new(	patXMM7R64_XMM7R64^.meaning);
		new(	patXMM7R64_XMM7R64^.matchedassembler);
			patXMM7R64_XMM7R64^.meaning^.tag:=reg;
			patXMM7R64_XMM7R64^.meaning^.index:=regXMM7R64_XMM7R64code;
			patXMM7R64_XMM7R64^.params:=nil;
			patXMM7R64_XMM7R64^.matchedassembler:=string2printlist('xmm7');
			registers[116].format:=(0+fref+fvector+4*fvecmult+fsigned+2);
			registers[116].printsas:='Xmm0';
			registers[116].permanentlyreserved:=false;
			registers[116].code:=regXMM0I324_XMM0I324code;
			registers[116].basecode:=[(regXMM0_XMM0code+0)..(regXMM0_XMM0code+0)+15];
			new(patXMM0I324_XMM0I324);
		new(	patXMM0I324_XMM0I324^.meaning);
		new(	patXMM0I324_XMM0I324^.matchedassembler);
			patXMM0I324_XMM0I324^.meaning^.tag:=reg;
			patXMM0I324_XMM0I324^.meaning^.index:=regXMM0I324_XMM0I324code;
			patXMM0I324_XMM0I324^.params:=nil;
			patXMM0I324_XMM0I324^.matchedassembler:=string2printlist('Xmm0');
			registers[117].format:=(0+fref+fvector+4*fvecmult+fsigned+2);
			registers[117].printsas:='Xmm1';
			registers[117].permanentlyreserved:=false;
			registers[117].code:=regXMM1I324_XMM1I324code;
			registers[117].basecode:=[(regXMM1_XMM1code+0)..(regXMM1_XMM1code+0)+15];
			new(patXMM1I324_XMM1I324);
		new(	patXMM1I324_XMM1I324^.meaning);
		new(	patXMM1I324_XMM1I324^.matchedassembler);
			patXMM1I324_XMM1I324^.meaning^.tag:=reg;
			patXMM1I324_XMM1I324^.meaning^.index:=regXMM1I324_XMM1I324code;
			patXMM1I324_XMM1I324^.params:=nil;
			patXMM1I324_XMM1I324^.matchedassembler:=string2printlist('Xmm1');
			registers[118].format:=(0+fref+fvector+4*fvecmult+fsigned+2);
			registers[118].printsas:='Xmm2';
			registers[118].permanentlyreserved:=false;
			registers[118].code:=regXMM2I324_XMM2I324code;
			registers[118].basecode:=[(regXMM2_XMM2code+0)..(regXMM2_XMM2code+0)+15];
			new(patXMM2I324_XMM2I324);
		new(	patXMM2I324_XMM2I324^.meaning);
		new(	patXMM2I324_XMM2I324^.matchedassembler);
			patXMM2I324_XMM2I324^.meaning^.tag:=reg;
			patXMM2I324_XMM2I324^.meaning^.index:=regXMM2I324_XMM2I324code;
			patXMM2I324_XMM2I324^.params:=nil;
			patXMM2I324_XMM2I324^.matchedassembler:=string2printlist('Xmm2');
			registers[119].format:=(0+fref+fvector+4*fvecmult+fsigned+2);
			registers[119].printsas:='Xmm3';
			registers[119].permanentlyreserved:=false;
			registers[119].code:=regXMM3I324_XMM3I324code;
			registers[119].basecode:=[(regXMM3_XMM3code+0)..(regXMM3_XMM3code+0)+15];
			new(patXMM3I324_XMM3I324);
		new(	patXMM3I324_XMM3I324^.meaning);
		new(	patXMM3I324_XMM3I324^.matchedassembler);
			patXMM3I324_XMM3I324^.meaning^.tag:=reg;
			patXMM3I324_XMM3I324^.meaning^.index:=regXMM3I324_XMM3I324code;
			patXMM3I324_XMM3I324^.params:=nil;
			patXMM3I324_XMM3I324^.matchedassembler:=string2printlist('Xmm3');
			registers[120].format:=(0+fref+fsigned+2);
			registers[120].printsas:='xmm0';
			registers[120].permanentlyreserved:=false;
			registers[120].code:=regiXMM00_XMM00code;
			registers[120].basecode:=[(regXMM0_XMM0code+0)..(regXMM0_XMM0code+0)+3];
			new(patiXMM00_XMM00);
		new(	patiXMM00_XMM00^.meaning);
		new(	patiXMM00_XMM00^.matchedassembler);
			patiXMM00_XMM00^.meaning^.tag:=reg;
			patiXMM00_XMM00^.meaning^.index:=regiXMM00_XMM00code;
			patiXMM00_XMM00^.params:=nil;
			patiXMM00_XMM00^.matchedassembler:=string2printlist('xmm0');
			registers[121].format:=(0+fref+fsigned+2);
			registers[121].printsas:='xmm1';
			registers[121].permanentlyreserved:=false;
			registers[121].code:=regiXMM10_XMM10code;
			registers[121].basecode:=[(regXMM1_XMM1code+0)..(regXMM1_XMM1code+0)+3];
			new(patiXMM10_XMM10);
		new(	patiXMM10_XMM10^.meaning);
		new(	patiXMM10_XMM10^.matchedassembler);
			patiXMM10_XMM10^.meaning^.tag:=reg;
			patiXMM10_XMM10^.meaning^.index:=regiXMM10_XMM10code;
			patiXMM10_XMM10^.params:=nil;
			patiXMM10_XMM10^.matchedassembler:=string2printlist('xmm1');
			registers[122].format:=(0+fref+fsigned+2);
			registers[122].printsas:='xmm2';
			registers[122].permanentlyreserved:=false;
			registers[122].code:=regiXMM20_XMM20code;
			registers[122].basecode:=[(regXMM2_XMM2code+0)..(regXMM2_XMM2code+0)+3];
			new(patiXMM20_XMM20);
		new(	patiXMM20_XMM20^.meaning);
		new(	patiXMM20_XMM20^.matchedassembler);
			patiXMM20_XMM20^.meaning^.tag:=reg;
			patiXMM20_XMM20^.meaning^.index:=regiXMM20_XMM20code;
			patiXMM20_XMM20^.params:=nil;
			patiXMM20_XMM20^.matchedassembler:=string2printlist('xmm2');
			registers[123].format:=(0+fref+fsigned+2);
			registers[123].printsas:='xmm3';
			registers[123].permanentlyreserved:=false;
			registers[123].code:=regiXMM30_XMM30code;
			registers[123].basecode:=[(regXMM3_XMM3code+0)..(regXMM3_XMM3code+0)+3];
			new(patiXMM30_XMM30);
		new(	patiXMM30_XMM30^.meaning);
		new(	patiXMM30_XMM30^.matchedassembler);
			patiXMM30_XMM30^.meaning^.tag:=reg;
			patiXMM30_XMM30^.meaning^.index:=regiXMM30_XMM30code;
			patiXMM30_XMM30^.params:=nil;
			patiXMM30_XMM30^.matchedassembler:=string2printlist('xmm3');
			registers[124].format:=(0+fref+fsigned+2);
			registers[124].printsas:='xmm4';
			registers[124].permanentlyreserved:=false;
			registers[124].code:=regiXMM40_XMM40code;
			registers[124].basecode:=[(regXMM4_XMM4code+0)..(regXMM4_XMM4code+0)+3];
			new(patiXMM40_XMM40);
		new(	patiXMM40_XMM40^.meaning);
		new(	patiXMM40_XMM40^.matchedassembler);
			patiXMM40_XMM40^.meaning^.tag:=reg;
			patiXMM40_XMM40^.meaning^.index:=regiXMM40_XMM40code;
			patiXMM40_XMM40^.params:=nil;
			patiXMM40_XMM40^.matchedassembler:=string2printlist('xmm4');
			registers[125].format:=(0+fref+fsigned+2);
			registers[125].printsas:='xmm5';
			registers[125].permanentlyreserved:=false;
			registers[125].code:=regiXMM50_XMM50code;
			registers[125].basecode:=[(regXMM5_XMM5code+0)..(regXMM5_XMM5code+0)+3];
			new(patiXMM50_XMM50);
		new(	patiXMM50_XMM50^.meaning);
		new(	patiXMM50_XMM50^.matchedassembler);
			patiXMM50_XMM50^.meaning^.tag:=reg;
			patiXMM50_XMM50^.meaning^.index:=regiXMM50_XMM50code;
			patiXMM50_XMM50^.params:=nil;
			patiXMM50_XMM50^.matchedassembler:=string2printlist('xmm5');
			registers[126].format:=(0+fref+fsigned+2);
			registers[126].printsas:='xmm6';
			registers[126].permanentlyreserved:=false;
			registers[126].code:=regiXMM60_XMM60code;
			registers[126].basecode:=[(regXMM6_XMM6code+0)..(regXMM6_XMM6code+0)+3];
			new(patiXMM60_XMM60);
		new(	patiXMM60_XMM60^.meaning);
		new(	patiXMM60_XMM60^.matchedassembler);
			patiXMM60_XMM60^.meaning^.tag:=reg;
			patiXMM60_XMM60^.meaning^.index:=regiXMM60_XMM60code;
			patiXMM60_XMM60^.params:=nil;
			patiXMM60_XMM60^.matchedassembler:=string2printlist('xmm6');
			registers[127].format:=(0+fref+fsigned+2);
			registers[127].printsas:='xmm7';
			registers[127].permanentlyreserved:=false;
			registers[127].code:=regiXMM70_XMM70code;
			registers[127].basecode:=[(regXMM7_XMM7code+0)..(regXMM7_XMM7code+0)+3];
			new(patiXMM70_XMM70);
		new(	patiXMM70_XMM70^.meaning);
		new(	patiXMM70_XMM70^.matchedassembler);
			patiXMM70_XMM70^.meaning^.tag:=reg;
			patiXMM70_XMM70^.meaning^.index:=regiXMM70_XMM70code;
			patiXMM70_XMM70^.params:=nil;
			patiXMM70_XMM70^.matchedassembler:=string2printlist('xmm7');
			registers[128].format:=(0+fref+fsigned+2);
			registers[128].printsas:='MM0';
			registers[128].permanentlyreserved:=false;
			registers[128].code:=regiMM00_MM00code;
			registers[128].basecode:=[(regMM0_MM0code+0)..(regMM0_MM0code+0)+3];
			new(patiMM00_MM00);
		new(	patiMM00_MM00^.meaning);
		new(	patiMM00_MM00^.matchedassembler);
			patiMM00_MM00^.meaning^.tag:=reg;
			patiMM00_MM00^.meaning^.index:=regiMM00_MM00code;
			patiMM00_MM00^.params:=nil;
			patiMM00_MM00^.matchedassembler:=string2printlist('MM0');
			registers[129].format:=(0+fref+fsigned+2);
			registers[129].printsas:='MM1';
			registers[129].permanentlyreserved:=false;
			registers[129].code:=regiMM10_MM10code;
			registers[129].basecode:=[(regMM1_MM1code+0)..(regMM1_MM1code+0)+3];
			new(patiMM10_MM10);
		new(	patiMM10_MM10^.meaning);
		new(	patiMM10_MM10^.matchedassembler);
			patiMM10_MM10^.meaning^.tag:=reg;
			patiMM10_MM10^.meaning^.index:=regiMM10_MM10code;
			patiMM10_MM10^.params:=nil;
			patiMM10_MM10^.matchedassembler:=string2printlist('MM1');
			registers[130].format:=(0+fref+fsigned+2);
			registers[130].printsas:='MM2';
			registers[130].permanentlyreserved:=false;
			registers[130].code:=regiMM20_MM20code;
			registers[130].basecode:=[(regMM2_MM2code+0)..(regMM2_MM2code+0)+3];
			new(patiMM20_MM20);
		new(	patiMM20_MM20^.meaning);
		new(	patiMM20_MM20^.matchedassembler);
			patiMM20_MM20^.meaning^.tag:=reg;
			patiMM20_MM20^.meaning^.index:=regiMM20_MM20code;
			patiMM20_MM20^.params:=nil;
			patiMM20_MM20^.matchedassembler:=string2printlist('MM2');
			registers[131].format:=(0+fref+fsigned+2);
			registers[131].printsas:='MM3';
			registers[131].permanentlyreserved:=false;
			registers[131].code:=regiMM30_MM30code;
			registers[131].basecode:=[(regMM3_MM3code+0)..(regMM3_MM3code+0)+3];
			new(patiMM30_MM30);
		new(	patiMM30_MM30^.meaning);
		new(	patiMM30_MM30^.matchedassembler);
			patiMM30_MM30^.meaning^.tag:=reg;
			patiMM30_MM30^.meaning^.index:=regiMM30_MM30code;
			patiMM30_MM30^.params:=nil;
			patiMM30_MM30^.matchedassembler:=string2printlist('MM3');
			registers[132].format:=(0+fref+fsigned+2);
			registers[132].printsas:='MM4';
			registers[132].permanentlyreserved:=false;
			registers[132].code:=regiMM40_MM40code;
			registers[132].basecode:=[(regMM4_MM4code+0)..(regMM4_MM4code+0)+3];
			new(patiMM40_MM40);
		new(	patiMM40_MM40^.meaning);
		new(	patiMM40_MM40^.matchedassembler);
			patiMM40_MM40^.meaning^.tag:=reg;
			patiMM40_MM40^.meaning^.index:=regiMM40_MM40code;
			patiMM40_MM40^.params:=nil;
			patiMM40_MM40^.matchedassembler:=string2printlist('MM4');
			registers[133].format:=(0+fref+fsigned+2);
			registers[133].printsas:='MM5';
			registers[133].permanentlyreserved:=false;
			registers[133].code:=regiMM50_MM50code;
			registers[133].basecode:=[(regMM5_MM5code+0)..(regMM5_MM5code+0)+3];
			new(patiMM50_MM50);
		new(	patiMM50_MM50^.meaning);
		new(	patiMM50_MM50^.matchedassembler);
			patiMM50_MM50^.meaning^.tag:=reg;
			patiMM50_MM50^.meaning^.index:=regiMM50_MM50code;
			patiMM50_MM50^.params:=nil;
			patiMM50_MM50^.matchedassembler:=string2printlist('MM5');
			registers[134].format:=(0+fref+fsigned+2);
			registers[134].printsas:='MM6';
			registers[134].permanentlyreserved:=false;
			registers[134].code:=regiMM60_MM60code;
			registers[134].basecode:=[(regMM6_MM6code+0)..(regMM6_MM6code+0)+3];
			new(patiMM60_MM60);
		new(	patiMM60_MM60^.meaning);
		new(	patiMM60_MM60^.matchedassembler);
			patiMM60_MM60^.meaning^.tag:=reg;
			patiMM60_MM60^.meaning^.index:=regiMM60_MM60code;
			patiMM60_MM60^.params:=nil;
			patiMM60_MM60^.matchedassembler:=string2printlist('MM6');
			registers[135].format:=(0+fref+fsigned+2);
			registers[135].printsas:='MM7';
			registers[135].permanentlyreserved:=false;
			registers[135].code:=regiMM70_MM70code;
			registers[135].basecode:=[(regMM7_MM7code+0)..(regMM7_MM7code+0)+3];
			new(patiMM70_MM70);
		new(	patiMM70_MM70^.meaning);
		new(	patiMM70_MM70^.matchedassembler);
			patiMM70_MM70^.meaning^.tag:=reg;
			patiMM70_MM70^.meaning^.index:=regiMM70_MM70code;
			patiMM70_MM70^.params:=nil;
			patiMM70_MM70^.matchedassembler:=string2printlist('MM7');
		alternatives[314]:=patXMM1_XMM1;
		alternatives[315]:=patXMM3_XMM3;
		alternatives[316]:=patXMM4_XMM4;
		alternatives[317]:=patXMM5_XMM5;
		alternatives[318]:=patXMM6_XMM6;
		alternatives[319]:=patXMM2_XMM2;
		alternatives[320]:=patXMM0_XMM0;
		alternatives[321]:=patXMM7_XMM7;
		lastalt:=321;
		new(patuxmreg_);
		patuxmreg_^.meaning:=pAAlternativesPatterndecl11172_AAP11172;
		patuxmreg_^.matchedassembler:=nil;
		patuxmreg_^.params :=nil;
		alternatives[322]:=patXMM00_XMM00;
		alternatives[323]:=patXMM10_XMM10;
		alternatives[324]:=patXMM20_XMM20;
		alternatives[325]:=patXMM30_XMM30;
		alternatives[326]:=patXMM70_XMM70;
		alternatives[327]:=patXMM60_XMM60;
		alternatives[328]:=patXMM50_XMM50;
		alternatives[329]:=patXMM40_XMM40;
		lastalt:=329;
		new(patsxmreg_);
		patsxmreg_^.meaning:=pAAlternativesPatterndecl11191_AAP11191;
		patsxmreg_^.matchedassembler:=nil;
		patsxmreg_^.params :=nil;
		alternatives[330]:=patiXMM00_XMM00;
		alternatives[331]:=patiXMM10_XMM10;
		alternatives[332]:=patiXMM20_XMM20;
		alternatives[333]:=patiXMM30_XMM30;
		alternatives[334]:=patiXMM70_XMM70;
		alternatives[335]:=patiXMM60_XMM60;
		alternatives[336]:=patiXMM50_XMM50;
		alternatives[337]:=patiXMM40_XMM40;
		lastalt:=337;
		new(patixmreg_);
		patixmreg_^.meaning:=pAAlternativesPatterndecl11210_AAP11210;
		patixmreg_^.matchedassembler:=nil;
		patixmreg_^.params :=nil;
		alternatives[338]:=patXMM0I324_XMM0I324;
		alternatives[339]:=patXMM3I324_XMM3I324;
		alternatives[340]:=patXMM2I324_XMM2I324;
		alternatives[341]:=patXMM1I324_XMM1I324;
		lastalt:=341;
		new(patxmregi324_324);
		patxmregi324_324^.meaning:=pAAlternativesPatterndecl11229_AAP11229;
		patxmregi324_324^.matchedassembler:=nil;
		patxmregi324_324^.params :=nil;
		alternatives[342]:=patXMM1I324_XMM1I324;
		alternatives[343]:=patXMM2I324_XMM2I324;
		alternatives[344]:=patXMM0I324_XMM0I324;
		alternatives[345]:=patXMM3I324_XMM3I324;
		lastalt:=345;
		new(patrevxmregi324_324);
		patrevxmregi324_324^.meaning:=pAAlternativesPatterndecl11240_AAP11240;
		patrevxmregi324_324^.matchedassembler:=nil;
		patrevxmregi324_324^.params :=nil;
		alternatives[346]:=patiMM00_MM00;
		alternatives[347]:=patiMM10_MM10;
		alternatives[348]:=patiMM20_MM20;
		alternatives[349]:=patiMM30_MM30;
		alternatives[350]:=patiMM70_MM70;
		alternatives[351]:=patiMM60_MM60;
		alternatives[352]:=patiMM50_MM50;
		alternatives[353]:=patiMM40_MM40;
		lastalt:=353;
		new(patimreg_);
		patimreg_^.meaning:=pAAlternativesPatterndecl11251_AAP11251;
		patimreg_^.matchedassembler:=nil;
		patimreg_^.params :=nil;
		alternatives[354]:=patXMM0R64_XMM0R64;
		alternatives[355]:=patXMM1R64_XMM1R64;
		alternatives[356]:=patXMM2R64_XMM2R64;
		alternatives[357]:=patXMM3R64_XMM3R64;
		alternatives[358]:=patXMM4R64_XMM4R64;
		alternatives[359]:=patXMM5R64_XMM5R64;
		alternatives[360]:=patXMM6R64_XMM6R64;
		alternatives[361]:=patXMM7R64_XMM7R64;
		lastalt:=361;
		new(patxmmr64_64);
		patxmmr64_64^.meaning:=pAAlternativesPatterndecl11270_AAP11270;
		patxmmr64_64^.matchedassembler:=nil;
		patxmmr64_64^.params :=nil;
		alternatives[362]:=patXMM3R324_XMM3R324;
		alternatives[363]:=patXMM2R324_XMM2R324;
		alternatives[364]:=patXMM1R324_XMM1R324;
		alternatives[365]:=patXMM0R324_XMM0R324;
		lastalt:=365;
		new(patpsxmreg_);
		patpsxmreg_^.meaning:=pAAlternativesPatterndecl11289_AAP11289;
		patpsxmreg_^.matchedassembler:=nil;
		patpsxmreg_^.params :=nil;
		alternatives[366]:=patXMM3R642_XMM3R642;
		alternatives[367]:=patXMM2R642_XMM2R642;
		alternatives[368]:=patXMM1R642_XMM1R642;
		alternatives[369]:=patXMM0R642_XMM0R642;
		lastalt:=369;
		new(patpdxmreg_);
		patpdxmreg_^.meaning:=pAAlternativesPatterndecl11300_AAP11300;
		patpdxmreg_^.matchedassembler:=nil;
		patpdxmreg_^.params :=nil;
		alternatives[370]:=patxmregi324_324;
		alternatives[371]:=patuxmreg_;
		alternatives[372]:=patpsxmreg_;
		alternatives[373]:=patpdxmreg_;
		alternatives[374]:=patrevxmregi324_324;
		lastalt:=374;
		new(patxmreg_);
		patxmreg_^.meaning:=pAAlternativesPatterndecl11311_AAP11311;
		patxmreg_^.matchedassembler:=nil;
		patxmreg_^.params :=nil;
		alternatives[375]:=patixmreg_;
		alternatives[376]:=patimreg_;
		lastalt:=376;
		new(patlowintreg_);
		patlowintreg_^.meaning:=pAAlternativesPatterndecl11324_AAP11324;
		patlowintreg_^.matchedassembler:=nil;
		patlowintreg_^.params :=nil;
		alternatives[377]:=patlowintreg_;
		alternatives[378]:=patsxmreg_;
		lastalt:=378;
		new(patlowreg_);
		patlowreg_^.meaning:=pAAlternativesPatterndecl11331_AAP11331;
		patlowreg_^.matchedassembler:=nil;
		patlowreg_^.params :=nil;
		alternatives[379]:=patmaddrmode_;
		alternatives[380]:=patxmmr64_64;
		lastalt:=380;
		new(patxmmr64m_64);
		patxmmr64m_64^.meaning:=pAAlternativesPatterndecl11338_AAP11338;
		patxmmr64m_64^.matchedassembler:=nil;
		patxmmr64m_64^.params :=nil;
		alternatives[381]:=patmaddrmode_;
		alternatives[382]:=patxmreg_;
		lastalt:=382;
		new(patlmaddrmode_);
		patlmaddrmode_^.meaning:=pAAlternativesPatterndecl11345_AAP11345;
		patlmaddrmode_^.matchedassembler:=nil;
		patlmaddrmode_^.params :=nil;
		alternatives[383]:=patmaddrmode_;
		alternatives[384]:=patsxmreg_;
		lastalt:=384;
		new(patsmaddrmode_);
		patsmaddrmode_^.meaning:=pAAlternativesPatterndecl11352_AAP11352;
		patsmaddrmode_^.matchedassembler:=nil;
		patsmaddrmode_^.params :=nil;
		alternatives[385]:=patmaddrmode_;
		alternatives[386]:=patreg_;
		lastalt:=386;
		new(patrm_);
		patrm_^.meaning:=pAAlternativesPatterndecl11359_AAP11359;
		patrm_^.matchedassembler:=nil;
		patrm_^.params :=nil;
		new(patsdiv_);
		new(patsdiv_^.meaning);
		patsdiv_^.meaning^.tag:=dyadicop;
		patsdiv_^.meaning^.opname:='div';
		patsdiv_^.matchedassembler:=string2printlist('div' );
		new(patmin_);
		new(patmin_^.meaning);
		patmin_^.meaning^.tag:=dyadicop;
		patmin_^.meaning^.opname:='MIN';
		patmin_^.matchedassembler:=string2printlist('MIN' );
		new(patmax_);
		new(patmax_^.meaning);
		patmax_^.meaning^.tag:=dyadicop;
		patmax_^.meaning^.opname:='MAX';
		patmax_^.matchedassembler:=string2printlist('MAX' );
		new(patpand_);
		new(patpand_^.meaning);
		patpand_^.meaning^.tag:=dyadicop;
		patpand_^.meaning^.opname:='AND';
		patpand_^.matchedassembler:=string2printlist('and' );
		new(patpor_);
		new(patpor_^.meaning);
		patpor_^.meaning^.tag:=dyadicop;
		patpor_^.meaning^.opname:='OR';
		patpor_^.matchedassembler:=string2printlist('or' );
		alternatives[387]:=patadd_;
		alternatives[388]:=patmul_;
		alternatives[389]:=patsdiv_;
		alternatives[390]:=patsub_;
		alternatives[391]:=patmin_;
		alternatives[392]:=patmax_;
		lastalt:=392;
		new(patsoperator_);
		patsoperator_^.meaning:=pAAlternativesPatterndecl11386_AAP11386;
		patsoperator_^.matchedassembler:=nil;
		patsoperator_^.params :=nil;
		alternatives[393]:=patmin_;
		alternatives[394]:=patmax_;
		lastalt:=394;
		new(patcoperator_);
		patcoperator_^.meaning:=pAAlternativesPatterndecl11401_AAP11401;
		patcoperator_^.matchedassembler:=nil;
		patcoperator_^.params :=nil;
		alternatives[395]:=patpor_;
		alternatives[396]:=patpand_;
		lastalt:=396;
		new(patloperator_);
		patloperator_^.meaning:=pAAlternativesPatterndecl11408_AAP11408;
		patloperator_^.matchedassembler:=nil;
		patloperator_^.params :=nil;
		alternatives[397]:=patcoperator_;
		alternatives[398]:=patnonmultoperator_;
		lastalt:=398;
		new(patsmoperator_);
		patsmoperator_^.meaning:=pAAlternativesPatterndecl11415_AAP11415;
		patsmoperator_^.matchedassembler:=nil;
		patsmoperator_^.params :=nil;
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patXPANDN_XPANDN);
		patXPANDN_XPANDN^.meaning:=pAAssignMeaning11425_AAM11425;
		patXPANDN_XPANDN^.matchedassembler:=pAAssemblesto11441_AA11441;
		new(patXPANDN_XPANDN^.params);
		for i:= 1 to maxparam do patXPANDN_XPANDN^.params^[i]:=nil;
		patXPANDN_XPANDN^.params^[0]:=patxmreg_;
		patXPANDN_XPANDN^.params^[1]:=patxmreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
(* defds ->public boolean pAIdentifierDyadic11466_AID11466*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPSD_OPSD);
		patOPSD_OPSD^.meaning:=pAAssignMeaning11456_AAM11456;
		patOPSD_OPSD^.matchedassembler:=pAAssemblesto11485_AA11485;
		new(patOPSD_OPSD^.params);
		for i:= 1 to maxparam do patOPSD_OPSD^.params^[i]:=nil;
		patOPSD_OPSD^.params^[2]:=patxmmr64_64;
		patOPSD_OPSD^.params^[1]:=patxmmr64m_64;
		patOPSD_OPSD^.params^[0]:=patsoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
(* defds ->public boolean pAIdentifierDyadic11511_AID11511*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPSS_OPSS);
		patOPSS_OPSS^.meaning:=pAAssignMeaning11501_AAM11501;
		patOPSS_OPSS^.matchedassembler:=pAAssemblesto11530_AA11530;
		new(patOPSS_OPSS^.params);
		for i:= 1 to maxparam do patOPSS_OPSS^.params^[i]:=nil;
		patOPSS_OPSS^.params^[2]:=patsxmreg_;
		patOPSS_OPSS^.params^[1]:=patsmaddrmode_;
		patOPSS_OPSS^.params^[0]:=patsoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patADDSS_ADDSS);
		patADDSS_ADDSS^.meaning:=pAAssignMeaning11544_AAM11544;
		patADDSS_ADDSS^.matchedassembler:=pAAssemblesto11573_AA11573;
		new(patADDSS_ADDSS^.params);
		for i:= 1 to maxparam do patADDSS_ADDSS^.params^[i]:=nil;
		patADDSS_ADDSS^.params^[1]:=patsxmreg_;
		patADDSS_ADDSS^.params^[0]:=patsmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee32 vector ( 4 )*)
(* defds ->public boolean pAIdentifierDyadic11602_AID11602*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPS_OPPS);
		patOPPS_OPPS^.meaning:=pAAssignMeaning11588_AAM11588;
		patOPPS_OPPS^.matchedassembler:=pAAssemblesto11629_AA11629;
		new(patOPPS_OPPS^.params);
		for i:= 1 to maxparam do patOPPS_OPPS^.params^[i]:=nil;
		patOPPS_OPPS^.params^[2]:=patxmreg_;
		patOPPS_OPPS^.params^[1]:=patxmreg_;
		patOPPS_OPPS^.params^[0]:=patsoperator_;
		 
		new(patslt_);
		new(patslt_^.meaning);
		patslt_^.meaning^.tag:=dyadicop;
		patslt_^.meaning^.opname:='<';
		patslt_^.matchedassembler:=string2printlist('lt' );
		new(patsle_);
		new(patsle_^.meaning);
		patsle_^.meaning^.tag:=dyadicop;
		patsle_^.meaning^.opname:='<=';
		patsle_^.matchedassembler:=string2printlist('le' );
		new(patseq_);
		new(patseq_^.meaning);
		patseq_^.meaning^.tag:=dyadicop;
		patseq_^.meaning^.opname:='=';
		patseq_^.matchedassembler:=string2printlist('eq' );
		alternatives[399]:=patslt_;
		alternatives[400]:=patsle_;
		alternatives[401]:=patseq_;
		lastalt:=401;
		new(patscmp_);
		patscmp_^.meaning:=pAAlternativesPatterndecl11652_AAP11652;
		patscmp_^.matchedassembler:=nil;
		patscmp_^.params :=nil;
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 4 )*)
(* defds ->public boolean pAIdentifierDyadic11683_AID11683*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patCMPPS_CMPPS);
		patCMPPS_CMPPS^.meaning:=pAAssignMeaning11666_AAM11666;
		patCMPPS_CMPPS^.matchedassembler:=pAAssemblesto11710_AA11710;
		new(patCMPPS_CMPPS^.params);
		for i:= 1 to maxparam do patCMPPS_CMPPS^.params^[i]:=nil;
		patCMPPS_CMPPS^.params^[2]:=patxmreg_;
		patCMPPS_CMPPS^.params^[1]:=patxmreg_;
		patCMPPS_CMPPS^.params^[0]:=patscmp_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee64 vector ( 2 )*)
(* defds ->public boolean pAIdentifierDyadic11740_AID11740*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPD_OPPD);
		patOPPD_OPPD^.meaning:=pAAssignMeaning11726_AAM11726;
		patOPPD_OPPD^.matchedassembler:=pAAssemblesto11767_AA11767;
		new(patOPPD_OPPD^.params);
		for i:= 1 to maxparam do patOPPD_OPPD^.params^[i]:=nil;
		patOPPD_OPPD^.params^[2]:=patxmreg_;
		patOPPD_OPPD^.params^[1]:=patxmreg_;
		patOPPD_OPPD^.params^[0]:=patsoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
(* defds ->public boolean pAIdentifierDyadic11798_AID11798*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI8m_OPPI8);
		patOPPI8m_OPPI8^.meaning:=pAAssignMeaning11783_AAM11783;
		patOPPI8m_OPPI8^.matchedassembler:=pAAssemblesto11827_AA11827;
		new(patOPPI8m_OPPI8^.params);
		for i:= 1 to maxparam do patOPPI8m_OPPI8^.params^[i]:=nil;
		patOPPI8m_OPPI8^.params^[2]:=patmreg_;
		patOPPI8m_OPPI8^.params^[1]:=patmreg_;
		patOPPI8m_OPPI8^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 4 )*)
(* defds ->public boolean pAIdentifierDyadic11859_AID11859*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI16m_OPPI16);
		patOPPI16m_OPPI16^.meaning:=pAAssignMeaning11844_AAM11844;
		patOPPI16m_OPPI16^.matchedassembler:=pAAssemblesto11888_AA11888;
		new(patOPPI16m_OPPI16^.params);
		for i:= 1 to maxparam do patOPPI16m_OPPI16^.params^[i]:=nil;
		patOPPI16m_OPPI16^.params^[2]:=patmreg_;
		patOPPI16m_OPPI16^.params^[1]:=patmreg_;
		patOPPI16m_OPPI16^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 4 )*)
(* defds ->public boolean pAIdentifierDyadic11932_AID11932*)
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier ma  to the tree at this point*)
		new(patXCMPPD_XCMPPD);
		patXCMPPD_XCMPPD^.meaning:=pAAssignMeaning11905_AAM11905;
		patXCMPPD_XCMPPD^.matchedassembler:=pAAssemblesto11961_AA11961;
		new(patXCMPPD_XCMPPD^.params);
		for i:= 1 to maxparam do patXCMPPD_XCMPPD^.params^[i]:=nil;
		patXCMPPD_XCMPPD^.params^[0]:=patxmregi324_324;
		patXCMPPD_XCMPPD^.params^[2]:=patmcondition_;
		patXCMPPD_XCMPPD^.params^[1]:=patxmregi324_324;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 4 )*)
		(*! Matches identifier ma  to the tree at this point*)
		(*! Matches identifier m  to the tree at this point*)
		new(patXCMPPDR_XCMPPDR);
		patXCMPPDR_XCMPPDR^.meaning:=pAAssignMeaning11978_AAM11978;
		patXCMPPDR_XCMPPDR^.matchedassembler:=pAAssemblesto12044_AA12044;
		new(patXCMPPDR_XCMPPDR^.params);
		for i:= 1 to maxparam do patXCMPPDR_XCMPPDR^.params^[i]:=nil;
		patXCMPPDR_XCMPPDR^.params^[0]:=patxmreg_;
		patXCMPPDR_XCMPPDR^.params^[2]:=patmcondition_;
		patXCMPPDR_XCMPPDR^.params^[1]:=patxmreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 8 )*)
(* defds ->public boolean pAIdentifierDyadic12074_AID12074*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI8msc_OPPI8);
		patOPPI8msc_OPPI8^.meaning:=pAAssignMeaning12059_AAM12059;
		patOPPI8msc_OPPI8^.matchedassembler:=pAAssemblesto12103_AA12103;
		new(patOPPI8msc_OPPI8^.params);
		for i:= 1 to maxparam do patOPPI8msc_OPPI8^.params^[i]:=nil;
		patOPPI8msc_OPPI8^.params^[2]:=patmreg_;
		patOPPI8msc_OPPI8^.params^[1]:=patmreg_;
		patOPPI8msc_OPPI8^.params^[0]:=patcoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 4 )*)
(* defds ->public boolean pAIdentifierDyadic12135_AID12135*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI16msc_OPPI16);
		patOPPI16msc_OPPI16^.meaning:=pAAssignMeaning12120_AAM12120;
		patOPPI16msc_OPPI16^.matchedassembler:=pAAssemblesto12164_AA12164;
		new(patOPPI16msc_OPPI16^.params);
		for i:= 1 to maxparam do patOPPI16msc_OPPI16^.params^[i]:=nil;
		patOPPI16msc_OPPI16^.params^[2]:=patmreg_;
		patOPPI16msc_OPPI16^.params^[1]:=patmreg_;
		patOPPI16msc_OPPI16^.params^[0]:=patcoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref uint8 vector ( 8 )*)
(* defds ->public boolean pAIdentifierDyadic12196_AID12196*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI8muc_OPPI8);
		patOPPI8muc_OPPI8^.meaning:=pAAssignMeaning12181_AAM12181;
		patOPPI8muc_OPPI8^.matchedassembler:=pAAssemblesto12225_AA12225;
		new(patOPPI8muc_OPPI8^.params);
		for i:= 1 to maxparam do patOPPI8muc_OPPI8^.params^[i]:=nil;
		patOPPI8muc_OPPI8^.params^[2]:=patmreg_;
		patOPPI8muc_OPPI8^.params^[1]:=patmreg_;
		patOPPI8muc_OPPI8^.params^[0]:=patcoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref uint16 vector ( 4 )*)
(* defds ->public boolean pAIdentifierDyadic12257_AID12257*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI16muc_OPPI16);
		patOPPI16muc_OPPI16^.meaning:=pAAssignMeaning12242_AAM12242;
		patOPPI16muc_OPPI16^.matchedassembler:=pAAssemblesto12286_AA12286;
		new(patOPPI16muc_OPPI16^.params);
		for i:= 1 to maxparam do patOPPI16muc_OPPI16^.params^[i]:=nil;
		patOPPI16muc_OPPI16^.params^[2]:=patmreg_;
		patOPPI16muc_OPPI16^.params^[1]:=patmreg_;
		patOPPI16muc_OPPI16^.params^[0]:=patcoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int8 vector ( 16 )*)
(* defds ->public boolean pAIdentifierDyadic12318_AID12318*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI8_OPPI8);
		patOPPI8_OPPI8^.meaning:=pAAssignMeaning12303_AAM12303;
		patOPPI8_OPPI8^.matchedassembler:=pAAssemblesto12347_AA12347;
		new(patOPPI8_OPPI8^.params);
		for i:= 1 to maxparam do patOPPI8_OPPI8^.params^[i]:=nil;
		patOPPI8_OPPI8^.params^[2]:=patxmreg_;
		patOPPI8_OPPI8^.params^[1]:=patxmreg_;
		patOPPI8_OPPI8^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 8 )*)
(* defds ->public boolean pAIdentifierDyadic12379_AID12379*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI16_OPPI16);
		patOPPI16_OPPI16^.meaning:=pAAssignMeaning12364_AAM12364;
		patOPPI16_OPPI16^.matchedassembler:=pAAssemblesto12408_AA12408;
		new(patOPPI16_OPPI16^.params);
		for i:= 1 to maxparam do patOPPI16_OPPI16^.params^[i]:=nil;
		patOPPI16_OPPI16^.params^[2]:=patxmreg_;
		patOPPI16_OPPI16^.params^[1]:=patxmreg_;
		patOPPI16_OPPI16^.params^[0]:=patnonmultoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref int16 vector ( 8 )*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTORUPI16_STORUPI16);
		patSTORUPI16_STORUPI16^.meaning:=pAAssignMeaning12423_AAM12423;
		patSTORUPI16_STORUPI16^.matchedassembler:=pAAssemblesto12451_AA12451;
		new(patSTORUPI16_STORUPI16^.params);
		for i:= 1 to maxparam do patSTORUPI16_STORUPI16^.params^[i]:=nil;
		patSTORUPI16_STORUPI16^.params^[1]:=patxmreg_;
		patSTORUPI16_STORUPI16^.params^[0]:=patsmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patMOVUPI16_MOVUPI16);
		patMOVUPI16_MOVUPI16^.meaning:=pAAssignMeaning12464_AAM12464;
		patMOVUPI16_MOVUPI16^.matchedassembler:=pAAssemblesto12482_AA12482;
		new(patMOVUPI16_MOVUPI16^.params);
		for i:= 1 to maxparam do patMOVUPI16_MOVUPI16^.params^[i]:=nil;
		patMOVUPI16_MOVUPI16^.params^[0]:=patsmaddrmode_;
		patMOVUPI16_MOVUPI16^.params^[1]:=patxmreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 4 )*)
(* defds ->public boolean pAIdentifierDyadic12512_AID12512*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI32_OPPI32);
		patOPPI32_OPPI32^.meaning:=pAAssignMeaning12497_AAM12497;
		patOPPI32_OPPI32^.matchedassembler:=pAAssemblesto12541_AA12541;
		new(patOPPI32_OPPI32^.params);
		for i:= 1 to maxparam do patOPPI32_OPPI32^.params^[i]:=nil;
		patOPPI32_OPPI32^.params^[2]:=patxmreg_;
		patOPPI32_OPPI32^.params^[1]:=patxmreg_;
		patOPPI32_OPPI32^.params^[0]:=patloperator_;
		 
		(*! Matches identifier r1  to the tree at this point*)
(* defds ->public boolean pAIdentifierDyadic12562_AID12562*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patOPPI32m_OPPI32);
		patOPPI32m_OPPI32^.meaning:=pAAssignMeaning12557_AAM12557;
		patOPPI32m_OPPI32^.matchedassembler:=pAAssemblesto12571_AA12571;
		new(patOPPI32m_OPPI32^.params);
		for i:= 1 to maxparam do patOPPI32m_OPPI32^.params^[i]:=nil;
		patOPPI32m_OPPI32^.params^[2]:=patxmregi324_324;
		patOPPI32m_OPPI32^.params^[1]:=patxmregi324_324;
		patOPPI32m_OPPI32^.params^[0]:=patsmoperator_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref int32 vector ( 4 )*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTORUPI32_STORUPI32);
		patSTORUPI32_STORUPI32^.meaning:=pAAssignMeaning12586_AAM12586;
		patSTORUPI32_STORUPI32^.matchedassembler:=pAAssemblesto12604_AA12604;
		new(patSTORUPI32_STORUPI32^.params);
		for i:= 1 to maxparam do patSTORUPI32_STORUPI32^.params^[i]:=nil;
		patSTORUPI32_STORUPI32^.params^[1]:=patxmregi324_324;
		patSTORUPI32_STORUPI32^.params^[0]:=patsmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patMOVUPI32_MOVUPI32);
		patMOVUPI32_MOVUPI32^.meaning:=pAAssignMeaning12617_AAM12617;
		patMOVUPI32_MOVUPI32^.matchedassembler:=pAAssemblesto12635_AA12635;
		new(patMOVUPI32_MOVUPI32^.params);
		for i:= 1 to maxparam do patMOVUPI32_MOVUPI32^.params^[i]:=nil;
		patMOVUPI32_MOVUPI32^.params^[0]:=patlmaddrmode_;
		patMOVUPI32_MOVUPI32^.params^[1]:=patxmreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref ieee64 vector ( 2 )*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTORUPD_STORUPD);
		patSTORUPD_STORUPD^.meaning:=pAAssignMeaning12648_AAM12648;
		patSTORUPD_STORUPD^.matchedassembler:=pAAssemblesto12674_AA12674;
		new(patSTORUPD_STORUPD^.params);
		for i:= 1 to maxparam do patSTORUPD_STORUPD^.params^[i]:=nil;
		patSTORUPD_STORUPD^.params^[1]:=patxmreg_;
		patSTORUPD_STORUPD^.params^[0]:=patsmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patMOVUPD_MOVUPD);
		patMOVUPD_MOVUPD^.meaning:=pAAssignMeaning12687_AAM12687;
		patMOVUPD_MOVUPD^.matchedassembler:=pAAssemblesto12704_AA12704;
		new(patMOVUPD_MOVUPD^.params);
		for i:= 1 to maxparam do patMOVUPD_MOVUPD^.params^[i]:=nil;
		patMOVUPD_MOVUPD^.params^[0]:=patsmaddrmode_;
		patMOVUPD_MOVUPD^.params^[1]:=patxmreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref ieee32 vector ( 4 )*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTORUPS_STORUPS);
		patSTORUPS_STORUPS^.meaning:=pAAssignMeaning12717_AAM12717;
		patSTORUPS_STORUPS^.matchedassembler:=pAAssemblesto12743_AA12743;
		new(patSTORUPS_STORUPS^.params);
		for i:= 1 to maxparam do patSTORUPS_STORUPS^.params^[i]:=nil;
		patSTORUPS_STORUPS^.params^[1]:=patxmreg_;
		patSTORUPS_STORUPS^.params^[0]:=patsmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref ieee32 vector ( 4 )*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patMOVAPS_MOVAPS);
		patMOVAPS_MOVAPS^.meaning:=pAAssignMeaning12756_AAM12756;
		patMOVAPS_MOVAPS^.matchedassembler:=pAAssemblesto12782_AA12782;
		new(patMOVAPS_MOVAPS^.params);
		for i:= 1 to maxparam do patMOVAPS_MOVAPS^.params^[i]:=nil;
		patMOVAPS_MOVAPS^.params^[1]:=patxmreg_;
		patMOVAPS_MOVAPS^.params^[0]:=patxmreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patSSQRT_SSQRT);
		patSSQRT_SSQRT^.meaning:=pAAssignMeaning12793_AAM12793;
		patSSQRT_SSQRT^.matchedassembler:=pAAssemblesto12803_AA12803;
		new(patSSQRT_SSQRT^.params);
		for i:= 1 to maxparam do patSSQRT_SSQRT^.params^[i]:=nil;
		patSSQRT_SSQRT^.params^[0]:=patsxmreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patSDSQRT_SDSQRT);
		patSDSQRT_SDSQRT^.meaning:=pAAssignMeaning12814_AAM12814;
		patSDSQRT_SDSQRT^.matchedassembler:=pAAssemblesto12824_AA12824;
		new(patSDSQRT_SDSQRT^.params);
		for i:= 1 to maxparam do patSDSQRT_SDSQRT^.params^[i]:=nil;
		patSDSQRT_SDSQRT^.params^[0]:=patxmmr64_64;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVUPS_MOVUPS);
		patMOVUPS_MOVUPS^.meaning:=pAAssignMeaning12837_AAM12837;
		patMOVUPS_MOVUPS^.matchedassembler:=pAAssemblesto12854_AA12854;
		new(patMOVUPS_MOVUPS^.params);
		for i:= 1 to maxparam do patMOVUPS_MOVUPS^.params^[i]:=nil;
		patMOVUPS_MOVUPS^.params^[1]:=patxmreg_;
		patMOVUPS_MOVUPS^.params^[0]:=patsmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		new(patMOVSS_MOVSS);
		patMOVSS_MOVSS^.meaning:=pAAssignMeaning12867_AAM12867;
		patMOVSS_MOVSS^.matchedassembler:=pAAssemblesto12885_AA12885;
		new(patMOVSS_MOVSS^.params);
		for i:= 1 to maxparam do patMOVSS_MOVSS^.params^[i]:=nil;
		patMOVSS_MOVSS^.params^[1]:=patsxmreg_;
		patMOVSS_MOVSS^.params^[0]:=patsmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVSD_MOVSD);
		patMOVSD_MOVSD^.meaning:=pAAssignMeaning12898_AAM12898;
		patMOVSD_MOVSD^.matchedassembler:=pAAssemblesto12916_AA12916;
		new(patMOVSD_MOVSD^.params);
		for i:= 1 to maxparam do patMOVSD_MOVSD^.params^[i]:=nil;
		patMOVSD_MOVSD^.params^[1]:=patxmmr64_64;
		patMOVSD_MOVSD^.params^[0]:=patxmmr64m_64;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patMOVSDl_MOVSD);
		patMOVSDl_MOVSD^.meaning:=pAAssignMeaning12930_AAM12930;
		patMOVSDl_MOVSD^.matchedassembler:=pAAssemblesto12948_AA12948;
		new(patMOVSDl_MOVSD^.params);
		for i:= 1 to maxparam do patMOVSDl_MOVSD^.params^[i]:=nil;
		patMOVSDl_MOVSD^.params^[1]:=patxmmr64_64;
		patMOVSDl_MOVSD^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier dest  to the tree at this point*)
		(*! Matches identifier src  to the tree at this point*)
		new(patMOVDl_MOVD);
		patMOVDl_MOVD^.meaning:=pAAssignMeaning12962_AAM12962;
		patMOVDl_MOVD^.matchedassembler:=pAAssemblesto12970_AA12970;
		new(patMOVDl_MOVD^.params);
		for i:= 1 to maxparam do patMOVDl_MOVD^.params^[i]:=nil;
		patMOVDl_MOVD^.params^[1]:=patlowreg_;
		patMOVDl_MOVD^.params^[0]:=patreg_;
		 
		(*! Matches identifier dest  to the tree at this point*)
		(*! Matches identifier src  to the tree at this point*)
		new(patMOVDs_MOVD);
		patMOVDs_MOVD^.meaning:=pAAssignMeaning12983_AAM12983;
		patMOVDs_MOVD^.matchedassembler:=pAAssemblesto12991_AA12991;
		new(patMOVDs_MOVD^.params);
		for i:= 1 to maxparam do patMOVDs_MOVD^.params^[i]:=nil;
		patMOVDs_MOVD^.params^[0]:=patreg_;
		patMOVDs_MOVD^.params^[1]:=patlowreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! matches a literal  to the tree at this point*)
		new(patXRLOADLIT_XRLOADLIT);
		patXRLOADLIT_XRLOADLIT^.meaning:=pAAssignMeaning13006_AAM13006;
		patXRLOADLIT_XRLOADLIT^.matchedassembler:=pAAssemblesto13021_AA13021;
		new(patXRLOADLIT_XRLOADLIT^.params);
		for i:= 1 to maxparam do patXRLOADLIT_XRLOADLIT^.params^[i]:=nil;
		patXRLOADLIT_XRLOADLIT^.params^[2]:=patsxmreg_;
		patXRLOADLIT_XRLOADLIT^.params^[1]:=patfloat_;
		patXRLOADLIT_XRLOADLIT^.params^[0]:=patfloat_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		(*! matches a literal  to the tree at this point*)
		new(patXRDLOADLIT_XRDLOADLIT);
		patXRDLOADLIT_XRDLOADLIT^.meaning:=pAAssignMeaning13036_AAM13036;
		patXRDLOADLIT_XRDLOADLIT^.matchedassembler:=pAAssemblesto13051_AA13051;
		new(patXRDLOADLIT_XRDLOADLIT^.params);
		for i:= 1 to maxparam do patXRDLOADLIT_XRDLOADLIT^.params^[i]:=nil;
		patXRDLOADLIT_XRDLOADLIT^.params^[2]:=patxmmr64_64;
		patXRDLOADLIT_XRDLOADLIT^.params^[1]:=patreal_;
		patXRDLOADLIT_XRDLOADLIT^.params^[0]:=patreal_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref int32*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patCVTSD2SI_CVTSD2SI);
		patCVTSD2SI_CVTSD2SI^.meaning:=pAAssignMeaning13064_AAM13064;
		patCVTSD2SI_CVTSD2SI^.matchedassembler:=pAAssemblesto13091_AA13091;
		new(patCVTSD2SI_CVTSD2SI^.params);
		for i:= 1 to maxparam do patCVTSD2SI_CVTSD2SI^.params^[i]:=nil;
		patCVTSD2SI_CVTSD2SI^.params^[1]:=patreg_;
		patCVTSD2SI_CVTSD2SI^.params^[0]:=patxmmr64m_64;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patCVTSI2SD_CVTSI2SD);
		patCVTSI2SD_CVTSI2SD^.meaning:=pAAssignMeaning13104_AAM13104;
		patCVTSI2SD_CVTSI2SD^.matchedassembler:=pAAssemblesto13130_AA13130;
		new(patCVTSI2SD_CVTSI2SD^.params);
		for i:= 1 to maxparam do patCVTSI2SD_CVTSI2SD^.params^[i]:=nil;
		patCVTSI2SD_CVTSI2SD^.params^[1]:=patxmmr64_64;
		patCVTSI2SD_CVTSI2SD^.params^[0]:=patreg_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier rm  to the tree at this point*)
		new(patCVTSI2SS_CVTSI2SS);
		patCVTSI2SS_CVTSI2SS^.meaning:=pAAssignMeaning13143_AAM13143;
		patCVTSI2SS_CVTSI2SS^.matchedassembler:=pAAssemblesto13169_AA13169;
		new(patCVTSI2SS_CVTSI2SS^.params);
		for i:= 1 to maxparam do patCVTSI2SS_CVTSI2SS^.params^[i]:=nil;
		patCVTSI2SS_CVTSI2SS^.params^[1]:=patsxmreg_;
		patCVTSI2SS_CVTSI2SS^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier r1  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier r0  to the tree at this point*)
		new(patCVTIR2SS_CVTIR2SS);
		patCVTIR2SS_CVTIR2SS^.meaning:=pAAssignMeaning13182_AAM13182;
		patCVTIR2SS_CVTIR2SS^.matchedassembler:=pAAssemblesto13208_AA13208;
		new(patCVTIR2SS_CVTIR2SS^.params);
		for i:= 1 to maxparam do patCVTIR2SS_CVTIR2SS^.params^[i]:=nil;
		patCVTIR2SS_CVTIR2SS^.params^[1]:=patsxmreg_;
		patCVTIR2SS_CVTIR2SS^.params^[0]:=patreg_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTORESS_STORESS);
		patSTORESS_STORESS^.meaning:=pAAssignMeaning13221_AAM13221;
		patSTORESS_STORESS^.matchedassembler:=pAAssemblesto13239_AA13239;
		new(patSTORESS_STORESS^.params);
		for i:= 1 to maxparam do patSTORESS_STORESS^.params^[i]:=nil;
		patSTORESS_STORESS^.params^[1]:=patsxmreg_;
		patSTORESS_STORESS^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier rm  to the tree at this point*)
		(*! try to cast to type: ref ieee64*)
		(*! Matches identifier r1  to the tree at this point*)
		new(patSTORESD_STORESD);
		patSTORESD_STORESD^.meaning:=pAAssignMeaning13252_AAM13252;
		patSTORESD_STORESD^.matchedassembler:=pAAssemblesto13270_AA13270;
		new(patSTORESD_STORESD^.params);
		for i:= 1 to maxparam do patSTORESD_STORESD^.params^[i]:=nil;
		patSTORESD_STORESD^.params^[1]:=patxmmr64_64;
		patSTORESD_STORESD^.params^[0]:=patmaddrmode_;
		 
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		(*! Matches identifier r  to the tree at this point*)
		new(patSSRPUSH_SSRPUSH);
		patSSRPUSH_SSRPUSH^.meaning:=pAValueMeaning13282_AVM13282;
		patSSRPUSH_SSRPUSH^.matchedassembler:=pAAssemblesto13291_AA13291;
		new(patSSRPUSH_SSRPUSH^.params);
		for i:= 1 to maxparam do patSSRPUSH_SSRPUSH^.params^[i]:=nil;
		patSSRPUSH_SSRPUSH^.params^[0]:=patsxmreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSSRPOP_SSRPOP);
		patSSRPOP_SSRPOP^.meaning:=pAAssignMeaning13300_AAM13300;
		patSSRPOP_SSRPOP^.matchedassembler:=pAAssemblesto13316_AA13316;
		new(patSSRPOP_SSRPOP^.params);
		for i:= 1 to maxparam do patSSRPOP_SSRPOP^.params^[i]:=nil;
		patSSRPOP_SSRPOP^.params^[0]:=patsxmreg_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref ieee32*)
		(*! Matches identifier mainSTACK  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patSSRPOPI_SSRPOPI);
		patSSRPOPI_SSRPOPI^.meaning:=pAAssignMeaning13326_AAM13326;
		patSSRPOPI_SSRPOPI^.matchedassembler:=pAAssemblesto13350_AA13350;
		new(patSSRPOPI_SSRPOPI^.params);
		for i:= 1 to maxparam do patSSRPOPI_SSRPOPI^.params^[i]:=nil;
		patSSRPOPI_SSRPOPI^.params^[0]:=patsxmreg_;
		 
(* defds ->public boolean pAIdentifierDyadic13368_AID13368*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		(*! Matches identifier l  to the tree at this point*)
	(*! recogises loc in value context *)
		new(patCOMISSIFGOTO_COMISSIFGOTO);
		patCOMISSIFGOTO_COMISSIFGOTO^.meaning:=pAIfMeaning13366_AIM13366;
		patCOMISSIFGOTO_COMISSIFGOTO^.matchedassembler:=pAAssemblesto13380_AA13380;
		new(patCOMISSIFGOTO_COMISSIFGOTO^.params);
		for i:= 1 to maxparam do patCOMISSIFGOTO_COMISSIFGOTO^.params^[i]:=nil;
		patCOMISSIFGOTO_COMISSIFGOTO^.params^[2]:=patsxmreg_;
		patCOMISSIFGOTO_COMISSIFGOTO^.params^[0]:=patlabel_;
		patCOMISSIFGOTO_COMISSIFGOTO^.params^[1]:=patsxmreg_;
		patCOMISSIFGOTO_COMISSIFGOTO^.params^[3]:=patfcondition_;
		 
		(*! Matches identifier r  to the tree at this point*)
		(*! try to cast to type: ref uint8*)
(* defds ->public boolean pAIdentifierDyadic13418_AID13418*)
		(*! Matches identifier r1  to the tree at this point*)
		(*! Matches identifier r2  to the tree at this point*)
		new(patCOMISS_COMISS);
		patCOMISS_COMISS^.meaning:=pAAssignMeaning13401_AAM13401;
		patCOMISS_COMISS^.matchedassembler:=pAAssemblesto13427_AA13427;
		new(patCOMISS_COMISS^.params);
		for i:= 1 to maxparam do patCOMISS_COMISS^.params^[i]:=nil;
		patCOMISS_COMISS^.params^[2]:=patsxmreg_;
		patCOMISS_COMISS^.params^[1]:=patsxmreg_;
		patCOMISS_COMISS^.params^[3]:=patbreg_;
		patCOMISS_COMISS^.params^[0]:=patfcondition_;
		 
		(*! Matches identifier m  to the tree at this point*)
		(*! Matches identifier r  to the tree at this point*)
		new(patFREP4_FREP4);
		patFREP4_FREP4^.meaning:=pAAssignMeaning13444_AAM13444;
		patFREP4_FREP4^.matchedassembler:=pAAssemblesto13458_AA13458;
		new(patFREP4_FREP4^.params);
		for i:= 1 to maxparam do patFREP4_FREP4^.params^[i]:=nil;
		patFREP4_FREP4^.params^[0]:=patxmreg_;
		patFREP4_FREP4^.params^[1]:=patreg_;
		 
		lastreg:=maxbasereg;
		lastinstruction:=269;
		  instructionsetorder[0]:= patRPUSH_RPUSH;
		  instructionsetorder[1]:= patIFLITGOTO_IFLITGOTO;
		  instructionsetorder[2]:= patLOADB_LOADB;
		  instructionsetorder[3]:= patLOADW_LOADW;
		  instructionsetorder[4]:= patLOAD_LOAD;
		  instructionsetorder[5]:= patMOVZXB_MOVZXB;
		  instructionsetorder[6]:= patMOVSXB_MOVSXB;
		  instructionsetorder[7]:= patMOVZXW_MOVZXW;
		  instructionsetorder[8]:= patMOVSXW_MOVSXW;
		  instructionsetorder[9]:= patMOVZXB2_MOVZXB2;
		  instructionsetorder[10]:= patMOVZXBW_MOVZXBW;
		  instructionsetorder[11]:= patMOVSXBW_MOVSXBW;
		  instructionsetorder[12]:= patCLEARREG_CLEARREG;
		  instructionsetorder[13]:= patSTORELIT_STORELIT;
		  instructionsetorder[14]:= patLEA_LEA;
		  instructionsetorder[15]:= patINC_INC;
		  instructionsetorder[16]:= patTESTIN_TESTIN;
		  instructionsetorder[17]:= patSHIFT_SHIFT;
		  instructionsetorder[18]:= patMLIT_MLIT;
		  instructionsetorder[19]:= patRMLIT_RMLIT;
		  instructionsetorder[20]:= patADDRMR_ADDRMR;
		  instructionsetorder[21]:= patPLANTBCONST_PLANTBCONST;
		  instructionsetorder[22]:= patPLANTWCONST_PLANTWCONST;
		  instructionsetorder[23]:= patPLANTICONST_PLANTICONST;
		  instructionsetorder[24]:= patPLANTRCONST_PLANTRCONST;
		  instructionsetorder[25]:= patPLANTSCONST_PLANTSCONST;
		  instructionsetorder[26]:= patDEC_DEC;
		  instructionsetorder[27]:= patIMULLIT_IMULLIT;
		  instructionsetorder[28]:= patMOD2_MOD2;
		  instructionsetorder[29]:= patMOD4_MOD4;
		  instructionsetorder[30]:= patMOD8_MOD8;
		  instructionsetorder[31]:= patMOD16_MOD16;
		  instructionsetorder[32]:= patIMOD_IMOD;
		  instructionsetorder[33]:= patUMOD_UMOD;
		  instructionsetorder[34]:= patINTABS_INTABS;
		  instructionsetorder[35]:= patNegate_N;
		  instructionsetorder[36]:= patNOTOP_NOTOP;
		  instructionsetorder[37]:= patMNegate_MN;
		  instructionsetorder[38]:= patBTS_BTS;
		  instructionsetorder[39]:= patUINT8MAX_UINT8MAX;
		  instructionsetorder[40]:= patUINT8MIN_UINT8MIN;
		  instructionsetorder[41]:= patINT8MAX_INT8MAX;
		  instructionsetorder[42]:= patINT8MIN_INT8MIN;
		  instructionsetorder[43]:= patSELECT_SELECT;
		  instructionsetorder[44]:= patPLANT_PLANT;
		  instructionsetorder[45]:= patLITPUSH_LITPUSH;
		  instructionsetorder[46]:= patMEMPUSH_MEMPUSH;
		  instructionsetorder[47]:= patSETUB_SETUB;
		  instructionsetorder[48]:= patSETUW_SETUW;
		  instructionsetorder[49]:= patSETB_SETB;
		  instructionsetorder[50]:= patSETW_SETW;
		  instructionsetorder[51]:= patSET_SET;
		  instructionsetorder[52]:= patSETU_SETU;
		  instructionsetorder[53]:= patIFASS_IFASS;
		  instructionsetorder[54]:= patSETeq_SET;
		  instructionsetorder[55]:= patRMR_RMR;
		  instructionsetorder[56]:= patIFLITGOTO_IFLITGOTO;
		  instructionsetorder[57]:= patIFULITGOTO_IFULITGOTO;
		  instructionsetorder[58]:= patBIFLITGOTO_BIFLITGOTO;
		  instructionsetorder[59]:= patIFIN_IFIN;
		  instructionsetorder[60]:= patIFGOTO_IFGOTO;
		  instructionsetorder[61]:= patIFUGOTO_IFUGOTO;
		  instructionsetorder[62]:= patBIMUL_BIMUL;
		  instructionsetorder[63]:= patRLIT_RLIT;
		  instructionsetorder[64]:= patLEA_LEA;
		  instructionsetorder[65]:= patRRM_RRM;
		  instructionsetorder[66]:= patfastIMUL_IMUL;
		  instructionsetorder[67]:= patRMRB_RMRB;
		  instructionsetorder[68]:= patRRD_RRD;
		  instructionsetorder[69]:= patRR_RR;
		  instructionsetorder[70]:= patDIV8_DIV8;
		  instructionsetorder[71]:= patIDIV_IDIV;
		  instructionsetorder[72]:= patfastBIDIV_BIDIV;
		  instructionsetorder[73]:= patBIDIV_BIDIV;
		  instructionsetorder[74]:= patUDIV_UDIV;
		  instructionsetorder[75]:= patCDQ_CDQ;
		  instructionsetorder[76]:= patRIDIV_RIDIV;
		  instructionsetorder[77]:= patSIDIV_SIDIV;
		  instructionsetorder[78]:= patIFGOTOB_IFGOTOB;
		  instructionsetorder[79]:= patIFGOTOW_IFGOTOW;
		  instructionsetorder[80]:= patGOTO_GOTO;
		  instructionsetorder[81]:= patFAIL_FAIL;
		  instructionsetorder[82]:= patBOUND4_BOUND4;
		  instructionsetorder[83]:= patBOUND0_BOUND0;
		  instructionsetorder[84]:= patBOUND16_BOUND16;
		  instructionsetorder[85]:= patBOUNDC_BOUNDC;
		  instructionsetorder[86]:= patREPMOVSB_REPMOVSB;
		  instructionsetorder[87]:= patREPMOVSD_REPMOVSD;
		  instructionsetorder[88]:= patADDUSB_ADDUSB;
		  instructionsetorder[89]:= patSUBUSB_SUBUSB;
		  instructionsetorder[90]:= patADDSSB_ADDSSB;
		  instructionsetorder[91]:= patSUBSSB_SUBSSB;
		  instructionsetorder[92]:= patMULTSSB_MULTSSB;
		  instructionsetorder[93]:= patMULTSSBAL_MULTSSBAL;
		  instructionsetorder[94]:= patSTOREWR_STOREWR;
		  instructionsetorder[95]:= patSTORER_STORER;
		  instructionsetorder[96]:= patSTOREBR_STOREBR;
		  instructionsetorder[97]:= patRPUSH_RPUSH;
		  instructionsetorder[98]:= patREFPUSH_REFPUSH;
		  instructionsetorder[99]:= patRPUSH_RPUSH;
		  instructionsetorder[100]:= patSDEREF_SDEREF;
		  instructionsetorder[101]:= patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD;
		  instructionsetorder[102]:= patIFBOOL_IFBOOL;
		  instructionsetorder[103]:= patSMLIT_SMLIT;
		  instructionsetorder[104]:= patSMRP_SMRP;
		  instructionsetorder[105]:= patSADD_SADD;
		  instructionsetorder[106]:= patSMULIT_SMULIT;
		  instructionsetorder[107]:= patSMRADD_SMRADD;
		  instructionsetorder[108]:= patSOP_SOP;
		  instructionsetorder[109]:= patSMR_SMR;
		  instructionsetorder[110]:= patBSMR_BSMR;
		  instructionsetorder[111]:= patSTACKLOAD_STACKLOAD;
		  instructionsetorder[112]:= patREFPOP_REFPOP;
		  instructionsetorder[113]:= patMEMPOP_MEMPOP;
		  instructionsetorder[114]:= patBPOP_BPOP;
		  instructionsetorder[115]:= patBSPOP_BSPOP;
		  instructionsetorder[116]:= patBSPUSH_BSPUSH;
		  instructionsetorder[117]:= patDMEMPUSH_DMEMPUSH;
		  instructionsetorder[118]:= patRPUSHE_RPUSHE;
		  instructionsetorder[119]:= patIMOD_IMOD;
		  instructionsetorder[120]:= patUMOD_UMOD;
		  instructionsetorder[121]:= patBPUSH_BPUSH;
		  instructionsetorder[122]:= patSTACKSTORE_STACKSTORE;
		  instructionsetorder[123]:= patSTACKWSTORE_STACKWSTORE;
		  instructionsetorder[124]:= patSTACKBSTORE_STACKBSTORE;
		  instructionsetorder[125]:= patRPOP_RPOP;
		  instructionsetorder[126]:= patToBYTE_TBYTE;
		  instructionsetorder[127]:= patSMRSHIFT_SMRSHIFT;
		  instructionsetorder[128]:= patWPOP_WPOP;
		  instructionsetorder[129]:= patPOPEADXu_POPEADX;
		  instructionsetorder[130]:= patPADDD_PADDD;
		  instructionsetorder[131]:= patPADDW_PADDW;
		  instructionsetorder[132]:= patPADDB_PADDB;
		  instructionsetorder[133]:= patPADDSB_PADDSB;
		  instructionsetorder[134]:= patPADDSB3_PADDSB3;
		  instructionsetorder[135]:= patPADDUSB_PADDUSB;
		  instructionsetorder[136]:= patPADDUB_PADDUB;
		  instructionsetorder[137]:= patSPADDSB_SPADDSB;
		  instructionsetorder[138]:= patSPADDUSB_SPADDUSB;
		  instructionsetorder[139]:= patSPADDUB_SPADDUB;
		  instructionsetorder[140]:= patPACKSSDW_PACKSSDW;
		  instructionsetorder[141]:= patPACKSSWB_PACKSSWB;
		  instructionsetorder[142]:= patPACKUSWB_PACKUSWB;
		  instructionsetorder[143]:= patCMPPB_CMPPB;
		  instructionsetorder[144]:= patCMPPBR_CMPPBR;
		  instructionsetorder[145]:= patCMPPD_CMPPD;
		  instructionsetorder[146]:= patCMPPDR_CMPPDR;
		  instructionsetorder[147]:= patCMPPW_CMPPW;
		  instructionsetorder[148]:= patCMPPWR_CMPPWR;
		  instructionsetorder[149]:= patSPSUBD_SPSUBD;
		  instructionsetorder[150]:= patPSUBW_PSUBW;
		  instructionsetorder[151]:= patPSUBB_PSUBB;
		  instructionsetorder[152]:= patPSUBSB_PSUBSB;
		  instructionsetorder[153]:= patPSUBUSB_PSUBUSB;
		  instructionsetorder[154]:= patPSUBUB_PSUBUB;
		  instructionsetorder[155]:= patPOR_POR;
		  instructionsetorder[156]:= patPAND_PAND;
		  instructionsetorder[157]:= patPANDN_PANDN;
		  instructionsetorder[158]:= patPMULLSSB_PMULLSSB;
		  instructionsetorder[159]:= patPMULLW_PMULLW;
		  instructionsetorder[160]:= patMOVDS_MOVDS;
		  instructionsetorder[161]:= patMOVDL_MOVDL;
		  instructionsetorder[162]:= patMOVQS_MOVQS;
		  instructionsetorder[163]:= patMOVQL_MOVQL;
		  instructionsetorder[164]:= patMOVQLR_MOVQLR;
		  instructionsetorder[165]:= patMOVOCTUINTS_MOVOCTUINTS;
		  instructionsetorder[166]:= patMOVOCTUINTL_MOVOCTUINTL;
		  instructionsetorder[167]:= patREP2_REP2;
		  instructionsetorder[168]:= patREP4_REP4;
		  instructionsetorder[169]:= patREP8_REP8;
		  instructionsetorder[170]:= patMMXPUSH_MMXPUSH;
		  instructionsetorder[171]:= patMOVQR_MOVQR;
		  instructionsetorder[172]:= patADDSS_ADDSS;
		  instructionsetorder[173]:= patCVTSI2SD_CVTSI2SD;
		  instructionsetorder[174]:= patCVTSI2SS_CVTSI2SS;
		  instructionsetorder[175]:= patCVTSD2SI_CVTSD2SI;
		  instructionsetorder[176]:= patCVTIR2SS_CVTIR2SS;
		  instructionsetorder[177]:= patXRLOADLIT_XRLOADLIT;
		  instructionsetorder[178]:= patXRDLOADLIT_XRDLOADLIT;
		  instructionsetorder[179]:= patFREP4_FREP4;
		  instructionsetorder[180]:= patSSQRT_SSQRT;
		  instructionsetorder[181]:= patSDSQRT_SDSQRT;
		  instructionsetorder[182]:= patOPSS_OPSS;
		  instructionsetorder[183]:= patOPSD_OPSD;
		  instructionsetorder[184]:= patOPPI32_OPPI32;
		  instructionsetorder[185]:= patOPPI32m_OPPI32;
		  instructionsetorder[186]:= patXPANDN_XPANDN;
		  instructionsetorder[187]:= patOPPS_OPPS;
		  instructionsetorder[188]:= patOPPD_OPPD;
		  instructionsetorder[189]:= patCOMISSIFGOTO_COMISSIFGOTO;
		  instructionsetorder[190]:= patCOMISS_COMISS;
		  instructionsetorder[191]:= patOPPI8_OPPI8;
		  instructionsetorder[192]:= patOPPI8m_OPPI8;
		  instructionsetorder[193]:= patOPPI8muc_OPPI8;
		  instructionsetorder[194]:= patOPPI8msc_OPPI8;
		  instructionsetorder[195]:= patOPPI16_OPPI16;
		  instructionsetorder[196]:= patOPPI16m_OPPI16;
		  instructionsetorder[197]:= patOPPI16muc_OPPI16;
		  instructionsetorder[198]:= patOPPI16msc_OPPI16;
		  instructionsetorder[199]:= patSTORUPS_STORUPS;
		  instructionsetorder[200]:= patSTORUPI16_STORUPI16;
		  instructionsetorder[201]:= patSTORUPI32_STORUPI32;
		  instructionsetorder[202]:= patSTORUPD_STORUPD;
		  instructionsetorder[203]:= patSTORESS_STORESS;
		  instructionsetorder[204]:= patSTORESD_STORESD;
		  instructionsetorder[205]:= patMOVUPD_MOVUPD;
		  instructionsetorder[206]:= patMOVSS_MOVSS;
		  instructionsetorder[207]:= patMOVSDl_MOVSD;
		  instructionsetorder[208]:= patMOVSD_MOVSD;
		  instructionsetorder[209]:= patMOVUPS_MOVUPS;
		  instructionsetorder[210]:= patMOVAPS_MOVAPS;
		  instructionsetorder[211]:= patMOVUPD_MOVUPD;
		  instructionsetorder[212]:= patMOVUPI16_MOVUPI16;
		  instructionsetorder[213]:= patMOVUPI32_MOVUPI32;
		  instructionsetorder[214]:= patSSRPOPI_SSRPOPI;
		  instructionsetorder[215]:= patSSRPOP_SSRPOP;
		  instructionsetorder[216]:= patXCMPPD_XCMPPD;
		  instructionsetorder[217]:= patXCMPPDR_XCMPPDR;
		  instructionsetorder[218]:= patCMPPS_CMPPS;
		  instructionsetorder[219]:= patMINp6_MIN6;
		  instructionsetorder[220]:= patMAXp6_MAX6;
		  instructionsetorder[221]:= patIFASSp6_IFASS6;
		  instructionsetorder[222]:= patFMINp6_FMIN6;
		  instructionsetorder[223]:= patFMAXp6_FMAX6;
		  instructionsetorder[224]:= patp6FIFGOTO_6FIFGOTO;
		  instructionsetorder[225]:= patFCHS_FCHS;
		  instructionsetorder[226]:= patFOPF_FOPF;
		  instructionsetorder[227]:= patFLOADLIT_FLOADLIT;
		  instructionsetorder[228]:= patFILOADLIT_FILOADLIT;
		  instructionsetorder[229]:= patFMAX_FMAX;
		  instructionsetorder[230]:= patFMIN_FMIN;
		  instructionsetorder[231]:= patFLD_FLD;
		  instructionsetorder[232]:= patFLDF_FLDF;
		  instructionsetorder[233]:= patFILDF_FILDF;
		  instructionsetorder[234]:= patFILD_FILD;
		  instructionsetorder[235]:= patFLOADDLIT_FLOADDLIT;
		  instructionsetorder[236]:= patFILDB_FILDB;
		  instructionsetorder[237]:= patReversePolishFOP_RPFOP;
		  instructionsetorder[238]:= patFMOP_FMOP;
		  instructionsetorder[239]:= patFPREM_FPREM;
		  instructionsetorder[240]:= patFOP_FOP;
		  instructionsetorder[241]:= patFOPI_FOPI;
		  instructionsetorder[242]:= patFOPII_FOPII;
		  instructionsetorder[243]:= patFPOPMSI64_FPOPMSI64;
		  instructionsetorder[244]:= patRMULTB_RMULTB;
		  instructionsetorder[245]:= patFISTR_FISTR;
		  instructionsetorder[246]:= patFSTR_FSTR;
		  instructionsetorder[247]:= patFSTRF_FSTRF;
		  instructionsetorder[248]:= patFILDIP_FILDIP;
		  instructionsetorder[249]:= patEXTENDMS_EXTENDMS;
		  instructionsetorder[250]:= patEXTENDANY_EXTENDANY;
		  instructionsetorder[251]:= patFIFGOTO_FIFGOTO;
		  instructionsetorder[252]:= patFIFGOTOgeneral_FIFGOTO;
		  instructionsetorder[253]:= patFSET_FSET;
		  instructionsetorder[254]:= patDPOPMS_DPOPMS;
		  instructionsetorder[255]:= patFLOATLDR_FLOATLDR;
		  instructionsetorder[256]:= patFLOATMS_FLOATMS;
		  instructionsetorder[257]:= patFPOPMS_FPOPMS;
		  instructionsetorder[258]:= patFILDR_FILDR;
		  instructionsetorder[259]:= patFISTB_FISTB;
		  instructionsetorder[260]:= patFPREMu_FPREM;
		  instructionsetorder[261]:= patFPUSHI_FPUSHI;
		  instructionsetorder[262]:= patFPUSHD_FPUSHD;
		  instructionsetorder[263]:= patFPUSHF_FPUSHF;
		  instructionsetorder[264]:= patSTOREAXDu_STOREAXD;
		  instructionsetorder[265]:= patSSRPUSH_SSRPUSH;
		  instructionsetorder[266]:= patMOVDl_MOVD;
		  instructionsetorder[267]:= patMOVDs_MOVD;
		  instructionsetorder[268]:= patRPUSH_RPUSH;
		  instructionsetorder[269]:= patRPOP_RPOP;
		{ generated by Ilcp }
		fp:=regEBP_EBPcode;registers[fp].permanentlyreserved:=true;
sp:=regESP_ESPcode;registers[sp].permanentlyreserved:=true;
		{ initialises the flags declared in the cpu description }
		flags[realLitSupported]:= 0;
			lastalt:=415;
		end.

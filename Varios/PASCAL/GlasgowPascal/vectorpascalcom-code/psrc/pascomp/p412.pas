{ file P412.pas part of codegen P4}
VAR
	i:integer;
	patoplen_:ppattern;
	patEADX_EADX:ppattern;
	patEAX_EAX:ppattern;
	patEDX_EDX:ppattern;
	patEADXu_EADX:ppattern;
	patECX_ECX:ppattern;
	patEBX_EBX:ppattern;
	patEBP_EBP:ppattern;
	patESP_ESP:ppattern;
	patESI_ESI:ppattern;
	patEDI_EDI:ppattern;
	patuax_:ppattern;
	patucx_:ppattern;
	patubx_:ppattern;
	patusi_:ppattern;
	patudi_:ppattern;
	patudx_:ppattern;
	patAL_AL:ppattern;
	patBL_BL:ppattern;
	patCL_CL:ppattern;
	patDL_DL:ppattern;
	patiBH_BH:ppattern;
	patiCH_CH:ppattern;
	patiDH_DH:ppattern;
	patBH_BH:ppattern;
	patCH_CH:ppattern;
	patDH_DH:ppattern;
	patuAL_AL:ppattern;
	patuBL_BL:ppattern;
	patuCL_CL:ppattern;
	patuDL_DL:ppattern;
	patoAL_AL:ppattern;
	patoBL_BL:ppattern;
	patoCL_CL:ppattern;
	patoDL_DL:ppattern;
	patAX_AX:ppattern;
	patBX_BX:ppattern;
	patDX_DX:ppattern;
	patCX_CX:ppattern;
	patuAX_AX:ppattern;
	patuBX_BX:ppattern;
	patuDX_DX:ppattern;
	patuCX_CX:ppattern;
	patSI_SI:ppattern;
	patDI_DI:ppattern;
	patregutil0_0:ppattern;
	patregutil1_1:ppattern;
	patrui0_0:ppattern;
	patrui1_1:ppattern;
	patrug_:ppattern;
	patrui_:ppattern;
	patru_:ppattern;
	patmainSTACK_STACK:ppattern;
	patindexreg_:ppattern;
	pataccumulators_:ppattern;
	patireg_:ppattern;
	patureg_:ppattern;
	patreg_:ppattern;
	patbireg_:ppattern;
	patbureg_:ppattern;
	patboreg_:ppattern;
	patbacc_:ppattern;
	patbnonacc_:ppattern;
	patbreg_:ppattern;
	patswreg_:ppattern;
	patuwreg_:ppattern;
	patuntypedwreg_:ppattern;
	patwreg_:ppattern;
	patpushreg_:ppattern;
	patdpushreg_:ppattern;
	patanyreg_:ppattern;
	patsignedreg_:ppattern;
	patunsignedreg_:ppattern;
	patacc_:ppattern;
	patqacc_:ppattern;
	patdacc_:ppattern;
	patwacc_:ppattern;
	patebxacc_:ppattern;
	patebxbacc_:ppattern;
	patecxacc_:ppattern;
	patecxbacc_:ppattern;
	patecxuacc_:ppattern;
	patmodreg_:ppattern;
	patsourcereg_:ppattern;
	patdestreg_:ppattern;
	patcountreg_:ppattern;
	pateadxu_:ppattern;
	patshiftcountreg_:ppattern;
	patadd_:ppattern;
	patand_:ppattern;
	pator_:ppattern;
	patxor_:ppattern;
	patsub_:ppattern;
	patmul_:ppattern;
	patimul_:ppattern;
	patbel_:ppattern;
	patlt_:ppattern;
	patab_:ppattern;
	patgt_:ppattern;
	pateq_:ppattern;
	patbe_:ppattern;
	patle_:ppattern;
	patae_:ppattern;
	patge_:ppattern;
	patne_:ppattern;
	patshiftleft_:ppattern;
	patshiftright_:ppattern;
	patcondition_:ppattern;
	patequals_:ppattern;
	pateqcondition_:ppattern;
	patunsignedcondition_:ppattern;
	patoperator_:ppattern;
	patlogoperator_:ppattern;
	patnonmultoperator_:ppattern;
	patsaddoperator_:ppattern;
	patshiftop_:ppattern;
	patunsigned_:ppattern;
	patsigned_:ppattern;
	patint_:ppattern;
	patdouble_:ppattern;
	patfloat_:ppattern;
	patreal_:ppattern;
	patbyte_:ppattern;
	patword32_32:ppattern;
	patword16_16:ppattern;
	patwordupto32_32:ppattern;
	patdataformat_:ppattern;
	patlongint_:ppattern;
	pathiint_:ppattern;
	pattwo_:ppattern;
	patfour_:ppattern;
	pateight_:ppattern;
	patinteger64_64:ppattern;
	patscale_:ppattern;
	patlabelf_:ppattern;
	patsconst_:ppattern;
	patlconstf_:ppattern;
	patlabelconstf_:ppattern;
	patconstf_:ppattern;
	patoffset_:ppattern;
	patregindirf_:ppattern;
	patsimplescaled_:ppattern;
	patnegcompscaled_:ppattern;
	patcompscaled_:ppattern;
	patscaled_:ppattern;
	patbaseminusoffsetf_:ppattern;
	patbaseplusoffsetf_:ppattern;
	patscaledIndexPlusOffsetf_IPO:ppattern;
	patbasePlusScaledIndexf_PSI:ppattern;
	patbasePlusScaledIndexPlusOffsetf_PSIPO:ppattern;
	patbasePlusIndexPlusOffsetf_PIPO:ppattern;
	patbasePlusIndexf_PI:ppattern;
	patdirectf_:ppattern;
	patudirectf_:ppattern;
	patriscaddr_:ppattern;
	patuncasteaform_:ppattern;
	pateaform_:ppattern;
	pataddrform_:ppattern;
	patmaddrmode_:ppattern;
	patmemrisc_:ppattern;
	patgmaddrmode_:ppattern;
	patimmediate_:ppattern;
	patintimmediate_:ppattern;
	patuimmediate_:ppattern;
	patjumpmode_:ppattern;
	pataddrmode_:ppattern;
	patuwaddrmode_:ppattern;
	patuaddrmode_:ppattern;
	patbaddrmode_:ppattern;
	patwaddrmode_:ppattern;
	patwmemdummy_:ppattern;
	patregshift_:ppattern;
	patshiftcount_:ppattern;
	patregaddrop_:ppattern;
	patuwregaddrop_:ppattern;
	patregaddrimmediate_:ppattern;
	patuwregaddrimmediate_:ppattern;
	patSTACKSTORE_STACKSTORE:ppattern;
	patSTACKWSTORE_STACKWSTORE:ppattern;
	patSTACKBSTORE_STACKBSTORE:ppattern;
	patSMLIT_SMLIT:ppattern;
	patSMULIT_SMULIT:ppattern;
	patSADD_SADD:ppattern;
	patSOP_SOP:ppattern;
	patSMR_SMR:ppattern;
	patSMRSHIFT_SMRSHIFT:ppattern;
	patBSMR_BSMR:ppattern;
	patSMRADD_SMRADD:ppattern;
	patSMRP_SMRP:ppattern;
	patRPUSH_RPUSH:ppattern;
	patRPUSHE_RPUSHE:ppattern;
	patPOPEADXu_POPEADX:ppattern;
	patSTOREAXDu_STOREAXD:ppattern;
	patRPOP_RPOP:ppattern;
	patBPUSH_BPUSH:ppattern;
	patBSPUSH_BSPUSH:ppattern;
	patBSPOP_BSPOP:ppattern;
	patBPOP_BPOP:ppattern;
	patREFPOP_REFPOP:ppattern;
	patWPOP_WPOP:ppattern;
	patMEMPOP_MEMPOP:ppattern;
	patLITPUSH_LITPUSH:ppattern;
	patMEMPUSH_MEMPUSH:ppattern;
	patDMEMPUSH_DMEMPUSH:ppattern;
	patSTACKLOAD_STACKLOAD:ppattern;
	patREFPUSH_REFPUSH:ppattern;
	patSDEREF_SDEREF:ppattern;
	patSDEREFDOUBLEWORD_SDEREFDOUBLEWORD:ppattern;
	patSELECT_SELECT:ppattern;
	patLOAD_LOAD:ppattern;
	patLOADW_LOADW:ppattern;
	patLOADB_LOADB:ppattern;
	patMOVZXB_MOVZXB:ppattern;
	patMOVZXB2_MOVZXB2:ppattern;
	patMOVSXB_MOVSXB:ppattern;
	patMOVZXBW_MOVZXBW:ppattern;
	patMOVSXBW_MOVSXBW:ppattern;
	patMOVZXW_MOVZXW:ppattern;
	patMOVSXW_MOVSXW:ppattern;
	patToBYTE_TBYTE:ppattern;
	patSTOREBR_STOREBR:ppattern;
	patSTORER_STORER:ppattern;
	patSTOREWR_STOREWR:ppattern;
	patNULMOV_NULMOV:ppattern;
	patSTORELIT_STORELIT:ppattern;
	patCLEARREG_CLEARREG:ppattern;
	patRMLIT_RMLIT:ppattern;
	patMLIT_MLIT:ppattern;
	patINC_INC:ppattern;
	patDEC_DEC:ppattern;
	patSHIFT_SHIFT:ppattern;
	patRMR_RMR:ppattern;
	patADDRMR_ADDRMR:ppattern;
	patRMRB_RMRB:ppattern;
	patnulbass_:ppattern;
	patADDUSB_ADDUSB:ppattern;
	patSUBUSB_SUBUSB:ppattern;
	patADDSSB_ADDSSB:ppattern;
	patMULTSSB_MULTSSB:ppattern;
	patMULTSSBAL_MULTSSBAL:ppattern;
	patSUBSSB_SUBSSB:ppattern;
	patUINT8MAX_UINT8MAX:ppattern;
	patINTMAX_INTMAX:ppattern;
	patINTABS_INTABS:ppattern;
	patUINT8MIN_UINT8MIN:ppattern;
	patINT8MAX_INT8MAX:ppattern;
	patINT8MIN_INT8MIN:ppattern;
	patLEA_LEA:ppattern;
	patNOTOP_NOTOP:ppattern;
	patNegate_N:ppattern;
	patMNegate_MN:ppattern;
	patRLIT_RLIT:ppattern;
	patRRD_RRD:ppattern;
	patRR_RR:ppattern;
	patRRPLUS_RRPLUS:ppattern;
	patRRM_RRM:ppattern;
	patbnonacreg_:ppattern;
	patbaccreg_:ppattern;
	patbaccregmode_:ppattern;
	patbnonacregmode_:ppattern;
	patfastBIDIV_BIDIV:ppattern;
	patBIDIV_BIDIV:ppattern;
	patBIMUL_BIMUL:ppattern;
	patfastIMUL_IMUL:ppattern;
	patCDQ_CDQ:ppattern;
	patIDIV_IDIV:ppattern;
	patRIDIV_RIDIV:ppattern;
	patSIDIV_SIDIV:ppattern;
	patUDIV_UDIV:ppattern;
	patIMULLIT_IMULLIT:ppattern;
	patIMOD_IMOD:ppattern;
	patUMOD_UMOD:ppattern;
	patBIMOD_BIMOD:ppattern;
	patMOD2_MOD2:ppattern;
	patMOD4_MOD4:ppattern;
	patMOD8_MOD8:ppattern;
	patDIV8_DIV8:ppattern;
	patMOD16_MOD16:ppattern;
	patPLANT_PLANT:ppattern;
	patPLANTRCONST_PLANTRCONST:ppattern;
	patPLANTICONST_PLANTICONST:ppattern;
	patPLANTSCONST_PLANTSCONST:ppattern;
	patPLANTBCONST_PLANTBCONST:ppattern;
	patPLANTWCONST_PLANTWCONST:ppattern;
	patFAIL_FAIL:ppattern;
	patGOTO_GOTO:ppattern;
	patIFLITGOTO_IFLITGOTO:ppattern;
	patIFULITGOTO_IFULITGOTO:ppattern;
	patBIFLITGOTO_BIFLITGOTO:ppattern;
	patIFGOTOB_IFGOTOB:ppattern;
	patIFGOTOW_IFGOTOW:ppattern;
	patIFGOTO_IFGOTO:ppattern;
	patIFUGOTO_IFUGOTO:ppattern;
	patIFASSp6_IFASS6:ppattern;
	patIFASS_IFASS:ppattern;
	patSET_SET:ppattern;
	patSETU_SETU:ppattern;
	patSETW_SETW:ppattern;
	patSETUW_SETUW:ppattern;
	patSETB_SETB:ppattern;
	patSETUB_SETUB:ppattern;
	patSETeq_SET:ppattern;
	patIFBOOL_IFBOOL:ppattern;
	patBOUNDC_BOUNDC:ppattern;
	patBOUND0_BOUND0:ppattern;
	patBOUND4_BOUND4:ppattern;
	patBOUND16_BOUND16:ppattern;
	patIFIN_IFIN:ppattern;
	patTESTIN_TESTIN:ppattern;
	patBTS_BTS:ppattern;
	patREPMOVSD_REPMOVSD:ppattern;
	patREPMOVSB_REPMOVSB:ppattern;
	patST_ST:ppattern;
	patanyreal_:ppattern;
	patfputype_:ppattern;
	patfpuint_:ppattern;
	patfdiv_:ppattern;
	patfrem_:ppattern;
	patfoperator_:ppattern;
	patfround_:ppattern;
	patfsqrt_:ppattern;
	patfsin_:ppattern;
	patfcos_:ppattern;
	patfextend_:ppattern;
	patfln_:ppattern;
	patfptan_:ppattern;
	patfabs_:ppattern;
	patfmoperator_:ppattern;
	patRDIVB_RDIVB:ppattern;
	patRMULTB_RMULTB:ppattern;
	patFISTB_FISTB:ppattern;
	patFILDB_FILDB:ppattern;
	patFILDR_FILDR:ppattern;
	patFSTR_FSTR:ppattern;
	patFSTRF_FSTRF:ppattern;
	patFLOATMS_FLOATMS:ppattern;
	patEXTENDMS_EXTENDMS:ppattern;
	patEXTENDANY_EXTENDANY:ppattern;
	patFPOPMS_FPOPMS:ppattern;
	patFPOPMSI64_FPOPMSI64:ppattern;
	patDPOPMS_DPOPMS:ppattern;
	patFPUSHD_FPUSHD:ppattern;
	patFPUSHF_FPUSHF:ppattern;
	patFISTR_FISTR:ppattern;
	patFPUSHI_FPUSHI:ppattern;
	patFLD_FLD:ppattern;
	patFLDF_FLDF:ppattern;
	patFILD_FILD:ppattern;
	patFILDF_FILDF:ppattern;
	patFLOATLDR_FLOATLDR:ppattern;
	patFILDIP_FILDIP:ppattern;
	patflt_:ppattern;
	patfgt_:ppattern;
	patfeq_:ppattern;
	patfle_:ppattern;
	patfge_:ppattern;
	patfne_:ppattern;
	patfcondition_:ppattern;
	patfpuval_:ppattern;
	patp6FIFGOTO_6FIFGOTO:ppattern;
	patFIFGOTO_FIFGOTO:ppattern;
	patFIFGOTOgeneral_FIFGOTO:ppattern;
	patFSET_FSET:ppattern;
	patFMOP_FMOP:ppattern;
	patFCHS_FCHS:ppattern;
	patFLOADLIT_FLOADLIT:ppattern;
	patFLOADDLIT_FLOADDLIT:ppattern;
	patFILOADLIT_FILOADLIT:ppattern;
	patFOP_FOP:ppattern;
	patFOPF_FOPF:ppattern;
	patFOPI_FOPI:ppattern;
	patFOPII_FOPII:ppattern;
	patReversePolishFOP_RPFOP:ppattern;
	patFMAXp6_FMAX6:ppattern;
	patMAXp6_MAX6:ppattern;
	patMINp6_MIN6:ppattern;
	patFMINp6_FMIN6:ppattern;
	patFMAX_FMAX:ppattern;
	patFMIN_FMIN:ppattern;
	patFPREM_FPREM:ppattern;
	patFPREMu_FPREM:ppattern;
	patMM0_MM0:ppattern;
	patMM1_MM1:ppattern;
	patMM2_MM2:ppattern;
	patMM3_MM3:ppattern;
	patMM4_MM4:ppattern;
	patMM1U_MM1U:ppattern;
	patMM1I_MM1I:ppattern;
	patMM7_MM7:ppattern;
	patMM5_MM5:ppattern;
	patMM6_MM6:ppattern;
	patMM0L_MM0L:ppattern;
	patMM1L_MM1L:ppattern;
	patMM2L_MM2L:ppattern;
	patMM3L_MM3L:ppattern;
	patMM4L_MM4L:ppattern;
	patMM1LU_MM1LU:ppattern;
	patMM1LI_MM1LI:ppattern;
	patMM5L_MM5L:ppattern;
	patMM016_MM016:ppattern;
	patMM116_MM116:ppattern;
	patMM216_MM216:ppattern;
	patMM316_MM316:ppattern;
	patMM416_MM416:ppattern;
	patMM516_MM516:ppattern;
	patMM032_MM032:ppattern;
	patMM132_MM132:ppattern;
	patMM232_MM232:ppattern;
	patMM332_MM332:ppattern;
	patMM432_MM432:ppattern;
	patMM532_MM532:ppattern;
	patMM08_MM08:ppattern;
	patMM18_MM18:ppattern;
	patMM28_MM28:ppattern;
	patMM38_MM38:ppattern;
	patMM48_MM48:ppattern;
	patMM58_MM58:ppattern;
	patim8reg_8:ppattern;
	patim2reg_2:ppattern;
	patim4reg_4:ppattern;
	patuntypedmreg_:ppattern;
	patlmreg_:ppattern;
	patumreg_:ppattern;
	patiMreg_M:ppattern;
	patilmreg_:ppattern;
	patulmreg_:ppattern;
	patwmreg_:ppattern;
	patmreg_:ppattern;
	patmrmaddrmode_:ppattern;
	patPMULLW_PMULLW:ppattern;
	patPMULLSSB_PMULLSSB:ppattern;
	patMMXPUSH_MMXPUSH:ppattern;
	patMMXPOP_MMXPOP:ppattern;
	patPADDD_PADDD:ppattern;
	patPADDW_PADDW:ppattern;
	patPADDB_PADDB:ppattern;
	patmeq_:ppattern;
	patmgt_:ppattern;
	patmcondition_:ppattern;
	patCMPPB_CMPPB:ppattern;
	patCMPPBR_CMPPBR:ppattern;
	patCMPPW_CMPPW:ppattern;
	patCMPPWR_CMPPWR:ppattern;
	patCMPPD_CMPPD:ppattern;
	patCMPPDR_CMPPDR:ppattern;
	patPADDUB_PADDUB:ppattern;
	patPADDSB_PADDSB:ppattern;
	patPADDSB3_PADDSB3:ppattern;
	patPADDUSB_PADDUSB:ppattern;
	patSPADDUSB_SPADDUSB:ppattern;
	patSPADDUB_SPADDUB:ppattern;
	patSPADDSB_SPADDSB:ppattern;
	patSPSUBD_SPSUBD:ppattern;
	patPSUBW_PSUBW:ppattern;
	patPSUBB_PSUBB:ppattern;
	patPSUBUB_PSUBUB:ppattern;
	patPSUBSB_PSUBSB:ppattern;
	patPSUBUSB_PSUBUSB:ppattern;
	patPAND_PAND:ppattern;
	patPANDN_PANDN:ppattern;
	patPOR_POR:ppattern;
	patMOVDS_MOVDS:ppattern;
	patMOVDL_MOVDL:ppattern;
	patMOVOCTUINTL_MOVOCTUINTL:ppattern;
	patMOVQS_MOVQS:ppattern;
	patMOVQR_MOVQR:ppattern;
	patMOVOCTUINTS_MOVOCTUINTS:ppattern;
	patMOVQL_MOVQL:ppattern;
	patMOVQLR_MOVQLR:ppattern;
	patREP2_REP2:ppattern;
	patREP4_REP4:ppattern;
	patREP8_REP8:ppattern;
	patPACKSSDW_PACKSSDW:ppattern;
	patPACKSSWB_PACKSSWB:ppattern;
	patPACKUSWB_PACKUSWB:ppattern;
	patXMM0_XMM0:ppattern;
	patXMM00_XMM00:ppattern;
	patXMM0R64_XMM0R64:ppattern;
	patXMM0R324_XMM0R324:ppattern;
	patXMM0R642_XMM0R642:ppattern;
	patXMM1_XMM1:ppattern;
	patXMM10_XMM10:ppattern;
	patXMM1R64_XMM1R64:ppattern;
	patXMM1R324_XMM1R324:ppattern;
	patXMM1R642_XMM1R642:ppattern;
	patXMM2_XMM2:ppattern;
	patXMM20_XMM20:ppattern;
	patXMM2R64_XMM2R64:ppattern;
	patXMM2R324_XMM2R324:ppattern;
	patXMM2R642_XMM2R642:ppattern;
	patXMM3_XMM3:ppattern;
	patXMM30_XMM30:ppattern;
	patXMM3R64_XMM3R64:ppattern;
	patXMM3R324_XMM3R324:ppattern;
	patXMM3R642_XMM3R642:ppattern;
	patXMM4_XMM4:ppattern;
	patXMM40_XMM40:ppattern;
	patXMM4R64_XMM4R64:ppattern;
	patXMM5_XMM5:ppattern;
	patXMM50_XMM50:ppattern;
	patXMM5R64_XMM5R64:ppattern;
	patXMM6_XMM6:ppattern;
	patXMM60_XMM60:ppattern;
	patXMM6R64_XMM6R64:ppattern;
	patXMM7_XMM7:ppattern;
	patXMM70_XMM70:ppattern;
	patXMM7R64_XMM7R64:ppattern;
	patXMM0I324_XMM0I324:ppattern;
	patXMM1I324_XMM1I324:ppattern;
	patXMM2I324_XMM2I324:ppattern;
	patXMM3I324_XMM3I324:ppattern;
	patiXMM00_XMM00:ppattern;
	patiXMM10_XMM10:ppattern;
	patiXMM20_XMM20:ppattern;
	patiXMM30_XMM30:ppattern;
	patiXMM40_XMM40:ppattern;
	patiXMM50_XMM50:ppattern;
	patiXMM60_XMM60:ppattern;
	patiXMM70_XMM70:ppattern;
	patiMM00_MM00:ppattern;
	patiMM10_MM10:ppattern;
	patiMM20_MM20:ppattern;
	patiMM30_MM30:ppattern;
	patiMM40_MM40:ppattern;
	patiMM50_MM50:ppattern;
	patiMM60_MM60:ppattern;
	patiMM70_MM70:ppattern;
	patuxmreg_:ppattern;
	patsxmreg_:ppattern;
	patixmreg_:ppattern;
	patxmregi324_324:ppattern;
	patrevxmregi324_324:ppattern;
	patimreg_:ppattern;
	patxmmr64_64:ppattern;
	patpsxmreg_:ppattern;
	patpdxmreg_:ppattern;
	patxmreg_:ppattern;
	patlowintreg_:ppattern;
	patlowreg_:ppattern;
	patxmmr64m_64:ppattern;
	patlmaddrmode_:ppattern;
	patsmaddrmode_:ppattern;
	patrm_:ppattern;
	patsdiv_:ppattern;
	patmin_:ppattern;
	patmax_:ppattern;
	patpand_:ppattern;
	patpor_:ppattern;
	patsoperator_:ppattern;
	patcoperator_:ppattern;
	patloperator_:ppattern;
	patsmoperator_:ppattern;
	patXPANDN_XPANDN:ppattern;
	patOPSD_OPSD:ppattern;
	patOPSS_OPSS:ppattern;
	patADDSS_ADDSS:ppattern;
	patOPPS_OPPS:ppattern;
	patslt_:ppattern;
	patsle_:ppattern;
	patseq_:ppattern;
	patscmp_:ppattern;
	patCMPPS_CMPPS:ppattern;
	patOPPD_OPPD:ppattern;
	patOPPI8m_OPPI8:ppattern;
	patOPPI16m_OPPI16:ppattern;
	patXCMPPD_XCMPPD:ppattern;
	patXCMPPDR_XCMPPDR:ppattern;
	patOPPI8msc_OPPI8:ppattern;
	patOPPI16msc_OPPI16:ppattern;
	patOPPI8muc_OPPI8:ppattern;
	patOPPI16muc_OPPI16:ppattern;
	patOPPI8_OPPI8:ppattern;
	patOPPI16_OPPI16:ppattern;
	patSTORUPI16_STORUPI16:ppattern;
	patMOVUPI16_MOVUPI16:ppattern;
	patOPPI32_OPPI32:ppattern;
	patOPPI32m_OPPI32:ppattern;
	patSTORUPI32_STORUPI32:ppattern;
	patMOVUPI32_MOVUPI32:ppattern;
	patSTORUPD_STORUPD:ppattern;
	patMOVUPD_MOVUPD:ppattern;
	patSTORUPS_STORUPS:ppattern;
	patMOVAPS_MOVAPS:ppattern;
	patSSQRT_SSQRT:ppattern;
	patSDSQRT_SDSQRT:ppattern;
	patMOVUPS_MOVUPS:ppattern;
	patMOVSS_MOVSS:ppattern;
	patMOVSD_MOVSD:ppattern;
	patMOVSDl_MOVSD:ppattern;
	patMOVDl_MOVD:ppattern;
	patMOVDs_MOVD:ppattern;
	patXRLOADLIT_XRLOADLIT:ppattern;
	patXRDLOADLIT_XRDLOADLIT:ppattern;
	patCVTSD2SI_CVTSD2SI:ppattern;
	patCVTSI2SD_CVTSI2SD:ppattern;
	patCVTSI2SS_CVTSI2SS:ppattern;
	patCVTIR2SS_CVTIR2SS:ppattern;
	patSTORESS_STORESS:ppattern;
	patSTORESD_STORESD:ppattern;
	patSSRPUSH_SSRPUSH:ppattern;
	patSSRPOP_SSRPOP:ppattern;
	patSSRPOPI_SSRPOPI:ppattern;
	patCOMISSIFGOTO_COMISSIFGOTO:ppattern;
	patCOMISS_COMISS:ppattern;
	patFREP4_FREP4:ppattern;
	patword_:ppattern;
	patuint32_32:ppattern;
	patint32_32:ppattern;
	patieee64_64:ppattern;
	patdoubleword_:ppattern;
	patuint64_64:ppattern;
	patint64_64:ppattern;
	patoctet_:ppattern;
	patuint8_8:ppattern;
	patint16_16:ppattern;
	patuint16_16:ppattern;
	patint8_8:ppattern;
	patieee32_32:ppattern;
	pathalfword_:ppattern;

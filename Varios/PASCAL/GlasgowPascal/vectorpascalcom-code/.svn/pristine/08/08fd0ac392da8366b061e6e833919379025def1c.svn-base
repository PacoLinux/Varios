package postfixilcg;
import postfix.analysis.*;
import ca.mcgill.sable.util.*;
import postfixilcg.node.*;


/**

This walks a parse tree of a postfix ilcg program and generates
a ilcg tree for code generation



Paul Cockshott

*/
public class TreeGenerator extends AnalysisAdapter
{
    public void inStart(Start node)
    {
        defaultIn(node);
    }

    public void outStart(Start node)
    {
        defaultOut(node);
    }

    public void defaultIn(Node node)
    {
    }

    public void defaultOut(Node node)
    {
    }

    public void caseStart(Start node)
    {
        inStart(node);
        node.getPProgram().apply(this);
        node.getEOF().apply(this);
        outStart(node);
    }

    public void inAProgram(AProgram node)
    {
        defaultIn(node);
    }

    public void outAProgram(AProgram node)
    {
        defaultOut(node);
    }

    public void caseAProgram(AProgram node)
    {
        inAProgram(node);
        if(node.getStatementlist() != null)
            {
                node.getStatementlist().apply(this);
            }
        outAProgram(node);
    }

    public void inAOctetFormat(AOctetFormat node)
    {
        defaultIn(node);
    }

    public void outAOctetFormat(AOctetFormat node)
    {
        defaultOut(node);
    }

    public void caseAOctetFormat(AOctetFormat node)
    {
        inAOctetFormat(node);
        if(node.getOctet() != null)
            {
                node.getOctet().apply(this);
            }
        outAOctetFormat(node);
    }

    public void inAHalfwordFormat(AHalfwordFormat node)
    {
        defaultIn(node);
    }

    public void outAHalfwordFormat(AHalfwordFormat node)
    {
        defaultOut(node);
    }

    public void caseAHalfwordFormat(AHalfwordFormat node)
    {
        inAHalfwordFormat(node);
        if(node.getHalfword() != null)
            {
                node.getHalfword().apply(this);
            }
        outAHalfwordFormat(node);
    }

    public void inAWordFormat(AWordFormat node)
    {
        defaultIn(node);
    }

    public void outAWordFormat(AWordFormat node)
    {
        defaultOut(node);
    }

    public void caseAWordFormat(AWordFormat node)
    {
        inAWordFormat(node);
        if(node.getWord() != null)
            {
                node.getWord().apply(this);
            }
        outAWordFormat(node);
    }

    public void inADoublewordFormat(ADoublewordFormat node)
    {
        defaultIn(node);
    }

    public void outADoublewordFormat(ADoublewordFormat node)
    {
        defaultOut(node);
    }

    public void caseADoublewordFormat(ADoublewordFormat node)
    {
        inADoublewordFormat(node);
        if(node.getDoubleword() != null)
            {
                node.getDoubleword().apply(this);
            }
        outADoublewordFormat(node);
    }

    public void inAQuadwordFormat(AQuadwordFormat node)
    {
        defaultIn(node);
    }

    public void outAQuadwordFormat(AQuadwordFormat node)
    {
        defaultOut(node);
    }

    public void caseAQuadwordFormat(AQuadwordFormat node)
    {
        inAQuadwordFormat(node);
        if(node.getQuadword() != null)
            {
                node.getQuadword().apply(this);
            }
        outAQuadwordFormat(node);
    }

    public void inATformatFormat(ATformatFormat node)
    {
        defaultIn(node);
    }

    public void outATformatFormat(ATformatFormat node)
    {
        defaultOut(node);
    }

    public void caseATformatFormat(ATformatFormat node)
    {
        inATformatFormat(node);
        if(node.getTformat() != null)
            {
                node.getTformat().apply(this);
            }
        outATformatFormat(node);
    }

    public void inAReference(AReference node)
    {
        defaultIn(node);
    }

    public void outAReference(AReference node)
    {
        defaultOut(node);
    }

    public void caseAReference(AReference node)
    {
        inAReference(node);
        if(node.getRef() != null)
            {
                node.getRef().apply(this);
            }
        if(node.getType() != null)
            {
                node.getType().apply(this);
            }
        outAReference(node);
    }

    public void inAFormatType(AFormatType node)
    {
        defaultIn(node);
    }

    public void outAFormatType(AFormatType node)
    {
        defaultOut(node);
    }

    public void caseAFormatType(AFormatType node)
    {
        inAFormatType(node);
        if(node.getFormat() != null)
            {
                node.getFormat().apply(this);
            }
        outAFormatType(node);
    }

    public void inASignedTformat(ASignedTformat node)
    {
        defaultIn(node);
    }

    public void outASignedTformat(ASignedTformat node)
    {
        defaultOut(node);
    }

    public void caseASignedTformat(ASignedTformat node)
    {
        inASignedTformat(node);
        if(node.getSigned() != null)
            {
                node.getSigned().apply(this);
            }
        outASignedTformat(node);
    }

    public void inAUnsignedTformat(AUnsignedTformat node)
    {
        defaultIn(node);
    }

    public void outAUnsignedTformat(AUnsignedTformat node)
    {
        defaultOut(node);
    }

    public void caseAUnsignedTformat(AUnsignedTformat node)
    {
        inAUnsignedTformat(node);
        if(node.getUnsigned() != null)
            {
                node.getUnsigned().apply(this);
            }
        outAUnsignedTformat(node);
    }

    public void inAIeee32Tformat(AIeee32Tformat node)
    {
        defaultIn(node);
    }

    public void outAIeee32Tformat(AIeee32Tformat node)
    {
        defaultOut(node);
    }

    public void caseAIeee32Tformat(AIeee32Tformat node)
    {
        inAIeee32Tformat(node);
        if(node.getIeee32() != null)
            {
                node.getIeee32().apply(this);
            }
        outAIeee32Tformat(node);
    }

    public void inAIeee63Tformat(AIeee63Tformat node)
    {
        defaultIn(node);
    }

    public void outAIeee63Tformat(AIeee63Tformat node)
    {
        defaultOut(node);
    }

    public void caseAIeee63Tformat(AIeee63Tformat node)
    {
        inAIeee63Tformat(node);
        if(node.getIeee64() != null)
            {
                node.getIeee64().apply(this);
            }
        outAIeee63Tformat(node);
    }

    public void inASigned(ASigned node)
    {
        defaultIn(node);
    }

    public void outASigned(ASigned node)
    {
        defaultOut(node);
    }

    public void caseASigned(ASigned node)
    {
        inASigned(node);
        if(node.getInt32() != null)
            {
                node.getInt32().apply(this);
            }
        outASigned(node);
    }

    public void inAInt8Signed(AInt8Signed node)
    {
        defaultIn(node);
    }

    public void outAInt8Signed(AInt8Signed node)
    {
        defaultOut(node);
    }

    public void caseAInt8Signed(AInt8Signed node)
    {
        inAInt8Signed(node);
        if(node.getInt8() != null)
            {
                node.getInt8().apply(this);
            }
        outAInt8Signed(node);
    }

    public void inAInt16Signed(AInt16Signed node)
    {
        defaultIn(node);
    }

    public void outAInt16Signed(AInt16Signed node)
    {
        defaultOut(node);
    }

    public void caseAInt16Signed(AInt16Signed node)
    {
        inAInt16Signed(node);
        if(node.getInt16() != null)
            {
                node.getInt16().apply(this);
            }
        outAInt16Signed(node);
    }

    public void inAInt64Signed(AInt64Signed node)
    {
        defaultIn(node);
    }

    public void outAInt64Signed(AInt64Signed node)
    {
        defaultOut(node);
    }

    public void caseAInt64Signed(AInt64Signed node)
    {
        inAInt64Signed(node);
        if(node.getInt64() != null)
            {
                node.getInt64().apply(this);
            }
        outAInt64Signed(node);
    }

    public void inAUnsigned(AUnsigned node)
    {
        defaultIn(node);
    }

    public void outAUnsigned(AUnsigned node)
    {
        defaultOut(node);
    }

    public void caseAUnsigned(AUnsigned node)
    {
        inAUnsigned(node);
        if(node.getUint32() != null)
            {
                node.getUint32().apply(this);
            }
        outAUnsigned(node);
    }

    public void inAUint8Unsigned(AUint8Unsigned node)
    {
        defaultIn(node);
    }

    public void outAUint8Unsigned(AUint8Unsigned node)
    {
        defaultOut(node);
    }

    public void caseAUint8Unsigned(AUint8Unsigned node)
    {
        inAUint8Unsigned(node);
        if(node.getUint8() != null)
            {
                node.getUint8().apply(this);
            }
        outAUint8Unsigned(node);
    }

    public void inAUint16Unsigned(AUint16Unsigned node)
    {
        defaultIn(node);
    }

    public void outAUint16Unsigned(AUint16Unsigned node)
    {
        defaultOut(node);
    }

    public void caseAUint16Unsigned(AUint16Unsigned node)
    {
        inAUint16Unsigned(node);
        if(node.getUint16() != null)
            {
                node.getUint16().apply(this);
            }
        outAUint16Unsigned(node);
    }

    public void inAUint64Unsigned(AUint64Unsigned node)
    {
        defaultIn(node);
    }

    public void outAUint64Unsigned(AUint64Unsigned node)
    {
        defaultOut(node);
    }

    public void caseAUint64Unsigned(AUint64Unsigned node)
    {
        inAUint64Unsigned(node);
        if(node.getUint64() != null)
            {
                node.getUint64().apply(this);
            }
        outAUint64Unsigned(node);
    }

    public void inARefvalValue(ARefvalValue node)
    {
        defaultIn(node);
    }

    public void outARefvalValue(ARefvalValue node)
    {
        defaultOut(node);
    }

    public void caseARefvalValue(ARefvalValue node)
    {
        inARefvalValue(node);
        if(node.getRefval() != null)
            {
                node.getRefval().apply(this);
            }
        outARefvalValue(node);
    }

    public void inANumberValue(ANumberValue node)
    {
        defaultIn(node);
    }

    public void outANumberValue(ANumberValue node)
    {
        defaultOut(node);
    }

    public void caseANumberValue(ANumberValue node)
    {
        inANumberValue(node);
        if(node.getNumber() != null)
            {
                node.getNumber().apply(this);
            }
        outANumberValue(node);
    }

    public void inACallValue(ACallValue node)
    {
        defaultIn(node);
    }

    public void outACallValue(ACallValue node)
    {
        defaultOut(node);
    }

    public void caseACallValue(ACallValue node)
    {
        inACallValue(node);
        if(node.getBra() != null)
            {
                node.getBra().apply(this);
            }
        if(node.getValuelist() != null)
            {
                node.getValuelist().apply(this);
            }
        if(node.getKet() != null)
            {
                node.getKet().apply(this);
            }
        if(node.getIdentifier() != null)
            {
                node.getIdentifier().apply(this);
            }
        outACallValue(node);
    }

    public void inAValueSylable(AValueSylable node)
    {
        defaultIn(node);
    }

    public void outAValueSylable(AValueSylable node)
    {
        defaultOut(node);
    }

    public void caseAValueSylable(AValueSylable node)
    {
        inAValueSylable(node);
        if(node.getValue() != null)
            {
                node.getValue().apply(this);
            }
        outAValueSylable(node);
    }

    public void inADyadicSylable(ADyadicSylable node)
    {
        defaultIn(node);
    }

    public void outADyadicSylable(ADyadicSylable node)
    {
        defaultOut(node);
    }

    public void caseADyadicSylable(ADyadicSylable node)
    {
        inADyadicSylable(node);
        if(node.getDyadic() != null)
            {
                node.getDyadic().apply(this);
            }
        outADyadicSylable(node);
    }

    public void inAMonadicSylable(AMonadicSylable node)
    {
        defaultIn(node);
    }

    public void outAMonadicSylable(AMonadicSylable node)
    {
        defaultOut(node);
    }

    public void caseAMonadicSylable(AMonadicSylable node)
    {
        inAMonadicSylable(node);
        if(node.getMonadic() != null)
            {
                node.getMonadic().apply(this);
            }
        outAMonadicSylable(node);
    }

    public void inACastSylable(ACastSylable node)
    {
        defaultIn(node);
    }

    public void outACastSylable(ACastSylable node)
    {
        defaultOut(node);
    }

    public void caseACastSylable(ACastSylable node)
    {
        inACastSylable(node);
        if(node.getBra() != null)
            {
                node.getBra().apply(this);
            }
        if(node.getType() != null)
            {
                node.getType().apply(this);
            }
        if(node.getKet() != null)
            {
                node.getKet().apply(this);
            }
        outACastSylable(node);
    }

    public void inAAssignSylable(AAssignSylable node)
    {
        defaultIn(node);
    }

    public void outAAssignSylable(AAssignSylable node)
    {
        defaultOut(node);
    }

    public void caseAAssignSylable(AAssignSylable node)
    {
        inAAssignSylable(node);
        if(node.getAssign() != null)
            {
                node.getAssign().apply(this);
            }
        outAAssignSylable(node);
    }

    public void inADerefSylable(ADerefSylable node)
    {
        defaultIn(node);
    }

    public void outADerefSylable(ADerefSylable node)
    {
        defaultOut(node);
    }

    public void caseADerefSylable(ADerefSylable node)
    {
        inADerefSylable(node);
        if(node.getDeref() != null)
            {
                node.getDeref().apply(this);
            }
        outADerefSylable(node);
    }

    public void inAFpRefval(AFpRefval node)
    {
        defaultIn(node);
    }

    public void outAFpRefval(AFpRefval node)
    {
        defaultOut(node);
    }

    public void caseAFpRefval(AFpRefval node)
    {
        inAFpRefval(node);
        if(node.getFp() != null)
            {
                node.getFp().apply(this);
            }
        outAFpRefval(node);
    }

    public void inAMemoryRefval(AMemoryRefval node)
    {
        defaultIn(node);
    }

    public void outAMemoryRefval(AMemoryRefval node)
    {
        defaultOut(node);
    }

    public void caseAMemoryRefval(AMemoryRefval node)
    {
        inAMemoryRefval(node);
        if(node.getMem() != null)
            {
                node.getMem().apply(this);
            }
        if(node.getBra() != null)
            {
                node.getBra().apply(this);
            }
        if(node.getValue() != null)
            {
                node.getValue().apply(this);
            }
        if(node.getKet() != null)
            {
                node.getKet().apply(this);
            }
        outAMemoryRefval(node);
    }

    public void inAReallitNumber(AReallitNumber node)
    {
        defaultIn(node);
    }

    public void outAReallitNumber(AReallitNumber node)
    {
        defaultOut(node);
    }

    public void caseAReallitNumber(AReallitNumber node)
    {
        inAReallitNumber(node);
        if(node.getReallit() != null)
            {
                node.getReallit().apply(this);
            }
        outAReallitNumber(node);
    }

    public void inAIntegerNumber(AIntegerNumber node)
    {
        defaultIn(node);
    }

    public void outAIntegerNumber(AIntegerNumber node)
    {
        defaultOut(node);
    }

    public void caseAIntegerNumber(AIntegerNumber node)
    {
        inAIntegerNumber(node);
        if(node.getIntlit() != null)
            {
                node.getIntlit().apply(this);
            }
        outAIntegerNumber(node);
    }

    public void inAReallit(AReallit node)
    {
        defaultIn(node);
    }

    public void outAReallit(AReallit node)
    {
        defaultOut(node);
    }

    public void caseAReallit(AReallit node)
    {
        inAReallit(node);
        if(node.getIntpart() != null)
            {
                node.getIntpart().apply(this);
            }
        if(node.getDot() != null)
            {
                node.getDot().apply(this);
            }
        if(node.getFracpart() != null)
            {
                node.getFracpart().apply(this);
            }
        if(node.getExponentpart() != null)
            {
                node.getExponentpart().apply(this);
            }
        outAReallit(node);
    }

    public void inAPlusDyadic(APlusDyadic node)
    {
        defaultIn(node);
    }

    public void outAPlusDyadic(APlusDyadic node)
    {
        defaultOut(node);
    }

    public void caseAPlusDyadic(APlusDyadic node)
    {
        inAPlusDyadic(node);
        if(node.getPlus() != null)
            {
                node.getPlus().apply(this);
            }
        outAPlusDyadic(node);
    }

    public void inAMinusDyadic(AMinusDyadic node)
    {
        defaultIn(node);
    }

    public void outAMinusDyadic(AMinusDyadic node)
    {
        defaultOut(node);
    }

    public void caseAMinusDyadic(AMinusDyadic node)
    {
        inAMinusDyadic(node);
        if(node.getMinus() != null)
            {
                node.getMinus().apply(this);
            }
        outAMinusDyadic(node);
    }

    public void inAIdentifierDyadic(AIdentifierDyadic node)
    {
        defaultIn(node);
    }

    public void outAIdentifierDyadic(AIdentifierDyadic node)
    {
        defaultOut(node);
    }

    public void caseAIdentifierDyadic(AIdentifierDyadic node)
    {
        inAIdentifierDyadic(node);
        if(node.getIdentifier() != null)
            {
                node.getIdentifier().apply(this);
            }
        outAIdentifierDyadic(node);
    }

    public void inATimesDyadic(ATimesDyadic node)
    {
        defaultIn(node);
    }

    public void outATimesDyadic(ATimesDyadic node)
    {
        defaultOut(node);
    }

    public void caseATimesDyadic(ATimesDyadic node)
    {
        inATimesDyadic(node);
        if(node.getTimes() != null)
            {
                node.getTimes().apply(this);
            }
        outATimesDyadic(node);
    }

    public void inADivideDyadic(ADivideDyadic node)
    {
        defaultIn(node);
    }

    public void outADivideDyadic(ADivideDyadic node)
    {
        defaultOut(node);
    }

    public void caseADivideDyadic(ADivideDyadic node)
    {
        inADivideDyadic(node);
        if(node.getDivide() != null)
            {
                node.getDivide().apply(this);
            }
        outADivideDyadic(node);
    }

    public void inALtDyadic(ALtDyadic node)
    {
        defaultIn(node);
    }

    public void outALtDyadic(ALtDyadic node)
    {
        defaultOut(node);
    }

    public void caseALtDyadic(ALtDyadic node)
    {
        inALtDyadic(node);
        if(node.getLt() != null)
            {
                node.getLt().apply(this);
            }
        outALtDyadic(node);
    }

    public void inAGtDyadic(AGtDyadic node)
    {
        defaultIn(node);
    }

    public void outAGtDyadic(AGtDyadic node)
    {
        defaultOut(node);
    }

    public void caseAGtDyadic(AGtDyadic node)
    {
        inAGtDyadic(node);
        if(node.getGt() != null)
            {
                node.getGt().apply(this);
            }
        outAGtDyadic(node);
    }

    public void inALeDyadic(ALeDyadic node)
    {
        defaultIn(node);
    }

    public void outALeDyadic(ALeDyadic node)
    {
        defaultOut(node);
    }

    public void caseALeDyadic(ALeDyadic node)
    {
        inALeDyadic(node);
        if(node.getLe() != null)
            {
                node.getLe().apply(this);
            }
        outALeDyadic(node);
    }

    public void inAGeDyadic(AGeDyadic node)
    {
        defaultIn(node);
    }

    public void outAGeDyadic(AGeDyadic node)
    {
        defaultOut(node);
    }

    public void caseAGeDyadic(AGeDyadic node)
    {
        inAGeDyadic(node);
        if(node.getGe() != null)
            {
                node.getGe().apply(this);
            }
        outAGeDyadic(node);
    }

    public void inAEqDyadic(AEqDyadic node)
    {
        defaultIn(node);
    }

    public void outAEqDyadic(AEqDyadic node)
    {
        defaultOut(node);
    }

    public void caseAEqDyadic(AEqDyadic node)
    {
        inAEqDyadic(node);
        if(node.getEquals() != null)
            {
                node.getEquals().apply(this);
            }
        outAEqDyadic(node);
    }

    public void inANeDyadic(ANeDyadic node)
    {
        defaultIn(node);
    }

    public void outANeDyadic(ANeDyadic node)
    {
        defaultOut(node);
    }

    public void caseANeDyadic(ANeDyadic node)
    {
        inANeDyadic(node);
        if(node.getNe() != null)
            {
                node.getNe().apply(this);
            }
        outANeDyadic(node);
    }

    public void inARemainderDyadic(ARemainderDyadic node)
    {
        defaultIn(node);
    }

    public void outARemainderDyadic(ARemainderDyadic node)
    {
        defaultOut(node);
    }

    public void caseARemainderDyadic(ARemainderDyadic node)
    {
        inARemainderDyadic(node);
        if(node.getRemainder() != null)
            {
                node.getRemainder().apply(this);
            }
        outARemainderDyadic(node);
    }

    public void inAOrDyadic(AOrDyadic node)
    {
        defaultIn(node);
    }

    public void outAOrDyadic(AOrDyadic node)
    {
        defaultOut(node);
    }

    public void caseAOrDyadic(AOrDyadic node)
    {
        inAOrDyadic(node);
        if(node.getOr() != null)
            {
                node.getOr().apply(this);
            }
        outAOrDyadic(node);
    }

    public void inAAndDyadic(AAndDyadic node)
    {
        defaultIn(node);
    }

    public void outAAndDyadic(AAndDyadic node)
    {
        defaultOut(node);
    }

    public void caseAAndDyadic(AAndDyadic node)
    {
        inAAndDyadic(node);
        if(node.getAnd() != null)
            {
                node.getAnd().apply(this);
            }
        outAAndDyadic(node);
    }

    public void inAXorDyadic(AXorDyadic node)
    {
        defaultIn(node);
    }

    public void outAXorDyadic(AXorDyadic node)
    {
        defaultOut(node);
    }

    public void caseAXorDyadic(AXorDyadic node)
    {
        inAXorDyadic(node);
        if(node.getXor() != null)
            {
                node.getXor().apply(this);
            }
        outAXorDyadic(node);
    }

    public void inANotMonadic(ANotMonadic node)
    {
        defaultIn(node);
    }

    public void outANotMonadic(ANotMonadic node)
    {
        defaultOut(node);
    }

    public void caseANotMonadic(ANotMonadic node)
    {
        inANotMonadic(node);
        if(node.getNot() != null)
            {
                node.getNot().apply(this);
            }
        outANotMonadic(node);
    }

    public void inAAssign(AAssign node)
    {
        defaultIn(node);
    }

    public void outAAssign(AAssign node)
    {
        defaultOut(node);
    }

    public void caseAAssign(AAssign node)
    {
        inAAssign(node);
        if(node.getType() != null)
            {
                node.getType().apply(this);
            }
        if(node.getStore() != null)
            {
                node.getStore().apply(this);
            }
        outAAssign(node);
    }

    public void inAWordsStatement(AWordsStatement node)
    {
        defaultIn(node);
    }

    public void outAWordsStatement(AWordsStatement node)
    {
        defaultOut(node);
    }

    public void caseAWordsStatement(AWordsStatement node)
    {
        inAWordsStatement(node);
        if(node.getWords() != null)
            {
                node.getWords().apply(this);
            }
        outAWordsStatement(node);
    }

    public void inAProcStatement(AProcStatement node)
    {
        defaultIn(node);
    }

    public void outAProcStatement(AProcStatement node)
    {
        defaultOut(node);
    }

    public void caseAProcStatement(AProcStatement node)
    {
        inAProcStatement(node);
        if(node.getProcedure() != null)
            {
                node.getProcedure().apply(this);
            }
        if(node.getIdentifier() != null)
            {
                node.getIdentifier().apply(this);
            }
        if(node.getBra() != null)
            {
                node.getBra().apply(this);
            }
        if(node.getStatementlist() != null)
            {
                node.getStatementlist().apply(this);
            }
        if(node.getKet() != null)
            {
                node.getKet().apply(this);
            }
        outAProcStatement(node);
    }

    public void inAAddresstypeStatement(AAddresstypeStatement node)
    {
        defaultIn(node);
    }

    public void outAAddresstypeStatement(AAddresstypeStatement node)
    {
        defaultOut(node);
    }

    public void caseAAddresstypeStatement(AAddresstypeStatement node)
    {
        inAAddresstypeStatement(node);
        if(node.getAddress() != null)
            {
                node.getAddress().apply(this);
            }
        if(node.getEquals() != null)
            {
                node.getEquals().apply(this);
            }
        if(node.getTformat() != null)
            {
                node.getTformat().apply(this);
            }
        outAAddresstypeStatement(node);
    }

    public void inAWhileStatement(AWhileStatement node)
    {
        defaultIn(node);
    }

    public void outAWhileStatement(AWhileStatement node)
    {
        defaultOut(node);
    }

    public void caseAWhileStatement(AWhileStatement node)
    {
        inAWhileStatement(node);
        if(node.getWhile() != null)
            {
                node.getWhile().apply(this);
            }
        if(node.getValue() != null)
            {
                node.getValue().apply(this);
            }
        if(node.getBra() != null)
            {
                node.getBra().apply(this);
            }
        if(node.getStatementlist() != null)
            {
                node.getStatementlist().apply(this);
            }
        if(node.getKet() != null)
            {
                node.getKet().apply(this);
            }
        outAWhileStatement(node);
    }

    public void inAIfthenStatement(AIfthenStatement node)
    {
        defaultIn(node);
    }

    public void outAIfthenStatement(AIfthenStatement node)
    {
        defaultOut(node);
    }

    public void caseAIfthenStatement(AIfthenStatement node)
    {
        inAIfthenStatement(node);
        if(node.getIf() != null)
            {
                node.getIf().apply(this);
            }
        if(node.getValue() != null)
            {
                node.getValue().apply(this);
            }
        if(node.getThen() != null)
            {
                node.getThen().apply(this);
            }
        if(node.getStatementlist() != null)
            {
                node.getStatementlist().apply(this);
            }
        if(node.getFi() != null)
            {
                node.getFi().apply(this);
            }
        outAIfthenStatement(node);
    }

    public void inAStatementlist(AStatementlist node)
    {
        defaultIn(node);
    }

    public void outAStatementlist(AStatementlist node)
    {
        defaultOut(node);
    }

    public void caseAStatementlist(AStatementlist node)
    {
        inAStatementlist(node);
        if(node.getStatement() != null)
            {
                node.getStatement().apply(this);
            }
        {
            Object temp[] = node.getStatements().toArray();
            for(int i = 0; i < temp.length; i++)
                {
                    ((PStatements) temp[i]).apply(this);
                }
        }
        outAStatementlist(node);
    }

    public void inAStatements(AStatements node)
    {
        defaultIn(node);
    }

    public void outAStatements(AStatements node)
    {
        defaultOut(node);
    }

    public void caseAStatements(AStatements node)
    {
        inAStatements(node);
        if(node.getSemicolon() != null)
            {
                node.getSemicolon().apply(this);
            }
        if(node.getStatement() != null)
            {
                node.getStatement().apply(this);
            }
        outAStatements(node);
    }

    public void inAValuelist(AValuelist node)
    {
        defaultIn(node);
    }

    public void outAValuelist(AValuelist node)
    {
        defaultOut(node);
    }

    public void caseAValuelist(AValuelist node)
    {
        inAValuelist(node);
        {
            Object temp[] = node.getValue().toArray();
            for(int i = 0; i < temp.length; i++)
                {
                    ((PValue) temp[i]).apply(this);
                }
        }
        outAValuelist(node);
    }

    public void inAWordlist(AWordlist node)
    {
        defaultIn(node);
    }

    public void outAWordlist(AWordlist node)
    {
        defaultOut(node);
    }

    public void caseAWordlist(AWordlist node)
    {
        inAWordlist(node);
        if(node.getSylable() != null)
            {
                node.getSylable().apply(this);
            }
        if(node.getWords() != null)
            {
                node.getWords().apply(this);
            }
        outAWordlist(node);
    }

    public void inAWords(AWords node)
    {
        defaultIn(node);
    }

    public void outAWords(AWords node)
    {
        defaultOut(node);
    }

    public void caseAWords(AWords node)
    {
        inAWords(node);
        {
            Object temp[] = node.getSylable().toArray();
            for(int i = 0; i < temp.length; i++)
                {
                    ((PSylable) temp[i]).apply(this);
                }
        }
        outAWords(node);
    }
}

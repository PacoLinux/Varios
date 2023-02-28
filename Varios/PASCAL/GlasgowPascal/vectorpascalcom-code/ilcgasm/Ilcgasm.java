 
package ilcgasm;
import ilcgasm.node.*;
import ilcgasm.lexer.*;
import ilcgasm.parser.*;
import ilcgasm.analysis.*;
import java.io.*;
import java.util.*;
import ilcg.tree.*;
import ilcg.Pascal.*;

public class Ilcgasm  extends
		DepthFirstAdapter
{
    String cpu;int pass=0;
    Ilcgasm(String c){cpu=c;}
    Hashtable trans = new Hashtable();
    Hashtable procs = new Hashtable();
    public void outACastValue(ACastValue node)
    {
        	ilcg.tree.Node v=(ilcg.tree.Node)trans.get(node.getValue());
		String t=node.getType().toString().trim();
		if (v==null) {
			if(pass==0) return;// not an error the first pass as types not fully resolved yet
			System.out.println(" cast applied to null on line "+node.getBra().getLine());
			System.exit(1);
			
		}
		ilcg.tree.Cast n =(  new ilcg.tree.Cast(t,v));
		//System.out.println("line "+node.getBra().getLine()+"v="+v+"cast="+n.toString());
        	trans.put(node,n);
    }
    public void outAIntValue(AIntValue node)
    {
		String s;
        	trans.put(node, new Int(s=node.getIntlit().getText()));
		//System.out.println(s);
    }
    public void outARealValue(ARealValue node)
    {
                String s;
        	trans.put(node, new Real(s=node.getFloatingConstant().getText()));
		//System.out.println(s);
    }
    
    public void outAType(AType node)
    {
        String s= node.toString().trim();
	trans.put(node, new Format(s));
    }
    public void outATypeValue(ATypeValue node)
    {
        String s= node.toString().trim();
	trans.put(node, new Format(s));
    }
 
    ilcg.tree.Node procCall(Dictionary d, String id, ilcg.tree.Node[] params)  {
        Object value = d.get( id);
      
       if (value != null)
	 {
            try {
                {
                    Vector actualParams = new Vector();
                    for (int i = 0; i < params.length; i++) {
                        // System.out.println("Check parameter "+getType(params[i])+getType(proc.params[i]));
                        actualParams.addElement(params[i]);
                    }

                    
                    Cartesian Params = new Cartesian(actualParams);

                    try {
			if ( value instanceof ImpLabel)
                           return new Monad(new Function(new Label(((ImpLabel)value).getLab()),"[]","uint8"),Params);
                        return new Monad(new Function((Procedure)value), Params);
                    }
                    catch (Exception en) {
                        error(
                                "internal compiler error \nin procCall\n"
                                        + en.getMessage());
                    }

                }
            }
            catch (Exception err2) {
                error("in procedure call " + err2);
            }
        }
        if(pass>0)error(id + " undeclared");
        return null;
    }
    public void error(String s){System.out.println("error "+s);System.exit(1);}
    public void outAProcValue(AProcValue node)
    {
	ilcg.tree.Node []params={};
       if(pass>0)trans.put(node,procCall(procs,node.getIdentifier().getText(),params));
    }
    public void outAIdValue(AIdValue node)
    {
		String s=node.getIdentifier().getText();
		if(s.equals("null")){  /* leave null */}

		else
		trans.put(node, new Label(s));
        	//System.out.println(s); 
    }
    public String decomma(String s){
	s=s.trim();
	if (s.startsWith(","))return s.substring(2);
	return s;
	}
    ilcg.tree.Node program;
   
    public void outAProgram(AProgram node)
    {
        program=(ilcg.tree.Node)trans.get(node.getValue());pass++;
    }
    public void outAFnValue(AFnValue node){
		String id = node.getIdentifier().getText();
		Object []tail=node.getCarttail().toArray();
		int length = 1+ tail.length;
		ilcg.tree.Node [] ntail = new ilcg.tree.Node[length];
		Object val;
		ntail[0]= (ilcg.tree.Node)trans.get(val=(node).getValue());
		for(int i=1;i<length;i++)if(trans.get(((ACarttail)tail[i-1]).getValue())instanceof ilcg.tree.Node)ntail[i]=			
			(ilcg.tree.Node)trans.get(((ACarttail)tail[i-1]).getValue());
		if(pass>0) trans.put(node,procCall(procs,id,ntail));
    }
    String removesingleref(String s)
	{if (s.startsWith("ref ref"))return s;
	 return Format.typeDeref(s);
	}
     public void outAPrimfnValue(APrimfnValue node)
    {
	try{		
		String id = node.getId().toString();
		Object []tail=((ACartval)node.getCartval()).getCarttail().toArray();
		int length = 1+ tail.length;
		ilcg.tree.Node [] ntail = new ilcg.tree.Node[length];
		Object val;
		ntail[0]= (ilcg.tree.Node)trans.get(val=((ACartval)node.getCartval()).getValue());
		for(int i=1;i<length;i++)if(trans.get(((ACarttail)tail[i-1]).getValue())instanceof ilcg.tree.Node)ntail[i]=			
			(ilcg.tree.Node)trans.get(((ACarttail)tail[i-1]).getValue());
		//System.out.println("#"+id+"#");
        	if(id.equals("mem ")){	 
			trans.put(node,new Memref(ntail[1],removesingleref(val.toString().trim())));
		}else
		if(id.equals("var ")){
			trans.put(node,ntail[0]);
		}else
		if(id.equals("imported ")){
			Label l;
			procs.put(ntail[0].toString(),l=new ImpLabel(ntail[0].toString()));
			trans.put(node,l);
		}
		else
		if(id.equals("procedure ")){
			Procedure p;
			trans.put(node,p=new Procedure(
			ntail[1].toString().trim(),    //external name
			new java.lang.Integer(ntail[11].toString().trim()).intValue(),
			decomma(tail[6].toString().trim()),    //argtype
			decomma(tail[7].toString().trim()),    //returns 
			(Label ) ntail[0],            // local name
			ntail[9],//Node n,
			(LocalStoreAllocator)trans.get(((ACarttail)tail[10-1]).getValue()),//LocalStoreAllocator l,
			((Int)ntail[6]).intValue()//int level
			));
			procs.put(ntail[0].toString(),p);
		}else
		if(id.equals("SubField ")){
			 
			trans.put(node, new SubField(ntail[0],((Number)ntail[1]).intValue(),ntail[2].toString()));
		}else
		if(id.equals("EXTEND ")){// this may need to be made more sophisticated later
			trans.put(node, new Monad("EXTEND",ntail[0]));
		}else
		if(id.equals("FLOAT ")){ 
			trans.put(node,new Monad("FLOAT", (ntail[0])));
		}
		else
		if(id.equals("ROUND ")){ 
			trans.put(node,new Monad("ROUND", (ntail[0])));
		}
		else    
		if(id.equals("POP ")){ 
			trans.put(node,new Monad("POP", (ntail[0])));
		}else
		if(id.equals("loc ")){ 
			trans.put(node, new Location( ntail[0]));
		}else  
		if(id.equals("LN ")){ 
			trans.put(node, new Monad("LN", (ntail[0])));
		}else  
 
		if(id.equals("ABS ")){ 
			trans.put(node, new Monad("ABS", (ntail[0])));
		}else  
		if(id.equals("SIN ")){ 
			trans.put(node, new Monad("SIN", (ntail[0])));
		}else  
		if(id.equals("COS ")){ 
			trans.put(node,new ilcg.tree.Cast("ieee64",new Monad("COS", (ntail[0]))));
		}else
		if(id.equals("SQRT ")){ 
			trans.put(node,new ilcg.tree.Cast("ieee64",new Monad("SQRT", (ntail[0]))));
		}else
		if(id.equals("goto ")){
			trans.put(node, new Goto(ntail[0]));
		}else
		if(id.equals("NOT ")){
			trans.put(node,new ilcg.tree.Cast(ntail[0].returnType(), new Monad("NOT",ntail[0])));
		}else
		if(id.equals("ret ")){
			trans.put(node, new Return(ntail[0]));
		}else
		if(id.equals("min ")){
			trans.put(node, new Dyad(ntail[0],ntail[1],"min"));
		}else
		if(id.equals("div ")){
			trans.put(node, new Dyad(ntail[0],ntail[1],"div"));
		}else
		if(id.equals("AND ")){
			trans.put(node, new Dyad(ntail[0],ntail[1],"AND"));
		}else
		if(id.equals("seq ")){
                        if(ntail.length==2)
			trans.put(node, new Statement(ntail[0],new Statement(ntail[1])));
			else trans.put(node, new Statement(ntail[0]));
		}else
		if(id.equals("if ")){
			trans.put(node,new If(ntail[0],ntail[1],ntail[2]));
		}else
		if(id.equals("LocalStoreAllocator ")){
			trans.put(node, new LocalStoreAllocator(java.lang.Integer.parseInt(decomma(((ACartval)node.getCartval()).getValue().toString()),10),
                                                                java.lang.Integer.parseInt(decomma(tail[0].toString()),10)));
		}
		else
		if(id.equals("for ")){ 
			trans.put(node, new For(ntail[0],ntail[1],ntail[2],ntail[3],ntail[4])); 
		}else
		if(id.equals("assign "))
		try{
			trans.put(node, new Assign(ntail[0],ntail[1]));
		}
		catch(Exception e){
			System.out.println("Error "+e);
			System.out.println("Line "+((AIdentifierId)node.getId()).getIdentifier().getLine());
			System.exit(1);
		}
		else
		if((node.getId() instanceof AOpId)  ||
			id.equals("OR ")||
			id.equals("Fail ")
		){ 
			String opid=id.trim();
			if(length==2)
			      trans.put(node,new Dyad(ntail[0],ntail[1],opid));
			
			if(length==1){
				trans.put(node,new Monad(new Op(opid,ntail[0].returnType(),ntail[0].returnType()),ntail[0]));
				if(opid.equals("^")){
					trans.put(node , new Deref(ntail[0]));
				}
			}
			
		}else
		{ System.out.println("dont recognise primfn "+id);System.exit(1);}
	}
	catch(Exception xx){
		System.out.println("exception "+xx);
		xx.printStackTrace();
	}
    }
    public static void main(String[] arguments)
    {
        if(arguments.length != 2)
        {
            System.out.println("usage:");
             System.out.println("java ilcgasm.Ilcgasm sourcefile cpu ");
            System.exit(1);
        }
        Parser parser;
        

       try
        {   FileReader r=    new FileReader(arguments[0]);
            PushbackReader pr =  new PushbackReader(  new BufferedReader( r), 1024)  ;
	        Lexer lexer = new Lexer( pr );
            parser = new Parser(lexer);
            ilcgasm.node.Node ast = parser.parse();
           // System.out.println(ast);
	    Ilcgasm a=null;
            try{
		 
		ast.apply(a=new Ilcgasm(arguments[1]));
                
		ast.apply(a);
		 
                System.out.println(a.program);

		
               }catch(Exception e){e.printStackTrace();}
	   
           
        }
       catch(Exception e)
        {
            System.out.println(e);
            System.out.println("exit");
        }


           

    }
}


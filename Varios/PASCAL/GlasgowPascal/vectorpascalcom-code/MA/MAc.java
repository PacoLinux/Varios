
import MA.node.*;
import MA.analysis.*;
import MA.parser.*;
import MA.lexer.*;
import MA.*;
import java.io.*;
import java.util.*;
public class MAc{
 
// ------------------ this handles comand line, parses, 
public static void main(String[] arguments)
{
	 if(arguments.length != 1)
        {
	    
            System.out.println("usage:");
             System.out.println("MAc   programfile    ");
	    System.out.println("argcount ="+arguments.length+"\n"+arguments);
            System.exit(1);
        }
        Parser parser;
        boolean printSyntax=false;
	boolean printTypes=false;
	for(int f=0;f<1;f++) 
       try
        {   FileReader r=    new FileReader(arguments[f]);
	     
            PushbackReader pr =  new PushbackReader(  new BufferedReader( r), 1024)  ;
	    Lexer lexer = new Lexer( pr );
		 
             parser = new Parser(lexer);
               Node ast = parser.parse();
           if(printSyntax) System.out.println(ast);
           Interpreter interp = new Interpreter();
	   ast.apply(interp);
	   
	}catch(Exception ex){ System.err.println(ex.toString());ex .printStackTrace(System.out);}
} 
} // of MAc



class Interpreter extends DepthFirstAdapter{
	 SymbolTable symbols = new SymbolTable(new Hashtable());
         Hashtable evaluations = new Hashtable(); // evaluations of all nodes
         Hashtable blocks = new Hashtable();// holds the local symboltable for each block
    public void outADAbsexpr(ADAbsexpr node)// activated for dyadic expressions
    {
         String op = node.getDyadicsym().toString().trim();
      
	 if(op.equals("PRINT"))try{
	   
	        String f= dequote(evaluate(node.getRight()).toString().trim());
	   
	        PrintWriter w = new PrintWriter(new FileOutputStream(f));
	        Node v = evaluate(node.getLeft());
	        w.println(v.toString());w.close();
	        evaluations.put(node,v);
	 }catch(Exception e){System.out.println("File error"+e);}
    }
    String dequote(String s)
    {
        if (s.charAt(0)=='\'')return s.substring(1,s.length()-1);
        return s;
    }
    Node evaluate(Node node)
    {
    
        Node already = (Node)evaluations.get(node);
        if(already != null) return already;
       
        Node referent = (Node) symbols.get(node.toString().trim());
        if (referent != null) return referent;
        
        return node;
    }
    public void inAAbsblock(AAbsblock node)
    {
        Hashtable h = new Hashtable();
	blocks.put(node,h);
	symbols.enterScope(h);
    }
    public void outAAbsblock(AAbsblock node)
    {
        symbols.leaveScope();
    }
    
     public void outADeclAbsstatement(ADeclAbsstatement node)
    {
        symbols.put(node.getAbsid().toString().trim(),node.getAbsexpr());
    }
}

package tinyb;
/*
*      This program is free software; you can redistribute it and/or modify
*      it under the terms of the GNU General Public License as published by
*      the Free Software Foundation; either version 2 of the License, or
*      (at your option) any later version.
*
*      This program is distributed in the hope that it will be useful,
*      but WITHOUT ANY WARRANTY; without even the implied warranty of
*      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*      GNU General Public License for more details.
*
*      You should have received a copy of the GNU General Public License
*      along with this program; if not, write to the Free Software
*      Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
*      MA 02110-1301, USA.
*/

import java.util.*;
import java.io.*;
import ilcg.tree.*;
import tinyb.analysis.*;
import tinyb.lexer.*;
import tinyb.parser.*;
import tinyb.node.*;
class Translator  extends DepthFirstAdapter {
    Walker cpu;
    Hashtable<tinyb.node.Node,ilcg.tree.Node> translations = new Hashtable<tinyb.node.Node,ilcg.tree.Node> ();
    Hashtable<String,ilcg.tree.Node> symbols= new Hashtable<String,ilcg.tree.Node>();
    Stack<Label> loops = new Stack<Label>();
    Stack<ilcg.tree.Node>  limits=new Stack<ilcg.tree.Node>();
    String precision="int64";
    Statement data =null;
    public void outAListStatements(AListStatements node) {
        translations.put(node,new Statement(translations.get(node.getStatement()),(Statement)translations.get(node.getStatements())));
    }
    public void outAStatement(AStatement node) {
        translations.put(node,new Statement(idof(node.getNumber().toString().trim()),new Statement(translations.get(node.getAction()))));
    }
    public void outAConditionalAction(AConditionalAction node) {
        translations.put(node,new If(translations.get(node.getC()),new Goto(idof(node.getN().toString().trim()))));
    }
    public void outAForloopAction(AForloopAction node) {
        try
        {
            Label l = new Label();
            loops.push(l);
            Assign init = new Assign(idof(node.getIdentifier().toString().trim()),translations.get(node.getFromexp()));
            limits.push(translations.get(node.getToexp()));
            translations.put(node,new Statement(init, new Statement(l)));
        }
        catch(Exception e) {
            Error(node,e);
        }
    }
    public void outAPrintexpAction(APrintexpAction node) {
		Procedure p=  new Procedure(("print"),1,
                     precision,
                      precision,
                    exidof( "print"),
                    new Block(),
                   new LocalStoreAllocator(1,0)  ,
                     0);
                     p.isImported=true;
        Function f = new Function(p);
        Vector <ilcg.tree.Node> v = new Vector<ilcg.tree.Node>();
        v.add(translations.get(node.getE()));
        translations.put(node, new Monad(f,new Cartesian(v)));
    }
    Label exidof(String s) {
        data=new Statement(new ImpLabel(s),data);
        return new ExtLabel(s);
    }
    public void outAReadAction(AReadAction node) {
        Function f = new Function(exidof("readint"),precision,precision);
        Vector <ilcg.tree.Node> v = new Vector<ilcg.tree.Node>();
        v.add(idof(node.getId().toString().trim()));
        ilcg.tree.Node call =new Monad(f,new Cartesian(v));
        translations.put(node, call);
    }
    public void outAPrintlnAction(APrintlnAction node) {
			Procedure p=  new Procedure(("println"),1,
                     precision,
                      precision,
                    exidof( "println"),
                    new Block(),
                   new LocalStoreAllocator(1,0)  ,
                     0);
                     p.isImported=true;
        Function f = new Function(p); 
        Vector <ilcg.tree.Node> v = new Vector<ilcg.tree.Node>();
        translations.put(node, new Monad(f,new Cartesian(v)));
    }
    public void outAEndAction(AEndAction node) {
        Function f = new Function(exidof("exit"),precision,precision);
        Vector <ilcg.tree.Node> v = new Vector<ilcg.tree.Node>();
        //translations.put(node, new Monad(f,new Cartesian(v)));
    }
    public void outAJumpAction(AJumpAction node) {
        translations.put(node,new Goto(idof(node.getN().toString().trim())));
    }
    public void outALoopendAction(ALoopendAction node) {
        try
        {
            // first generate the increment
            ilcg.tree.Node i =idof(node.getI().toString().trim());
            ilcg.tree.Node di = new Deref(i);
            ilcg.tree.Node inc = new Assign(i, new Dyad(di,new Int(1,precision),"+"));
            // now the jump
            ilcg.tree.Statement jump = new Statement(
                new If(new Dyad(di,limits.pop(),"<="),new Goto(loops.pop())));
            translations.put(node, new Statement(inc,jump));
        }
        catch(Exception e) {
            Error(node,e);
        }
    }
    public void outAAssignmentAction(AAssignmentAction node) {
        try {
            translations.put(node,new Assign(idof(node.getId().toString().trim()),translations.get(node.getE())));
        }
        catch(Exception e) {
            Error(node,e);
        }
    }
    
     static void Error(tinyb.node.Node n,Exception e) {
        System.err.println("Error in : "+n+ "\n"+e);
        System.exit(-1);
    }
    static void Error(tinyb.node.Node n,String e) {
        System.err.println("Error in : "+n+ "\n"+e);
        System.exit(-1);
    }
    public void outACondition(ACondition node) {
        ilcg.tree.Node l,r;
        l=translations.get(node.getLeft());
        r=translations.get(node.getRight());
        ilcg.tree.Node n = new Dyad(l,r,transop(node.getOp().toString().trim()));
        translations.put(node,n);
    }
    public void outAValueExpression(AValueExpression node) {
        translations.put(node,translations.get(node.getV()).eval());
    }
    String transop(String op) {
        return op;
    }
    public void outAArithExpression(AArithExpression node) {
        ilcg.tree.Node l,r;
        l=translations.get(node.getLeft());
        r=translations.get(node.getRight());
        ilcg.tree.Node n = new Dyad(l,r,transop(node.getOp().toString().trim()));
        translations.put(node,n);
    }
    public void outAConstantValue(AConstantValue node) {
        translations.put(node, new ilcg.tree.Int(new Long(node.toString().trim()).longValue(),precision));
    }
    ilcg.tree.Node idof(String s) {
        ilcg.tree.Node n = symbols.get(s);
        if (cpu.verbose){System.out.println("idof "+s+"="+n);}
        
        if(n==null)try {
            if(Character.isDigit(s.charAt(0))){n = new Label("line"+s);}else
            n= new Memref( 
                   new Dyad(new Deref(cpu.getFP(),precision), new  Int(thealloc.alloc(8,16)),"+"),
                     
                    "ref "+precision
                   );
            
            symbols.put(s,n);
             if (cpu.verbose){System.out.println("idof  "+s+" set to "+n);}
        }catch (Exception e){
			System.err.println("error "+e);
			System.exit(1);
		}
        return n;
    }
    public void outAIdentifierValue(AIdentifierValue node) {
        translations.put(node, new Deref(  idof(node.getIdentifier().toString().trim())));
    }
    public void outAExpressionValue(AExpressionValue node) {
        translations.put(node,translations.get(node.getExpression()));
    }
    public LocalStoreAllocator thealloc= new LocalStoreAllocator (-1,16);
    public void outStart(Start node) {

        Procedure main = new Procedure("basic", 0, "[]", "void", new Label("basicstart"),
                                       translations.get(node.getPStatements()), thealloc, 0) ;
        main.isExported=true;
        translations.put(node,main);
    }
   /* static ilcg.tree.Node[] oldtranslate(tinyb.node.Node n, Walker cpu) {
        Translator t = new Translator();
        n.apply(t);
        ilcg.tree.Node i= t.translations.get(n);
        //System.out.println("src="+n+"\nabstract="+i );
        ilcg.tree.Node [] list = {i,t.data};
        return list;
    }*/
    static ilcg.tree.Node[] translate(tinyb.node.Node n,Walker cpu ) {
        try {
            Translator t = new Translator(cpu);
            n.apply(t);
            ilcg.tree.Node i= t.translations.get(n);
            //System.out.println("src="+n+"\nabstract="+i );
            ilcg.tree.Node [] list = {i,t.data};
            return list;
        } catch(Exception e) {
            Error(n,e);
        }

        return null;
    }
    public Translator(Walker C) {
        cpu=C;

        Format.addressType =cpu.getAddressType();
        int i;

    }
}

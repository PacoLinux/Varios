package matlab;

import java.util.Vector;
import java_cup.runtime.Symbol;
public  abstract class MatlabTree{
	public abstract void traverse(MatlabVisitor v);
}
class MatlabVisitor{
	public abstract void visit(MatlabTree t);
}
abstract class MatlabType extends MatlabTree{}
class MatlabFunction extends MatlabTree{
	MatlabFunction(Vector<String> res, Vector<String> args, MatlabTree body, String nom)
	{ result=res; arguments=args; text = body;name=nom;
	}
	Vector<String> result,arguments;
	MatlabTree text;
	String name;
	public String toString()
	{ 
	String s="function ";
	  if(result!=null){
		  s=s+ result;
	  }
	  s=s+"="+name+"(";
	  if (arguments!=null)
		 
		  	for (int i=0;i<arguments.size();i++)s=s+arguments.elementAt(i)+" ";
		   
	  s=s+")\n"+text;
	  return s;
	}
}
class MatlabIf extends MatlabTree{
	MatlabIf(Object cond, Object then_, Object else_)
	{condition=(MatlabTree)cond; thenpart=(MatlabTree)then_; elsepart=(MatlabTree)else_;}
	MatlabTree condition,thenpart,elsepart;
	public String toString()
	{ return "if "+condition+"\n"+thenpart+(elsepart==null?"\nend\n":"\nelse\n"+elsepart+"\nend\n");}
	public  void traverse(MatlabVisitor v){
		condition.traverse(v);
		thenpart.traverse(v);
		if(elsepart!=null) elsepart.traverse(v);
		v.visit(this);
	}
}
class MatlabArrayList extends MatlabTree{
	MatlabArrayList(Vector<MatlabTree> l){list=l;}
	 
	Vector<MatlabTree> list;
	public String toString()
	{ String s="[ ";
	 for (int i=0;i<list.size();i++)
		s=s+list.get(i);
	  return s+"]";
	}
}
class MatlabStatement extends MatlabTree{
	MatlabStatement(MatlabTree s, String eoln)
	{ statement=s; terminator =eoln;}
	String terminator;
	MatlabTree statement;
	public String toString(){
		return ""+statement+terminator;
	}
}
 class MatlabStatementList extends MatlabTree{
	MatlabStatementList(Vector<MatlabTree> l){list=l;}
	 
	Vector<MatlabTree> list;
	public String toString()
	{ String s="";
	  for(int i=0;i< list.size();i++)if (list.get(i)!=null)s=s+list.get(i)+"\n";
	  return s;
	}
}
 
class MatlabUnaryExp extends MatlabTree{
	MatlabUnaryExp(String op, Object exp)
	{ oper=op;expr=exp;}
	Object expr;
	String oper;
	public String toString()
	{ 
	  return oper+"("+expr+")";
	}
}
class MatlabExp extends MatlabTree{
	MatlabExp(Object lexp,String op, Object rexp)
	{ oper=op;left=(MatlabTree)lexp;right=(MatlabTree)rexp;}
	MatlabTree left,right;
	String oper;
	public String toString()
	{ 
	  return "("+left+oper+right+")";
	}
}
class MatlabAssign extends MatlabTree{
	MatlabAssign(Object lexp, Object rexp)
	{ left=(MatlabTree)lexp;right=(MatlabTree)rexp;}
	MatlabTree left,right;

	public String toString()
	{ 
	  return left.toString()+"="+right;
	}
}
class MatlabJump extends MatlabTree{
	MatlabJump(String s){type=s;}
	String type;
	public String toString(){return type;}

} 
class MatlabVar extends MatlabTree{
	MatlabVar(String s){id=s;}
	String id;
	public String toString(){return id;}

} 
class MatlabTypedVar extends MatlabVar{
	MatlabTypedVar(MatlabVar v, MatlabType t)
	{
		super(v.id); type=t;
	}
	MatlabType type;
}

class MatlabConst extends MatlabTree{
	MatlabConst(Object s){val=s;}
	Object  val;
	public String toString(){return (val instanceof String?"'"+val+"'":" "+val+" ");}

} 
  
class MatlabFor extends MatlabTree{
	MatlabFor(String id_, MatlabTree init_, MatlabTree action_)
	{id=id_; init=init_; action = action_;}
	String id; MatlabTree action, init;
	public String toString(){
		return "for "+id+"="+init+"\n"+action+"\nend";
	}
} 
class MatlabWhile extends MatlabTree{
	MatlabWhile(MatlabTree test_, MatlabTree action_)
	{ test=test_; action = action_;}
	 MatlabTree action, test;
	public String toString(){
		return "while "+test+"\n"+action+"\nend";
	}
} 
class MatlabArrayExpression extends MatlabTree{
	MatlabArrayExpression(Object id, Object ind)
	{ identifier=(String)id; indices=(Vector<MatlabTree>)ind;}
	String  identifier;
	Vector<MatlabTree> indices;	
	public String toString()
	{	String s=identifier+"(";
		for(int i=0;i<indices.size();i++)s=s+(i>0?",":"")+indices.get(i);
		return s+")";
	}
}

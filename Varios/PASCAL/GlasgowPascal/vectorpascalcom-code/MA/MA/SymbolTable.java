
//Title:        MA
//Version:      
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:      
//Description:  Your description


package MA;

import java.util.*;
import java.io.*;
class STEnumerator implements Enumeration{
	SymbolTable myTable;
	Enumeration myen;
	STEnumerator(SymbolTable tab){
	  myTable=tab;
	  myen=tab.t.keys();
	}
	public Object nextElement(){
		
		if(myen.hasMoreElements())return myen.nextElement();
		
		if(myTable.next==null) return null;
		myTable=myTable.next;
		myen=myTable.keys();
		return nextElement();
	}
	public boolean hasMoreElements()
	{
		if(myen.hasMoreElements())return true;
		if(myTable==null)return false;
		myTable=myTable.next;	if(myTable==null)return false;
		myen=myTable.keys();
		return hasMoreElements();
	}
	
}
class STelEnumerator implements Enumeration{
	SymbolTable myTable;
	Enumeration myen;
	STelEnumerator(SymbolTable tab){
	  myTable=tab;
	  myen=tab.t.elements();
	}
	public Object nextElement(){
		if(myen.hasMoreElements())return myen.nextElement();
		if(myTable.next==null) return null;
		myTable=myTable.next;
		myen=myTable.elements();
		return nextElement();
	}
	public boolean hasMoreElements()
	{
		if(myen.hasMoreElements())return true;
		if(myTable==null)return false;
		myTable=myTable.next;if(myTable==null)return false;
		myen=myTable.elements();
		return hasMoreElements();
	}
	
}
//---------------------------------------------------------------------
public class SymbolTable extends Dictionary implements Serializable  {
  Dictionary t;
  SymbolTable next;
  
  
  public Dictionary getCurrentScope(){return t;}
  public void putAll(Map m){ ((Hashtable )t).putAll(m);}
  public int depth=0;
  public SymbolTable(Dictionary h) {
  	next=null;
  	t=h;
  }
  /** searches for an object first in current scope and then
      in all surrounding scopes until it is found. If it is
      not found, returns null */
  public Object get(Object o)
  {
	if(o==null)return null;
//	System.out.println("Symbol table get "+o);
	try{
		 
  		Object val = t.get(o);
  		if (val==null)
  	  		if(next!=null)return next.get(o);
		//System.out.println(val);
  		return val;
	}
	catch(Exception e){
		System.out.println("in Symbol Table get "+e);
		return null;
	}
  }
/** this returns an array of all the values associated with 
the identifier starting with the value in the closest
enclosing scope */
 public Object[] idList(Object o)
 {
	if(o==null )return null;
	Object[] all=null;
	if(next!=null)all=next.idList(o);
        Object local = t.get(o);
	if(local!=null){
		if(all!=null){
		Object []more = new Object[1+all.length];
		more[0]=local;
		for(int i=1;i<more.length;i++)more[i]=all[i-1];
		all=more;
		}
		else {
			all=new Object[1];
			all[0]=local;
		}
		return all;
	}else
	{
		return all;
	}
}
  public Object checkedGet(Object o)throws Exception
  { Object g= get(o);
	if (g==null) throw new Exception("Uknown id "+o);
	return g;
  }
  public void list()
	{ for (Enumeration e = keys() ; e.hasMoreElements() ;) {
            System.out.println(e.nextElement());
        }

	}
  /** removes key from innermost scope in which it is found */
  public Object remove(Object key)
  {
  	Object v= t.remove(key);
  	if(v==null)
  	  if(next!=null)v=next.remove(key);
  	return v;
  }
/** associates a value with a key*/
  public Object put(Object key, Object val)
  {
  	return t.put(key,val);
  }
  /* true if all scopes emmpty */
  public boolean isEmpty()
  {
   if(next==null)return t.isEmpty();
   return t.isEmpty()&&next.isEmpty();
  }
  public Enumeration keys()
  {
  	return new STEnumerator(this);
  }
  public void listKeys(){
  	Enumeration k=keys();
  	while(k.hasMoreElements()){
  		Object key= k.nextElement(); if (key!=null)System.out.println(key.toString());}
  }
  public Enumeration elements()
  {
  	return new STelEnumerator(this);
  }
  public SymbolTable(Dictionary h,SymbolTable s)
  {t=h;next=s;}
  public int size()
  { int total=t.size();
    if (next!=null) total=total+next.size();
    return total;
  }
  /** creates a new scope that hides all precceding scopes
  thus all instances of an identifier in the old  */
  public void enterScope()
  {    enterScope(new Hashtable());  }
/** enter scope using the hashtable passed in as the current scope */
  public void enterScope(Dictionary h)
  { next=new SymbolTable(t,next);t=h;depth++;}
  /** all names declared since the last enter scope are deleted */
  public void leaveScope()
  {
  	if(next!=null){
  		t=next.t;
  		next=next.next;
  	}
        depth--;
  }
  public void load(Dictionary d)
  {
	Enumeration keys = d.keys();
	while(keys.hasMoreElements()){
		Object k=keys.nextElement();
		if(k!=null)put(k,d.get(k));
	}
  }
  public Dictionary popscope(){Dictionary old=t;leaveScope();return old;}
} 




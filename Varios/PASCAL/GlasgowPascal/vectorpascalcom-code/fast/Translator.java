package fast;
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
import fast.analysis.*;
import fast.lexer.*;
import fast.parser.*;
import fast.node.*;
class Translator  extends DepthFirstAdapter{
	Hashtable<fast.node.Node,ilcg.tree.Node> translations = new Hashtable<fast.node.Node,ilcg.tree.Node> ();
	Hashtable<String,Set<AAbsfndecl>> globalsymbols= new Hashtable<String,Set<AAbsfndecl>>();  
	Hashtable<AAbsfndecl,Hashtable<String,localvar>> alllocals =new Hashtable<AAbsfndecl,Hashtable<String,localvar>>();
	Hashtable<String,localvar> currentlocals = new Hashtable<String,localvar>();
	declprocess dp=new declprocess();
	Statement data =null;
	int stride =4 ;// number of bytes in a basic word
	Walker cpu;
	Translator(Walker w){cpu=w;}
	static ilcg.tree.Node[] translate(fast.node.Node n ,Walker w )
	{
		Translator t = new Translator(w);
		n.apply(t.dp);
		n.apply(t);	
		ilcg.tree.Node i= t.translations.get(n);
		//System.out.println("src="+n+"\nabstract="+i );
		ilcg.tree.Node [] list ={i,t.data};
		return list;
	}
	
	class declprocess extends DepthFirstAdapter
	{   int localalloc=0;
		public void inAAbsfndelc(AAbsfndecl node)
		{
			currentlocals = new Hashtable<String,localvar>();
			alllocals.put(node, currentlocals);
			localalloc = 2*stride;
		}
		public void outAAbsparam(AAbsparam node)
		{
			currentlocals.put(node.getAbslabel().toString().trim(),
				new localvar(localalloc,node.getAbstype()));
			localalloc+= typesize(node.getAbstype());
		}
			
		public void outAAbsfndecl(AAbsfndecl node)
		{
			String n=node.getAbslabel().toString().trim();
			Set<AAbsfndecl>d=globalsymbols.get(n);
			if(d!=null)d.add(node);else{
				d=new HashSet<AAbsfndecl>();
				d.add(node);
				globalsymbols.put(n,d);
			}
		}
	}
	class localvar
	{
		int offsetFromFP;
		PAbstype type;
		localvar (int o, PAbstype t)
		{ 
			type=t;offsetFromFP=o;
		}
	}
}

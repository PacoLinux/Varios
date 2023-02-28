
//Title:        ilcg
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:
//Description:  this is a class that enables data to be
//              written to it with the option of setting
//              rollback points
//              it can eventually be flushed to a file

package ilcg.tree;

import java.util.Vector;
import java.io.*;

public class RollBackBuffer implements Serializable
{
    volatile Vector store = new Vector();
    int lastline =0;
    public RollBackBuffer()
    {
        store=new Vector();
        lastline=0;
    }

    public void removeblanks()
    {
        Vector v =store;
        int line=lastline;
        lastline=0;
        store = new Vector();
        String s;
        int i;
        for(i=0; i<v.size(); i++)
            {
                s= v.elementAt(i).toString();
                if(!s.equals(""))writeln(s);
            }
    }
    /** returns a token that is used to define rollbacks */
    public int mark()
    {
        return lastline;
    }
    /** discard all lines after i*/
    public void rollBackTo(int i)
    {
        if(i<=store.size())
            {
                lastline=i;
                store.setSize(i);
            }
    }
    public void append(String[] lines)
    {
        for(int i=0; i<lines.length; i++)writeln(lines[i]);
    }
    /** grab all lines from startline and roll back to startline */
    public String[] sequester(int startline)
    {
        int sz=lastline;
        String [] res = new String [sz-startline];
        for(int i=startline; i<sz; i++)
            res[i-startline]=store.elementAt(i).toString();
        rollBackTo(startline);
        return res;
    }
    public void appendtolast(String s)
    {
        store.set(lastline-1,store.elementAt(lastline-1).toString()+s);
    }
    public void writeln(String s)
    {
        int pos;
        if((pos=s.indexOf('\n'))<0)
            {
                store.addElement(s);
                lastline++;
            }
        else
            {
                String head=s.substring(0,pos);
                String tail=s.substring(pos+1);
                //System.out.println("head ="+head);
                //System.out.println("tail ="+tail);
                writeln(head);
                writeln(tail);
            }
    }
    public void flush(PrintWriter out)
    {
        int i;
        for(i=0; i<lastline; i++)out.println(store.elementAt(i).toString());
        rollBackTo(0);
    }

}


//Title:        ilcg.tree.Loader
//Version:
//Copyright:    Copyright (c) 2000
//Author:       Paul Cockshott
//Company:
//Description:  Loads binary representation of Ilcg trees


package ilcg.tree;
import java.io.*;
import java.util.*;
/**
 *  Class to provide a means of loading ilcg trees from a standard binary form
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Loader
{
    /**
     *  Loads a tree from the input stream using the cpu to provide the register FP
     *  etc
     *
     *@param  in                       Description of Parameter
     *@param  cpu                      Description of Parameter
     *@return                          Description of the Returned Value
     *@exception  IOException          Description of Exception
     *@exception  AssignmentException  Description of Exception
     */
    public static Node load(DataInputStream in, Walker cpu) throws IOException, AssignmentException,Exception
    {
        Node tree = null;
        Hashtable labs = new Hashtable();
        Stack s = new Stack();
        try
            {
                int b;
                for(b = in.readUnsignedByte(); b != Node.codeForend; b = in.readUnsignedByte())
                    {
                        switch(b)
                            {
                            case(Node.codeForend):
                                break;
                            case(Node.codeForplus):
                                s.push(mkdyad(s, Node.plus));
                                break;
                            case(Node.codeForsatplus):
                                s.push(mkdyad(s, Node.satplus));
                                break;
                            case(Node.codeForminus):
                                s.push(mkdyad(s, Node.minus));
                                break;
                            case(Node.codeForsatminus):
                                s.push(mkdyad(s, Node.satminus));
                                break;
                            case(Node.codeFortimes):
                                s.push(mkdyad(s, Node.times));
                                break;
                            case(Node.codeForlt):
                                s.push(mkdyad(s, Node.lt));
                                break;
                            case(Node.codeForneq):
                                s.push(mkdyad(s, Node.neq));
                                break;
                            case(Node.codeForle):
                                s.push(mkdyad(s, Node.le));
                                break;
                            case(Node.codeForge):
                                s.push(mkdyad(s, Node.ge));
                                break;
                            case(Node.codeForgt):
                                s.push(mkdyad(s, Node.gt));
                                break;
                            case(Node.codeForeq):
                                s.push(mkdyad(s, Node.eq));
                                break;
                            case(Node.codeFordivide):
                                s.push(mkdyad(s, Node.divide));
                                break;
                            case(Node.codeForremainder):
                                s.push(mkdyad(s, Node.remainder));
                                break;
                            case(Node.codeForstore):
                            {
                                Node n2 = (Node) s.pop();
                                Node n1 = (Node) s.pop();
                                s.push(new Assign(n1, n2));
                            }
                            ;
                            break;
                            case(Node.codeForintlit):
                                s.push(new Int(in.readLong()));
                                break;
                            case(Node.codeFornoval):
                                s.push(null);
                                break;
                            // case(Node. codeForpush ):{ RegisterStack rs=(RegisterStack)s.pop();s.push(new Push(rs,(Node)s.pop()));}break;
                            // case(Node. codeForpop ):{ RegisterStack rs=(RegisterStack)s.pop();s.push(new Pop(rs));}break;
                            case(Node.codeForand):
                                s.push(mkdyad(s, Node.and));
                                break;
                            case(Node.codeForor):
                                s.push(mkdyad(s, Node.or));
                                break;
                            case(Node.codeForxor):
                                s.push(mkdyad(s, Node.xor));
                                break;
                            case(Node.codeForapply):
                                s.push(mkdyad(s, Node.apply));
                                break;
                            case(Node.codeForFor):
                            {
                                Node processing = (Node) s.pop();
                                Node step = (Node) s.pop();
                                Node end = (Node) s.pop();
                                Node begin = (Node) s.pop();
                                Memref var = (Memref) s.pop();
                                s.push(new For(var, begin, end, step, processing));
                            }
                            break;
                            case(Node.codeForIf):
                            {
                                Node elsepart = (Node) s.pop();
                                Node thenpart = (Node) s.pop();
                                Node cond = (Node) s.pop();
                                s.push(new If(cond, thenpart, elsepart));
                            }
                            break;
                            case(Node.codeForProc):
                            {
                                Int lexLev = (Int) s.pop();
                                LocalStoreAllocator l = (LocalStoreAllocator) s.pop();
                                Node code = (Node) s.pop();
                                Label starts = (Label) s.pop();
                                String returns = (String) s.pop();
                                String argtype = (String) s.pop();
                                int params = ((Int) s.pop()).intValue();
                                String externalname = (String) s.pop();
                                s.push(new Procedure(externalname, params,
                                                     argtype,
                                                     returns,
                                                     starts,
                                                     code,
                                                     l,
                                                     lexLev.intValue()));
                            }
                            break;
                            case(Node.codeForReal):
                                s.push(new Real(in.readDouble()));
                                break;
                            case(Node.codeForCharlit):
                                s.push(new CharLit(in.readChar()));
                                break;
                            case(Node.codeForGoto):
                                s.push(new Goto((Label) s.pop()));
                                break;
                            case(Node.codeForPlantLab):
                            {
                                Object key = s.pop();
                                if(labs.containsKey(key))
                                    {
                                        s.push(labs.get(key));
                                    }
                                else
                                    {
                                        Label l1 = new Label();
                                        labs.put(key, l1);
                                        s.push(l1);
                                    }
                            }
                            break;
                            case(Node.codeForString):
                            {
                                int len = in.readInt();
                                int i;
                                byte[] data = new byte[len];
                                for(i = 0; i < len; i++)
                                    {
                                        data[i] = in.readByte();
                                    }
                                s.push(new String(data));
                            }
                            break;
                            case(Node.codeForMemref):
                            {
                                String returns = (String) s.pop();
                                Node index = (Node) s.pop();
                                s.push(new Memref(index, returns));
                            }
                            break;
                            case(Node.codeForFP):
                                s.push(cpu.FP);
                                break;
                            case(Node.codeForCast):
                            {
                                Node n = (Node) s.pop();
                                String t = (String) s.pop();
                                s.push(new Cast(t, n));
                            }
                            break;
                            case(Node.codeForDeref):
                                s.push(new Deref((Node) s.pop()));
                                break;
                            case(Node.codeForStatement):
                            {
                                Node s2 = (Node) s.pop();
                                Node s1 = (Node) s.pop();
                                if(s2 instanceof Statement)
                                    {
                                        s.push(new Statement(s1, (Statement) s2));
                                    }
                                else
                                    {
                                        s.push(new Statement(s1, new Statement(s2)));
                                    }
                            }
                            break;
                            case(Node.codeForFormat):
                                s.push(new Format((String) s.pop()));
                                break;
                            case(Node.codeForBlock):
                            {
                                LocalStoreAllocator a = (LocalStoreAllocator) s.pop();
                                Node stree = (Node) s.pop();
                                s.push(new Block(stree, a));
                            }
                            break;
                            case(Node.codeForLocalStoreAllocator):
                            {
                                Int current = (Int) s.pop();
                                Int dir = (Int) s.pop();
                                s.push(new LocalStoreAllocator(dir.intValue(), current.intValue()));
                            }
                            break;
                            case(Node.codeForRegister):
                            case(Node.codeForRegisterStack):
                                s.push(cpu.registerIndex.get(s.pop()));
                                break;
                            case(Node.codeForLocation):
                                s.push(new Location((Node) s.pop()));
                                break;
                            default:
                                throw new IOException(" input code " + b + "undefined");
                            }
                    }
            }
        catch(EOFException e)
            {
            }
        return tree;
    }


    /**
     *  Description of the Method
     *
     *@param  out              Description of Parameter
     *@param  s                Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public static void toBinary(DataOutputStream out, String s) throws IOException
    {
        int l = s.length();
        out.writeByte(Node.codeForString);
        out.writeInt(l);
        out.writeBytes(s);
    }


    /**
     *  Description of the Method
     *
     *@param  out              Description of Parameter
     *@param  n                Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public static void toBinary(DataOutputStream out, Node n) throws IOException
    {
        if(n == null)
            {
                out.writeByte(Node.codeFornoval);
            }
        else
            {
                n.toBinary(out);
            }
    }


    /**
     *  Description of the Method
     *
     *@param  s   Description of Parameter
     *@param  op  Description of Parameter
     *@return     Description of the Returned Value
     */
    static Node mkdyad(Stack s, String op)throws Exception
    {
        Node n2 = (Node) s.pop();
        Node n1 = (Node) s.pop();
        return new Dyad(n1, n2, op);
    }
}

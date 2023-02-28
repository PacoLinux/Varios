
//Title:        ilcg.tree.ImpLabel
//Version:
//Copyright:    Copyright (c) 1999
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation representation of external Labels
package ilcg.tree;
import java.io.*;

public class ImpLabel extends Label implements Serializable
{
    String lab;
    public ImpLabel(String name)
    {
        lab=name;
    }
    public String toString()
    {
        return "imported("+lab+")";
    }
    public String getLab()
    {
        return lab;
    }
}

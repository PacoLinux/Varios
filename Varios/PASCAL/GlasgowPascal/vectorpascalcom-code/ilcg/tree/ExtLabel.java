
//Title:        ilcg.tree.ExtLabel
//Version:
//Copyright:    Copyright (c) 1999
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation representation of external Labels
package ilcg.tree;
import java.io.*;

public class ExtLabel extends Label implements Serializable
{
    String lab;
    public ExtLabel(String name)
    {
        lab=name;
    }
    public String toString()
    {
        return lab;
    }

}

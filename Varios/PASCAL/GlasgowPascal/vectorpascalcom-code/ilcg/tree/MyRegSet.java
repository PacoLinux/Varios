package ilcg.tree;
import java.util.*;
import java.io.*;

public
class MyRegSet  extends MyHashSet  implements Serializable
{
    class MyLineHolder implements Serializable
    {
        int [] myline;
        MyLineHolder(int n)
        {
            myline=new int [n];
        }
    }
// This ensures that each register has a unique reservation line and also
// provides a fast method to access these
    public  MyLineHolder[]  reservationlines = {new MyLineHolder(1)};
    public int [] getline(int i)
    {
        return reservationlines[i].myline;
    }
    public int [] newreservationline(int n)
    {
        MyLineHolder temp = new MyLineHolder(n);
        MyLineHolder[] old = reservationlines;
        reservationlines = new MyLineHolder[ old.length+1];
        for(int i=0; i<old.length; i++)reservationlines[i]=old[i];
        MyLineHolder x=reservationlines[old.length]= new MyLineHolder(n);
        return x.myline;
    }


}

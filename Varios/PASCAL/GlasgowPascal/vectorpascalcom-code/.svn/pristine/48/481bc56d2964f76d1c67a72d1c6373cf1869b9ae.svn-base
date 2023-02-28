

package ilcg;

public class SyntaxError extends Exception
{

    public int line,cpos=0;
    String unitname="<undefined>";
    public SyntaxError(String s, int Line, int pos, String unit)
    {
        super(s);
        line=Line;
        cpos=pos;
        unitname=unit;
    }
    public String toString()
    {
        if(line>0)
            return "\nError on line "+ line+", "+cpos+"["+unitname+"]\t "+getMessage();
        return " Error "+getMessage();
    }
    public SyntaxError(String s,int Line)
    {
        super(s);
        line=Line;
    }
}

package ilcg.tree;
/** Semantics for pushing onto a stack */
public class Push extends Dyad
{

    public Push(RegisterStack s, Node n)
    {
        left=s;
        right=n;
        O=new Pushop();
    }

}

class Pushop extends Op
{
    Pushop()
    {
        Left="stack";
        Right="t";
        Returns="t";
        Symbol=Node.push;
    }
}

package VPTeX;

public class DeclarationLine extends CodeLine{

    byte Type; // The type of declaration: 0 being CONST, 1 being TYPE and 2 being VAR

    /* Default constructor */
    DeclarationLine(){
	super();
	Type= 4; // Default value
    }

    /* Constructor for declarationLine which sets the contents of the line, 
       the line number and the contents of the margin comment */
    public DeclarationLine(String s, int n, String s1, byte b,boolean sel){
	super(s,n,s1,0,sel);
	Type= b;
    }

}

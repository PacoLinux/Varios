package VPTeX;

public class ProcedureLine extends CodeLine{
    
    private String name; // The name of the procedure in which this line is contained
    private String declaredIn; // The path to this procedure
    private byte type; // The type. ie 0= Procedure, 1= Function, 2= Constructor, 3= Deconstructor, 4= Unspecified
    private String proType[] ={"procedure ","function ","constructor ","destructor "};
	private boolean forward=false;

    /* Default constructor */
    ProcedureLine(){
	super();
	this.name= "";
	this.declaredIn= "";
	this.type= 4;
    }

    /** Constructor for ProcedureLine. Sets the contents of the line, the line number, the margin comment,
        the name of the procedure, the path of the procedure and the type of procedure */
    public    ProcedureLine(String s, int n, String s2, String s3, String s4, byte b, boolean sel){
	super(s,n,s2,0,sel);
	this.name= s3; // Set the name of the procedure
	this.declaredIn= s4; // Set the path of this procedure
	this.type= b; // Set the type of the procedure
    }

    /** Public method to return the name of the procedure which contains this line */
    public String getName(){
	return this.name;
    }

    /** Public method to return the path to where this line is declared */
    public String getDeclared(){
	return this.declaredIn; 
    }

    /** Public method to return the type of the procedure which contains this line */
    public byte getType(){
	return this.type;
    }

    public String sectionHead(){
		return ("\\section{" + /*proType[type] +*/ formatString(name) + "}\\label{sec:" + declaredIn+name + "}\n");
    }

    public String toString(){
	return (super.toString());
    }
    
    public String toStringRef(){
	return ((super.toString()) + " (see Section \\ref{sec:"+declaredIn+name+"} )\\\\");
    }
	public void setFowrard() {
		this.forward=true;
	}
	public boolean getFowrard() {
		return this.forward;
	}
}

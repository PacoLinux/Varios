package VPTeX;

class Variable{

    private String name;
    private DeclarationLine type;
    private String declaredIn; // The scope in which the variable is declared

    /* Default constructor for Variable */
    Variable(){
	this.name= "";
	this.type= new DeclarationLine();
	this.declaredIn= "";
    }

    /** Constructor for Variable which sets the name, type and declaredIn */
    Variable(String n, DeclarationLine t, String d){
	this.name= n;
	this.type= t;
	this.declaredIn= d;
    }

    /** Returns the nae of the variable */
    public String getName(){
	return this.name;
    }

    /** Returns the type of the variable */
    public DeclarationLine getType(){
	return this.type;
    }

    /** Returns the scope in which the variable is declared */
    public String getDeclaredIn(){
	return this.declaredIn;
    }

}

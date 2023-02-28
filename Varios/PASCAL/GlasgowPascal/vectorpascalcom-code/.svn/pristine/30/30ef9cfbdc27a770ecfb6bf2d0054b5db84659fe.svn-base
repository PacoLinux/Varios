// changed feb 15 02 to fix array equality on two dynamic arrays

package ilcg.Pascal;

import java.io.*;
import java.util.*;
import ilcg.SyntaxError;
import ilcg.tree.*;
import ilcg.tree.Procedure;

/**
 *  represents the type of pascal arrays
 *
 * @author     wpc
 * @created    June 21, 2001
 * modified
 *21-03-02    fixed bug in computation of dynamic array ranges in getstep
 */
class ArrayType extends Type implements Cloneable,Serializable {

    /**
     *  Description of the Field
     */
    public Type elemtype;

    /**
     *true if an array has at least one bound that is only known at run time
     */
    public boolean isDynamic = false;
    /**
     *  Description of the Field
     */
    public boolean isSubarray = false;
    long esize = 4;
    int drank = 1;
    long[][] indices;// assume these are only used for staticly known indices
    // first index holds rank, second lower and upper bound
    // same convention for what follows
    int[][] positions = {{0, 0}};
    // if index is dynamic this holds which parameter in the
    // schema parameter list holds this bound
    Node[][] symbolicIndices = {{null, null}};

    String[][] indexnames = {{"lwb", "upb"}};
    boolean[][] isStatic = {{true, true}};// used to indicate which indices are statically known
    // only used for dynamic arrays
    int numparams = 0;
    int addrlength = Format.lengthInBytes(Format.addressType);

    static String times = "*";
    static String plus = "+";
    static Node zero = new Int(0, Format.addressType);
    static Node one = new Int(1, Format.addressType);
    /**
    	 *  A method that must beinstantiated allowing a TreeModifier to substitute
    	 *  values into the tree. if e.visit(this) is false the method should return
    	 *  this.
    	 *
    	 * @param  m  Description of Parameter
    	 * @return    Description of the Returned Value
    	 */
    public Node modify(TreeModifier m) {
        if(m.visit(this))try {
                ArrayType at =(ArrayType) clone();
                at.symbolicIndices=(Node[][])symbolicIndices.clone();
                for(int i=0; i<symbolicIndices.length; i++) {
                    Node[] nind= {
                        m.modified(symbolicIndices[i][0]),
                        m.modified(symbolicIndices[i][1])
                    };
                    at.symbolicIndices[i]=nind;
                }
                at.elemtype=(Type)m.modified(at.elemtype);
                return at;
            }
            catch(Exception e) {
                System.err.println("in ArrayType.modify "+e);
                e.printStackTrace();
                System.exit(1);
                return this;
            }
        else return this;
    }

    /**
     *  Constructor for the ArrayType object  use with static arrays
     *
     * @param  i                      indices of the array as array of integer pairs
     * @param  t                      type of the lements
     * @param  elementsize            bytes per element
     */
    public ArrayType(long[][] i, Type t, long elementsize) {
        if(t instanceof ArrayType && (!(t instanceof SetType))
                && (!(t instanceof StringType))) {
            ArrayType at = (ArrayType) t;
            long[][] newindices = new long[i.length + at.indices.length][2];
            isStatic = new boolean[newindices.length][2];
            for(int j = 0; j < i.length; j++) {
                newindices[j] = i[j];
            }
            for(int j = 0; j < at.indices.length; j++) {
                newindices[j + i.length] = at.indices[j];
            }
            indices = newindices;
            elemtype = at.elemtype;
            type = at.type;
            esize = at.esize;
            initindexnames();
        }
        else {
            elemtype = t;
            indices = i;
            isStatic = new boolean[indices.length][2];
            esize = elementsize;
            for(int j = 0; j < indices.length; j++) {
                isStatic[j][0] = true;
                isStatic[j][1] = true;

            }

            type = codeGenRepresentation(AsmLink.cpu);
            initindexnames();
        }
        symbolicIndices = new Node[indices.length][2];
        for(int j = 0; j < indices.length; j++) {
            isStatic[j][0] = true;
            isStatic[j][1] = true;
            for(int k = 0; k < 2; k++) {
                symbolicIndices[j][k] = new Int(indices[j][k]);
            }
        }
    }


    /**
     *   Constructor for  dynamic array type
     *
     * @param  dims         Description of the Parameter
     * @param  elems        Description of the Parameter
     * @param  elementsize  Description of the Parameter
     */
    public ArrayType(int dims, Type elems, long elementsize) {
        elemtype = elems;
        drank = dims;
        numparams = dims * 2;
        indices = new long[dims][2];
        isStatic = new boolean[dims][2];
        positions = new int[dims][2];
        symbolicIndices = new Node[dims][2];
        for(int i = 0; i < dims; i++) {
            indices[i][0] = 0 + 2 * i;
            indices[i][1] = 1 + 2 * i;
            symbolicIndices[i][0] = null;
            symbolicIndices[i][1] = null;
            isStatic[i][0] = false;
            isStatic[i][1] = false;
        }
        esize = elementsize;
        isDynamic = true;
        type = codeGenRepresentation(AsmLink.cpu);
        initindexnames();
    }


    /**
     * default Constructor for the ArrayType object
     */
    public ArrayType() {
        elemtype = new IntegralType(0, 1);
        indices = new long[1][2];
        indices[0][0] = 0;
        indices[0][1] = 1;
        esize = 1;
        type = size2rep(esize);
        initindexnames();
    }


    /**
     *Constructor for the ArrayType object
     *
     * @param  t        Description of the Parameter
     * @param  newrank  Description of the Parameter
     */
    public ArrayType(ArrayType t, int newrank) {
        elemtype = t.elemtype;
        type = t.type;
        esize = t.esize;
        if(t.isDynamic) {
            drank = newrank;
            isDynamic = true;
        }
        indices = new long[newrank][2];
        isStatic = new boolean[newrank][2];
        symbolicIndices = new Node[newrank][2];
        int offset = t.rank() - newrank;
        for(int i = 0; i < indices.length; i++) {
            indices[i] = t.indices[i + offset];
            symbolicIndices[i] = t.symbolicIndices[i];
            isStatic[i] = t.isStatic[i + offset];
        }
        initindexnames();
    }


    /**
     * create the array type of a slice taken from and array of type t
     *the array subscripts is of form [2][rank] where subscripts[0][i] holds the starting position in dimension i of
     *the source and subscripts[1][i] holds the ending position in dimension i.
     *The subscripts are symbolic expressions which may not be known at compile time.
     *
     * @param  t              Description of the Parameter
     * @param  subscripts     Description of the Parameter
     * @exception  Exception  Description of the Exception
     */
    public ArrayType(ArrayType t, Node[][] subscripts)
    throws Exception {
        elemtype = t.elemtype;
        esize = t.esize;
        isSubarray = true;
        drank = t.rank();
        if(subscripts[0].length > t.rank()) {
            throw new Exception(" too many subscripts in ArrayType");
        }
        // if(subscripts[0].length<t.rank())throw new Exception(" too few subscripts in ArrayType");
        indices = new long[t.rank()][2];
        isStatic = new boolean[t.rank()][2];
        symbolicIndices = new Node[t.rank()][2];
        for(int i = 0; i < indices.length; i++) {
            if(i < subscripts[0].length) {
                indices[i][0] = 0;
                isStatic[i][0] = true;
                symbolicIndices[i][0] = new Int(0);
                Node upb = new Dyad(subscripts[1][i], subscripts[0][i], "-");
                symbolicIndices[i][1] = upb;
                isStatic[i][1] = upb instanceof Int;
                if(isStatic[i][1]) {
                    indices[i][1] = ((Int) upb).intValue();
                }
            }
            else {
                for(int j = 0; j < 2; j++) {
                    indices[i][j] = t.indices[i][j];
                    isStatic[i][j] = t.isStatic[i][j];
                    symbolicIndices[i][j] = t.symbolicIndices[i][j];
                }
            }
        }
        isDynamic = true;
        initindexnames();
        type = codeGenRepresentation(AsmLink.cpu);
    }
    // symbolic indices are used for  arrays whose
    // bounds have expressions supplied for them which
    // can be evalutated at run time for example a[x..y]
    // this array is dynamic but no descriptor needs to
    // be created unless the array is passed as a procedure
    // parameter. Unknown indices indicate that the
    // array is dynamic - that is can only be handled
    // using a descriptor
    void setdynamicflag() {
        for(int i = 0; i < symbolicIndices.length; i++) {
            for(int j = 0; j < 2; j++) {
                if(symbolicIndices[i][j] == null) {
                    isDynamic = true;
                }
            }
        }
    }// used in dynamic array types to record how many parameters they have


    /**
     * return number of parameters to schema array type
     *
     * @return    The numParams value
     */
    public int getNumParams() {
        return numparams;
    }


    void initindexnames() {
        indexnames = new String[rank()][2];
        for(int i = 0; i < rank(); i++) {
            indexnames[i][0] = "lwb" + i;
            indexnames[i][1] = "upb" + i;
        }
    }


    /**
     * return the lower bound of  a static array
     *
     * @param  dimension      Description of the Parameter
     * @return                The lwb value
     * @exception  Exception  Description of the Exception
     */
    public Node getLwb(int dimension)
    throws Exception {
        if(isStatic[dimension][0]) {
            return new Int(indices[dimension][0], Format.addressType);
        }
        if(symbolicIndices[dimension][0] == null) {
            throw new Exception("Not a static array");
        }
        return symbolicIndices[dimension][0];
    }

    public Node elementcount()throws Exception {
        return elementcount(0);
    }
    public Node elementcount(int d)throws Exception {
        if( d>= rank()) return new Int(1);
        return new Dyad(elementcount(d+1),new Dyad(new Dyad(getUpb(d),getLwb(d),"-"),new Int(1),"+"),"*");
    }
    /**
     * return the upper bound of  a static array
     *
     * @param  dimension      Description of the Parameter
     * @return                The upb value
     * @exception  Exception  Description of the Exception
     */
    public Node getUpb(int dimension)
    throws Exception {
        if(isStatic[dimension][1]) {
            return new Int(indices[dimension][1], Format.addressType);
        }
        if(symbolicIndices[dimension][1] == null) {
            throw new Exception("Not a static array");
        }
        return symbolicIndices[dimension][1];
    }


    /**
     *  Gets the bound attribute of the ArrayType object
     *
     * @param  name           Description of the Parameter
     * @param  base           Description of the Parameter
     * @return                The bound value
     * @exception  Exception  Description of the Exception
     */
    public Node getBound(String name, Node base)
    throws Exception {
        int i;
        for(i = 0; i < rank(); i++) {
            if(name.equals(indexnames[i][0])) {
                return getLwb(i, base);
            }
            if(name.equals(indexnames[i][1])) {
                return getUpb(i, base);
            }
        }
        throw new Exception("undeclared bound name " + name);
    }


    /**
     * This is used to relabel the bounds of a dynamic array type
     *
     * @param  dimension  The new boundName value
     * @param  bound      The new boundName value
     * @param  name       The new boundName value
     */
    public void setBoundName(int dimension, int bound, String name) {
        indexnames[dimension][bound] = name;
        isStatic[dimension][bound] = false;
    }


    /**
     * Specifies where in the schema parameter list the bound occurs
     *
     * @param  dimension  The new boundPosition value
     * @param  bound      The new boundPosition value
     * @param  position   The new boundPosition value
     */
    public void setBoundPosition(int dimension, int bound, int position) {
        positions[dimension][bound] = position;
        isStatic[dimension][bound] = false;
    }


    /**
     * indicates if a bound is statically known
     *
     * @param  dimension  Description of the Parameter
     * @param  bound      Description of the Parameter
     * @return            The boundStatic value
     */
    public boolean isBoundStatic(int dimension, int bound) {
        return isStatic[dimension][bound];
    }


    /**
     *  Gets the boundPosition attribute of the ArrayType object
     *
     * @param  dimension      Description of the Parameter
     * @param  bound          Description of the Parameter
     * @return                The boundPosition value
     * @exception  Exception  Description of the Exception
     */
    public int getBoundPosition(int dimension, int bound)
    throws Exception {
        if(isStatic[dimension][bound]) {
            throw new Exception(
                "bound[" + dimension + "," + bound
                + "] is static not dynamic");
        }
        return (int) positions[dimension][bound];
    }


    /**
     *  Sets the numParams attribute of the ArrayType object
     *
     * @param  num  The new numParams value
     */
    public void setNumParams(int num) {
        numparams = num;
    }


    /**
     * sets the bound of dimension to limit
     *
     * @param  dimension  The new staticBound value
     * @param  bound      The new staticBound value
     * @param  limit      The new staticBound value
     */
    public void setStaticBound(int dimension, int bound, int limit) {
        indices[dimension][bound] = limit;
        isStatic[dimension][bound] = true;
    }


    /**
     *  return formula for computing upper bound given the starting point of the
     *  array or array descriptor as an expression in base
     *
     *  For dynamic arrays the information is extracted from the run time descriptor
     *
     * @param  dimension      dimension for which upper bound is to be found, starts with 0
     * @param  base           base address of array or array descriptor
     * @return                The upb value as an ilcg formula
     * @exception  Exception  Description of the Exception
     */
    public Node getUpb(int dimension, Node base)
    throws Exception {
        if(!isStatic[dimension][1]) {
            if(symbolicIndices[dimension][1] != null) {
                return symbolicIndices[dimension][1];
            }
            return new Deref(
                       new Memref(
                           new Dyad(base,
                                    new Int((dimension + 1) * (3 * addrlength) - addrlength, Format.addressType),
                                    "+"),
                           Format.addressType));
        }
        return new Int(indices[dimension][1], Format.addressType);
    }


    /**
     *  return formula for computing lower bound given the starting point of the
     *  array or array descriptor as an expression in base. Dimensions start at 0.
     *
     *  For dynamic arrays the information is extracted from the run time descriptor
     *
     * @param  dimension      array dimension being queried
     * @param  base           base address of the descriptor or array
     * @return                The lwb value
     * @exception  Exception  Description of the Exception
     */
    public Node getLwb(int dimension, Node base)
    throws Exception {
        if(!isStatic[dimension][0]) {
            if(symbolicIndices[dimension][0] != null) {
                return symbolicIndices[dimension][0];
            }
            return new Deref(
                       new Memref(
                           new Dyad(base,
                                    new Int((dimension + 1) * (3 * addrlength) - 2 * addrlength, Format.addressType),
                                    "+"),
                           Format.addressType));
        }
        return new Int(indices[dimension][0], Format.addressType);
    }


    /**
     * derive a boolean condition that indicates a bounds fault for the specified dimension  using the
     *specified index, and assuming that the array or array descriptor is at address 'base'
     *
     * @param  dimension      Description of the Parameter
     * @param  base           Description of the Parameter
     * @param  index          Description of the Parameter
     * @return                The boundsFaultCondition value
     * @exception  Exception  Description of the Exception
     */
    public Node getBoundsFaultCondition(int dimension, Node base, Node index)
    throws Exception {
        // System.out.println("Get bounds fault condition "+dimension+"\nbase\t"+base+"\nindex\t"+index);
        Node u = getUpb(dimension, base);
        Node l = getLwb(dimension, base);
        Node test = new Dyad(new Dyad(index, l, "<"), new Dyad(index, u, ">"), "OR").eval();
        // System.out.println("test="+test);
        return test;
    }


    /**
     *  return formula for computing num bytes in dimension given the starting
     *  point of the array or array descriptor as an expression in base
     *
     * @param  dimension      Description of Parameter
     * @param  base           address of the descriptor or data
     * @return                The step value
     * @exception  Exception  Description of the Exception
     */
    public Node getStep(int dimension, Node base)
    throws Exception {
        // System.out.println("get step dimension "+dimension+"base "+base+"drank "+drank);
        // for dynamic array get it from the descriptor if it is not the last dimension
        Node res;
        try {
            if(isDynamic && (dimension < (drank - 1))) {
                Node step = computeStep(dimension, base).eval();// bug fix 21-03-02
                // if(step.knownAtCompileTime())res =step;        //  ditto
                // else
                res = new Deref(
                    new Memref(
                        new Dyad(base,
                                 new Int((dimension + 1) * (3 * addrlength), Format.addressType),
                                 "+"),
                        Format.addressType));
            }// otherwise return formula to compute it
            else {
                res = computeStep(dimension, base);
            }
        }
        catch(Exception ex) {
            System.out.println("in getStep" + ex);
            throw new Exception("Getstep " + ex);
        }
        // System.out.println("returns "+res);
        return res;
    }


    /**
     *  Gets the range attribute of the ArrayType object
     *
     * @param  dimension  Description of Parameter
     * @param  base       Description of Parameter
     * @return            The range value
     */
    public Node getRange(int dimension, Node base) {
        try {
            return new Dyad(new Dyad(getUpb(dimension, base), one, "+"),
                            getLwb(dimension, base), "-");
        }
        catch(Exception e) {
            System.out.println(e);
            return null;
        }
    }


    /**
     *  return formula for determining start of data given the starting point of
     *  the array or array descriptor in base
     *
     * @param  base  base address of array
     * @return       address of the start of the data
     */
    public Node getStartOfData(Node base) {
        if(isDynamic) {
            return new Deref(new Memref(base, Format.addressType));
        }
        return base;
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Returned Value
     */
    public int rank() {
        if(isDynamic) {
            return drank;
        }
        return indices.length;
    }


    /**
     *  Description of the Method
     *
     * @param  dimension      the dimension for which it is being computed, will cause error if this is
     *> rank-1
     * @param  base           base address of array or array descriptor
     * @return                formula for the step in bytes between sucessive elements on this dimensions
     * @exception  Exception  Description of the Exception
     */
    public Node computeStep(int dimension, Node base)
    throws Exception {
        Node res;
        // System.out.println("compute step"+dimension+" rank="+rank());
        if(rank() < dimension) {
            throw new Exception("rank " + rank() + "<" + dimension);
        }
        try {
            if(rank() == (dimension + 1)) {
                res = new Int(esize, Format.addressType);
                // System.out.println(res);
            }
            else {
                Node substep = computeStep(dimension + 1, base);
                res = new Dyad(new Cast(Format.addressType, getRange(dimension + 1, base)), substep, "*").eval();
            }
        }
        catch(Exception e4) {
            throw new Exception(
                " whilst computing step of array dimension\n"
                + e4.getMessage());
        }
        // System.out.println("Compute step for dimension "+dimension+" gives"+res);
        return res;
    }


    /**
     *  return the formula to compute the address of an array element given the
     *  indices and the starting point of the array or array descriptor, all as
     *  formulae
     *
     * @param  base           address of start of the array
     * @param  indices        the indices to be applied
     * @return                a memory reference formula to the element
     * @exception  Exception  Description of the Exception
     */
    public Node indexArray(Node base, Node[] indices)
    throws Exception {
        //
        if(indices.length != rank()) {
            throw new Exception(
                " compiler error attempt to index array of rank " + rank()
                + " with " + indices.length + " indices ");
        }
        return new Memref(
                   new Dyad(getStartOfData(base),
                            indexArrayOffset(base, indices, 0), "+"),
                   elemtype.type);
    }


    /**
     * Create an array that represents the contents of a descriptor to
     *the sub array indexed by the indices
     *
     * @param  base           Description of the Parameter
     * @param  indices        Description of the Parameter
     * @return                Description of the Return Value
     * @exception  Exception  Description of the Exception
     */
    public Node[] createSubArrayDescriptor(Node base, Node[] indices)
    throws Exception {
        if(indices.length >= rank()) {
            throw new Exception(
                " compiler error attempt subindex array of rank " + rank()
                + " with " + indices.length + " indices ");
        }
        int newrank = rank() - indices.length;
        // System.out.println("new rank is "+newrank);
        Node[] descriptor = new Node[3 * newrank];
        for(int i = 0; i < newrank; i++) {
            if(i == 0) {
                descriptor[i] = new Dyad(indexArrayOffset(base, indices, 0),
                                         getStartOfData(base), "+");
                // it holds the base address of the data
            }
            else {
                descriptor[i * 3] = getStep(indices.length + i - 1, base);// it holds the step size
            }
            descriptor[i * 3 + 1] = getLwb(indices.length + i, base);
            descriptor[i * 3 + 2] = getUpb(indices.length + i, base);
        }
        // System.out.println("descriptor");
        // for(int i=0;i<descriptor.length;i++)System.out.println(descriptor[i]);
        return descriptor;
    }


    /**
     * Create an array that represents the contents of a descriptor to
     *the sub array indexed by the pairs of subrange indices
     *
     * @param  base           Description of the Parameter
     * @param  indices        Description of the Parameter
     * @return                Description of the Return Value
     * @exception  Exception  Description of the Exception
     */
    public Node[] createSubArrayDescriptor(Node base, Node[][] indices)
    throws Exception {
        int i = 0;
        if(indices[0].length > rank()) {
            throw new Exception(
                " compiler error attempt subrange array of rank " + rank()
                + " with " + indices[0].length + " indices ");
        }
        int newrank = rank();
        // System.out.println("new rank is "+newrank);
        Node[] descriptor = new Node[3 * newrank];
        try {
            for(i = 0; i < newrank; i++) {
                if(i < indices[0].length) {
                    try {
                        // System.out.println("i is less than indice length");
                        descriptor[i * 3 + 1] = zero;
                        descriptor[i * 3 + 2] = new Dyad(indices[1][i],
                                                         indices[0][i], "-");
                    }
                    catch(Exception en2) {
                        System.out.println(
                            "in createsubarraydescriptor 1 i=" + i
                            + ", length descriptor=" + descriptor.length
                            + ", length indices=" + indices[0].length);
                        throw new Exception(
                            "Computing sub array descriptor 1 \n"
                            + en2.toString());
                    }
                }
                else {
                    descriptor[i * 3 + 1] = getLwb(i, base).eval();
                    descriptor[i * 3 + 2] = getUpb(i, base).eval();
                }
                if(i == 0) {
                    try {
                        // System.out.println("Building Dyadic Operation");
                        descriptor[i] = new Dyad(
                            indexArrayOffset(base, indices[0], 0),
                            getStartOfData(base), "+");
                        // it holds the base address of the data
                    }
                    catch(Exception en1) {
                        System.out.println(
                            "in createsubarraydescriptor 2 i=" + i
                            + ", length descriptor=" + descriptor.length
                            + ", length indices=" + indices[0].length);
                        throw new Exception(
                            "Computing sub array descriptor 2 \n"
                            + en1.toString());
                    }
                }
                else {
                    int dim = i - 1;
                    Node step = getStep(dim, base);
                    descriptor[i * 3] = step;// it holds the step size
                }
            }
        }
        catch(Exception en) {
            System.out.println(
                "in createsubarraydescriptor 3 i=" + i
                + ", length descriptor=" + descriptor.length
                + ", length indices=" + indices[0].length);
            throw new Exception(
                "Computing sub array descriptor 3\n" + en.toString());
        }
        /*
         *  for( i=0;i<descriptor.length;i++) {
         *  System.out.println(descriptor[i]);
         *  }
         */
        return descriptor;
    }


    /**
     *compute the base address of where an element in the array is
     *base gives the start of the array
     *indices is a vector of indices being used
     *dimension is the dimension currently being indexed, ( routine is recursive)
     *
     * @param  base           Description of the Parameter
     * @param  indices        Description of the Parameter
     * @param  dimension      Description of the Parameter
     * @return                Description of the Return Value
     * @exception  Exception  Description of the Exception
     */
    Node indexArrayOffset(Node base, Node[] indices, int dimension)
    throws Exception {
        if(indices.length==0)throw new Exception("zero length index list in indexArrayOffset");
        if(indices.length == (dimension + 1)) {
            Node RBI = lesslwb(indices[dimension], base, dimension);// rebased index
            //
            Node res = new Dyad(RBI, // new Cast(Format.addressType,RBI),
                                getStep(dimension, base), "*").eval();
            //
            return res;
        }
        else {
            Node offset = indexArrayOffset(base, indices, dimension + 1);
            //
            Node rebasedindex = lesslwb(indices[dimension], base, dimension);
            //
            Node res = new Dyad(new Dyad(rebasedindex, getStep(dimension, base), "*"), offset, "+").eval();
            // System.out.println("index array offset returns "+res);
            return res;
        }
    }


    /**
     *returns an expression for the rebased index of an
     *array obtained by taking the lower bound from the index
     *
     * @param  index          Description of the Parameter
     * @param  base           Description of the Parameter
     * @param  dimension      Description of the Parameter
     * @return                Description of the Return Value
     * @exception  Exception  Description of the Exception
     */
    Node lesslwb(Node index, Node base, int dimension)
    throws Exception {
        // System.out.println("less lwb , index="+index+" base="+base);
        Node lwb = getLwb(dimension, base);
        // System.out.println("Get LWB - " + lwb);
        return new Dyad(index, lwb, "-");
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Returned Value
     */
    public String toString() {
        String index = "";
        for(int i = 0; i < indices.length; i++) {
            index = index + (isStatic[i][0] ? " " + indices[i][0] : "*") + ".."
                    + (isStatic[i][1] ? " " + indices[i][1] : "*");
            if(i < indices.length - 1) {
                index = index + ",";
            }
        }
        return "array[" + index + "]of " + elemtype;
    }


    /**
     *  returns the type obtained by one level of subscription of the array
     *
     * @return    Description of the Returned Value
     */
    public Type subscriptedType() {
        if(rank() == 1) {
            return elemtype;
        }
        if(!isDynamic) {
            long[][] newindices = new long[rank() - 1][2];
            for(int i = 1; i < rank(); i++) {
                newindices[i - 1] = indices[i];
            }
            return new ArrayType(newindices, elemtype, esize);
        }
        return new ArrayType(rank() - 1, elemtype, esize);
    }


    /**
     *  Description of the Method
     *
     * @param  out              Description of Parameter
     * @exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out)
    throws IOException {
        throw new IOException("toBinary unimplemented in " + this);
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Returned Value
     */
    public long length() {
        return indices[0][1] - indices[0][0] + 1;
    }


    /**
     *  A method that is used by an examiner to visit all locations. This must call
     *  examine on all its subtrees if e.visit(this) is true.
     *
     * @param  e  Description of Parameter
     */
    public void examine(TreeExaminer e) { }





    /**
     *  given size in bytes this returns the array type representation
     *
     * @param  processor  Description of Parameter
     * @return            Description of the Returned Value
     */

    public String codeGenRepresentation(Walker processor) {
        if(isDynamic) {
            return "int" +(processor.getAddressLenInBytes()*8)+" vector ( " + rank() * 3 + " )";
        }

        if(elemtype instanceof SimpleType) try {
                return (elemtype.codeGenRepresentation(processor) + " vector ( "
                        + ((Num)(elementcount().eval()) ).intValue() + " )");
            } catch(Exception s) { // do nothing and fall through
                System.out.println("in codgenrepresentation of an array "+s);
                s.printStackTrace();
            }
        return "octet vector ( " + sizeOf(processor) + " )";
    }


    /**
     *  Description of the Method
     *
     * @param  j  Description of Parameter
     * @return    Description of the Returned Value
     */
    public String size2rep(long j) {
        long i = esize;
        String repe;
        if(i == 1) {
            repe = Node.octet;
        }
        else if(i == 2) {
            repe = Node.halfword;
        }
        else if(i == 4) {
            repe = Node.word;
        }
        else if(i == 8) {
            repe = Node.doubleword;
        }
        else {
            repe = elemtype.toString();
        }
        return repe + " vector ( " + j / i + " )";
    }


    /**
     *  return the number of bytes in an array element
     *
     * @param  processor  Description of Parameter
     * @return            Description of the Returned Value
     */
    public int elemsize(Walker processor) {
        return (int) elemtype.sizeOf(processor);
    }


    /**
     * retyurn the number of bytes in the header required for
     *a dynamic array, zero for static one. Dynamic arrays require
     *3 words   of header for each dimension
     *
     * @return    Description of the Return Value
     */
    public int headersize(Walker processor) {
        if(!isDynamic) {
            return 0;
        }
        return 3* processor.getAddressLenInBytes()* rank();
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Returned Value
     */
    public long elemsize() {
        return esize;
    }


    /**
     *  Description of the Method
     *
     * @param  processor  Description of Parameter
     * @return            Description of the Returned Value
     */
    public long sizeOf(Walker processor) {
        if(isDynamic) {
            return rank() * 3* processor.getAddressLenInBytes();
        }
        long elements = indices[0][1] - indices[0][0] + 1;
        for(int i = 1; i < indices.length; i++) {
            elements = elements * (indices[i][1] - indices[i][0] + 1);
        }
        if(processor.verbose)System.out.println("in "+toString()+".sizeof elements="+elements
                                                    +" elementsize ="+elemsize(processor));

        return elements * elemsize(processor);
    }


    /**
     *  Description of the Method
     *
     * @param  t  Description of Parameter
     * @return    Description of the Returned Value
     */
    public boolean equals(Type t) {
        if(!(t instanceof ArrayType)) {
            return false;
        }
        ArrayType a = (ArrayType) t;
        if(!a.elemtype.equals(elemtype)) {
            return false;
        }
        if(indices.length != a.indices.length) {
            return false;
        }
        int i;
        if(!isDynamic && !a.isDynamic) {
            for(i = 0; i < indices.length; i++) {
                if(indices[i][1] - indices[i][0]
                        != a.indices[i][1] - a.indices[i][0]) {
                    return false;
                }
                // if (indices[i][1] != a.indices[i][1]) {
                // return false;
                // }
            }
        }
        return isDynamic == a.isDynamic;
    }
}


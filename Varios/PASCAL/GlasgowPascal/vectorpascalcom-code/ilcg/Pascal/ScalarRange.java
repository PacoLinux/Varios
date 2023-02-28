package ilcg.Pascal;


interface ScalarRange {

    /**
     *  Description of the Method
     *
     *@return    highest value in range
     */
    long top();

    /**
     *  Description of the Method
     *
     *@return    lowest value in range
     */
    long bottom();

    /**
     *  Description of the Method
     *
     *@return    range of discrete values
     */
    double range();

    /** returns true if the representation is fully saturated
     that is if it can not hold any more numbers than the range */
    boolean fullrange();
}

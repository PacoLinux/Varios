
package viper;


import java.util.*;



/** Class that encapsulates a filename and ALL of its associated dependencies 
	* Essentially a record containing the filename and a list of files that it depends on */
class Project_Dependencies
	
	
{
	 /** file name*/
	 private String file;
	
	/** list of all dependent files */
	 private Vector depend;


	/** Creates a new Project_Dependency
		*@param f Filename of the file
		*@param d List of dependencies of the above file    
		* Essentially a record of a file and its related dependencies  
 */
	Project_Dependencies(String f,Vector d)
	{
		file= f;
		depend= d; 
		
	}

	/** returns the filename for this instance
		*@return Returns a String that represents the file name
	*/
	public String fileName()
	{
		return file;
	}	



	/** returns an array of files that this file is dependent on
		*@return returns a list of dependent files for this particular instance

 */
	public String[] dependentFiles()
	{
		String[] dependentfiles= new String[depend.size()];
		/* Put all values in to a String array */
		for(int i = 0; i < depend.size();i++)
		{
			System.out.println("m: "+depend.elementAt(i));
			dependentfiles[i]= depend.elementAt(i).toString();

		}

		return dependentfiles;
	}

	/** toString representation for Project_Dependencies
		*@return Overides the toString() for Objects - Returns a String representation
	*/
	public String toString() {
		
			String temp="";
			for(int a=0 ; a < depend.size(); a++)
				temp= temp  + " " + depend.elementAt(a);
			
			return file + temp;
	}

} // Project_Dependencies

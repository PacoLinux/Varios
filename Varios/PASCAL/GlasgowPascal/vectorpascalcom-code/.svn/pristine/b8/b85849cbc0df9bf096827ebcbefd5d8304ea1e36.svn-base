/* Class used for Smart Compiler */
package viper;
   import java.io.*;
   import java.util.*;

   import ilcg.tree.*;
   import ilcg.tree.Procedure;
   import ilcg.*;
class SmartComp {
	
	  /**
	   * Used for Smart Compiler to deserialize a Walker
	   * @return Walker w The deserialised Walker
	   * @param path path where walker is to be found
	   * @param fileName name of serialized file
	   */	  
	  public static Walker getWalker (String path, String fileName)
	  {
		  Walker w=null;
		  File progTree = new File(path,fileName);
		  if (progTree.exists())
		  {
			  try
			  {
				  FileInputStream fis = new FileInputStream(progTree);
				  ObjectInputStream ois = new ObjectInputStream(fis);
				  w= (Walker) ois.readObject();
				  ois.close();
				  return w;
			  }
			  catch(Exception e)
			  {
				  System.out.println("Deserialisation Failure " + e);
				  w= null;
				  return w;
			  }
		  }
		  return w;
	  }
	  
	  /**
	   * Used for Smart Compiler to serialize a Walker
	   * @param Walker w Walker to be serialized
	   * @param path path where walker is to be stored
	   * @param fileName name of serialized file
	   */
	  public static void putWalker ( Walker w, String path, String fileName)
	  {
		    File progTree = new File(path,fileName);
			try
			{
				FileOutputStream fos = new FileOutputStream(progTree);
				ObjectOutputStream oos = new ObjectOutputStream(fos);
				oos.writeObject(w);
				oos.flush();
				oos.close();
			}
			catch(Exception e)
			{
			     System.out.println("Serialisation Failure" + e);
			}
	  }

}
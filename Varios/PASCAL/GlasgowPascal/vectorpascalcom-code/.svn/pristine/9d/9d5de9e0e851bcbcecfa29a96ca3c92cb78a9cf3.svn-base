package viper;
import java.io.File.*;
import java.io.*;

public class ViperFileHandler extends java.io.File
{
	ViperFileHandler(File parent, String child){super(parent,child);}
	ViperFileHandler(String parent, String child){super(parent,child);}
	/**
	 * @author V.I.P.E.R Team
	 * @version 1.0
	 * @param to
	 * {@link}
	 */
	public void moveFile(File to){
		try{
			if (this.isFile()){	
				/*if (!to.isFile())
				to.*/
				FileReader fr = new FileReader(this);
				
				FileWriter fw = new FileWriter(to);
				BufferedReader br = new BufferedReader(fr);
				BufferedWriter bw = new BufferedWriter(fw);
				String temp;
				if (this.isFile()){
					while ((temp=br.readLine()) != null){
						bw.write(temp);
						bw.newLine();
						bw.flush();
					}
				}
				bw.close();
				br.close();
				fr.close();
				fw.close();
			}
		}
		catch (Exception e){}
	}
	
	/**
	 * @param fromParent source path
	 * @param fromChild source file name
	 * @param toParent destination path
	 * @param toChild destination file name
	 */
	public static void moveFile(String fromParent, String fromChild,String toParent, String toChild)
	{
		try{
	        File from = new File(fromParent,fromChild);
			File to = new  File (toParent,toChild);
			if (from.isFile()){	
				/*if (!to.isFile())
				to.*/
				FileReader fr = new FileReader(from);
				
				FileWriter fw = new FileWriter(to);
				BufferedReader br = new BufferedReader(fr);
				BufferedWriter bw = new BufferedWriter(fw);
				String temp;
				if (from.isFile())
				{
					while ((temp=br.readLine()) != null)
					{
						bw.write(temp);
						bw.newLine();
						bw.flush();
					}
				}
				bw.close();
				br.close();
				fr.close();
				fw.close();
			}
		}
		catch (Exception e){}
	}
	
	public static void moveFile(File from, File to)
	{
		try{
			
			if (from.isFile())
			{	
				/*if (!to.isFile())
				to.*/
				FileReader fr = new FileReader(from);
				
				FileWriter fw = new FileWriter(to);
				BufferedReader br = new BufferedReader(fr);
				BufferedWriter bw = new BufferedWriter(fw);
				String temp;
				if (from.isFile()){
					while ((temp=br.readLine()) != null){
						bw.write(temp);
						bw.newLine();
						bw.flush();
					}
				}
				bw.close();
				br.close();
				fr.close();
				fw.close();
			}
		}
		catch (Exception e){}
	}
	
	
	public static void setTimeStamps(String latestParent, String latestChild,String toParent, String toChild)
	{

		try{
			File from = new File(latestParent,latestChild);
			File to = new  File (toParent,toChild);
			long temp = System.currentTimeMillis();
			if (from.isFile()&&to.isFile())
			{
				from.setLastModified(temp);
				to.setLastModified(temp);
			
				
			}
		}
		catch (Exception e){}
	}
	
	
	public static boolean compareTimeStamps(String latestParent, String latestChild,String toParent, String toChild)
	{

		
		File from = new File(latestParent,latestChild);
		File to = new  File (toParent,toChild);
		long temp;
		if (from.isFile()&&to.isFile()){	
			temp = from.lastModified()-to.lastModified();
			return Math.abs(temp)<10000; 
		}
		
		return true;
	}
	
	public static void moveTo(String toPath,String fromPath,String filename)
	{
		try
		{
			
			//lets deal with the p.o file first.
			File fPath= new File (fromPath,filename);
			File tPath= new File (toPath,filename );
			if (fPath.exists())
			{//if the file exist move it

				if (tPath.exists())
				{ //if the to file does existed

					tPath.delete();//delete it
					tPath = new File(toPath,(filename));//if create a new
				}
				fPath.renameTo(tPath);//then move to file
			
			}
		}
		catch (Exception e)
		{			}
	}

public static void moveTo(String path, String fromPath,String filename,String toFilename )
	{
		try
		{
			
			//lets deal with the p.o file first.
			File fPath= new File (fromPath,filename);
			File tPath= new File (path,toFilename );
		
			if (fPath.exists())
			{//if the file exist move it
			
				if (tPath.exists())
				{ //if the to file does existed

					tPath.delete();//delete it
					tPath = new File(path,toFilename);//if create a new
				}
				fPath.renameTo(tPath);//then move to file
				
			}
		}
		catch (Exception e)
		{			}
	}

public static void moveFiles(String [] list)
	{
		try
		{
			for(int i =0;i<list.length;i++){
			File fPath= new File (list[i]);
			File tPath=new File(System.getProperty("user.dir"),getName(list[i])+".pas");
			if (fPath.isFile()){	
			
			
				FileReader fr = new FileReader(fPath);
				
				FileWriter fw = new FileWriter(tPath);
				BufferedReader br = new BufferedReader(fr);
				BufferedWriter bw = new BufferedWriter(fw);
				String temp;
				if (tPath.isFile())
				{
					while ((temp=br.readLine()) != null)
					{
						bw.write(temp);
						bw.newLine();
						bw.flush();
					}
				}
				bw.close();
				br.close();
				fr.close();
				fw.close();
				fPath =null;
				tPath =null;
			}
			}
		}
		catch (Exception e)
		{			}
	}


public static void deleteFile(File name){

	name.delete();
  
}

	 protected   static  String getName(String path)
	   {
		   String   str= System.getProperty("file.separator");
		   char ch= str.charAt(0);
		   int m=   path.lastIndexOf(ch);
		   int n=   path.length();
		   char buf[]= new char[n-m-5];
		   path.getChars(m+1,n-4,buf,0);
		   String   name= new String(buf);
		   return   name;
	   }
	
	public static void main(String args[]){
		boolean test;
		ViperFileHandler.setTimeStamps("/users/students3/level3/ronaesom/","hello.pas","/users/students3/level3/ronaesom/","demo.tex");
		test = ViperFileHandler.compareTimeStamps("/users/students3/level3/ronaesom/","hello.lst","/users/students3/level3/ronaesom/","demo.tex");
		System.out.println(test);
		
	}	
	
}//end ViperFileHandler

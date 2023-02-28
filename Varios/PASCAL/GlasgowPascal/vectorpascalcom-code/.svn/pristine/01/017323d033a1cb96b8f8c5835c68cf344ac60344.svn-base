/**
 * ListAllFiles.java - ListAllFiles class for use with the viper Project. 
 */

package viper;

import java.io.*;
import java.util.*;

public class ListAllFiles{

    Vector filevector;
    String rootdirectory = new String();
    MasterFilter filter;

    public ListAllFiles(String rootdirectory, String ext){
        this.rootdirectory = rootdirectory;
        filter = new MasterFilter(ext);
        filevector = new Vector();
        getList(rootdirectory);
    }

    public void getList(String path){	//recursively descend into each subdirectory
        String[] filelist;
        File startfile = new File(path);
        filelist = startfile.list(filter);//Gets the File array of files with no extension (directories)
        for (int i=0;i<filelist.length;i++){	// or given extension
        	File newfile=new File(path+System.getProperty("file.separator")+filelist[i]);
            if (newfile.isDirectory()){
                getList(newfile.getPath());		//gets the files within that subdirectory
            }
            else {
                filevector.addElement(newfile);
            }
        }
    }
}

/**
 * JSPFilter
 * This file is used by the viper class to identify recognized file types
 * for the viper editor
 */
package viper;

import java.io.*;


public class JspFilter extends SpecialFileFilters
{
    /**
     * Determines if the filter can accept the file type based on the name of the file
     * @param f The File in question
     * @return <b>true</b> if the given File has the .jsp extension. Otherwise it returns <b>false</b>
     */
    public boolean accept(File f)
    {
        boolean accept = super.accept(f);
        if (!accept)
        {
            String suffix = getSuffix(f);
            if (suffix != null)
                accept = suffix.startsWith("jsp");
        }
        return accept;
    }

    /**
     * Returns the description of the file type(s) that this filter recognizes.
     * @return String Description of the file types that this filter will accept.
     */
    public String getDescription()
    {
        return "Java Server Pages (*.jsp)";
    }
}


package viper;
import java.io.*;
/** FileFilter Class for .tex file extension.
 */
class TeXFilter extends SpecialFileFilters
{ 
/**  * 
 * @param f 
 */
public boolean accept(File f)
{
boolean accept = super.accept(f);
if (!accept)
{
String suffix = getSuffix(f);
if (suffix != null)
accept = suffix.equals("tex");
}
return accept;
}
/** return description of this type of filter.
 */
public String getDescription()
{
return "TeX Files(*.tex)";
}
}
    

/*
 * 23:17:37 20/03/99
 *
 * RemoveSpaces.java
 */

package viper;

import javax.swing.text.Element;
import javax.swing.text.Document;
import javax.swing.text.BadLocationException;

import org.gjt.sp.jedit.textarea.*;

public class RemoveSpaces
{
  public RemoveSpaces(JEditTextArea textArea)

  {
    textArea.beginCompoundEdit();
    Document doc = textArea.getDocument();
    try
    {
      Element map = doc.getDefaultRootElement();
      int count = map.getElementCount();
      for (int i = 0; i < count; i++)
      {
        Element lineElement = map.getElement(i);
        int start = lineElement.getStartOffset();
        int end = lineElement.getEndOffset() - 1;
        end -= start;
        String text = doRemove(textArea.getText(start, end));
	if (text != null)
	{
          doc.remove(start, end);
          doc.insertString(start, text, null);
	}
      }
      textArea.endCompoundEdit();
    } catch (BadLocationException ble) { }
  }

  private String doRemove(String in)
  {
    int off = in.length() - 1;
    if (off < 0) return null;
    StringBuffer buf = new StringBuffer();
    while (in.charAt(off) == ' ')
      if (--off < 0) break;
    for (int i = 0; i < off + 1; i++)
      buf.append(in.charAt(i));
    return buf.toString();
  }
}

// End of RemoveSpaces.java

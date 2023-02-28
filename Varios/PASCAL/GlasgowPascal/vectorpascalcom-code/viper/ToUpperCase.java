/*
 * ToUpperCase.java
 */

package viper;

import javax.swing.text.Element;
import javax.swing.text.Document;
import javax.swing.text.BadLocationException;

import org.gjt.sp.jedit.textarea.*;

public class ToUpperCase
{

  public ToUpperCase(JEditTextArea textArea)
  {
    textArea.beginCompoundEdit();
    String selection = textArea.getSelectedText();
    if (selection != null)
    {
      textArea.setSelectedText(selection.toUpperCase());
    } else {
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
          int tabSize = textArea.getTabSize();
          String text = textArea.getText(start, end).toUpperCase();
          doc.remove(start, end);
          doc.insertString(start, text, null);
        }
      } catch (BadLocationException ble) { }
    }
    textArea.endCompoundEdit();
  }
}

// End of ToUpperCase.java

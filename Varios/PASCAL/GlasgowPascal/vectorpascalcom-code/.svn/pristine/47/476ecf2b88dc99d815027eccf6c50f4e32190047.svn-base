/*
 * 16:43:35 17/11/99
 *
 * RightIndent.java
 */

package viper;

import javax.swing.text.Element;
import javax.swing.text.Document;
import javax.swing.text.BadLocationException;

import org.gjt.sp.jedit.textarea.*;

public class RightIndent
{


  public RightIndent(JEditTextArea textArea)
  {
    Document doc = textArea.getDocument();
    textArea.beginCompoundEdit();
    try
    {
      int tabSize = textArea.getTabSize();
      boolean noTabs = textArea.getSoftTab();
      Element map = textArea.getDocument().getDefaultRootElement();
      int start = map.getElementIndex(textArea.getSelectionStart());
      int end = map.getElementIndex(textArea.getSelectionEnd());
      for (int i = start; i <= end; i++)
      {
        Element lineElement = map.getElement(i);
        int lineStart = lineElement.getStartOffset();
        String line = doc.getText(lineStart, lineElement.getEndOffset() - lineStart - 1);
        int whiteSpace = ViperUtilities.getLeadingWhiteSpace(line);
        int whiteSpaceWidth = ViperUtilities.getLeadingWhiteSpaceWidth(line, tabSize) + tabSize;
        doc.remove(lineStart, whiteSpace);
        doc.insertString(lineStart, ViperUtilities.createWhiteSpace(whiteSpaceWidth,
	                 (noTabs ? 0 : tabSize)), null);
      }
    } catch(BadLocationException ble) {
      ble.printStackTrace();
    }
    textArea.endCompoundEdit();
  }
}

// End of RightIndent.java

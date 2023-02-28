/*
 * SimpleComment.java
 */

package viper;

import javax.swing.text.*;
import javax.swing.text.BadLocationException;

import org.gjt.sp.jedit.textarea.*;



public class SimpleComment
{


  public SimpleComment(JEditTextArea textArea)
  {
    String comment = "//";
    if (comment == null)
      return;
    comment = comment + ' ';

    Document doc = textArea.getDocument();

    int selectionStart = textArea.getSelectionStart();
    int selectionEnd = textArea.getSelectionEnd();
    Element map = doc.getDefaultRootElement();
    int startLine = map.getElementIndex(selectionStart);
    int endLine = map.getElementIndex(selectionEnd);

    textArea.beginCompoundEdit();

    try
    {
      doc.insertString(selectionStart, comment, null);
      for (int i = startLine + 1; i <= endLine; i++)
        doc.insertString(map.getElement(i).getStartOffset(), comment, null);
    } catch(BadLocationException ble) { }
    textArea.setCaretPosition(textArea.getCaretPosition());
    textArea.endCompoundEdit();
  }
}

// End of SimpleComment.java

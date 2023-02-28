/*
 
 */

package viper;

import javax.swing.text.Element;
import javax.swing.text.Document;
import javax.swing.text.BadLocationException;

import org.gjt.sp.jedit.textarea.*;

public class BoxComment
{

  public BoxComment(JEditTextArea textArea)
  {

    Document doc = textArea.getDocument();
    String commentStart =" /**";
    String commentEnd = "*/";
    String boxComment = " * ";
    if (commentStart == null || commentEnd == null || boxComment == null) return;
    commentStart = commentStart + ' ';
    commentEnd = ' ' + commentEnd;
    boxComment = boxComment + ' ';
    int selectionStart = textArea.getSelectionStart();
    int selectionEnd = textArea.getSelectionEnd();
    Element map = doc.getDefaultRootElement();
    int startLine = map.getElementIndex(selectionStart);
    int endLine = map.getElementIndex(selectionEnd);
    textArea.beginCompoundEdit();
    try
    {
      Element lineElement = map.getElement(startLine);
      int start = lineElement.getStartOffset();
      doc.insertString(Math.max(start , selectionStart), commentStart, null);
      for(int i = startLine +1; i < endLine; i++)
      {
        lineElement = map.getElement(i);
        start = lineElement.getStartOffset();
        doc.insertString(start, boxComment, null);
      }
      lineElement = map.getElement(endLine);
      start = lineElement.getStartOffset();
      doc.insertString(start, boxComment, null);
      doc.insertString(Math.max(start, textArea.getSelectionEnd()), "\n"+commentEnd, null);
      textArea.setCaretPosition(textArea.getCaretPosition());
    } catch(BadLocationException ble) { }
    textArea.endCompoundEdit();
  }
}

// End of BoxComment.java

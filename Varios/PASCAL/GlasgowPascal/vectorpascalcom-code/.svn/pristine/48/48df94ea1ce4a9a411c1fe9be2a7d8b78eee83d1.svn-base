/*
 * DeleteLine.java
 */

package viper;

import javax.swing.text.Element;

import javax.swing.text.BadLocationException;

import org.gjt.sp.jedit.textarea.*;

public class DeleteLine
{
  public DeleteLine(JEditTextArea textArea)
  {

    try
    {
      Element map = textArea.getDocument().getDefaultRootElement();
      Element lineElement = map.getElement(map.getElementIndex(textArea.getCaretPosition()));
      int start = lineElement.getStartOffset();
      int end = lineElement.getEndOffset();
      if (end == textArea.getDocument().getLength() + 1) end--;
      textArea.getDocument().remove(start, end - start);
      // parent.updateStatus(textArea);
    } catch (BadLocationException ble) { }
  }
}

// End of DeleteLine.java

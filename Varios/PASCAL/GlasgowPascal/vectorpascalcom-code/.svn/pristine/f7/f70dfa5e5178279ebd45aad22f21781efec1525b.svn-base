/**
 * StatusBar.java 
 */
package viper;

import java.awt.*;
import java.awt.event.*;
import javax.swing.text.*;
import javax.swing.*;

import org.gjt.sp.jedit.textarea.*;

public class StatusBar extends JPanel
{

    static JLabel msgline;
    static JLabel lineIndicator;

    public StatusBar()
    {
        GridBagLayout gridbag = new GridBagLayout();
        GridBagConstraints c = new GridBagConstraints();
        c.weightx = 2.5;
        setLayout(gridbag);
        c.fill = GridBagConstraints.HORIZONTAL;
        c.weightx = 2.0;
        msgline = new JLabel("Viper - by The Viper Team");
        //        msgline.setBorder(BorderFactory.createLoweredBevelBorder());
        msgline.setHorizontalAlignment(JLabel.LEFT);
        msgline.setFont(new Font("dialog", 0, 11));
        gridbag.setConstraints(msgline, c);
        c.weightx = 0.5;
        lineIndicator = new JLabel();
        //        lineIndicator.setBorder(BorderFactory.createLoweredBevelBorder());
        lineIndicator.setHorizontalAlignment(JLabel.RIGHT);
        lineIndicator.setFont(new Font("dialog", 0, 11));
        gridbag.setConstraints(lineIndicator, c);
        setBorder(BorderFactory.createLoweredBevelBorder());
        add(((Component)msgline));
        add(lineIndicator);
    }

    /**
     * Update status label which displays informations about caret's position.
     * @param textArea The text area which caret status has to be updated
     */

    public void updateStatus(JEditTextArea textarea)
    {
        int off = textarea.getCaretPosition();

        Element map =textarea.getDocument().getDefaultRootElement();
        int currLine = map.getElementIndex(off);

        Element lineElement = map.getElement(currLine);
        int start = lineElement.getStartOffset();
        int end = lineElement.getEndOffset();
        int numLines = map.getElementCount();

        lineIndicator.setText("Line: " + (currLine + 1) +
                              "/" + numLines + " Column: "+ (off - start + 1) + ":" + (end - start) + " - " + (((currLine + 1) * 100) / numLines) + "%");
    }


}
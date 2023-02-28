/**
 * Find.java - Find/Replace class for use with the viper Project.
 */

package viper;

//import java.awt.*;
 
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.Insets;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.JDialog;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.KeyStroke;
import javax.swing.text.Keymap;import javax.swing.*;

import org.gjt.sp.jedit.textarea.JEditTextArea;

/**
 * This dialog supports the search/replace text functionality.
 *
 * history
 * 17 July 2000: changed to GridBagLayout, cleaned up variable names, etc. 
 * 12 July 2000: set default button for dialog to find_next button and 
 *						disabled enter key awt compatibility for find text field.
 */
public class Find extends JDialog implements ActionListener
{
	JButton findNextButton;
    JButton replaceButton;
    JButton replaceAllButton;
    JButton cancelButton;
    JTextField findText;
    JTextField replaceWithText;
    JLabel findTextLabel;
    JLabel replaceWithLabel;
    JCheckBox matchCaseCheckBox;
    int pos;
    int count;
    int a;
    int newcounter;	static String lnfName = null;
    static JEditTextArea editor;

    public Find(JFrame parent, JEditTextArea text,String Lnf)
    {
        super(parent, "Find/Replace", false);
			//String Lnf = "Metal";
			try
			{		    if (Lnf.startsWith("Metal"))
               lnfName = "javax.swing.plaf.metal.MetalLookAndFeel";
            else if (Lnf.startsWith("Window"))
               lnfName ="com.sun.java.swing.plaf.windows.WindowsLookAndFeel";
            else if (Lnf.startsWith("CDE/Motif"))
               lnfName = "com.sun.java.swing.plaf.motif.MotifLookAndFeel";
            else
               lnfName = UIManager.getCrossPlatformLookAndFeelClassName();
            UIManager.setLookAndFeel(lnfName);
			}			            catch (Exception exc)
            {
               System.err.println("Error loading L&F: " + exc);
            }
		init();
		ViperUtilities.centerComponentChild(parent,this);
    }

	protected void init()
	{
		GridBagLayout layout;
		GridBagConstraints cons;

		layout = new GridBagLayout();
		cons = new GridBagConstraints();

		getContentPane().setLayout(layout);

		findTextLabel = new JLabel("Find Text:");
		cons.gridx = 0;
		cons.gridy = 0;
		cons.fill = GridBagConstraints.NONE;
		cons.anchor = GridBagConstraints.EAST;
		cons.gridwidth = 1;
		cons.gridheight = 1;
		cons.insets = new Insets(0, 10, 0, 10);
		layout.setConstraints(findTextLabel, cons);
		getContentPane().add(findTextLabel);

		findText = new JTextField(14);
		findText.setEditable(true);
		cons.gridx = 1;
		cons.gridy = 0;
		cons.fill = GridBagConstraints.HORIZONTAL;
		cons.anchor = GridBagConstraints.WEST;
		cons.gridwidth = 2;
		cons.gridheight = 1;
		cons.insets = new Insets(0, 0, 0, 0);
		layout.setConstraints(findText, cons);
		getContentPane().add(findText);

        findNextButton = new JButton("Find Next");
		cons.gridx = 3;
		cons.gridy = 0;
		cons.fill = GridBagConstraints.BOTH;
		cons.anchor = GridBagConstraints.CENTER;
		cons.gridwidth = 1;
		cons.gridheight = 1;
		cons.insets = new Insets(10, 10, 5, 10);
		layout.setConstraints(findNextButton, cons);
		getContentPane().add(findNextButton);

		replaceWithLabel = new JLabel("Replace With:");
		cons.gridx = 0;
		cons.gridy = 1;
		cons.fill = GridBagConstraints.NONE;
		cons.anchor = GridBagConstraints.EAST;
		cons.gridwidth = 1;
		cons.gridheight = 1;
		cons.insets = new Insets(0, 10, 0, 10);
		layout.setConstraints(replaceWithLabel, cons);
		getContentPane().add(replaceWithLabel);

        replaceWithText = new JTextField(14);
		cons.gridx = 1;
		cons.gridy = 1;
		cons.fill = GridBagConstraints.HORIZONTAL;
		cons.anchor = GridBagConstraints.WEST;
		cons.gridwidth = 2;
		cons.gridheight = 1;
		cons.insets = new Insets(0, 0, 0, 0);
		layout.setConstraints(replaceWithText, cons);
		getContentPane().add(replaceWithText);

        replaceButton = new JButton("Replace");
		cons.gridx = 3;
		cons.gridy = 1;
		cons.fill = GridBagConstraints.BOTH;
		cons.anchor = GridBagConstraints.CENTER;
		cons.gridwidth = 1;
		cons.gridheight = 1;
		cons.insets = new Insets(0, 10, 5, 10);
		layout.setConstraints(replaceButton, cons);
		getContentPane().add(replaceButton);
         
		matchCaseCheckBox = new JCheckBox("Match Case",new ImageIcon("viper/resources/rb.gif"));			//------------oro---------------
    //matchcase = new JCheckBox("Match Case",new ImageIcon("viper/resources/rb.gif"));
    matchCaseCheckBox.setPressedIcon(new ImageIcon("viper/resources/rbp.gif"));
	matchCaseCheckBox.setRolloverIcon(new ImageIcon("viper/resources/rbr.gif"));	matchCaseCheckBox.setRolloverSelectedIcon(new ImageIcon("viper/resources/rbrs.gif"));	matchCaseCheckBox.setSelectedIcon(new ImageIcon("viper/resources/rbs.gif"));
	matchCaseCheckBox.setFocusPainted(false);
	matchCaseCheckBox.setBorderPainted(false);
	matchCaseCheckBox.setContentAreaFilled(false);
	matchCaseCheckBox.setMargin(new Insets(0,0,0,0));
	//-----------oro----------------------------
		cons.gridx = 1;
		cons.gridy = 2;
		cons.fill = GridBagConstraints.NONE;
		cons.anchor = GridBagConstraints.CENTER;
		cons.gridwidth = 1;
		cons.gridheight = 1;
		cons.insets = new Insets(10, 10, 0, 10);
		layout.setConstraints(matchCaseCheckBox, cons);
		getContentPane().add(matchCaseCheckBox);

        replaceAllButton = new JButton("Replace All");
		cons.gridx = 3;
		cons.gridy = 2;
		cons.fill = GridBagConstraints.BOTH;
		cons.anchor = GridBagConstraints.CENTER;
		cons.gridwidth = 1;
		cons.gridheight = 1;
		cons.insets = new Insets(0, 10, 5, 10);
		layout.setConstraints(replaceAllButton, cons);
		getContentPane().add(replaceAllButton);

		cancelButton = new JButton("Cancel");
		cons.gridx = 3;
		cons.gridy = 4;
		cons.fill = GridBagConstraints.BOTH;
		cons.anchor = GridBagConstraints.CENTER;
		cons.gridwidth = 1;
		cons.gridheight = 1;
		cons.insets = new Insets(0, 10, 10, 10);
		layout.setConstraints(cancelButton, cons);
		getContentPane().add(cancelButton);

        findNextButton.addActionListener(this);
        replaceButton.addActionListener(this);
        replaceAllButton.addActionListener(this);
        cancelButton.addActionListener(this);

        setResizable(true);
		pack();

		// disable awt compatibility for find text field so that the enter key will work for default button
		KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
		Keymap map = findText.getKeymap();
		map.removeKeyStrokeBinding(enter);

		getRootPane().setDefaultButton(findNextButton);
	}

    public void actionPerformed(ActionEvent event)
    {
        Object source = event.getSource();
        if (source == cancelButton)
        {
            setVisible(false);
        }
        //Replace the Text
        if (source == replaceButton)
            replace();

        // Find the Text
        if (source == findNextButton)
            find();

        // Find & Replace all text in one operation.
        if (source == replaceAllButton)
            replaceAll();

    }

    public void find()
    {
        String str;
        String txt;
        count = 0;
        a = 0;

        if (matchCaseCheckBox.isSelected())
        {
            txt = editor.getText();
            str = (String)findText.getText();
        }
        else
        {
            txt = editor.getText().toLowerCase();
            str = findText.getText().toLowerCase();
        }

        pos = txt.indexOf(str, editor.getSelectionEnd() + newcounter);

        if (pos >= 0)
		{
            editor.select(pos, pos + str.length());
		}
    }

    public void replace()
    {
        int start;
        int end;

		start = editor.getSelectionStart();
		end = editor.getSelectionEnd();

        if (end > start)
		{
            editor.setSelectedText(replaceWithText.getText());
		}

        editor.select(start, start + replaceWithText.getText().length());
        find();
    }

	public void setVisible(boolean visible)
	{
		super.setVisible(visible);

		if (visible)
		{
			findText.requestFocus();
			findText.setCaretPosition(0);
			findText.moveCaretPosition(findText.getText().length());
		}
	}

    public void replaceAll()
    {
        editor.select(0, 0);

        while (pos >= 0)
		{
            replace();
		}
    }
}

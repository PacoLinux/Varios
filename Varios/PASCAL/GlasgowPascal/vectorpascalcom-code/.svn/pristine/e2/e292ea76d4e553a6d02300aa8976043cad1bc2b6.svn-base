/**
 * Editor.java - Editor class for use with the viper Project 
 */

package viper;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import javax.swing.*;
import javax.swing.text.*;
import javax.swing.event.*;
import javax.swing.undo.*;
import java.net.URL;
import java.util.*;

import org.gjt.sp.jedit.syntax.*;
import org.gjt.sp.jedit.textarea.*;


public class Editor extends JTextArea
{
    private JSFormatter jsbeautifier;
    private CompoundEdit compoundEdit;
    protected static int num_windows = 0;
    protected static int window_num = 0;
    JEditTextArea textarea;
    protected UndoableEditListener undoHandler = new UndoHandler();

    /**
    * UndoManager that we add edits to.
    */
    protected UndoManager undo = new UndoManager();

    File file;
    String filename;
    String title;
    static boolean dontopen = false;
    String path;
    Viper viper;
    public Editor(Viper parent, String str, File importfile)
    {
        super(str);
        viper = parent;

        if(importfile!=null)file = importfile;
        else file=null;
        textarea=new JEditTextArea();
        textarea.setBackground(Color.white);
        textarea.getPainter().setFont(new Font(viper.props.FONTSTYLE, 0, viper.props.FONTSIZE));
        setTabSize(getTabSize());
        textarea.setEditable(true);
        if (str.startsWith("Html"))
            setDocumentStyle(".html");
		else if (str.startsWith("TeX"))
            setDocumentStyle(".tex");
        else if (str.startsWith("Vector Pascal"))
            setDocumentStyle(".pas");
        else if (str.startsWith("Untitled"))
            setDocumentStyle("");
        jsbeautifier=new JSFormatter();
        textarea.setRightClickPopup(viper.popup);
        textarea.addCaretListener(new CaretHandler());
        textarea.getDocument().addUndoableEditListener(undoHandler);
        if(viper.props.AUTOINDENT)textarea.setAutoIndentOn();
        	else textarea.setAutoIndentOff();

    }

    public String getTitle()
    {
        return (title);
    }
    public String setTitle(String setTitle)
    {
        title = setTitle;
        return title;
    }

    void SetActiveWindow()
    {
        viper.activeChild = this;
        viper.statusBar.msgline.setText("Current Window : " + this.getTitle());
        if (viper.activeChild.getTitle().toLowerCase().endsWith(".pas"))
            viper.speedbar.parse();
		else if (viper.activeChild.getTitle().toLowerCase().endsWith(".tex"))
			viper.speedbar.parseTex();
        Find.editor = textarea;
    }
    public void setDirtyTitle(){
        viper.tabbedPane2.setForegroundAt(viper.tabbedPane2.getSelectedIndex(), Color.red.darker());
    }
    void load(String filename)
    {
        StringBuffer sb = new StringBuffer();
        try
        {
            FileReader fis = new FileReader(file);
            BufferedReader br = new BufferedReader(fis);
            String str = br.readLine();
            while (str != null)
            {
                sb.append(str);
                sb.append("\n");
                str = br.readLine();
            }
            fis.close();
            setDocumentStyle(file.getName());
            setTitle(file.getName());
            textarea.setText(sb.toString());
        }
        catch (Exception err)
        {
        }
    }

    void close()
    {
        int selectedValue = 1;
        if (textarea.isDirty() == true)
            selectedValue = SaveConfirm(
                                this.getTitle(), "File not Saved, Save Now?");
        if (selectedValue == 0)
        {
            if (file != null)
                SaveFile(false);
            else
                SaveFile(true);
            selectedValue = 1;
        }
        if (selectedValue == 1)
        {
            String str;
            for (int i = 0; i < viper.window.getItemCount(); i++)
            {
                if (viper.window.getItem(i) == null)
                {
                    continue;
                }
                str = viper.window.getItem(i).getText();
                if (str == this.getTitle())
                    viper.window.remove(i);
            }
            viper.children.removeElement((Object)this);
            viper.tabbedPane2.removeTabAt(viper.tabbedPane2.indexOfTab(
                                             this.getTitle()));
            if (viper.children.isEmpty())
            {
                viper.statusBar.msgline.setText("No current Window Set");
                viper.activeChild = null;
                viper.speedbar.removeList();
            }
            else
                viper.GetWindow(new File(viper.tabbedPane2.getTitleAt(
                                            viper.tabbedPane2.getSelectedIndex())));
        }
    }
	public boolean SaveReply()
	{
		SaveFile(false);
		return true;
	}
	
    public void SaveFile(boolean saveas)
    {
        boolean saveAs=saveas;
        if(file==null)saveAs=true;
        JFileChooser fileChooser = new JFileChooser(viper.CURRENTDIR);
        if (saveAs)
        {
            fileChooser.addChoosableFileFilter(new TeXFilter());
            fileChooser.addChoosableFileFilter(new HtmlFilter());
            //fileChooser.addChoosableFileFilter(new JspFilter());
			//fileChooser.addChoosableFileFilter(new JavaFilter());
            fileChooser.setFileFilter(new VPasFilter());

            int selected = fileChooser.showSaveDialog(this);
            if (selected == JFileChooser.APPROVE_OPTION){
                file = fileChooser.getSelectedFile();
                fileChooser.setCurrentDirectory(file);
                viper.CURRENTDIR=fileChooser.getCurrentDirectory();
            }
            else
                return;
        }
        try
        {
            viper.statusBar.msgline.setText("Saving Document " + file.getName());
            FileWriter fos = new FileWriter(file.getPath());
            fos.write(this.textarea.getText());
            fos.close();
            viper.statusBar.msgline.setText( file.getName()+" Saved.");
            textarea.clean();
            viper.tabbedPane2.setForegroundAt(viper.tabbedPane2.getSelectedIndex(), Color.black);

        }
        catch (Exception err)
        {
            viper.statusBar.msgline.setText("Error : " + err);
        }
        if (saveAs){

            for (int i = 0; i < viper.window.getItemCount(); i++)
            {

                if (viper.window.getItem(i)==null)
                {
                    continue;
                }
                if (this.getTitle().equals(viper.window.getItem(i).getText()))
                    viper.window.remove(i);
            }
            viper.children.removeElement((Object)this);
            viper.tabbedPane2.setTitleAt(
                viper.tabbedPane2.getSelectedIndex(), file.getName());
            setTitle(file.getName());
            viper.addChild(viper, this);
        }
    }
    int SaveConfirm(String confirmTitle, String confirmText)
    {
        int value;
        value = JOptionPane.showConfirmDialog(
                    this, confirmText, confirmTitle, JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE);
        return value;
    }

    public void Goto()
    {
        String nameExtension = JOptionPane.showInputDialog("Goto Line:");

        if(nameExtension==null)System.out.println("");
        if ((nameExtension!=null)&&(nameExtension.trim().length() >0))
        {
            try
            {
                int lineno = Integer.valueOf(nameExtension).intValue() - 1;
                System.out.println(""+lineno );
                if (lineno <= textarea.getLineCount() && lineno>0)
                    gotoLine(lineno);
            }
            catch (NumberFormatException e)
            {
            }
        }
    }
    public void gotoLine(int line)
    {

        Element elemen3 = textarea.getDocument().getDefaultRootElement();
        Element elemen4 = elemen3.getElement(line);
        textarea.select(
            ((int)elemen4.getStartOffset()), elemen4.getEndOffset());
    }
    public int getTabSize()
    {
        int tabSize = viper.props.TABSIZE;
        return tabSize;
    }

    /**
     * See getTabSize().
     * 
     * @param size The new tab size (in amount of spaces)
     */
    public void setTabSize(int size)
    {
        try
        {
            ((PlainDocument)textarea.getDocument()).putProperty(((PlainDocument)textarea.getDocument()).tabSizeAttribute, new Integer
                    (size));
            textarea.setTabSize(size);
        }
        catch (NumberFormatException nfe)
        {
            ((PlainDocument)textarea.getDocument()).putProperty(((PlainDocument)textarea.getDocument()).tabSizeAttribute, new Integer
                    (4));
            textarea.setTabSize(4);
        }
    }
  
    public void indent()
    {
        try{
            JSFormatter format = new JSFormatter();
            format.setBracketBreak(true);
            format.beautifier.setSpaceIndentation(getTabSize());
            format.init();
            Document doc = textarea.getDocument();
            Element map = doc.getDefaultRootElement();

            String line;
            int i = 0, start, end;
            StringBuffer buf = new StringBuffer(doc.getLength());
            try
            {
                while (true)
                {
                    while (!format.hasMoreFormattedLines())
                    {
                        if (i > map.getElementCount()) throw new NullPointerException();
                        Element lineElement = map.getElement(i);
                        start = lineElement.getStartOffset();
                        end = lineElement.getEndOffset() - 1;
                        end -= start;
                        line = textarea.getText(start, end);
                        if (line == null) throw new NullPointerException();
                        format.formatLine(line);
                        i++;
                    }
                    while (format.hasMoreFormattedLines())
                        buf.append(format.nextFormattedLine() + '\n');
                }
            } catch (NullPointerException npe) { }

            doc.remove(0, doc.getLength());
            doc.insertString(0, buf.toString(), null);

            format.summerize();
            while (format.hasMoreFormattedLines())
                doc.insertString(doc.getLength(), format.nextFormattedLine() + '\n', null);
        } catch (BadLocationException ble) { }
    }
    public void setDocumentStyle(String str)
    {
        //if (str.toLowerCase().endsWith(".java") || str.toLowerCase().endsWith(
        //            ".jav")) textarea.setTokenMarker(new JavaTokenMarker());
	  if (str.toLowerCase().endsWith(".pas"))
	       textarea.setTokenMarker(new VPasTokenMarker());
      else if (str.toLowerCase().endsWith(".htm") || str.toLowerCase().endsWith(".html"))
            textarea.setTokenMarker(new HTMLTokenMarker());
        //else if (str.toLowerCase().endsWith(".jsp"))
        //    textarea.setTokenMarker(new JSPTokenMarker());
        //else if (str.toLowerCase().endsWith(".c") || str.toLowerCase().endsWith
        //         (".cpp"))
        //    textarea.setTokenMarker(new CTokenMarker());
        //else
        //textarea.setTokenMarker(new TeXTokenMarker());
	 else if (str.toLowerCase().endsWith(".tex"))
			textarea.setTokenMarker(new TeXTokenMarker());
	 else if (str.toLowerCase().endsWith(".prj"))
			textarea.setTokenMarker(new TextTokenMarker());
	 else if (str.toLowerCase().endsWith(".txt"))
		    textarea.setTokenMarker(new TextTokenMarker());
	 else 
		textarea.setTokenMarker(new VPasTokenMarker());
    }
    class UndoHandler implements UndoableEditListener
    {

        /**
         * Messaged when the Document has created an edit, the edit is added 
         * to <code>undo</code>, an instance of UndoManager.
         */
        public void undoableEditHappened(UndoableEditEvent e)
        {
            undo.addEdit(e.getEdit());

            // undoAction.update();
            // redoAction.update();

        }
    }
    void redoAction()
    {
        try
        {
            undo.redo();
        }
        catch (CannotRedoException ex)
        {
            System.out.println("Unable to redo: " + ex);
            ex.printStackTrace();
        }
    }
    void undoAction()
    {
        try
        {
            undo.undo();
        }
        catch (CannotUndoException ex)
        {
            System.out.println("Unable to undo: " + ex);
            ex.printStackTrace();
        }
		
		
    }
	public boolean isDirty(){
			return textarea.isDirty();					 
		}
    class CaretHandler implements CaretListener
    {
        public void caretUpdate(CaretEvent evt)
        {
            viper.statusBar.updateStatus(textarea);
            if(textarea.isDirty() && viper.tabbedPane2.getForegroundAt(viper.tabbedPane2.getSelectedIndex())!=Color.red.darker())viper.tabbedPane2.setForegroundAt(viper.tabbedPane2.getSelectedIndex(), Color.red.darker());
            
        //    if(viper.props.AUTOINDENT)textarea.setAutoIndentOn();
       //     	else textarea.setAutoIndentOff();
        }
    }

}
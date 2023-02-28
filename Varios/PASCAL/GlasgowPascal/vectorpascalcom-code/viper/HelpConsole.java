//compare test

/**
 * HelpConsole.java - Help class for use with the Viper Project 
 */
package viper;

import javax.swing.*;
import javax.swing.event.*;
import javax.swing.text.html.*;
import java.awt.*;
import java.io.*;
import java.net.*;


/** HelpConsole class to display Help files within a Viper Editor Window.
 * 
 */
public class HelpConsole extends JPanel
{
    /**      * 
     */
    Viper viper;
    /**      * 
     */
    JEditorPane helpConsole;
    /**      */
    public HelpConsole(Viper parent)
    {
        helpConsole = new JEditorPane();
        showPage("docs/intro.htm");
        helpConsole.addHyperlinkListener(createHyperLinkListener());
        viper.tabbedPane2.add(new JScrollPane(helpConsole), "- Help -");
        viper.tabbedPane2.setSelectedIndex(viper.tabbedPane2.getTabCount() - 1);
        viper.children.addElement((Object)this);
        viper.statusBar.msgline.setText("Help Window");
        viper.window.add(viper.windowitem = new JMenuItem("- Help -"));
        viper.windowitem.setFont(new Font("dialog", Font.PLAIN, 11));
        viper.windowitem.addActionListener(parent);
    }
    /** Add a listener so that we can detect when somebody has clicked on a link.
     * 
     */
    public HyperlinkListener createHyperLinkListener() {
        return new HyperlinkListener() {
                   /** Try to open new a new page when a link has be selected.
                    * 
                    * @param e 
                    */
                   public void hyperlinkUpdate(HyperlinkEvent e) {
                       if (e.getEventType() == HyperlinkEvent.EventType.ACTIVATED) {
                           if (e instanceof HTMLFrameHyperlinkEvent) {
                               ((HTMLDocument)helpConsole.getDocument()).processHTMLFrameHyperlinkEvent(
                                   (HTMLFrameHyperlinkEvent)e);
                           } else {
                               try {
                                   helpConsole.setPage(e.getURL());
                               } catch (IOException ioe) {
                                   System.out.println("IOE: " + ioe);
                               }
                           }
                       }
                   }
               };
    }

    /** Display the HTML page.
     * 
     * @param page 
     */
    public void showPage(String page)
    {
        helpConsole.setEditable(false);
        URL pageURL = getClass().getResource(page);
        try
        {
            helpConsole.setPage(pageURL);
        }
        catch (java.io.IOException ioe)
        {
            System.out.println("IOExecption while loading page.");
        }
    }

    /** Close the Help Window, and tidy up Viper Editor.
     * 
     */
    public void close(){
        String str;
        for (int i = 0; i < viper.window.getItemCount(); i++)
        {
            if (viper.window.getItem(i) == null)
            {
                continue;
            }
            str = viper.window.getItem(i).getText();
            if (str.equals("- Help -"))
                viper.window.remove(i);
        }
        viper.children.removeElement((Object)this);
        viper.tabbedPane2.removeTabAt(viper.tabbedPane2.indexOfTab("- Help -"));
    }
}


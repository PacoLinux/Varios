package ilcg.Pascal;


import java.io.*;
import java.util.*;


public class ProgressNotifier implements Serializable {
    public void done(String message, int line) {
        System.out.print(
            "\r " + line + " " + message + "                              ");
    }
}

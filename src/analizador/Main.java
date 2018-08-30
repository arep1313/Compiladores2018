/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package analizador;

import java.io.File;

/**
 *
 * @author Carlos
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //String path = "C:\\Users\\betic\\Documents\\URL\\8vo Ciclo\\Compiladores\\analizadorLexico2-Java\\src\\analizador\\Lexer.flex";
        String path = "C:\\Users\\betic\\Documents\\URL\\8vo Ciclo\\Compiladores\\analizadorLexico2-Java\\src\\analizador\\minicsharp.flex";
        generarLexer(path);
    
    }
    public static void generarLexer(String path){
        File file=new File(path);
        JFlex.Main.generate(file);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

/**
 *
 * @author Jaakko
 */
public class InputOutputCleaner {
    
    public static String clean(String inputOutputString){

        try {
            inputOutputString = inputOutputString.replace('<', ' ');
            inputOutputString = inputOutputString.replace('>', ' ');
            
        } catch (Exception e) {
            System.out.println("ERROR IN: InputOutputCleaner");
            
        }
        
        return inputOutputString;
    }
    
    public static boolean hasNoWhitespaces(String stringToCheck){
        
        boolean hasNoWhitespace = true;
        
        if(stringToCheck.contains(" ")){
            System.out.println("STRING HAS WHITESPACE");
            hasNoWhitespace = false;
        }
        
        return hasNoWhitespace;
    }
}

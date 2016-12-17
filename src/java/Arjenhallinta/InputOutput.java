/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

/**
 *
 * class provides two methods, clean() is used to remove < > marks
 * in order to avoid XSS vulnerability, while hasNoWhitespaces()
 * can be used to check if string has any whitespaces (for example
 * when changing password)
 */
public class InputOutput {
    
    public static String clean(String inputOutputString){

        if(inputOutputString != null){
            inputOutputString = inputOutputString.replace('<', ' ');
            inputOutputString = inputOutputString.replace('>', ' ');
        }else{
            inputOutputString = "";
        }
        
        return inputOutputString;
    }
    
    public static boolean hasNoWhitespaces(String stringToCheck){
        
        boolean hasNoWhitespace = true;
        
        if(stringToCheck.contains(" ")){
            hasNoWhitespace = false;
        }
        
        return hasNoWhitespace;
    }
}

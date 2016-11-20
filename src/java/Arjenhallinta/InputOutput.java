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
public class InputOutput {
    
    public static String clean(String inputOutputString){

        if(inputOutputString != null){
            inputOutputString = inputOutputString.replace('<', ' ');
            inputOutputString = inputOutputString.replace('>', ' ');
        }else{
            System.out.println("InputOutput.clean : STRING THAT WAS NULL WAS SET TO EMPTY");
            inputOutputString = "";
        }
        
        /*//Old implementation
        try {
            inputOutputString = inputOutputString.replace('<', ' ');
            inputOutputString = inputOutputString.replace('>', ' ');
            
        } catch (Exception e) {
            System.out.println("ERROR IN: InputOutputCleaner");
            
        }
        */
        
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

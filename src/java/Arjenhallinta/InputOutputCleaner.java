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
    
    public String cleanInputOutput(String input){

        try {
            input = input.replace('<', ' ');
            input = input.replace('>', ' ');
            
        } catch (Exception e) {
            System.out.println("ERROR IN: InputOutputCleaner");
            
        }
        
        return input;
    }
}

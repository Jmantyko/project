/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

/**
 *
 * Class used to print all the frontpage content
 * in etusivu.jsp
 */
public class Content {

    private String content;
    
    public Content(String contentContent) {
        content = contentContent;
    }
    
    public String getContent(){
        return content;
    }
}

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
public class Content {
    
    private int id;
    private String content;
    
    public Content(int contentID, String contentContent) {
        id = contentID;
        content = contentContent;
    }
    
    public int getID(){
        return id;
    }
    
    public String getContent(){
        return content;
    }
}

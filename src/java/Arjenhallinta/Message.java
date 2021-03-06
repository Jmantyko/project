/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Arjenhallinta;

/**
 *
 * objects of this class are used to carry all messages related
 * to certain exercise: used in customer.jsp and in admincustomerdetails.jsp
 * to print conversations
 */
public class Message {
    
    private int messageid;
    private String usertype;
    private String messagecontent;
    private String messagedate;
    
    public Message(int messageID, String userType, String messageContent, String messageDate) {
        messageid = messageID;
        usertype = userType;
        messagecontent = messageContent;
        messagedate = messageDate;
    }
    
    public int getMessageID(){
        return messageid;
    }
    
    public String getMessageUserType(){
        return usertype;
    }
    
    public String getMessageContent(){
        return messagecontent;
    }
    
    public String getMessageDate(){
        return messagedate;
    }
}

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
public class Memo1 {
    
    private int id;
    private String time;
    private String doing;
    private String suojapercentage;
    private String tehtpercentage;
    
    public Memo1(int memoID, String memoTime, String memoDoing,
            String memoSuojaPercentage, String memoTehtPercentage) {
        id = memoID;
        time = memoTime;
        doing = memoDoing;
        suojapercentage = memoSuojaPercentage;
        tehtpercentage = memoTehtPercentage;
    }
    
    public int getMemoID(){
        return id;
    }
    
    public String getMemoTime(){
        return time;
    }
    
    public String getMemoDoing(){
        return doing;
    }
    
    public String getMemoSuojaPercentage(){
        return suojapercentage;
    }
    
    public String getMemoTehtPercentage(){
        return tehtpercentage;
    }
}

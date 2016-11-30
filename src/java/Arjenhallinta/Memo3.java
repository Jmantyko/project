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
public class Memo3 {
    
    private int id;
    private String time;
    private String doing;
    private String positivepercentage;
    private String negativepercentage;
    private String tehtpercentage;
    
    public Memo3(int memoID, String memoTime, String memoDoing,
            String memoPositivePercentage, String memoNegativePercentage, String memoTehtPercentage) {
        id = memoID;
        time = memoTime;
        doing = memoDoing;
        positivepercentage = memoPositivePercentage;
        negativepercentage = memoNegativePercentage;
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
    
    public String getMemoPositivePercentage(){
        return positivepercentage;
    }
    
    public String getMemoNegativePercentage(){
        return negativepercentage;
    }
    
    public String getMemoTehtPercentage(){
        return tehtpercentage;
    }
}

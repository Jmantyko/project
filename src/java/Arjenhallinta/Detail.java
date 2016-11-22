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
public class Detail {
    
    private int detailid;
    private String detailage;
    private String detailresidencemodel;
    private String detaillifestyle;
    private String detailhealthservices;
    private String detailproblems;
    
    public Detail(int detailID, String detailAge, String detailResidencemodel, String detailLifestyle, String detailHealthServices, 
            String detailProblems) {
        detailid = detailID;
        detailage = detailAge;
        detailresidencemodel = detailResidencemodel;
        detaillifestyle = detailLifestyle;
        detailhealthservices = detailHealthServices;
        detailproblems = detailProblems;
    }
    
    public int getDetailID(){
        return detailid;
    }
    
    public String getDetailAge(){
        return detailage;
    }
    
    public String getDetailResidencemodel(){
        return detailresidencemodel;
    }
    
    public String getDetailLifestyle(){
        return detaillifestyle;
    }
    
    public String getDetailHealthservices(){
        return detailhealthservices;
    }
    
    public String getDetailProblems(){
        return detailproblems;
    }
}

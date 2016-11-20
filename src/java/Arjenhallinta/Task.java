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
public class Task {
    
    private int taskid;
    private int tasktypeid;
    private String taskcontent;
    
    public Task(int taskID, int taskTypeID, String taskContent) {
        taskid = taskID;
        tasktypeid = taskTypeID;
        taskcontent = taskContent;
    }
    
    public int getTaskID(){
        return taskid;
    }
    
    public int getTaskTypeID(){
        return tasktypeid;
    }
    
    public String getTaskContent(){
        return taskcontent;
    }
}

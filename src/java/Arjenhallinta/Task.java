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
    private boolean taskisreturned;
    private boolean taskisclosed;
    
    public Task(int taskID, int taskTypeID, String taskContent, boolean taskIsReturned, boolean taskIsClosed) {
        taskid = taskID;
        tasktypeid = taskTypeID;
        taskcontent = taskContent;
        taskisreturned = taskIsReturned;
        taskisclosed = taskIsClosed;
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
    
    public boolean getTaskIsReturned(){
        return taskisreturned;
    }
    
    public boolean getTaskIsClosed(){
        return taskisclosed;
    }
}

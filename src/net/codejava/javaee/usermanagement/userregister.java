/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.codejava.javaee.usermanagement;

/**
 *
 * @author Om prakash
 */
public class userregister {
    private int id;
    private String name;
    private String password;
    private String conpass;
    private String activity;
    private String ques;
    private String ans;

    public userregister() {
    }

    public userregister(int id, String name, String password, String conpass, String activity, String ques, String ans) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.conpass = conpass;
        this.activity = activity;
        this.ques = ques;
        this.ans = ans;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConpass() {
        return conpass;
    }

    public void setConpass(String conpass) {
        this.conpass = conpass;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getQues() {
        return ques;
    }

    public void setQues(String ques) {
        this.ques = ques;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }
    
    
    
}

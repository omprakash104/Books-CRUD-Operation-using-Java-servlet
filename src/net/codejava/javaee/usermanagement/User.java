package net.codejava.javaee.usermanagement;

import java.sql.Date;

/**
 * User.java
 This is a model class represents a book entity
 * @author www.codejava.net
 *
 */
public class User {
	protected int id;
	protected String name;
	protected String email;
	protected String password;
        protected String conpass;
        protected Date date;

	public User() {
	}

	public User(int id) {
		this.id = id;
	}

    public User(String name) {
        this.name = name;
    }

        
        
    public User(String name, String email, String password, String conpass) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.conpass=conpass;
    }

    public User(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    String getconpass() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

	

}

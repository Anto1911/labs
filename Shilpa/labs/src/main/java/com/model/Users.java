/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.*;


/**
 *
 * @author 236336
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users")
public class Users implements Serializable{
    @XmlElement(name = "user")
    private List<User> users= new ArrayList();

    public Users() {
        super();
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
    
    public void add(User user){
        this.users.add(user);
    }
    public void remove(User user){
        this.users.remove(user);
    }
    
    public User user(String email, String password){
        return this.users.stream().filter(user -> user.login(email, password)).findAny().orElse(null);
    }
    
    public User user(String email){
        return this.users.stream().filter(user -> user.match(email)).findAny().orElse(null);
    }
    
        public User user(int ID){
        return this.users.stream().filter(user -> user.match(ID)).findAny().orElse(null);
    }
}

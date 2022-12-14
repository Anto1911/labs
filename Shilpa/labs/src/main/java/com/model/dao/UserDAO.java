/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dao;

import com.model.User;
import com.model.Users;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.io.StringWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author 236361
 */
public class UserDAO implements Serializable{
    private String fileName;
    private Users users;

    public UserDAO() {
    }

    public UserDAO(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName){
        try {
            this.fileName = fileName;
            System.out.println("this.fileName = "+this.fileName);
            JAXBContext jc = JAXBContext.newInstance(Users.class);
            Unmarshaller um= jc.createUnmarshaller();
            FileInputStream fin = new FileInputStream(fileName);   
            users = (Users) um.unmarshal(fin);
        } catch (JAXBException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Users getUsers() {
        return users;
    }
    
    public String marshal(Users users,String filename) {
        StringWriter writer = new StringWriter();
        try {
            
            JAXBContext jc = JAXBContext.newInstance(Users.class);
            Marshaller m = jc.createMarshaller();
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            FileOutputStream fout = new FileOutputStream(filename);
            m.marshal(users, fout);
        //m.marshal(users, System.out);  //this is used to prove that the objects are mapped to XML
            fout.close();
            
        } catch (JAXBException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            return writer.toString();
        }
    }

    public void setUsers(Users users) {
        this.users = users;
    }   
    
    public void save(Users users, String filename)
    {
        try {
            this.users = users;
            this.fileName = filename;
            System.out.println("this.fileName = "+this.fileName);
            JAXBContext jc = JAXBContext.newInstance(Users.class);
            Marshaller m = jc.createMarshaller();
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            FileOutputStream fout = new FileOutputStream(filename);
            m.marshal(users, fout);
            m.marshal(users, System.out);
            fout.close();
        } catch (JAXBException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Users read(String filename){
        try {
            this.fileName = filename;
            JAXBContext jc = JAXBContext.newInstance(Users.class);
            Unmarshaller um= jc.createUnmarshaller();
            FileInputStream fin = new FileInputStream(filename);
            users = (Users) um.unmarshal(fin);            
        } catch (JAXBException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            return users;
        }
    }
    
    public void update(Users users, User other){
        this.users = users;
        this.users.remove(other);
        save(this.users, fileName);
        this.users.add(other);
        save(this.users, fileName);
    }
    public void delete(Users users, User user){
        this.users = users;
        this.users.remove(user);
        save(this.users, fileName);
    }
    
}




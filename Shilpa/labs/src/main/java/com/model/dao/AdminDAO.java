/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dao;


import com.model.Admins;
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
public class AdminDAO implements Serializable{
    private String fileName;
    private Admins admins;

    public AdminDAO() {
    }

    public AdminDAO(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName){
        try {
            this.fileName = fileName;
            System.out.println("this.fileName = "+this.fileName);
            JAXBContext jc = JAXBContext.newInstance(Admins.class);
            Unmarshaller um= jc.createUnmarshaller();
            FileInputStream fin = new FileInputStream(fileName);   
            admins = (Admins) um.unmarshal(fin);
        } catch (JAXBException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Admins getAdmins() {
        return admins;
    }

    public void setAdmins(Admins admins) {
        this.admins = admins;
    }

    
    
    public String marshal(Admins admins,String filename) {
        StringWriter writer = new StringWriter();
        try {
            
            JAXBContext jc = JAXBContext.newInstance(Admins.class);
            Marshaller m = jc.createMarshaller();
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            FileOutputStream fout = new FileOutputStream(filename);
            m.marshal(admins, fout);
        //m.marshal(admins, System.out);  //this is used to prove that the objects are mapped to XML
            fout.close();
            
        } catch (JAXBException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            return writer.toString();
        }
    }

     
    
    public void save(Admins admins, String filename)
    {
        try {
            this.admins = admins;
            this.fileName = filename;
            System.out.println("this.fileName = "+this.fileName);
            JAXBContext jc = JAXBContext.newInstance(Admins.class);
            Marshaller m = jc.createMarshaller();
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            FileOutputStream fout = new FileOutputStream(filename);
            m.marshal(admins, fout);
            m.marshal(admins, System.out);
            fout.close();
        } catch (JAXBException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Admins read(String filename){
        try {
            this.fileName = filename;
            JAXBContext jc = JAXBContext.newInstance(Admins.class);
            Unmarshaller um= jc.createUnmarshaller();
            FileInputStream fin = new FileInputStream(filename);
            admins = (Admins) um.unmarshal(fin);            
        } catch (JAXBException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            return admins;
        }
    }
    
}




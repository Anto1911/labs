/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model.dao;

import com.model.Users;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.util.JAXBSource;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

/**
 *
 * @author 236361
 */
public class XMLTransformer {

    public XMLTransformer() {
    }
    
    public void transform(String xslPath,Users users, StreamResult result){
        try {
            TransformerFactory tf = TransformerFactory.newInstance();
            StreamSource xslSource = new StreamSource(xslPath);
            
            JAXBContext jc = JAXBContext.newInstance(Users.class);
            JAXBSource xmlSource = new JAXBSource(jc,users);
            
            Transformer transformer = tf.newTransformer(xslSource);
            transformer.transform(xmlSource, result);
            //to be commented
            StreamResult systemOutResult = new StreamResult(System.out);
            transformer.transform(xmlSource, systemOutResult);
            
        } catch (JAXBException ex) {
            Logger.getLogger(XMLTransformer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(XMLTransformer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(XMLTransformer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

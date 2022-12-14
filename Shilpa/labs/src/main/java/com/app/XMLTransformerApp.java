/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app;

import com.model.Users;
import com.model.dao.UserDAO;
import com.model.dao.XMLTransformer;
import javax.xml.transform.stream.StreamResult;

/**
 *
 * @author 236361
 */
public class XMLTransformerApp {
    public static void main(String[] args) {
        XMLTransformer transformer = new XMLTransformer();
        String xslPath = "src\\main\\webapp\\XSL\\users.xsl";
        UserDAO userDAO = new UserDAO();
        String xmlPath = "src\\main\\webapp\\WEB-INF\\users.xml";
        userDAO.setFileName(xmlPath);
        Users users = userDAO.getUsers();
        String output = "src\\main\\webapp\\output.html";
        transformer.transform(xslPath, users, new StreamResult(output));
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.desire.ds.dao;

import com.desire.ds.entities.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author NUR MOHAMMAD
 */
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    public UserDao() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    //get user by email and password
    public User getUserByEmailAndPassword(String email, String password)
    {
        User user = null;
        try{
            String query ="from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
             Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            
            user = (User) q.uniqueResult();
            
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    public List<User> getAllUser(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from User");
        List<User> list = query.list();
        return list;
    }
}

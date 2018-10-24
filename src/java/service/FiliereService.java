/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Employe;
import beans.Filiere;
import dao.IDao;
import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author rania.lagrich
 */
public class FiliereService implements IDao <Filiere> {

    @Override
    public void create(Filiere o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        session.close(); 
    }

    @Override
    public void delete(Filiere o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void update(Filiere o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(o);
        session.getTransaction().commit();
        session.close(); 
    }

    @Override
    public List<Filiere> findAll() {
       List <Filiere> filieres = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        filieres = session.createQuery("from Filiere").list();
        session.getTransaction().commit();
        session.close();
        return filieres;
    }

    @Override
    public Filiere findById(int id) {
       Filiere u = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        u = (Filiere) session.get(Filiere.class, id);
        session.getTransaction().commit();
        session.close();  
        return u;
    }
    
}

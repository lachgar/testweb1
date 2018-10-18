/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Service;
import dao.IDao;
import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author a
 */
public class ServiceService implements IDao<Service>{

    @Override
    public void create(Service o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        session.close();               
    }

    @Override
    public void delete(Service o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(o);
        session.getTransaction().commit();
        session.close();       
    }

    @Override
    public void update(Service o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(o);
        session.getTransaction().commit();
        session.close();       
    }

    @Override
    public List<Service> findAll() {
        List <Service> services = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        services = session.createQuery("from Service").list();
        session.getTransaction().commit();
        session.close();
        return services;
    }

    @Override
    public Service findById(int id) {
        Service u = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        u = (Service) session.get(Service.class, id);
        session.getTransaction().commit();
        session.close();  
        return u;
    }
    
}

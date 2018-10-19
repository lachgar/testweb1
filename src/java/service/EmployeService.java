/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Employe;
import dao.IDao;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author a
 */
public class EmployeService implements IDao<Employe>{

    @Override
    public void create(Employe o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        session.close();               
    }

    @Override
    public void delete(Employe o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(o);
        session.getTransaction().commit();
        session.close();       
    }

    @Override
    public void update(Employe o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(o);
        session.getTransaction().commit();
        session.close();       
    }

    @Override
    public List<Employe> findAll() {
        List <Employe> employes = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        employes = session.createQuery("from Employe").list();
        session.getTransaction().commit();
        session.close();
        return employes;
    }

    @Override
    public Employe findById(int id) {
        Employe u = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        u = (Employe) session.get(Employe.class, id);
        session.getTransaction().commit();
        session.close();  
        return u;
    }
    
    public List<Employe> FindBetweenDates(Date d1, Date d2){
        List<Employe> ee = null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.beginTransaction();
        ee = s.getNamedQuery("empBetweenDates").setParameter(0, d1).setParameter(1, d2).list();
        s.getTransaction().commit();
        s.close();
        
        return ee;
    }
    
}

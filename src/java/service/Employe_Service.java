/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import beans.Employe;
import dao.IDao;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author a
 */
public class Employe_Service implements IDao<Employe>{

    @Override
    public void create(Employe o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        session.close();               
    }
    
    public int createWithIDFeedBack(Employe o){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        session.close();  
        
        return o.getId();
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
    
    public List<Object[]> FindBetweenDates(int id,Date d1, Date d2){
        List<Object[]> ee = null;
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.beginTransaction();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        ee =  s.createQuery("SELECT e,es FROM EmployeService es,Employe e WHERE es.employe.id = e.id AND es.service.id = "+id+" AND es.id.dateDebut BETWEEN '"+sdf.format(d1)+"' AND '"+sdf.format(d2)+"'").list();
        s.getTransaction().commit();
        s.close();
        
        return ee;
    }
    
    public List<Object[]> findEmploye() {
        List<Object[]> mList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        mList =  session.createQuery("SELECT e,es FROM EmployeService es,Employe e WHERE es.employe.id = e.id ").list();
        session.getTransaction().commit();
        session.close();  
        return mList;
    }
    public List<Object[]> findEmployesByServiceId(int id ) {
        List<Object[]> mList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        mList =  session.createQuery("SELECT e,es FROM EmployeService es,Employe e WHERE es.employe.id = e.id And es.service.id ="+id).list();
        session.getTransaction().commit();
        session.close();  
        return mList;
    }
    
    public int CountEmployesByServiceName(String nom){
        int nb = 0;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        nb = Integer.parseInt( session.createQuery("SELECT COUNT(es) FROM EmployeService es WHERE es.service.nom ="+nom).uniqueResult().toString());
        session.getTransaction().commit();
        session.close(); 
        return nb;
    }
}

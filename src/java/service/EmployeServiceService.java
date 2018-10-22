/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.IDao;
import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;
import beans.EmployeService;

/**
 *
 * @author Sinponzakra
 */
public class EmployeServiceService implements IDao<EmployeService> {

    @Override
    public void create(EmployeService o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void delete(EmployeService o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(o);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void update(EmployeService o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<EmployeService> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public EmployeService findById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public EmployeService findByEmployeId(int id) {
        EmployeService es = null;
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        es = (EmployeService) session.createQuery("SELECT es FROM EmployeService es WHERE es.employe.id ="+id).uniqueResult();
        session.getTransaction().commit();
        session.close();
        
        return es;
    }

}

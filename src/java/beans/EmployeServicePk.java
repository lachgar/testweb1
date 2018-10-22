/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;


/**
 *
 * @author a
 */
@Embeddable
public class EmployeServicePk implements Serializable{
    private int employe;
    private int service;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateDebut;

    public EmployeServicePk(int employe, int service, Date dateDebut) {
        this.employe = employe;
        this.service = service;
        this.dateDebut = dateDebut;
    }

    public EmployeServicePk() {
    }
    
    

    public int getEmploye() {
        return employe;
    }

    public void setEmploye(int employe) {
        this.employe = employe;
    }

    public int getService() {
        return service;
    }

    public void setService(int service) {
        this.service = service;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }
    
    
    
    
}

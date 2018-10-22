/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;

/**
 *
 * @author a
 */
@Entity
public class EmployeService {
    @EmbeddedId
    private EmployeServicePk id;
    @JoinColumn(name = "service", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne
    private Service service;
    @JoinColumn(name = "employe", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne 
    private Employe employe;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateFin;
    
    public EmployeService() {
    }

    public EmployeService(EmployeServicePk id, Service service, Employe employe, Date dateFin) {
        this.id = id;
        this.service = service;
        this.employe = employe;
        this.dateFin = dateFin;
    }
    
    

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    
    public EmployeServicePk getId() {
        return id;
    }

    public void setId(EmployeServicePk id) {
        this.id = id;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Employe getEmploye() {
        return employe;
    }

    public void setEmploye(Employe employe) {
        this.employe = employe;
    }
    
    
}

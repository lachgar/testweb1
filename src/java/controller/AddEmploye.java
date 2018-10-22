/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.Employe;
import beans.EmployeService;
import beans.EmployeServicePk;
import com.google.gson.Gson;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.Employe_Service;
import service.EmployeServiceService;
import service.ServiceService;

/**
 *
 * @author Sinponzakra
 */
@WebServlet(name = "AddEmploye", urlPatterns = {"/AddEmploye"})
public class AddEmploye extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String date = request.getParameter("dateNaissance");
            String dateDebut = request.getParameter("dateDebut");
            String dateFin = request.getParameter("dateFin");
            int service = Integer.parseInt(request.getParameter("service"));
            
                           
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dN = sdf.parse(date);
            Date dD = sdf.parse(dateDebut);
            Date dF = null;
            
            if(!dateFin.isEmpty()){
                dF = sdf.parse(dateFin);
            }
            
            Employe_Service es = new Employe_Service();
            EmployeServiceService ess = new EmployeServiceService();
            ServiceService ss = new ServiceService();
            
            
            if (request.getParameter("idupdate") != "") {
                int id = Integer.parseInt(request.getParameter("idupdate"));
                Employe e1 = es.findById(id);
                e1.setNom(nom);
                e1.setPrenom(prenom);
                e1.setDateNaissance(dD);
                es.update(e1);
                ess.delete(ess.findByEmployeId(id));
                EmployeService es1 = new EmployeService(new EmployeServicePk(id, service, dD), ss.findById(service), e1, dF);
                ess.create(es1);
                
            } else {
                Employe e = new Employe(nom,prenom,dD);
                int EmpID = es.createWithIDFeedBack(e);
                EmployeServicePk pk = new EmployeServicePk(EmpID, service, dD);
                ess.create(new beans.EmployeService(pk, ss.findById(service), e, null));
            }
            response.setContentType("application/json");
            new Gson().toJson(es.findEmploye(), response.getWriter());
        } catch (ParseException ex) {
            Logger.getLogger(AddEmploye.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AddEmploye.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

<%-- 
    Document   : tables
    Created on : Oct 18, 2018, 9:03:45 PM
    Author     : mst
--%>

<%@page import="java.util.List"%>
<%@page import="beans.Service"%>
<%@page import="service.ServiceService"%>
<%@page import="beans.Employe"%>
<%@page import="service.Employe_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employes</title><meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">


        <!-- Bootstrap Core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- DataTables CSS -->
        <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

        <!-- Custom CSS --> 
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="../script/script.js" type="text/javascript"></script>
        <script src="../script/moment.js" type="text/javascript"></script>
    </head>

    <body>

        <div id="wrapper">

            <%@ include file="NavbarMenu.jsp" %>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Gestion des Employes</h1>
                    </div>
                    <!-- /.col-lg-12 -->

                    <legend style="margin-left: 2%">Ajouter un Employe</legend> 

                    <table border="0">

                        <tr>               
                            <td><label style="margin-bottom: 5%">Nom :</label></td>
                            <td></td>
                            <td><input style="margin-bottom: 5%" class="form-control" type="text" name="nom" id="nom"/></td>

                        </tr>

                        <tr>               
                            <td><label style="margin-bottom: 5%">Prenom :</label></td>
                            <td></td>
                            <td><input style="margin-bottom: 5%" class="form-control" type="text" name="prenom" id="prenom"/></td>

                        </tr>
                        <tr>               
                            <td><label style="margin-bottom: 5%">Date Naissance :</label></td>
                            <td></td>
                            <td><input style="margin-bottom: 5%" class="form-control" type="date" name="dateNaissance" id="dateNaissance"/></td>

                        </tr>
                        <tr>               
                            <td><label style="margin-bottom: 5%">Service :</label></td>
                            <td></td>
                            <td><select style="margin-bottom: 5%" class="form-control" id="service" name="service">
                                    <% ServiceService ss = new ServiceService();
                                        for (Service s : ss.findAll()) {
                                    %>
                                    <option value="<%=s.getId()%>"><%= s.getNom()%></option>
                                    <%}%>
                                </select>
                            </td>

                        </tr>
                        <tr>               
                            <td><label style="margin-bottom: 5%" >Date Debut :</label></td>
                            <td></td>
                            <td><input style="margin-bottom: 5%"  class="form-control" type="date" name="dateDebut" id="dateDebut"/></td>

                        </tr>
                        <tr hidden="true" id="hiddenDate">               
                            <td><label>Date Fin :</label></td>
                            <td></td>
                            <td><input class="form-control" type="date" name="dateFin" id="dateFin"/></td>

                        </tr>
                        <tr>
                            <td></td>
                            <td><br><button style="margin-left: 180%" value="Valider" id="save" class="btn btn-success">Ajouter</button><br></td>
                            <td><br></td>

                        </tr>

                    </table>
                    <br>
                    <input type="hidden" id="idupdate" name="idupdate" value="" />



                </div>
                <!-- /#page-wrapper -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Tableau des Employes
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Nom</th>
                                                <th>Prenom</th>
                                                <th>Date Naissance</th>
                                                <th>Service</th>
                                                <th>Date Debut</th>
                                                <th>Date Fin</th>
                                                <th>Suprimer</th>
                                                <th>Modifier</th>
                                            </tr>
                                        </thead>
                                        <tbody id="mTable">
                                            <%
                                                Employe_Service es = new Employe_Service();
                                                String sd = "-----";
                                                for (Object[] o : es.findEmploye()) {
                                                    Employe emps = (Employe) o[0];
                                                    beans.EmployeService empss = (beans.EmployeService) o[1];

                                                    if (empss.getDateFin() != null) {
                                                        sd = empss.getDateFin().toString();
                                                    }

                                            %>
                                            <tr>
                                                <td><%= emps.getId()%></td>
                                                <td><%= emps.getNom()%></td>
                                                <td><%= emps.getPrenom()%></td>
                                                <td><%= empss.getId().getDateDebut()%></td>
                                                <td><%= empss.getService().getNom()%></td>
                                                <td><%= empss.getId().getDateDebut()%></td>
                                                <td><%= sd%></td>
                                                <td><Button onclick="DeleteEmploye(<%=emps.getId()%>)" class="btn btn-danger" >Supprimer</Button></td>
                                                <td><Button onclick="f2(<%= emps.getId()%>, '<%= emps.getNom()%>', '<%= emps.getPrenom()%>', '<%= empss.getId().getDateDebut()%>', '<%= empss.getService().getNom()%>', '<%= empss.getId().getDateDebut()%>', '<%=sd%>')" class="btn btn-warning" id ="update">Modifier</Button></td>
                                            </tr>
                                            <% sd = "-----";
                                                }%>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                </div>
            </div>
            <!-- /#wrapper -->

            <!-- jQuery -->
            <script src="../vendor/jquery/jquery.min.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

            <!-- Metis Menu Plugin JavaScript -->
            <script src="../vendor/metisMenu/metisMenu.min.js"></script>

            <!-- DataTables JavaScript -->
            <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
            <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
            <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

            <!-- Custom Theme JavaScript -->
            <script src="../dist/js/sb-admin-2.js"></script>

            <!-- Page-Level Demo Scripts - Tables - Use for reference -->
            <script>
                                                    $(document).ready(function () {
                                                        $('#dataTables-example').DataTable({
                                                            responsive: true
                                                        });
                                                    });

                                                    $('#save').click(function () {

                                                        let nom = $('#nom').val();
                                                        let prenom = $('#prenom').val();
                                                        let dateNaissance = $('#dateNaissance').val();
                                                        let service = $('#service').val();
                                                        let dateDebut = $('#dateDebut').val();
                                                        let dateFin = $('#dateFin').val();

                                                        console.log("Work");

                                                        let idupdate = $('#idupdate').val();
                                                        let container = $('#mTable');

                                                        $.ajax({
                                                            url: "../AddEmploye",
                                                            type: 'GET',
                                                            data: {nom: nom, prenom: prenom, dateNaissance: dateNaissance, service: service, dateDebut: dateDebut, dateFin: dateFin, idupdate: idupdate},
                                                            success: function (data) {
                                                                container.empty();
                                                                container.html(feedTable(data));
                                                                $('#nom').val("");      //Clear inputs
                                                                $('#prenom').val("");
                                                                $('#dateNaissance').val("");
                                                                $('#dateDebut').val("");
                                                                $('#dateFin').val("");
                                                                $('#dateFin').val("");

                                                                $('#save').html("Ajouter");  //Change Name for Button  
                                                                $('#idupdate').val("");  //reset idupdate to ""  

                                                                $('#hiddenDate')[0].hidden = true; //to hide the date again,casted by [0] to change to core js for prop  
                                                            },
                                                            error: function (errorThrown) {
                                                                console.log("Error Ajax :" + errorThrown);
                                                            }
                                                        });
                                                    });

                                                    function DeleteEmploye(id) {

                                                        let container = $('#mTable');

                                                        $.ajax({
                                                            url: "../DeleteEmploye",
                                                            type: 'GET',
                                                            data: {id: id},
                                                            success: function (data) {
                                                                container.empty();
                                                                container.html(feedTable(data));
                                                            },
                                                            error: function (errorThrown) {
                                                                console.log("Error Ajax :" + errorThrown);
                                                            }
                                                        });
                                                    }

                                                    function feedTable(data) {
                                                        var ft = "";
                                                        var df = "-----";

                                                        for (var i = 0; i < data.length; i++) {
                                                            var dn = moment(new Date(data[i][0].dateNaissance)).format('L');
                                                            var dd = moment(new Date(data[i][1].id.dateDebut)).format('L');

                                                            if (data[i][1].dateFin != undefined)
                                                                df = moment(new Date(data[i][1].dateFin)).format('L');

                                                            var func = "f2(" + data[i][0].id + ",'" + data[i][0].nom + "','" + data[i][0].prenom + "','" + dn + "','" + data[i][1].service.nom + "','" + dd + "','" + df + "')";

                                                            ft += '<tr><td>' + data[i][0].id + '</td><td>' + data[i][0].nom + '</td><td>' + data[i][0].prenom + '</td><td>' + dn + '</td><td>' + data[i][1].service.nom + '</td><td>' + dd + '</td><td>' + df + '</td><td><Button onclick="DeleteEmploye(' + data[i][0].id + ')" class="btn btn-danger" >Supprimer</Button></td><td><Button onclick="' + func + '" class="btn btn-warning" id ="update">Modifier</Button></td></tr>';
                                                            df = "-----";
                                                        }

                                                        return ft;
                                                    }
            </script>

    </body>

</html>

<%-- 
    Document   : tables
    Created on : Oct 18, 2018, 9:03:45 PM
    Author     : mst
--%>

<%@page import="controller.searchDates"%>
<%@page import="beans.Employe"%>
<%@page import="service.EmployeService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title><meta charset="utf-8">
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
    </head>

    <body>

        <div id="wrapper">

            <%@ include file="NavbarMenu.jsp" %>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Search Employes Between Dates</h1>
                    </div>
                    <!-- /.col-lg-12 -->
            
                    <form action="../searchDates" method="GET">
                    <div>
                        <div>Date 1 : <input type="date" name="date1" id="date1" /></div>
                        <div>Date 2 : <input type="date" name="date2" id="date2" /></div>
                        <div><button class="btn btn-primary" type="submit"  id="btn1">Search</button></div>
                    </div>
                        </form>
                    
                    
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
                                                <th>Suprimer</th>
                                                <th>Modifier</th>
                                            </tr>
                                        <tbody>
                                            <%
                                                EmployeService es = new EmployeService();
                                                searchDates d = new searchDates();
                                                for (Employe e : d.getList()) {
                                            %>
                                            <tr>
                                                <td><%= e.getId()%></td>
                                                <td><%= e.getNom()%></td>
                                                <td><%= e.getPrenom()%></td>
                                                <td><%= e.getDateNaissance()%></td>
                                                <td><a href="../DeleteEmploye?id=<%=e.getId()%>">Supprimer</a></td>
                                                <td><input id ="update" type="button" value="Modifier" onclick="f2(<%=e.getId()%>, '<%=e.getNom()%>','<%=e.getPrenom()%>','<%=e.getDateNaissance()%>')" /></td>
                                            </tr>
                                            <%}%>
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
        </script>

    </body>

</html>

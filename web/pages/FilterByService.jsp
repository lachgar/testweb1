<%-- 
    Document   : FilterByService
    Created on : 22 oct. 2018, 21:46:21
    Author     : Sinponzakra
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
        <title>Filter By Service</title><meta charset="utf-8">
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
                        <h1 class="page-header">Filter Employes by Service</h1>
                    </div>
                    <!-- /.col-lg-12 -->

                    <label>Service :</label>

                    <select style="margin-bottom: 5%" class="form-control" id="service" name="service">
                        <% ServiceService ss = new ServiceService();
                            for (Service s : ss.findAll()) {
                        %>
                        <option value="<%=s.getId()%>"><%= s.getNom()%></option>
                        <%}%>
                    </select>

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
                                            </tr>
                                        </thead>
                                        <tbody id="mTable">

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

                $('#service').change(function () {
                    var id = $('#service').val();

                    let container = $('#mTable');

                    $.ajax({
                        url: "../FilterByService",
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
                });

                function feedTable(data) {
                    var ft = "";
                    var df = "-----";

                    for (var i = 0; i < data.length; i++) {
                        var dn = moment(new Date(data[i][0].dateNaissance)).format('L');
                        var dd = moment(new Date(data[i][1].id.dateDebut)).format('L');

                        if (data[i][1].dateFin != undefined)
                            df = moment(new Date(data[i][1].dateFin)).format('L');

                        ft += '<tr><td>' + data[i][0].id + '</td><td>' + data[i][0].nom + '</td><td>' + data[i][0].prenom + '</td><td>' + dn + '</td><td>' + data[i][1].service.nom + '</td><td>' + dd + '</td><td>' + df + '</td>';
                        df = "-----";
                    }

                    return ft;
                }
            </script>

    </body>

</html>
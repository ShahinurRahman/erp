<#macro app_layout title="">
<html>
<head>
    <meta charset="utf-8">
    <title>${title}</title>
    <#include "stylesheets.ftl"/>
    <#include "scripts.ftl"/>
</head>
<body>
<div id="wrapper">
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->

    <#include "header.ftl"/>
    <!-- Top Menu Items -->

    <#include "top_menu.ftl"/>
    <!-- Left Menue -->
    <#include "menu.ftl"/>
    <!-- /.navbar-collapse -->
</nav>

<div id="page-wrapper">

<div class="container-fluid">
<!-- Page Heading -->
<div class="row">
    <div class="col-lg-6">
        <h3 class="page-header">
            Project
            <small>Statistics Overview</small>
        </h3>
    </div>
    <div class="col-lg-6  text-right">
       <img class="img-thumbnail" src="resources/images/logo/logo_admin.png" alt="">
    </div>
</div>
<!-- /.row -->
<#--
<div class="row">
    <div class="col-lg-12">
        <div class="alert alert-info alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <i class="fa fa-info-circle"></i> <strong>Like SB Admin?</strong> Try out <a
                href="http://startbootstrap.com/template-overviews/sb-admin-2" class="alert-link">SB Admin 2</a> for
            additional features!
        </div>
    </div>
</div>
-->
<!-- /.row -->
<#--
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-comments fa-5x faa-shake animated"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">26</div>
                        <div>Update Message</div>
                    </div>
                </div>
            </div>
            <a href="#">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-green">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-gear fa-spin fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">4</div>
                        <div>Running Project!</div>
                    </div>
                </div>
            </div>
            <a href="#">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-trophy fa-5x faa-tada animated"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">12</div>
                        <div>Completed Project!</div>
                    </div>
                </div>
            </div>
            <a href="#">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-md-6">
        <div class="panel panel-red">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-times-circle fa-5x faa-flash animated"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">13</div>
                        <div>Stopped Project!</div>
                    </div>
                </div>
            </div>
            <a href="#">
                <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
</div>
-->
<!-- /.row -->
<!--
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Area Chart</h3>
            </div>
            <div class="panel-body">
                <div id="morris-area-chart"></div>
            </div>
        </div>
    </div>
</div>
-->
<!-- /.row -->

<div class="row">
    <div class="col-lg-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-angle-double-right fa-lg"></i> Welcome to BRTC, BUET</h3>
            </div>
            <div class="panel-body">
                <div class="text-justify">
                    As a center of excellence, BUET is not only continuing as the focal point for the development and dissemination of engineering and technological know-how within the country, but also it is involved to solve complicated practical problems of national importance faced by the planners, engineers and technologists of the country. The university being the home of highly trained man power, expert services are given through this bureau, causing a fourfold enrichment – enrichment of the nation from the expert services, enrichment of the university, enrichment of the staff and enriched teaching and research from the knowledge acquired through The Bureau of Research, Testing and Consultation. BRTC undertakes research, testing and consultation works in the field of engineering, architecture and planning as entrusted to them by private parties and by government and autonomous bodies in order to achieve following objectives:
                </div>
                <div class="text-right">
                    <a href="welcomeDetails.erp">View Details <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-spinner fa-spin fa-lg"></i> Tasks Panel</h3>
            </div>
            <div class="panel-body">
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <span class="badge">just now</span>
                        <i class="fa fa-fw fa-calendar"></i> Calendar updated
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">4 minutes ago</span>
                        <i class="fa fa-fw fa-comment"></i> Commented on a post
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">23 minutes ago</span>
                        <i class="fa fa-fw fa-truck"></i> Order 392 shipped
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">46 minutes ago</span>
                        <i class="fa fa-fw fa-money"></i> Invoice 653 has been paid
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">1 hour ago</span>
                        <i class="fa fa-fw fa-user"></i> A new user has been added
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">2 hours ago</span>
                        <i class="fa fa-fw fa-check"></i> Completed task: "pick up dry cleaning"
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">yesterday</span>
                        <i class="fa fa-fw fa-globe"></i> Saved the world
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="badge">two days ago</span>
                        <i class="fa fa-fw fa-check"></i> Completed task: "fix error on sales page"
                    </a>
                </div>
                <div class="text-right">
                    <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i> Transactions Panel</h3>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th>Project No.</th>
                            <th>Team ID</th>
                            <th>Progress</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>PB 26</td>
                            <td>TC 31</td>
                            <td>10%</td>
                        </tr>
                        <tr>
                            <td>PB 25</td>
                            <td>TC 45</td>
                            <td>16%</td>
                        </tr>
                        <tr>
                            <td>PB 24</td>
                            <td>TC 07</td>
                            <td>58%</td>
                        </tr>
                        <tr>
                            <td>PB 21</td>
                            <td>TC 55</td>
                            <td>56%</td>
                        </tr>
                        <tr>
                            <td>PB 56</td>
                            <td>TC 05</td>
                            <td>56%</td>
                        </tr>
                        <tr>
                            <td>PB 10</td>
                            <td>TC 48</td>
                            <td>76%</td>
                        </tr>
                        <tr>
                            <td>PB 56</td>
                            <td>TC 05</td>
                            <td>56%</td>
                        </tr>
                        <tr>
                            <td>PB 10</td>
                            <td>TC 48</td>
                            <td>76%</td>
                        </tr>
                        <tr>
                            <td>PB 10</td>
                            <td>TC 48</td>
                            <td>76%</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="text-right">
                    <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- /.row -->

</div>
<!-- /.container-fluid -->


</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>
</html>
</#macro>
<#macro gen_app_layout title="">
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
        <#nested>

        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>
</html>
</#macro>
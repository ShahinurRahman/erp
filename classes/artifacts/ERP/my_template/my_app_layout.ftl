<#macro my_app_layout title="">
    <html>
        <head>
            <title>${PageTitle}</title>
            <#include "../my_template/resources.ftl"/>
        </head>
        <body>
            <div id="wrapper">
                <#include "../my_template/navigation.ftl"/>
                <div id="page-wrapper">
                    <div class="container-fluid">


                        <#nested>



                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /#page-wrapper -->
            </div>
            <!-- /#wrapper -->
        </body>
    </html>
</#macro>

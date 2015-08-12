<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-10">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-plus-square"></i><a href="/ERP/brtc/createClient.erp"> Create ${PageTitle}</a>
            </li>
            <li>
                <i class="fa fa-list"></i> ${PageTitle} List
            </li>
        </ol>
    </div>

    <div class="col-lg-2 text-right">
        <ol class="breadcrumb">
            <li class="active">
                <i class="fa fa-print"></i><a href="#" onclick="jQuery('#myPrintDiv').print()"> Print</a>
            </li>
            <li class="active">
                <i class="fa fa-file-pdf-o"></i><a href="#" onclick="jQuery('#myPrintDiv').print()"> PDF</a>
            </li>
        </ol>
    </div>
</div>
<div class="row" id="firstRow">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-primary">${PageTitle} List</h3>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th>Client ID</th>
                            <th>Client Name</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Fax & Email</th>
                            <th>Spokes Man</th>
                            <th>S. Man Cell</th>
                            <th class="text-center">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list clientList as client>
                            <tr>
                                <td class="col-md-1">${client.id}</td>
                                <td class="col-md-2">${client.name}</td>
                                <td class="col-md-2">${client.address}</td>
                                <td class="col-md-2">${client.phone}</td>
                                <td class="col-md-2">${client.fax}<br/>${client.email}</td>
                                <td class="col-md-2">${client.spokesMan}</td>
                                <td class="col-md-2">${client.spokesManCell}</td>

                                <td class="text-center">
                                    <a href="deleteClient.erp?id=${client.id}" title="Delete"
                                       class="fa fa-times fa-lg text-pad-t-3"></a>
                                    &nbsp;&nbsp;
                                    <a href="editClient.erp?id=${client.id}" title="Edit"
                                       class="fa fa-pencil fa-lg text-pad-t-3"></a>
                                </td>
                            </tr>
                            </#list>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->




</@layout.my_app_layout>



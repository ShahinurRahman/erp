<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}"> Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/ERP/brtc/brtcProjectList.erp"> Project List</a>
            </li>
            <li>
                <i class="fa fa-plus-square "></i><a href="/ERP/brtc/viewBrtcProject.erp?fileNo=${fileNo}"> Project</a>
            </li>
            <li class="active">
                <i class="fa fa-list"></i> ${PageTitle}
            </li>

        </ol>
    </div>
</div>

<div class="row" id="firstRow">
    <div class="col-lg-10 text-left">
        <strong style="font-size: 25px; color: #ff7217">Project History of ${fileNo}</strong>
    </div>

    <div class="col-lg-2 text-center">
        <form name="searchForm" role="form" id="searchForm" action="projectHistoryList.erp" method="GET">
            <script>
                function submitForm() {
                    document.searchForm.submit();
                }
                Ext.onReady(function () {
                    //alert("hello");
                    $("#fileNoumber").focus();
                });
            </script>
            <div class="form-group input-group">
                <input type="text" name="fileNo" id="fileNoumber" class="form-control" placeholder="File No.">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="submitForm();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center">
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th>Sl.</th>
                    <th>Record Date</th>
                    <th class="text-justify">Note</th>
                    <th>Created By</th>
                    <th class="text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                    <#assign x = 1>
                    <#list historyList as history>
                    <tr>
                        <td class="col-md-1">${x}</td>
                        <td class="col-md-2">${history.recordDate}</td>
                        <td class="col-md-4">${history.note}</td>
                        <td class="col-md-3">${history.createdBy.token.userDetails.name}</td>

                        <td class="col-md-4 text-center">
                            <a href="deleteBrtcProject.erp?id=${history.id}" title="Delete"
                               class="fa fa-times fa-lg text-pad-t-3"></a>
                            &nbsp;&nbsp;
                            <a href="editBrtcProject.erp?id=${history.id}" title="Edit"
                               class="fa fa-pencil fa-lg text-pad-t-3"></a>
                            &nbsp;&nbsp;
                            <a href="viewBrtcProject.erp?fileNo=${history.id}" title="View Details"
                               class="fa fa-list-alt fa-lg text-pad-t-3"></a>
                        </td>
                    </tr>
                    <#assign x = x+1>
                    </#list>

                </tbody>
            </table>
        </div>

    </div>
</div>

<!--End First Row -->




</@layout.my_app_layout>



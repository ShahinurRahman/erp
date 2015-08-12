<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-10">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}"> Dashboard</a>
            </li>
            <li>
                <i class="fa fa-plus-square "></i><a href="/ERP/brtc/createBrtcProject.erp"> Create Project</a>
            </li>
            <li>
                <i class="fa fa-list"></i> ${PageTitle} List
            </li>

        </ol>
    </div>
    <div class="col-lg-2 text-right">
        <ol class="breadcrumb">
            <li class="active">
                <i class="fa fa-print" id="printProject"> Print</i>
            </li>
            <li class="active">
                <i class="fa fa-file-pdf-o"></i><a href="/ERP/report/projectList.erp"> PDF</a>
            </li>
        </ol>
    </div>
</div>


<div class="row" id="firstRow">
    <div class="col-lg-10 text-left">
        <strong style="font-size: 25px">Project List</strong>
    </div>

    <div class="col-lg-2 text-center">
        <form name="searchForm" role="form" id="searchForm" action="viewBrtcProject.erp" method="GET">
            <script>
                function submitForm() {
                    document.searchForm.submit();
                }
            </script>
            <div class="form-group input-group">
                <input type="text" name="fileNo" id="fileNo" class="form-control" placeholder="File No.">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="submitForm();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center">
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th class="text-center">Actions</th>
                    <th>File No</th>
                    <th>Project Title</th>
                    <th class="text-center">Fees</th>
                    <th>Is Active</th>
                    <th>Status</th>
                    <th>Team</th>
                </tr>
                </thead>
                <tbody>
                    <#assign progressStatus = ['Not Assigned', 'Assigned', 'No Response', 'Negotiating', 'Negotiation Failed', 'Running', 'Stopped', 'Completed', 'Others']>
                    <#list projectList as project>
                    <tr style="color:<#if project.active?string == "false">red</#if>">
                        <td class="text-center">
                            <a href="viewBrtcProject.erp?fileNo=${project.fileNo}" title="View Details"
                               class="fa fa-list-alt fa-lg text-pad-t-1"></a>
                            &nbsp;&nbsp;
                            <a href="editBrtcProject.erp?id=${project.id}" title="Edit"
                               class="fa fa-pencil fa-lg text-pad-t-1"></a>
                            &nbsp;&nbsp;
                            <button onclick="deleteBRTCProject(${project.fileNo});" class="btn btn-xs btn-danger"><i class="fa fa-times fa-1x"></i></button>
                        </td>
                        <td class="col-md-1">${project.fileNo}</td>
                        <td class="col-md-4">${project.projectTitle}</td>

                        <td class="text-right col-md-1">
                            <b>${project.finalFee}</b>
                        </td>

                        <td class="text-center">
                            <#if project.active?string == "true">Active<#else >Inactive</#if>
                        </td>

                        <td>${progressStatus[project.projectStatus.progressStatus]}</td>

                        <td class="col-md-1">
                            <#if project.team??>
                            ${project.team.id}
                            <#else >
                                No team Formed
                            </#if>
                        </td>
                    </tr>
                    </#list>

                </tbody>
            </table>
        </div>

    </div>
</div>

<!--End First Row -->
<script type="text/javascript">
    function deleteBRTCProject(fileNo){
        $.ajax({
            url: '/ERP/brtc/deleteBrtcProject.erp',
            data: "fileNo="+fileNo,
            dataType: "json",
            success: function(data){
                if(data.success == "false"){
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Project <b>"+fileNo+"</b> can't be deleted !") ;
                    $('#alert-danger-body').html(data.msg+"<br/>"+data.teamLeader) ;
                }else{
                    window.location.href = '/ERP/brtc/brtcProjectList.erp';
                }
            }
        });
    }
</script>



</@layout.my_app_layout>



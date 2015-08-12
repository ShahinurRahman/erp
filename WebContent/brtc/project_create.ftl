<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/ERP/brtc/brtcProjectList.erp"> Project List</a>
            </li>
            <li class="active">
                <i class="fa fa-cog fa-spin"></i> Creating Project
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-3 text-center"></div>

    <div class="col-lg-6 text-center">
        <div class="panel panel-green">
            <div class="panel-body">
                <h3 class="text-left text-success">Create Project</h3>

                <form name="dataForm" id="dataForm" action="saveBrtcProject.erp" method="POST">
                    <div class="col-lg-12 text-center">

                        <div class="col-lg-4 text-left">
                            File Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="fileNo" id="fileNo" class="form-control has-success">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Project Title:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="projectTitle" id="projectTitle" class="form-control  has-success"
                                          rows="3"></textarea>
                            </div>
                        </div>
                        <!-- Hidden Field for Department, In case of all department it will be modified -->
                        <input type="hidden" name="departmentId" value="1"/>

                        <div class="col-lg-4 text-left">
                            Client:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <select class="form-control  has-success" name="clientId" id="clientId">
                                    <option value="null">--Select a client--</option>
                                    <#if clientList??>
                                        <#list clientList as client>
                                            <option value="${client.id}">${client.name}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="button" onclick="saveBRTCProject();" class="btn btn-success">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-lg-3 text-center"></div>
</div>

<!--End First Row -->
<script type="text/javascript">
    function saveBRTCProject(){
        var fileNo = document.getElementById("fileNo").value;
        var projectTitle = document.getElementById("projectTitle").value;
        var clientId = document.getElementById("clientId").value;
        if(fileNo== "" || projectTitle == "" || clientId == "null"){
            $('#alertModal-warning').modal('show');
            $('#alert-warning-title').html("Attention !") ;
            $('#alert-warning-body').html("Please fill all field up of the form.") ;
            return false;
        }
        $.ajax({
            url: '/ERP/brtc/checkDuplicateProject.erp',
            data: "fileNo="+fileNo,
            dataType: "json",
            success: function(data){
                if(data.msg == "Yes"){
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("File number <b>"+fileNo+"</b> already exists !") ;
                    $('#alert-danger-body').html("Title: "+data.projectTitle) ;
                }else{
                    document.dataForm.submit();
                }
            }
        });
    }
</script>




</@layout.my_app_layout>




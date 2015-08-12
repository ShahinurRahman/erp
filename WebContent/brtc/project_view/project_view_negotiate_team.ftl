<div class="col-lg-12">
    <div class="panel panel-yellow">
        <div class="panel-heading">
            <h3 class="panel-title" onclick="$('#teamTable').show();">
            <#if negotiateTeam??>
                Negotiation Team : [ID-${negotiateTeam.id}]
            <#else >
                Negotiation Team:
            </#if>
            </h3>
        </div>

    <#if negotiateTeam??>
        <table id="teamTable" class=" table table-bordered table-hover table-striped"> <!--hideMe-->
            <thead>
            <tr>
                <th>Sl</th>
                <th>Member Name</th>
                <th>Member Type</th>
                <th>Join Date</th>
                <th>Active?</th>
                <th>Leaving Date</th>
                <th>Note</th>
                <th class="text-center">Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <#assign x = 1>
                <#assign memberType = ['Team Leader', 'Member']>
                <#list negotiateTeam.consultantList as consultant>
                    <#assign color =  consultant.active?string("green", "red")>
                <tr style="color: ${color}">
                    <td>${x}</td>
                    <td>${consultant.consultant.token.userDetails.name}</td>
                    <td>${memberType[consultant.type]}</td>
                    <td>${consultant.activeDate}</td>
                    <td>${consultant.active?string("Active", "Inactive")}</td>
                    <td><#if consultant.inactiveDate??>${consultant.inactiveDate}<#else >---</#if></td>
                    <td>${consultant.note}</td>
                    <td class="fa text-center">
                        &nbsp;&nbsp;
                        <button onclick="updateConsultant(${consultant.id}+',activateDeactivate');" class="btn btn-xs btn-danger"><i class="fa fa-power-off fa-1x"></i></button>
                        &nbsp;&nbsp;
                        <button onclick="deleteTeam(${consultant.id});" class="btn btn-xs btn-danger"><i class="fa fa-times fa-1x"></i></button>
                    </td>
                </tr>
                    <#assign x = x + 1>
                </#list>
            <td colspan="8" class="text-right">
                <i class="fa fa-plus-square"></i>
                <a href="#" data-toggle="modal" data-target="#addConsultantModal">Add Consultant</a>
            </td>
            </tr>
            </tbody>
        </table>
    <#else >
        <h5> &nbsp;&nbsp;&nbsp;&nbsp;
            No Negotiator Team formed yet &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <i class="fa fa-plus-square"></i><a
                    href="/ERP/brtc/createNegotiateTeam.erp?projectId=${project.id}">
                Create Consultant Team</a>
        </h5>
    </#if>

    </div>
</div>

<script type="text/javascript">
    function deleteConsultant(id){
        $.ajax({
            url: '/ERP/brtc/deleteConsultant.erp',
            data: "id="+id,
            dataType: "json",
            success: function(data){
                if(data.success == "false"){
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Can't be deleted !") ;
                    $('#alert-danger-body').html(data.msg) ;
                }else{
                    window.location.href = '/ERP/brtc/viewBrtcProject.erp?fileNo=${project.fileNo}';
                }
            }
        });
    }

    function updateConsultant(array){
        //alert(array); return false;
        $.ajax({
            url: '/ERP/brtc/updateConsultant.erp',
            data: {
                array : array
            },
            dataType: "json",
            success: function(data){
                if(data.success == "false"){
                    $('#alertModal-danger').modal('show');
                    $('#alert-danger-title').html("Can't be deleted !") ;
                    $('#alert-danger-body').html(data.msg) ;
                }else{
                    window.location.href = '/ERP/brtc/viewBrtcProject.erp?fileNo=${project.fileNo}';
                }
            }
        });
    }
</script>
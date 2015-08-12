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
            <li>
                <i class="fa fa-file"></i><a href="/ERP/brtc/viewBrtcProject.erp?fileNo=${fileNo}"> Project</a>
            </li>
            <li class="active">
                <i class="fa fa-cog fa-spin"></i> Creating Project
            </li>

        </ol>
    </div>
</div>

<div class="row">

    <div class="col-lg-12 text-center">
        <div class="panel panel-green">
            <div class="panel-body">
                <div class="row" style="background-color: #e5dfe3; margin: 0 10 0 10">
                    <div class="col-lg-12 text-center">
                        <h3 class="text-left text-success">Distribution Form</h3>
                    </div>
                    <div class="col-lg-12 text-left" style="font-size: 21px">
                    <b>File ${fileNo} : </b> ${project.projectTitle}
                    </div>
                    <div class="col-lg-12 text-left" style="color: #200080">
                        <h4 class="text-left text-success"><b>BRTC No. : </b>${brtcNos}</h4>
                    </div>
                    <div class="col-lg-12 text-left">
                        <hr/>
                    </div>
                </div>
                <div class="col-lg-12 text-left"><br/></div>
                <div class="row" style="background-color: #fdf7fb; margin: 0 20 0 20">
                    <form name="distributionDataForm" id="distributionDataForm" action="saveDistribution.erp"
                          method="POST">
                        <div class="col-lg-12 text-center">
                            <div class="row">
                                <div class="col-lg-2 text-left">
                                    Total Amount:
                                </div>
                                <div class="col-lg-4 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="totalAmount" id="totalAmount" value="1"
                                                   class="form-control has-success">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-2 text-left">
                                    Advances (Dept.):
                                </div>
                                <div class="col-lg-4 text-center">
                                    <div class="form-group has-success">
                                        <input type="text" name="advances" id="advances" value="2"
                                               class="form-control has-success">
                                    </div>
                                </div>
                            </div>

                            <!--Consultants List-->
                            <div class="row">
                                <div class="col-lg-2 text-left">
                                    Consultant:
                                </div>
                                <div class="col-lg-10 text-center">

                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                            <tr>
                                                <th>Consultant Name</th>
                                                <th>Designation</th>
                                                <th>Type</th>
                                                <th>Team</th>
                                                <th>Amount</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <#if teacherList??>
                                                    <#assign y = 0>
                                                    <#list teacherList as teacher>
                                                    <tr>
                                                        <td>${teacher.name}</td>
                                                        <td>${teacher.designation}</td>
                                                        <td>${teacher.type}</td>
                                                        <td>${teacher.team}</td>
                                                        <td><input type="text" name="consultantsFees" id="" value="${y}"
                                                                   class="form-control has-success"></td>
                                                    </tr>
                                                    <input type="hidden" value="${teacher.id}" name="consultantsId"/>
                                                        <#assign y = y + 1>
                                                    </#list>
                                                </#if>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                            <input type="hidden" name="fileNo" id="fileNo" value="${fileNo}"/>
                            <input type="hidden" name="brtcNos" id="brtcNos" value="${brtcNos}"/>

                            <div class="row">
                                <div class="col-lg-4 text-left">
                                </div>
                                <div class="col-lg-8 text-right">
                                    <button type="reset" class="btn btn-primary" name="reset" value="reset">Reset
                                    </button>
                                    <button type="button" onclick="saveDistribution();" name="save" value="save"
                                            class="btn btn-success">Save
                                    </button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->
<script type="text/javascript">
    function saveDistribution() {
        var totalAmount = $('#totalAmount').val();
        var advances = $('#advances').val();
        var consultantFeesTotal = 0.0;
        var consultantFees = "";
        var consultantIds = "";
        var j = 0;
        var k = ${y};
        //alert(document.distributionDataForm.elements.length);
        for (var i = 0; i <= document.distributionDataForm.elements.length; i++) {
            if (document.getElementsByTagName('input')[i].getAttribute('name') === "consultantsFees") {
                var amount = document.distributionDataForm.elements[i-1].value;
                consultantFeesTotal += parseFloat(amount);
                consultantFees += amount + ",";
                j++;
               // if (j == k)break;
            }
            if (document.getElementsByTagName('input')[i].getAttribute('name') === "consultantsId") {
                consultantIds += document.distributionDataForm.elements[i-1].value + ",";
                j++;
                if (j == (k * 2))break;
            }
        }
        //alert(consultantIds+" & " +consultantFees); return false;

        var others = totalAmount - advances - consultantFeesTotal;
        $.ajax({
            url: '/ERP/brtc/saveDistribution.erp',
            data: {
                totalAmount : totalAmount,
                advances : advances,
                consultantFeesTotal : consultantFeesTotal,
                others : others,
                consultantFees: consultantFees,
                consultantIds: consultantIds,
                fileNo: $('#fileNo').val(),
                brtcNos: $('#brtcNos').val()
            },
            dataType: "json",
            success: function (data) {
                $('#alertModal-success').modal('show');
                $('#alert-success-title').html("Yes !");
                $('#alert-success-body').html(data.msg);
            }
        });
    }

</script>




</@layout.my_app_layout>









<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->

    <#assign statusArray = ['PA Submitted', 'Encashed', 'Checked']/>


<div class="row">
    <div class="col-lg-10">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-plus-square"></i><a href="/ERP/brtc/createClientPayment.erp?for=new"> Create ${PageTitle}</a>
            </li>
            <li>
                <i class="fa fa-list"></i> ${PageTitle} List (${statusArray[status]})
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
    <div class="col-lg-6 text-center">
        <#if  paymentList??>
            <h3 class="text-left text-primary">
            ${PageTitle} List ( ${statusArray[status]} )
            </h3>
        </#if>
    </div>
    <div class="col-lg-3 text-center">
        <div class="form-group">
            <div class="form-group has-success" id="brtcListCreateDiv">
                <select name="findForOption" id="findForOption"  class="form-control">
                    <option value="-1">--Select Status--</option>
                    <option value="0">PA Submitted</option>
                    <option value="1">Encashed</option>
                    <option value="2">Checked</option>
                </select>
            </div>
        </div>
        <script type="text/javascript">
            $('#findForOption').on('change', function() {
                var status =  this.value;
                window.location = "clientPaymentList.erp?findFor=all&status="+status;
            });
        </script>
    </div>
    <div class="col-lg-3 text-center">
        <form name="searchForm" role="form" id="searchForm" action="clientPaymentList.erp" method="GET">
            <input type="hidden" name="status" id="status" value="1"/>
            <script>
                function submitForm() {
                    document.searchForm.submit();
                }
            </script>
            <div class="form-group input-group">
                <input type="text" name="findFor" id="findFor" class="form-control" placeholder="BRTC No.">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="submitForm();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center">
        <div class="table-responsive">
            <#if  paymentList??>
                <table class="table table-bordered table-hover table-striped">
                    <thead>
                    <tr>
                        <th>File No</th>
                        <th>Client Name</th>
                        <th>BRTC No.</th>
                        <th>MR No.</th>
                        <th>Amount</th>
                        <th>Payment Date</th>
                        <th>Operator</th>
                        <#if status == 1>
                            <th class="text-center">Checked</th>
                        </#if>
                        <#if status == 2>
                            <th>Checked By</th>
                        </#if>
                        <#if status == 0>
                            <th class="text-center">Encash/Delete</th>
                        </#if>
                    </tr>
                    </thead>
                    <tbody>
                        <#list paymentList as payment>
                            <#if status == payment.status>
                            <tr>
                                <td class="col-md-1">${payment.project.fileNo}</td>
                                <td class="col-md-3">${payment.project.client.name}</td>
                                <td class="">${payment.brtcNo}</td>
                                <td class=""><#if payment.mrNo??>${payment.mrNo}<#else><strong class="faa-ring animated"
                                                                                               style="color: red">-_-</strong></#if>
                                </td>
                                <td class="">${payment.amount}</td>
                                <td class="">
                                    <#if payment.encashDate??> ${payment.encashDate} <#else ><strong
                                            class="faa-ring animated" style="color: red">-_-</strong></#if>
                                </td>
                                <td class="">${payment.operator.token.userDetails.name}</td>

                                <#if status == 0>
                                    <td class="text-center">
                                        <a href="#" title="Encash" data-toggle="modal" data-target="#paymentEncash"
                                           value="${payment.brtcNo}"
                                           class="fa fa-bank fa-lg text-pad-t-3 financial-modal-link"></a>
                                        &nbsp;&nbsp;
                                        <a href="deleteClientPayment.erp?id=${payment.id}" title="Delete"
                                           class="fa fa-times fa-lg text-pad-t-3"></a>
                                    </td>
                                </#if>
                                <#if status == 1>
                                    <td class="text-center">
                                        <a href="checkClientPayment.erp?id=${payment.id}" title="Encash"
                                           class="fa fa-check-square-o fa-lg text-pad-t-3"></a>
                                    </td>
                                </#if>
                                <#if status == 2>
                                    <td class="">
                                    ${payment.checkedBy.token.userDetails.name}
                                    </td>
                                </#if>
                            </tr>
                            </#if>
                        </#list>

                    </tbody>
                </table>
            <#else >
                <h1 class="text-danger"> No such BRTC No. found in Database..</h1>
            </#if>
        </div>
    </div>

</div>

<!--End First Row -->

<#--Payment Encash Add Modal -->
    <#include "modals/payment_encash.ftl"/>

<script>
    $(".financial-modal-link").click(function () {
        var myDataValue = $(this).attr("value");
        document.getElementById("brtcNo").value = myDataValue;
        //alert(myDataValue);
    });
</script>

</@layout.my_app_layout>



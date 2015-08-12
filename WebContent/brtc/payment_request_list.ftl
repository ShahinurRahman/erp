<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<#assign statusArray = ['Requested', 'Countered', 'Accepted', 'Received']/>
<#assign statusIndex = [1, 2, 3, 0]/>
<div class="row">
    <div class="col-lg-8">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-plus-square"></i><a href="/ERP/brtc/createPaymentRequest.erp"> Create ${PageTitle}</a>
            </li>
            <li>
                <i class="fa fa-list"></i> ${PageTitle} List (${statusArray[status]})
            </li>
        </ol>
    </div>

    <div class="col-lg-2 text-right">
        <ol class="breadcrumb">
            <li class="active">
                <i class="fa fa-money"></i>
                <a href="paymentRequestList.erp?status=${statusIndex[status]}">
                    ${statusArray[statusIndex[status]]}
                </a>
                &nbsp;&nbsp;
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
    <div class="col-lg-10 text-center">
        <#if  requestList??>
            <h3 class="text-left text-primary">
                ${PageTitle} List ( ${statusArray[status]} )
            </h3>
        </#if>
    </div>

    <div class="col-lg-2 text-center">
        <form name="searchPaymentRequest" role="form" id="searchPaymentRequest" action="/ERP/brtc/viewPaymentRequest.erp" method="GET">
            <script>
                function submitForm(){
                    document.searchPaymentRequest.submit();
                }
            </script>
            <div class="form-group input-group">
                <input type="text" name="AprId" id="AprId" class="form-control"  placeholder="$ Request ID.">
                <span class="input-group-addon"><a class="fa fa-search" href="#" onclick="submitForm();"></a></span>
            </div>
        </form>
    </div>
    <div class="col-lg-12 text-center">
        <div class="table-responsive">

            <#if  requestList??>
            <table class="table table-bordered table-hover table-striped">
                <thead>
                <tr>
                    <th>Action</th>
                    <th>ID</th>
                    <th>Requested By</th>
                    <th>Amount</th>
                    <th>Countered by</th>
                    <th>Approved?</th>
                    <th>Received</th>
                </tr>
                </thead>
                <tbody>


                    <#list requestList as request>
                    <tr>
                        <td>
                            <a href="viewPaymentRequest.erp?AprId=${request.id}" title="View Details"
                               class="fa fa-list-alt fa-lg text-pad-t-1"></a>
                            &nbsp;
                            <button id="hitMe" onclick="deletePaymentRequest(${request.id});" class="btn btn-xs btn-danger"><i class="fa fa-times"></i></button>
                            &nbsp;
                            <a href="editBrtcProject.erp?id=${request.id}" title="Edit"
                               class="fa fa-pencil fa-lg text-pad-t-1"></a>&nbsp;
                            <a href="../report/paymentRequest.erp?APRId=${request.id}" title="PDF"
                               class="fa fa-file-pdf-o fa-lg text-pad-t-1"></a>
                        </td>
                        <td >${request.id}</td>
                        <td >${request.appliedBy.token.userDetails.name}</td>
                        <td >${request.amount}</td>
                        <td><#if request.counteredBy??> ${request.counteredBy.token.userDetails.name}</#if></td>
                        <td ><#if request.acceptedBy??>Approved</#if></td>
                        <td><#if request.receivedBy??> ${request.receivedBy.token.userDetails.name}</#if> </td>
                    </tr>
                    </#list>
                </tbody>
            </table>
            <#else >
                <h1 class="text-danger"> No such Payment request found in Database..</h1>
            </#if>
        </div>
    </div>

</div>

<!--End First Row -->



<script>
     function deletePaymentRequest(id){
         $('#alertModal-warning').modal('show');
         $('#alert-warning-title').html('Warning !') ;
         $('#alert-warning-body').html('Are you sure to delete this request ?') ;

         $.ajax({
             url: '/ERP/brtc/deletePaymentRequest.erp',
             data: "id="+id,
             dataType: "json",
             success: function(data){
                 if(data.success === true){
                     window.location.href = '/ERP/brtc/paymentRequestList.erp?status=0';
                 }else{
                     $('#alertModal-danger').modal('show');
                     $('#alert-danger-title').html('Sorry') ;
                     $('#alert-danger-body').html(data.msg) ;
                 }
             }
         });
     }
</script>
</@layout.my_app_layout>



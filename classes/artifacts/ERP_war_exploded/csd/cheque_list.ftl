<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >
<script src="#"></script>

<div class="bread_crumbs_ui_div" style="width: 611px">
    <ul id="crumbs_ui_custom">
        <li><a href="index">Dashboard</a></li>
        <li><a href="approveHome.erp">Approve Home</a></li>
        <li><a href="#">${PageTitle}</a></li>
    </ul>
</div>

<br class="clear"/>

<div class="widget">
    <style>

        table, hr {
            margin-left: 30px;
            margin-right: 10px;
        }

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            font-size: 13px;
            padding: 3px;
        }
        tr{height:30px}
        .even{background-color: #d0e3e8
        }
        th {
            text-align: center;
            font-weight: bold;
            color: green;
            background-color: #b9b9b9;
        }

        .cid {
            font-weight: bold;
            color: green;
            text-align: center;
            width: 110px;
        }
        .date{width:100px; text-align: center}
        .rNo{width:70px; text-align: center}
        .sl{width:40px; text-align: center}
        .name{width: 300;}
        .amount{width: 80px; text-align: center}
        .action{
            width: 150px;
            text-align: center;
        }
    </style>
    <div class="header">
        <span><span class="ico gray money_disburse"></span>${PageTitle}</span>

    </div>

    <div class="content">
        <form name="cidForm" id="cidForm" action="moneyDisburseList.erp" method="GET">
            <input type="text" name="findFor" id="findFor" placeholder="not | all | CID" value="" style="font-size: 15px"/>
            <a onclick="openHelp();">Help(?)</a>
            <label id="errorMsg" name="errorMsg" style="color: red;"></label>
            <a class="print-link no-print" onclick="jQuery('#ele1').print()" style="position: absolute; left: 88%;"><img
                    alt="Print"
                    src="../resources/images/csd/printer2.png"/></a>
            <a class="print-link no-print" onclick="jQuery('#ele1').print()" style="position: absolute; left: 90%;"><img
                    alt="Pdf"
                    src="../resources/images/csd/pdf.png"/></a>
        </form>
        <div id="ele1" class="content scaffold-list" role="main">
            <div style="min-height: 1250px">
                <h3><label style="color: #1c0eff">Check list (Not Passed)</label></h3>
                <table>
                    <tr style="font-weight: bold; color: #0200ff">
                        <th>Sl.</th>
                        <th>Cheque Details</th>
                        <th>CID</th>
                        <th>Name</th>
                        <th>Amount</th>
                        <th>Receipt Date</th>
                        <th>Receipt</th>
                        <th>Cheque Date</th>
                        <th>Action</th>
                    </tr>
                    <#assign x = 1>
                    <#list chequeList as cheque>
                            <#if cheque.status = "NOT PASSED">
                                <#if x%2==0><tr class=" not even"></#if>
                                <#if x%2!=0><tr class="not odd"></#if>
                                    <td class="sl">${x}</td>
                                    <td class="cid">${cheque.chequeDetails}</td>
                                    <td class="cid">${cheque.cid}</td>
                                    <td class="name">${cheque.name}</td>
                                    <td class="amount">${cheque.amount}</td>
                                    <td class="date">${cheque.receiptDate}</td>
                                    <td class="rNo">${cheque.receiptNo}</td>
                                    <td class="date">${cheque.chequeDate}</td>
                                    <td class="action">
                                        <input type="hidden" name="chequeDate${cheque.id}" id="chequeDate${cheque.id}" value="${cheque.chequeDate}"/>
                                        <label onclick="abc(${cheque.id}, 1111)"><img title='Update' src='../resources/images/common/progress.png'/></label>
                                     &nbsp;
                                        <label onclick="abc(${cheque.id}, 2222)"><img title='Reject' src='../resources/images/common/reject4.png'/></label>

                                    </td>
                                <#assign x = x + 1>
                                </tr>
                            </#if>
                    </#list>
                </table>
            </div>
            <br/><br/>
            <div class="copyright"> Powered by : <span class="tip"><a href="#" original-title="zero.com.bd">Khomeni</a> </span>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function abc(id, code){
            var chequeDate = document.getElementById("chequeDate"+id).value;
            var aaa = smartDateToNormal(chequeDate);
            var passedDate = prompt("Type cheque passed date ("+id+")", aaa);
            var href = "updateChequeStatus.erp";
            window.location = href+"?passedDate="+passedDate+"&id="+id+"&code="+code;

        }


        $("#findFor").keyup(function (event) {
            var id = document.getElementById("cid").value;
            if (event.keyCode == 13) {
                if (id.toUpperCase() != "ALL" || id.toUpperCase() != "ALL") {
                    document.getElementById("errorMsg").innerHTML = "Please insert ???";
                } else {
                    document.cidForm.submit();
                }
            }
        });
        $(document).ready(function () {
            $("#findFor").focus();
        });

        function openHelp() {
            var content = "Please do any one of the following to get result<hr/>"+
                    "To get result for all type <b>'all'</b> and press Enter<br/>"+
                    "To get result for pending type <b>'not'</b> and press Enter<br/>"+
                    "To get result for individual type<b> 'cid'</b> like <b> '12'</b> and press Enter<br/>";
            top.helpPan = window.open('','','width=500, height=250, top=270, left=520, ')
            top.helpPan.document.writeln(
                    '<html><head><title>Help</title></head>'
                            +'<body bgcolor=white onLoad="self.focus()" style="font-family: calibri; color: green">'
                            +content
                            +'</body></html>'
            )
            top.helpPan.document.close()
        }


    </script>


</div>

</@layout.gen_app_layout>
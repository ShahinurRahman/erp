<#import "../../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >
<script src="#"></script>

<div class="bread_crumbs_ui_div" style="width: 611px">
    <ul id="crumbs_ui_custom">
        <li><a href="index">Dashboard</a></li>
        <li><a href="#">CSD Home</a></li>
        <li><a href="paymentHome.erp">Payment Home</a></li>
        <li><a href="#">${PageTitle}</a></li>
    </ul>
</div>

<br class="clear"/>

<div class="widget">

    <div class="header">
        <span><span class="ico gray user"></span>${PageTitle}</span>

    </div>

    <div class="content">
        <form name="cidForm" id="cidForm" action="viewPaymentStatement.erp" method="GET">
            <input type="text" name="cid" id="cid" placeholder="CID : e.g. 12, 123" style="font-size: 15px"/>
            <a onclick="openHelp();">Help(?)</a>
            <label id="errorMsg" name="errorMsg" style="color: red;"></label>
            <label style="position: absolute; left: 80%;"><input type="checkbox" checked="checked" onclick="toggle(this)"/> Hide
                Header</label>
            <a class="print-link no-print" onclick="jQuery('#ele1').print()" style="position: absolute; left: 88%;"><img alt="Print"
                    src="../resources/images/csd/printer2.png"/></a>
            <a class="print-link no-print" onclick="jQuery('#ele1').print()" style="position: absolute; left: 90%;"><img
                    alt="Pdf"
                    src="../resources/images/csd/pdf.png"/></a>
        </form>
        <div id="ele1" class="content scaffold-list" role="main">
            <br/><br/>
            <div class="headerDiv" id="headerDiv">
                <table class="headTable" id="headTable">
                    <tr>
                        <td class="CompanyName">D<span style="color: #c04c05">O</span>RPAN Properties Limited</td>
                    </tr>
                    <tr>
                        <td class="address">18, Jasimuddin Avenue, Uttara, Dhaka-1230</td>
                    </tr>
                    <tr>
                        <td class="address">Ph: 0289 58752, cs.dorpan@gmail.com</td>
                    </tr>
                    <tr>
                        <td class="header"></td>
                    </tr>
                </table>
                <hr/>
            </div>
            <#if errMsg = "">
            <h1 style="text-align: center">Payment Statement</h1>
            <br/><br/><br/><br/>
            <div style="min-height: 1000px">

                <h3><label style="color: #1c0eff">${cid}</label> : <label style="color: green">${customerName}</label>
                </h3>

                <table>
                    <tr style="font-weight: bold; color: #0200ff">
                        <th class="date">Date</th>
                        <th class="vrNo">Receipt No/Vr No.</th>
                        <th class="mode">Mode of payment</th>
                        <th class="status">Status</th>
                        <th class="amount">Debt(Dr.)</th>
                        <th class="amount">Credit(Cr.)</th>
                    </tr>
                    <#list paymentList as pl>
                        <tr class="datam">
                            <td class="date">${pl.date}</td>
                            <td class="vrNo">${pl.no}</td>
                            <td class="mode">${pl.mode}</td>
                            <td class="status">${pl.status}</td>
                            <td class="amount">${pl.dr}</td>
                            <td class="amount">${pl.cr}</td>
                        </tr>
                    </#list>

                    <tr class="total">
                        <td colspan="4">Total Dr. & Total Cr. : </td>
                        <td class="amount">${totalDr}</td>
                        <td class="amount">${totalCr}</td>
                    </tr>
                    <tr class="">
                        <td colspan="4" class="closing">Closing Balance :</td>
                        <td colspan="2" class="closing">${totalDeposit}</td>
                    </tr>

                </table>
            </div>
            <#else >
                <h1 style="color: red">${errMsg}</h1>
            </#if>
        </div>
    </div>
    <script type="text/javascript">
        function submitForm() {
            document.dataForm.submit();
        }


        $("#cid").keyup(function (event) {
            var id = document.getElementById("cid").value;
            if (event.keyCode == 13) {
                document.cidForm.submit();
            }
        });

        function openHelp() {
            var content =
                    "Please type <b>'cid'</b> and press Enter to get <b>Payment Statement</b><br/>"+
                    "<i>e.g. </i> <b>12</b>, <b>125</b>,  <b>126</b> etc. and press Enter<br/>";
            top.helpPan = window.open('','','width=500, height=250, top=270, left=520, ')
            top.helpPan.document.writeln(
                    '<html><head><title>Help</title></head>'
                            +'<body bgcolor=white onLoad="self.focus()" style="font-family: calibri; color: green; font-size: 32px">'
                            +content
                            +'</body></html>'
            )
            top.helpPan.document.close()
        }
        $(document).ready(function () {
            $("#cid").focus();
            $("#headerDiv").hide();
        });

        function toggle(obj) {
            var $input = $(obj);
            if ($input.prop('checked')) $("#headerDiv").hide();
            else $("#headerDiv").show();
        }
    </script>

    <style>
        table, hr {
            margin-left: 50px;
            margin-right: 50px;
        }

        table, th, td {
            border: 0px dotted black;
            border-collapse: collapse;
            font-size: 14px;
            padding: 5px 16px 5px 6px;
        }

        .datam{height: 35px; border-bottom: 1px dotted #747474
        }


        td {
            width: 110px;
        }

        th {
            text-align: center;
            font-weight: bold;
            color: #000200;
            background-color: #b96519;
            border-top: 1px solid black; border-bottom: 1px solid black;
        }
        .total{
            border-top: 2px double #000000;
            font-weight: bold;
            text-align: right;
        }
        .closing{
            border-top: 5px double #000000;

            font-weight: bold;
            font-size: 17px;
            text-align: right;
            height: 40px;
        }
        .amount {
            font-weight: bold;
            text-align: right;
            width: 150px;
        }
        .date{width: 250px; text-align: center}
        .mode {
            width: 250px; text-align: center
        }
        .vrNo {
            width: 200px; text-align: center
        }
        .status {
            width: 250px; text-align: left
        }

        .companyname, .address, .header {
            width: 1080px;
            text-align: center;
            font-weight: bold
        }

        .CompanyName {
            font-size: 30px;
        }

        .address {
            font-size: 14px;
        }

        .header {
            font-size: 20px;
        }
    </style>
</div>

</@layout.gen_app_layout>
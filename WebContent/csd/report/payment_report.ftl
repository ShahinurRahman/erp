<#import "../../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >
<script src="#"></script>

<div class="bread_crumbs_ui_div" style="width: 611px">
    <ul id="crumbs_ui_custom">
        <li><a href="index">Dashboard</a></li>
        <li><a href="#">CSD Home</a></li>
        <li><a href="reportHome.erp">Report Home</a></li>
        <li><a href="#">${PageTitle}</a></li>
    </ul>
</div>

<br class="clear"/>

<div class="widget">


<style>
        .statusOfPayment{
            border: 1px solid #000000;
            margin-left: 80px;
            margin-right: 50px;
            width: 850px;
        }
        .statusOfPayment tr td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 3 20px 3 10px;
            font-size: 14px;
            height:30px;
        }
        .amount, .status{
            width: 130px;text-align: right; padding-right: 15px
        }
        .particular{width: 200px}

        .promo1 {
            margin-left: 80px;
            margin-right: 50px;
            width: 850px;
            border: 1px solid #000000;
            padding: 3 20px 3 10px;

        }
        .date{font-weight: bold; color: green}
        .full{
            width: 800px; padding-left: 5px;
        }
        .mid{
            text-align: center;
        }
        .left{
            text-align: left;
        }
        .right{
            text-align: right;
        }

        .headerTable {
            margin-left: 80px;
            margin-right: 50px;
            width: 850px;
            border: 0px;
        }
        td {
            width: 200px;
            font-weight: bold;
        }

        th {
            text-align: center;
            font-weight: bold;
            color: green;
            border: 1px solid #000000;
        }


        .promo1 td{padding: 4px}
        .promo2{
            margin-top: 30px;
            margin-left: 80px;
            margin-right: 50px;
            width: 850px;}
        .promo2 tr td {border: 0px; padding: 3 20px 3 10px}
        .headTable{margin-left: 0px}
        .CompanyName{width: 1000px; text-align: center; font-size: 30px; font-weight: bold}
        .address{width: 1000px; text-align: center; font-size: 14px; font-weight: bold}
        .header{width: 1000px; text-align: center; font-size: 20px; font-weight: bold}
        hr{border: 1px double #000000}
    </style>
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
    $(document).ready(function () {
        $("#cid").focus();
        $("#headerDiv").hide()
    });

    function toggle(obj) {
        var $input = $(obj);
        if ($input.prop('checked')) $("#headerDiv").hide();
        else $("#headerDiv").show();
    }

</script>
    <div class="header">
        <span><span class="ico gray user"></span>${PageTitle}</span>

    </div>

    <div class="content">
        <form name="cidForm" id="cidForm" action="viewPaymentReport.erp" method="GET">
            <input type="text" name="cid" id="cid" placeholder="CID : e.g. 012, 123 (Press Enter)"/>

            <label id="errorMsg" name="errorMsg" style="color: red;"></label>
            <label style="position: absolute; left: 80%;"><input type="checkbox" onclick="toggle(this)" checked/> Hide Header</label>
            <a onclick="jQuery('#ele1').print()" style="position: absolute; left: 88%;"><img
                    alt="Print" src="../resources/images/csd/printer2.png"/></a>
            <a onclick="jQuery('#ele1').print()" style="position: absolute; left: 90%;"><img
                    alt="Pdf" src="../resources/images/csd/pdf.png"/></a>
        </form>
        <div id="ele1" class="content scaffold-list" role="main">
            <#if errMsg = "">
            <div style="min-height: 1400px">
                <br/><br/><br/><br/><br/>
                <div class="headerDiv" id="headerDiv">
                    <table class="headTable" id="headTable">
                        <tr><td class="CompanyName">D<span style="color: #c04c05">O</span>RPAN Properties Limited</td></tr>
                        <tr><td class="address">18, Jasimuddin Avenue, Uttara, Dhaka-1230</td></tr>
                        <tr><td class="address">Ph: 0289 58752, cs.dorpan@gmail.com</td></tr>
                        <tr><td class="header"></td></tr>
                    </table>
                    <hr/>
                    <br/><br/><br/>
                </div>
                <table class="headerTable">
                    <tr>
                        <td class="right">File No.: ${fileNo}</td>
                    </tr>
                </table>
                <br/><br/>
                <table class="headerTable">
                    <tr>
                        <td class="right date">${today}</td>
                    </tr>
                </table>
                <br/><br/>  <br/><br/>
                <table class="headerTable">
                    <tr>
                        <td style="width: 800px; text-align: center; font-size: 22px; font-weight: bold">PAYMENT REPORT</td>
                    </tr>
                    <tr>
                        <td style="width: 800px; text-align: center;">of</td>
                    </tr>
                </table>
                <table class="promo1" border="1px solid black" style="border-collapse: collapse">
                    <tr>
                        <td colspan="4" style="background-color: #41adff"  class="full mid">${cid}</td>
                    </tr>
                    <tr>
                        <td colspan="4"  class="full left"><label
                                style="color: blue; font-size: 18px">${customerName}</label></td>
                    </tr>
                    <tr>
                        <td colspan="4"  class="full left">Address: ${address}</td>

                    </tr>
                    <tr>
                        <td  class="full left">Apart ID(AID) : ${aid}</td>
                        <td  class="full left">Hand-Over : ${handOver}</td>
                        <td  class="full left">Size : ${size} sft</td>
                        <td  class="full left">Price/Sft : ${price}/=</td>
                    </tr>
                </table>

                <table class="promo2" border="1px solid black" style="border-collapse: collapse">
                    <tr>
                        <td class="left">Total price of the flat :</td>
                        <td class="right">${apartmentPrice}/=</td>
                        <td class=""></td>
                    </tr>
                    <tr style="background-color: #00dd70">
                        <td class="left">Deposited amount :</td>
                        <td class="right">${paidTotalActual}/=</td>
                        <td class="">[Till ${today}]</td>
                    </tr>
                    <tr>
                        <td class="left">Rest Amount :</td>
                        <td class="right">${restTotal}/=</td>
                        <td class=""></td>
                    </tr>

                </table>

                <br/><br/>
                <label style="padding-left: 80px; font-size: 17px; color: #00184b">Payment Distribution:</label>
                <table class="statusOfPayment">
                    <tr style="background-color: #93a456">
                        <th class="particular">Particular</th>
                        <th class="amount">Total</th>
                        <th class="amount">Payable</th>
                        <th class="amount">Paid</th>
                        <th class="status">Status/Due</th>
                    </tr>
                    <tr>
                        <td class="particular">Installment (Nos.)</td>
                        <td class="amount">${totalInst} <br/> Tk.${amountPerInst?string("#,##0")} / Inst.</td>
                        <td class="amount">${payableInst?string("#,##0.00")}</td>

                        <td class="amount">${paidInst?string("#,##0.00")}</td>
                        <td class="status">${dueInst?string("#,##0.00")}</td>
                    </tr>
                    <tr>
                        <td class="particular">Installment Amount</td>
                        <td class="amount">${totalInstAmount}</td>
                        <td class="amount">${payableInstAmount}</td>
                        <td class="amount">${paidInstAmount}</td>
                        <td class="status">${dueInstAmount}</td>
                    </tr>
                    <tr>
                        <td class="particular">Down Payment</td>
                        <td class="amount">${totalDp}</td>
                        <td class="amount">${payableDp}</td>
                        <td class="amount">${paidDp}</td>
                        <td class="status">${dueDp}</td>
                    </tr>
                    <tr>
                        <td class="particular">Special Payment</td>
                        <td class="amount">${totalSp}</td>
                        <td class="amount">${payableSp}</td>
                        <td class="amount">${paidSp}</td>
                        <td class="status">${dueSp}</td>
                    </tr>
                    <tr>
                        <td class="particular">Car Parking</td>
                        <td class="amount">${totalCp}</td>
                        <td class="amount">${payableCp}</td>
                        <td class="amount">${paidCp}</td>
                        <td class="status">${dueCp}</td>
                    </tr>
                    <tr>
                        <td class="particular">Other Payment</td>
                        <td class="amount">${totalOp}</td>
                        <td class="amount">${payableOp}</td>
                        <td class="amount">${paidOp}</td>
                        <td class="status">${dueOp}</td>
                    </tr>
                </table>

            </div>
            <div id="recruit_home" class="" role="main" style="width: 1000px; text-align: right;">
                <label style="color: green; text-align: right">Powered by: ZERO, 01717659287</label>

            </div>
            <#else >
                <h1 style="color: #ff0000">${errMsg}</h1>
            </#if>
        </div>
    </div>

</div>

</@layout.gen_app_layout>
<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >

<div class="bread_crumbs_ui_div" style="width: 611px">
    <ul id="crumbs_ui_custom">
        <li><a  href="../home.erp">Dashboard</a></li>
        <li><a  href="moneyReceiptList.erp">All Receipts</a></li>
        <li><a  href="#">Create</a></li>
    </ul>
</div>
<br class="clear"/>


<div class="widget" style="width: 500px">

    <div class="header" style="width: 500px;">
        <span><span class="ico gray user"></span>${PageTitle}</span>
    </div>
    <div  style="width: 500px;">
        <span><span style="color: red; font-weight: bold"></span></span>
    </div>

    <div id="user_crate" class="content" role="main" style="width: 450px;">

        <form name="dataForm" id="dataForm" action="saveMoneyReceipt.erp" method="POST">
            <fieldset class="form">
                <div class="container_16">
                    <div class="grid_3 alpha">
                        <label for="receiptNo">
                            Receipt No:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="receiptNo" class="myElement a0" id="receiptNo" placeholder="receiptNo" value=""/>
                        <br>${msg}
                </div>


                    <br class="clear" /> <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="receiptDate">
                            Receipt Date:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="receiptDate" class="myElement a1" id="receiptDate" placeholder="receiptDate" onkeyup="setCashDate();"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="amount">
                            Amount (BDT):
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="amount" class="myElement a2" id="amount" placeholder="amount" value=""/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="CID">
                            Customer ID:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="CID" class="myElement a3" id="CID" value="" placeholder="Customer Identity"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="paymentMethod">
                            Payment Method:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <!-- Select Option for "Cash | TT | Cheque | DD | Others | Adjustment | Incentive | Profit | Share Dividend -->
                        <select name="paymentMethod" id="paymentMethod">
                            <option value="Cash">Cash</option>
                            <option value="Cheque">Cheque</option>
                            <option value="TT">TT</option>
                            <option value="DD">DD</option>
                            <option value="Incentive">Incentive</option>
                            <option value="Profit">Profit</option>
                            <option value="Others">Others</option>
                        </select>
                        <!-- <input type="text" name="paymentMethod" id="paymentMethod" placeholder="Payment Method" value="Cash"/>  -->
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="note">
                            Note:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="note" id="note" class="myElement a4" placeholder="Note" value="No note here"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="cashDate">
                            Cash Date:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="cashDate" class="myElement a5" id="cashDate" placeholder="cashDate" value=""/>
                    </div>
                    <input type="hidden" name="signature" id="signature" class="myElement a6" placeholder="signature" value="2"/>

                    <br class="clear" /> <br class="clear"/>
                    <div class="grid_4 omega reset-input reset-button-left">
                        <a id="userCreate" class="button icon approve myElement a7"  onclick="submitForm()">Save</a>
                        <a id="ff" class="button danger icon remove" onclick="document.dataForm.reset()">Clear</a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <!--end user create div-->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".a0").focus();
        });
        var counter = 1;
        $(".myElement").keyup(function (event) {
            if (event.keyCode == 13) {
                if(counter < 7){
                    $(".a"+counter).focus();
                    $(".a"+counter).select();
                    counter++;
                }else{
                    submitForm();
                }

            }
        });

        function submitForm(){
            document.dataForm.submit();
            //alert("Record Saved ! !");
        }

        function setCashDate() {
            var receiptDate = document.getElementById("receiptDate");
            var cashDate = document.getElementById("cashDate");
            cashDate.value = receiptDate.value;
        }
    </script>
</div>
<#--End widget div-->

</@layout.gen_app_layout>

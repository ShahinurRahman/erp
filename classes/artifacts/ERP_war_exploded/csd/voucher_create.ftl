<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >

<div class="bread_crumbs_ui_div" style="width: 611px">
    <ul id="crumbs_ui_custom">
        <li><a  href="index">Dashboard</a></li>
        <li><a href="//home.erp">CSD Home</a></li>
        <li><a  href="#">Voucher</a></li>
        <li><a  href="#">Create</a></li>
    </ul>
</div>
<br class="clear"/>

<div class="widget" style="width: 500px">

    <div class="header" style="width: 500px;">
        <span><span class="ico gray user"></span>${PageTitle}</span>
    </div>

    <div id="user_crate" class="content" role="main" style="width: 450px;">

        <form name="dataForm" id="dataForm" action="saveVoucher.erp" method="POST">
            <fieldset class="form">
                <div class="container_16">
                    <div class="grid_3 alpha">
                        <label for="voucherNo">
                            Voucher No:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="voucherNo" id="voucherNo" placeholder="voucherNo"/>
                    </div>

                    <br class="clear" /> <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="voucherDate">
                            Voucher Date :
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="voucherDate" id="voucherDate" placeholder="voucherDate" value=""/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="type">
                            Voucher type:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <select name="type" id="type">
                            <option value="withdraw">Withdraw</option>
                            <option value="adjustment">Adjustment</option>
                        </select>
                    </div>

                    <br class="clear cidFrom" /> <br class="clear cidFrom" />
                    <div class="grid_3 alpha cidFrom">
                        <label for="cidFrom">
                            From (CID):
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input cidFrom">
                        <input type="text" name="cidFrom" id="cidFrom" placeholder="cidFrom" value=""/>
                    </div>

                    <br class="clear cidTo" /> <br class="clear cidTo" />
                    <div class="grid_3 alpha cidTo">
                        <label for="cidTo">
                            To (CID):
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input cidTo">
                        <input type="text" name="cidTo" id="cidTo" placeholder="CID" value=""/>
                    </div>

                    <br class="clear" /> <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="amount">
                            Amount:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="amount" id="amount" placeholder="amount" value=""/>
                    </div>

                    <br class="clear" /> <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="note">
                            Note:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="note" id="note" placeholder="Note" value="Transfer to "/>
                    </div>

                    <br class="clear" /> <br class="clear" />
                    <div class="grid_4 omega reset-input reset-button-left">
                        <a id="userCreate" class="button icon approve" onclick="submitForm()">Save</a>
                        <a id="ff" class="button danger icon remove" onclick="document.dataForm.reset()">Clear</a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <!--end user create div-->

    <script type="text/javascript">
        function submitForm(){
            document.dataForm.submit();
            //alert("Record Saved ! !");
        }

        $(document).ready(function(){
            $("select").change(function(){
                $( "select option:selected").each(function(){
                    if($(this).attr("value")=="adjustment"){
                        $(".cidFrom").show();
                        $(".cidTo").show();
                        $(".drCr").hide();
                    }
                    if($(this).attr("value")=="withdraw"){
                        $(".cidFrom").show();
                        $(".cidTo").hide();
                        $(".drCr").show();
                    }
                    if($(this).attr("value")=="other"){

                    }
                });
            }).change();
        });
    </script>
    <script src="../csd/voucher_create.js"></script>



</div>
<#--End widget div-->

</@layout.gen_app_layout>

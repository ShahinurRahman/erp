<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >

<div class="bread_crumbs_ui_div" style="width: 611px">
    <ul id="crumbs_ui_custom">
        <li><a  href="index">Dashboard</a></li>
        <li><a href="//home.erp">CSD Home</a></li>
        <li><a  href="#">Customer</a></li>
        <li><a  href="#">Create</a></li>
    </ul>
</div>
<br class="clear"/>

<div class="widget" style="width: 500px">

    <div class="header" style="width: 500px;">
        <span><span class="ico gray user"></span>${PageTitle}</span>
    </div>

    <div id="user_crate" class="content" role="main" style="width: 450px;">

        <form name="customerForm" id="customerForm" action="saveCustomer.erp" method="POST">
            <fieldset class="form">
                <div class="container_16">
                    <div class="grid_3 alpha">
                        <label for="bookingDate">
                            Booking Date:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="bookingDate" id="bookingDate" placeholder="Booking Date"/>
                    </div>


                    <br class="clear" /> <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="cid">
                            Customer Identity:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="cid" id="cid" placeholder="Customer Identity"/>
                        <br>${errorMsg}
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="name">
                            Customer Name:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="name" id="name" placeholder="Customer Name" onkeyup="changeCase();"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="buildingName">
                            Building:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <select name="buildingId" id="buildingId">
                            <#list buildings as building>
                                <option value="${building.id}">${building.buildingName}</option>
                            </#list>
                        </select>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="aid">
                            Apartment ID:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="aid" id="aid" placeholder="e.g. 402, 201, 303"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="countryLocation">
                            Country Location:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="countryLocation" id="countryLocation" placeholder="e.g. JP, BD, USA, UAE"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="referenceId">
                            Reference ID:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input list="refId" style="height: 30px; padding-left: 5px; width: 200px;" name="referenceId" id="referenceId" placeholder=""/>
                        <datalist id="refId"  autocomplete="off">
                            <#list mids as mida>
                                <option value="${mida.mid} : ${mida.name}">
                            </#list>
                        </datalist>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="offerId">
                            Offer Name:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <select name="offerId" id="offerId"  style="width: 80%;">
                            <#list offers as offer>
                                <option  style="width: 200px;" value="${offer.id}">${offer.offerName}</option>
                            </#list>
                        </select>

                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="careById">
                            Care By (MID):
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input list="careId" style="height: 30px; padding-left: 5px; width: 200px;" name="careById" id="careById" placeholder=""/>

                        <datalist id="careId"  autocomplete="off">
                            <#list empCsds as empCsd>
                            <option value="${empCsd.mid} : ${empCsd.name}">
                            </#list>
                        </datalist>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="cellPhone">
                            Cell Phone:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="cellPhone" id="cellPhone" placeholder="cellPhone"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="altPhone">
                            Alternative Phone:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="altPhone" id="altPhone" placeholder="altPhone"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="emailAddress">
                            Email Address:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="emailAddress" id="emailAddress" placeholder="emailAddress"/>
                        <br><label id="errorEmail" style="color: red"></label>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="mailingAddress">
                            Mailing Address:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="mailingAddress" id="mailingAddress" placeholder="mailingAddress"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="floorSize">
                            Floor Size:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="floorSize" id="floorSize" placeholder="floorSize"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="price">
                            Price / sft:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="price" id="price" placeholder="price / sft"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="handoverDate">
                            Handover Date:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <input type="text" name="handoverDate" id="handoverDate" placeholder="handoverDate"/>
                    </div>

                    <br class="clear" />   <br class="clear" />
                    <div class="grid_3 alpha">
                        <label for="paymentType">
                            Payment Type:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>
                    <div class="grid_4 omega reset-input">
                        <select name="paymentType" id="paymentType">
                            <option value="Installment">Installment</option>
                            <option value="One Time">One Time</option>
                            <option value="Special">Special</option>
                        </select>
                    </div>

                    <br class="clear" /> <br class="clear" />
                    <div class="grid_4 omega reset-input reset-button-left">
                        <a id="userCreate" class="button icon approve" onclick="submitForm(document.customerForm.emailAddress.value)">Save</a>
                        <a id="ff" class="button danger icon remove" onclick="document.customerForm.reset()">Clear</a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <!--end user create div-->

    <script type="text/javascript">
        function submitForm(eAddress){
            if(checkEmail(eAddress)){
                document.customerForm.submit();
            }else{
                document.getElementById("errorEmail").innerHTML = "This is not valid E-address";
            }
            //alert("Record Saved ! !");
        }

        function checkEmail(arg){
            var pattern = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
            if(pattern.test(arg)){
                return true;
            }else{
                return false;
            }
        }


        function changeCase() {
            var x = document.getElementById("name");
            x.value = x.value.toUpperCase();
        }

    </script>
    <style>
        select { width: 5.5em }
    </style>
</div>
<#--End widget div-->

</@layout.gen_app_layout>

<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >

<div class="bread_crumbs_ui_div" style="width: 500px">
    <ul id="crumbs_ui_custom">
        <li><a href="${DashboardLink}">Dashboard</a></li>
        <li><a href="userDetailsList.erp">User List</a></li>
        <li>Create User Details</li>
    </ul>
</div>
<br class="clear"/>

<div class="widget" style="width: 500px">

    <div class="header" style="width: 500px;">
        <span><span class="ico gray user"></span>${PageTitle}</span>
    </div>

    <div id="user_crate" class="content" role="main" style="width: 450px;">

        <form name="dataForm" id="dataForm" action="saveUserDetails.erp" method="POST">

            <fieldset class="form">
                <div class="container_16">
                    <div class="grid_3 alpha">
                        <label for="tokenId">
                            Token/Username:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <select name="tokenId" id="tokenId">
                            <#list users as user>
                                <#if user.token.userDetails??>
                                    <#else >
                                    <option value="${user.token.tokenId}">${user.token.username}</option>
                                </#if>
                            </#list>
                        </select>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="groupId">
                            Group:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <select name="groupId" id="groupId">
                            <#list groups as group>
                                <option value="${group.authorizedId}">${group.authorizationName}</option>
                            </#list>
                        </select>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="name">
                            Full Name:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="name" id="name"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="nickName">
                            Nick Name:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="nickName" id="nickName"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="desiId">
                            Designation:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <select name="desiId" id="desiId">
                            <#list designationList as designation>
                                <option value="${designation.id}">${designation.name}</option>
                            </#list>
                        </select>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="dptId">
                            Department:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <select name="dptId" id="dptId">
                            <#list departmentList as department>
                                <option value="${department.id}">${department.name}</option>
                            </#list>
                        </select>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="officePhone">
                            Office Phone:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="officePhone" id="officePhone"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="cellPhone">
                            Cell Phone:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="cellPhone" id="cellPhone"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="workEmail">
                            Work Email:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="workEmail" id="workEmail"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="personalEmail">
                            Personal Email:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="personalEmail" id="personalEmail"/>
                    </div>
                    <br class="clear" /><br class="clear" />

                    <div class="grid_3 alpha">
                        <label for="webLink">
                            Web Link:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="webLink" id="webLink"/>
                    </div>
                    <br class="clear" /><br class="clear" />




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
        }
    </script>
</div>
<#--End widget div-->

</@layout.gen_app_layout>
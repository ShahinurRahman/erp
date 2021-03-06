<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >

<div class="bread_crumbs_ui_div" style="width: 500px">
    <ul id="crumbs_ui_custom">
        <li><a href="${DashboardLink}">Dashboardpl</a></li>

        <li><a href="userList.erp">User List</a></li>
        <li>Create User</li>
    </ul>
</div>
<br class="clear"/>

<div class="widget" style="width: 500px">

    <div class="header" style="width: 500px;">
        <span><span class="ico gray user"></span>${PageTitle}</span>
    </div>

    <div id="create_category" class="content" role="main" style="width: 450px;">

        <form name="categoryForm" id="categoryForm" action="saveCategory.erp" method="POST">

            <fieldset class="form">


                <div class="container_16">

                    <div class="grid_3 alpha">
                        <label>
                            Component Name:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="categoryName" id="categoryName"/>
                    </div>

                    <br class="clear" />
                    <br class="clear" />

                    <div class="grid_3 alpha">
                        <label>
                            Description:
                            <span class="required-indicator">*</span>
                        </label>
                    </div>

                    <div class="grid_4 omega reset-input">
                        <input type="text" name="parentCategory" id="parentCategory"/>
                    </div>

                    <br class="clear" />
                    <br class="clear" />

                    <div class="grid_4 omega reset-input reset-button-left">
                        <a id="createCategory" class="button icon approve" onclick="submitForm()">Save</a>
                        <a id="ff" class="button danger icon remove" onclick="document.categoryForm.reset()">Clear</a>
                    </div>



                </div>

            </fieldset>


        </form>
    </div>
    <!--end user create div-->

    <script type="text/javascript">
        function submitForm(){
            document.categoryForm.submit();
        }
    </script>
</div>
<#--End widget div-->

</@layout.gen_app_layout>
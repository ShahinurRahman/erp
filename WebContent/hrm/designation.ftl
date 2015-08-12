<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "Test" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="../home.erp">Dashboard</a>
            </li>
            <li class="active">
                <i class="fa fa-arrow-circle-o-right"></i>${PageTitle}
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-6 text-center">
        <form name="dataForm" id="dataForm" action="saveDesignation.erp" method="POST">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3 class="text-left text-success">${PageTitle}</h3>
                    <input type="hidden" name="id" id="id" value=""/>

                    <div class="col-lg-4 text-left">
                        Designation:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="name" class="form-control" id="name">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 text-left">
                        Description:
                    </div>
                    <div class="col-lg-8 text-center">
                        <div class="form-group">
                            <div class="form-group has-success">
                                <input type="text" name="description" class="form-control" id="description">
                            </div>
                        </div>
                    </div>



                    <div class="col-lg-4 text-left">
                    </div>
                    <div class="col-lg-8 text-right">
                        <button type="reset" class="btn btn-primary">Reset</button>
                        <button type="submit" class="btn btn-success" id="saveBtn">Save</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="col-lg-6 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-primary">User List</h3>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Designation</th>
                            <th>Description</th>
                            <th class="text-center">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <#list designationList as designation>
                                <tr>
                                    <td class="id">${designation.id}</td>
                                    <td class="name">${designation.name}</td>
                                    <td class="desc">${designation.description}</td>
                                    <td class="text-center">
                                        <a href="deleteUserDetails.erp?id=${designation.id}" title="Delete"
                                           class="fa fa-times fa-lg text-pad-t-3"></a>
                                        &nbsp;&nbsp;
                                        <a title="Edit" class="fa fa-pencil fa-lg text-pad-t-3 designation-edit editBtn" id="editBtn"></a>
                                    </td>
                                </tr>

                            </#list>

                        <script type="text/javascript">
                            $(".designation-edit").click(function() {
                                var $row = $(this).closest("tr");    // Find the row
                                var $text1 = $row.find(".id").text(); // Find the text
                                var $text2 = $row.find(".name").text(); // Find the text
                                var $text3 = $row.find(".desc").text(); // Find the text

                                document.getElementById("id").value =  $text1;
                                document.getElementById("name").value =  $text2;
                                document.getElementById("description").value =  $text3;
                                document.getElementById("saveBtn").innerHTML = "Update";
                                $("form").attr("action","updateDesignation.erp");

                            });
                        </script>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

</div>
<!--End First Row -->

</@layout.my_app_layout>
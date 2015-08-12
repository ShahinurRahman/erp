<#import "../my_template/my_app_layout.ftl" as layout>
<@layout.my_app_layout "${PageTitle}" >
<!--Row for Bread Crumb-->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i> <a href="${DashBoardLink}">Dashboard</a>
            </li>
            <li>
                <i class="fa fa-list"></i><a href="/ERP/brtc/clientList.erp"> ${PageTitle} List</a>
            </li>
            <li>
                <i class="fa fa-cog fa-spin"></i> Edit ${PageTitle}
            </li>

        </ol>
    </div>
</div>

<div class="row">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-success">Create ${PageTitle}</h3>

                <form name="dataForm" id="dataForm" action="updateClient.erp" method="POST">
                    <div class="col-lg-6 text-center">
                        <input type="hidden" name="id" id="id" value="${client.id}"/>
                        <div class="col-lg-4 text-left">
                            Client Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="name" id="name" value="${client.name}" class="form-control" disabled>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Address:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="address" id="address" class="form-control"
                                          rows="3">${client.address}</textarea>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Phone:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="phone" id="phone" value="${client.phone}" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Email:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="email" name="email" id="email" value="${client.email}" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Fax:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="fax" id="fax" value="${client.fax}" class="form-control">
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--Form right column-->
                    <div class="col-lg-6 text-center">

                        <div class="col-lg-4 text-left">
                            Description:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <textarea name="description" id="description"  class="form-control"
                                          rows="3">${client.description}</textarea>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Spokes Man Name:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="spokesMan" value="${client.spokesMan}" id="spokesMan" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Spokes Man Cell:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="spokesManCell"  id="spokesManCell" value="${client.spokesManCell}" class="form-control">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Operator:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <input class="form-control" name="operator" id="operator" type="text"
                                       value="${user}"
                                       disabled>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="submit" class="btn btn-success">Update</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->




</@layout.my_app_layout>



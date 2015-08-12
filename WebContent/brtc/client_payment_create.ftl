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
                <i class="fa fa-list"></i><a href="/ERP/brtc/clientPaymentList.erp?findFor=all&status=0"> Deposit List</a>
            </li>
            <li>
                <i class="fa fa-cog fa-spin"></i> Creating ${PageTitle}
            </li>

        </ol>
    </div>
</div>


<div class="row">
    <div class="col-lg-12 text-center">
        <div class="panel panel-default">
            <div class="panel-body">
                <h3 class="text-left text-success">Add Cheque Deposit Slip</h3>
                <hr/><hr/>
                <form name="dataForm" id="dataForm" action="saveClientPayment.erp" method="POST">
                    <div class="col-lg-6 text-center">


                        <div class="col-lg-4 text-left">
                            Project/File No:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group input-group  has-success">
                                <input list="projectList" name="fileNo" value="${fileNo}" id="fileNo" onkeyup="checkClient();" onblur="checkClient();" class="form-control">
                                <span class="input-group-btn">
                                    <button onclick="checkClient();" class="btn btn-success" type="button">Check Client &nbsp;&nbsp;
                                        <i class="fa fa-arrow-right fa-lg"></i>
                                    </button></span>
                            <#-- Data List code-->
                                <datalist id="projectList"  autocomplete="off">
                                    <#list projectList as project>
                                    <option value="${project.fileNo}">
                                    </#list>
                                </datalist>

                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            BRTC Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="brtcNo" id="brtcNo" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Deposit Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="depositNo" id="depositNo" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Ref. Number:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="refNo" id="refNo" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 text-left">
                            Cheque Details:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <div class="form-group has-success">
                                    <input type="text" name="chequeDetails" id="chequeDetails" class="form-control">
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                            Amount:
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group input-group  has-success">
                                <span class="input-group-addon">BDT.</span>
                                <input name="amount" id="amount" class="form-control" type="text" value="">
                                <span class="input-group-addon">.00/-</span>
                            </div>
                        </div>


                        <div class="col-lg-4 text-left">
                        </div>
                        <div class="col-lg-8 text-right">
                            <button type="reset" class="btn btn-primary">Reset</button>
                            <button type="button" onclick="submitForm()" class="btn btn-success" >Save</button>
                        </div>

                    </div>
                    <!--Form right column-->
                    <div class="col-lg-6 text-center" id="mak-right-column">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-lg-3 text-left">
                                    Client's Name:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="clientName" id="clientName" class="form-control"
                                                   disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 text-left">
                                    Client's Address:
                                </div>
                                <div class="col-lg-9 text-left">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="clientAddress" id="clientAddress" class="form-control"
                                                   disabled>
                                           <!-- <label class="form-control" id="clientAddress"></label>    -->
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 text-left">
                                    Spokes Man:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="spokesMan" id="spokesMan" class="form-control"
                                                   disabled>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-3 text-left">
                                    Cell Number:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <input type="text" name="cell" id="cell" class="form-control" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 text-left">
                                    Work Description:
                                </div>
                                <div class="col-lg-9 text-center">
                                    <div class="form-group">
                                        <div class="form-group has-success">
                                            <textarea disabled name="projectTitle" id="projectTitle" class="form-control  text-success text-justify"
                                                      rows="5"></textarea>
                                            <!--<label id="projectTitle" class="text-success text-justify"></label>-->
                                        </div>
                                    </div>
                                </div>


                            <#-- Hidden field for storing item and corresponding values  -->
                                <#list projectList as project>
                                    <input type="hidden"
                                           id="${project.fileNo}ProjectTitle"
                                           name="${project.fileNo}"
                                           value="${project.projectTitle}"/>
                                    <input type="hidden"
                                           id="${project.fileNo}Name"
                                           name="${project.fileNo}"
                                           value="${project.client.name}"/>
                                    <input type="hidden"
                                           id="${project.fileNo}SpokesMan"
                                           name="${project.fileNo}"
                                           value="${project.client.spokesMan}"/>
                                    <input type="hidden"
                                           id="${project.fileNo}Cell"
                                           name="${project.fileNo}"
                                           value="${project.client.spokesManCell}"/>
                                    <input type="hidden"
                                           id="${project.fileNo}Address"
                                           name="${project.fileNo}"
                                           value="${project.client.address}"/>
                                </#list>


                                <script type="text/javascript">
                                    function submitForm(){
                                        //checkValidity();
                                        document.dataForm.submit();
                                    }
                                    function checkClient() {
                                        clearAll();
                                        var fileNo = document.getElementById("fileNo").value;
                                        //alert(fileNo+" Y")
                                        var projectTitle = document.getElementById(fileNo+"ProjectTitle").value;
                                        //document.getElementById("projectTitle").innerHTML = "<hr/><u>Title:</u> "+projectTitle;
                                        document.getElementById("projectTitle").value = projectTitle;

                                        var clientName = document.getElementById(fileNo + "Name").value;
                                        document.getElementById("clientName").value = clientName;

                                        var spokesMan = document.getElementById(fileNo + "SpokesMan").value;
                                        document.getElementById("spokesMan").value = spokesMan;

                                        var cell = document.getElementById(fileNo + "Cell").value;
                                        document.getElementById("cell").value = cell;

                                        var clientAddress = document.getElementById(fileNo + "Address").value;
                                        document.getElementById("clientAddress").value = clientAddress;

                                    }
                                    function clearAll(){
                                        document.getElementById("projectTitle").value = "No project Found !";
                                        document.getElementById("clientName").value = "";
                                        document.getElementById("spokesMan").value = "";
                                        document.getElementById("cell").value = "";
                                        document.getElementById("clientAddress").value = "";
                                    }

                                    $( document ).ready(function() {
                                        // checkClient();
                                        var forWhat = document.getElementById("fileNo").value;
                                        if(forWhat!=""){
                                            checkClient();
                                        }
                                    });

                                </script>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--End First Row -->




</@layout.my_app_layout>

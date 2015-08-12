<!--Slider-->
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
        <li>
            <a href="home.erp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#access_dd"><i class="fa fa-fw fa-edit"></i> Access <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="access_dd" class="collapse">
                <li><a href="/ERP/security/createUser.erp?errMsg=1" class="null">User</a></li>
                <li><a href="/ERP/security/authorityList.erp" class="null">Authority</a></li>
                <li><a href="/ERP/security/featureList.erp" class="null">Feature</a></li>
                <li><a href="/ERP/security/userGroupList.erp" class="null">User Group</a></li>
                <li><a href="/ERP/security/componentList.erp" class="null">Component</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#hrm_dd"><i class="fa fa-fw fa-desktop"></i> H R M <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="hrm_dd" class="collapse">
                <li><a href="/ERP/hrm/userDetailsList.erp">Emp. Details</a></li>
                <li><a href="/ERP/hrm/createDepartment.erp">Department</a></li>
                <li><a href="/ERP/hrm/createDesignation.erp">Designation</a></li>
                <li><a href="/ERP/hrm/#.erp">User Type</a></li>
            </ul>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#brtc_dd"><i class="fa fa-fw fa-wrench"></i> Access <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="brtc_dd" class="collapse">
                <li><a href="/ERP/csd/reportHome.erp"><b>Project</b></a></li>
                <li><a href="/ERP/csd/moneyReceiptList.erp" class="null">Application</a></li>
                <li><a href="/ERP/csd/moneyDisburseList.erp?findFor=not"><b>History</b></a></li>
                <li><a href="/ERP/csd/csdConfigurationHome.erp"><b>Client</b></a></li>
                <li><a href="/ERP/csd/paymentHome.erp"><b>Team</b></a></li>
                <li><a href="/ERP/csd/approveHome.erp"><b>Distribution</b></a></li>
            </ul>
        </li>
        <li>
            <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
        </li>
        <li>
            <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
        </li>
        <li>
            <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="demo" class="collapse">
                <li>
                    <a href="#">Dropdown Item</a>
                </li>
                <li>
                    <a href="charts.html">Charts</a>
                </li>
                <li>
                    <a href="tables.html"> Tables</a>
                </li>
                <li>
                    <a href="forms.html"> Forms</a>
                </li>
                <li>
                    <a href="bootstrap-elements.html"> Bootstrap Elements</a>
                </li>
                <li>
                    <a href="bootstrap-grid.html">Bootstrap Grid</a>
                </li>

            </ul>
        </li>
        <li>
            <a href="#"><i class="fa fa-fw fa-file"></i> Blank Page</a>
        </li>
        <li>
            <a href="#"><i class="fa fa-fw"></i></a>
        </li>
        <li>
            <a href="#"><i class="fa fa-fw"></i></a>
        </li>
        <li>
            <a href="#"><i class="fa fa-fw"></i></a>
        </li>
        <li>
            <a href="#"><i class="fa fa-fw"></i></a>
        </li>
    </ul>
</div>

<script>
    var myVar=setInterval(function(){myTimer()},1000);

    function myTimer() {
        var d = new Date();
        document.getElementById("clock").innerHTML = d.toLocaleTimeString();
    }
</script>
<!--/Slider-->
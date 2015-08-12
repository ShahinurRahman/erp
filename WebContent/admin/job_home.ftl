<#import "../gen_template/gen_app_layout.ftl" as layout>
<@layout.gen_app_layout "${PageTitle}" >

<div class="bread_crumbs_ui_div" style="width: 849px">
    <ul id="crumbs_ui_custom">
        <li><a href="${DashboardLink}">Dashboard</a></li>
        <li>Job Home</li>
    </ul>
</div>
<br class="clear"/>

<div class="widget" style="width: 849px">

    <style>
        .content{height: 125px;}
        .widgetlist { list-style: none; }
        .widgetlist li { display: inline-block; float: left; width: 130px; margin: 0 10px 10px 0; }
        .widgetlist li a { display: block; padding: 15px; border: 1px solid #ccc; color: #333; text-align: center;  }
        .widgetlist li a { -moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px; -moz-box-shadow: 1px 1px 0 #fff; color: #069; }
        .widgetlist li a span { font-size: 12px; display: block; margin-top: 10px; }
        .widgetlist li a:hover { -moz-box-shadow: 0 0 4px #ddd; text-decoration: none; }
    </style>
    <div class="header" style="width: 849px;">
        <span><span class="ico gray leave"></span>Job Home</span>
    </div>

    <div id="recruit_home" class="content scaffold-list" role="main" style="width: 799px;">
        <ul class="widgetlist">

            <li><a href="createJobTitle.erp"><img src="../resources/images/jobtitles.png"><span>Job Title</span></a></li>
            <li><a href="createJobRole.erp"><img src="../resources/images/job_role.png"><span>Job Role</span></a></li>
            <li><a href="createJobSpec.erp"><img src="../resources/images/job_space.png"><span>Job Spec</span></a></li>
            <li><a href="createEmployeeStatus.erp"><img src="../resources/images/status.png"><span>Job Status</span></a></li>
            <li></li>
            <li></li>
        </ul>
    </div>

</div>
<#--End widget div-->

</@layout.gen_app_layout>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

</head>

<body>

<div class="row">
    <div class="col-lg-9 text-center">
        <img class="img-rounded fa-spin" src="resources/images/logo/login_logo.png" alt="">
        <br/><br/><br/><br/><br/><br/><br/>
        <h1 class="page-header" style="color: white">Bureau of Research, Testing and Consultation, BUET</h1>
    </div>
    <div class="col-lg-3 text-center">
        <div class="panel-body">
        <form name="loginform" action="auth/authenticateUser.erp" method="post">
            <div class="form-group input-group">
                <span class="input-group-addon">Username</span>
                <input type="text" name="username" class="form-control" placeholder="Username">
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon">Password</span>
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
            <div class="form-group text-right">
                <button type="reset" class="btn btn-primary">Reset</button>
                <button type="submit" class="btn btn-success">Login</button>
            </div>
        </form>
    </div>

</div>

<#--<div class="col-lg-1 text-center">

</div>-->
</div>


</body>

</html>

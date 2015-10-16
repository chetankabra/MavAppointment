<%@include file="templates/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Implementing css and javascript</title>

<link rel="stylesheet" href="css/password.css" type="text/css"></link>
 <script src="js/gcal.js">
 </script> 
</head>
<form action ="#" method="post">
<div class="container">
     <h3>Registration</h3>
    <hr>
    <div class="row">
        <div class="col-lg-6">
        <div class="form-group">
                <label>Student ID </label>
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" name="userid" id="Username" placeholder="1000xxxxxx or 6000xxxxxx" >
                </div>
            </div>
            <div class="form-group">
                <label>Username</label>
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" name="username" id="Username" placeholder="Requested Username" >
                </div>
            </div>
            <div class="form-group">
                <label>Email</label>
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                    <input type="text" class="form-control" name="emailAddress" id="emailAddress" placeholder="yourname@mavs.uta.edu" >
                </div>
            </div>
            <div class="form-group">
                <label>Password</label>
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" class="form-control" name="password" id="password" placeholder="password" required data-toggle="popover" title="Password Strength" data-content="Enter Password...">
                </div>
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <div class="input-group"> <span class="input-group-addon"><span class="glyphicon glyphicon-resize-vertical"></span></span>
                    <input type="password" class="form-control" name="repeatPassword" id="confirm" placeholder="Confirm Password" required>
                </div>
            </div>
            <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary pull-right">
        </div>
    </div>
</div>
</form>
<%@include file="templates/footer.jsp"%>
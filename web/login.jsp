<%-- 
    Document   : login
    Created on : Mar 16, 2017, 2:23:06 PM
    Author     : developer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet"/>
        <link href="./css/bootstrap-theme.min.css" rel="stylesheet"/>
        <link href="./js/bootstrap.min.js" rel="javascript"/>
    </head>
    <body style="background-color: #444;margin-top: 5px;">
        <h1 class="text-center"><small><span style="color: tomato;">HIMCS</span><span style="color: #5bc0de;"> IT CLUB</span></small></h1>
        <div class="container panel" style="width:450px;height:450px;text-align: center;;margin-top: 100px;"><div class="panel-body panel-primary">
            <form class="form-group" action="Login_Procced" method="post">
                <div>
                    <img src="images/login_admin1.png" style="width:150px;height:150px;margin-top: -70px;" class="img-thumbnail img-circle"><br>
                </div>
                <div style="margin:0 auto;margin-top: 30px; width:350px; ">
                <div class="form-group input-group">
                    <span class="input-group-addon"><b>@</span>
                    <span><input type="text" placeholder="Enter Username" name="username" class="form-control" ></span>
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="Enter Password" class="form-control">
                </div>
                <div class="form-group">
                    <select class="form-control">
                        <option>Select User Type</option>
                        <option>Admin</option>
                        <option>Faculty</option>
                        <option>It member </option>
                        <option>Student</option>
                        <option></option>
                    </select>
                </div>
                    <label for="error"></label>
                <input type="submit" name="submit" value="login" class="btn-success" style="width:150px;height:50px; margin-top: 25px;">
                
                <p style="margin-top:15px;"><a href="member_reg.jsp" ><b style="color:#99ff00">Sign Up</b></a></p>
                </div>
            </form>
            </div>
        </div>
    </body>
</html>

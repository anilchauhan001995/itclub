<%-- 
    Document   : member_reg
    Created on : Mar 16, 2017, 7:01:08 AM
    Author     : developer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./css/bootstrap.min.css" rel="stylesheet"/>
        <link href="./css/bootstrap-theme.min.css" rel="stylesheet"/>
        <link href="./js/bootstrap.min.js" rel="javascript"/>
        
        <script type="text/javascript">
            function check()
            {
            var pass1 = document.forms["myform"]["password"].value;
            var pass2 = document.forms["myform"]["repassword"].value;
                 if (pass1 != pass2) 
                 {
                  alert("Password & Retype Password Not Matched");
                }
            }
        </script>
        
        <script>
            function validation()
            {
                var fname=document.getElementById("firstName");
                var lname=document.getElementById("lastName");
                var x = document.forms["myform"]["username"].value;
                var atpos = x.indexOf("@");
                var dotpos = x.lastIndexOf(".");
                var phno=document.getElementById("phno");
                var gender=document.getElementById("gender");
                var pass1 = document.forms["myform"]["password"].value;
                var pass2 = document.forms["myform"]["repassword"].value;
                if(fname.value.length<=1 || lname.value.length<=1)
                {
                    alert("Name Should be More than 1 character");
                    return false;
                }
                if(isNaN(fname.value)==false || isNaN(lname.value)==false)
                {
                    alert("First Name and Last Name Could not be a Number ");
                    return false;
                }
                if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) 
                {
                    alert("Not a valid e-mail address");
                    return false;
                }
                if(phno.value.length!=10 || isNaN(phno.value)==true)  
                {
                    alert("Mobile No Should be Numeric And Having Exactly 10 Digit");
                    return false;
                }
                if(gender.value=="choose")
                {
                    alert("Plz Select Gender");
                    return false;
                }
                if(pass1.length<8 || pass2.length<8)
                {
                    alert("Password must be alteast 8 character long");
                    return false;
                }
                if(pass1!=pass2)
                {
                    alert("Password & Retype Password Not Matched");
                    return false;
                }
            }
        </script>
        
    </head>
    
    <body>
        
        <div class="jumbotron" style="height:100px">
            <h1 class="text-center" style="margin-top: -30px" ><small><span style="color: tomato;">Registeration For </span><span style="color: #5bc0de;"> IT Members</span></small></h1>
        </div>
        <div class="panel panel-primary" style="margin-top: -25px">
            <div class="panel-heading"><h3 class="text-justify">Sign Up</h3></div>
        </div>
        
        <div class="panel panel-group panel-primary" style="margin: 0 auto;width: 700px" >
            
            <div class="panel-heading">Register</div>
            <form role="form" action="RegisterItMember" name="myform" onsubmit="return validation()">
                <div class="row" style="margin-left: 25px;">
                <div class="panel-body col-lg-5">
                 <label class="control-label" for="name">First Name:</label> 
                 <input type="text" class="form-control" name="firstName" placeholder="Enter First Name" id="firstName" required>  
                </div>
                    
                 <div class="panel-body col-lg-6">
                 <label class="control-label">Last Name:</label>  
                 <input type="text" class="form-control" name="lastName" placeholder="Enter Last Name" id="lastName" required>  
                </div>   
                </div>
                
                
                
                <div class="panel-body row" style="margin-left: 10px">
                 <label class="control-label col-lg-2" for="email">Email :</label>  
                 <div class="col-sm-11">  
                     <input type="email" class="form-control" name="username" placeholder="XYZ@eample.com" id="username" required>  
                </div>
                </div>
                
               <div class="panel-body row" style="margin-left: 10px">
                 <div class="panel-body col-lg-5">
                 <label class="control-label">Phone no:</label>  
                 <input type="text" class="form-control" name="phno" placeholder="Enter Phone no" id="phno" required>  
                 </div>
                   <div class="panel-body col-lg-6">
                       <label class="control-label">Gender.:</label>  
                       <select class="form-control" name="gender" id="gender">
                           <option value="choose" selected>Choose</option>
                           <option value="male">Male</option>
                           <option value="female">Female</option>
                           <option value="other">Others</option>
                       </select>
                   </div>
                </div>
                
                <div class="panel-body row" style="margin-left: 10px">
                 <label class="control-label col-lg-2" for="password">Password :</label>  
                 <div class="col-sm-11">  
                     <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>  
                </div>
                </div> 
                
                
                <div class="panel-body row" style="margin-left: 10px">
                 <label class="control-label col-lg-4" for="password">Retype Password :</label>  
                 <div class="col-sm-11">  
                     <input type="password" class="form-control" id="repassword" name="repassword" placeholder="Enter Password" onchange="check()">  
                </div>
                </div>
                                                       
                
                <div class="checkbox row" style="margin-left: 40px">
                        <label>
                            <input type="checkbox" name="agreement"> Accept the terms and policies.
                        </label>
                    </div> 
                        <div class="row" style="margin-left: 20%">
                            <input type="submit" class="form-control btn-primary" value="Register" style="width:400px">
                        </div>
                    <hr style="margin-top: 5px; margin-bottom: 5px;">
                </form>
                <div>
                    <a href="login.jsp" style="color: tomato;margin-left: 250px;">Allready Have an account?</a>
                </div>
            </div>
                
                </div>

        
        
    </body>

    
    
    
    
    
    
    
    
   <!-- <body style="background-color: #444;">
        <div class="container" style="margin-top: -10px;"><div class="panel-title">
                <div cla="panel">
            <h1 class="text-center"><small><span style="color: tomato;">Registeration For </span><span style="color: #5bc0de;"> IT Members</span></small></h1>
            </div>
                <div class="panel-body panel-primary">
            <div style="width:450px;height:570px; margin: 0 auto; margin-top: 15px;background-color:#777;">
                        <table class="table">
                            <thead><tr><th style="text-align: center;font-size: 18px; height:45px;">SignUp</th></tr></thead>
                        </table>
                <form role="form" style="margin-left: 15px;margin-right: 15px; margin-top: -10px;" name="myform" action="RegisterItMember" method="get">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter Name" style="" name="name">
                    </div>
                    <div class="form-group">
                        <label for="phno">Phone Number</label>
                        <input type="text" class="form-control" id="phno" placeholder="Enter Contact Number" name="phno">
               *     </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter Your Email Id" name="email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password">
                    </div>
                    <div class="form-group">
                        <label for="repassword">Retype Password</label>
                        <input type="password" class="form-control" id="repassword" placeholder="Retype Password" onchange="check()" >
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Accept the terms and policies.
                        </label>
                    </div> 
                        <div>
                            <button type="submit" class="btn btn-primary">Sign Up</button>
                        </div>
                    <hr style="margin-top: 5px; margin-bottom: 5px;">
                </form>
                <div>
                    <a href="login.jsp" style="color: white;margin-left: 100px;">Allready Have an account?</a>
                </div>
                <a href="login.jsp" class="btn btn-primary btn-sm" role="button" style="width:90%;margin-left: 20px; margin-top: 3px;"> Sign In </a>
            </div>
           
        </div>
        </div>
    </body> -->
</html>

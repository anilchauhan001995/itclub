<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DisplayProfile_Database" %>
<%@page import="beans.Profile" %>
<!DOCTYPE html>
<%
    DisplayProfile_Database dis=new DisplayProfile_Database();
    String sql="select * from registered_users where username='"+request.getParameter("userid")+"'";
    dis.connect(sql);
    Profile pf=dis.getProfile();
%>
<html>
    <head>
        
        <script src="./js/jquery-1.9.1.min.js"></script>
        <script src="./js/bootstrap-datepicker.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#datepicker1').datepicker({
                    format: "dd/mm/yyyy"
                });    });
        </script>    
        <script type="text/javascript">
            function check()
            {
            var old_pass = document.forms["myform"]["old_pass"].value;
            var new_pass = document.forms["myform"]["new_pass"].value;
            var conf_pass = document.forms["myform"]["conf_pass"].value;
                 if (new_pass != conf_pass) 
                 {
                  alert("Password & Retype Password Not Matched");
                  document.getElementById("new_pass").value="";
                  document.getElementById("conf_pass").value="";
                  return false;
                }
                if(old_pass==new_pass)
                {
                    alert("Old Password and New Password Could Not Same")
                    document.getElementById("new_pass").value="";
                    document.getElementById("conf_pass").value="";
                    return false;
                }
            }
        </script>
        
    </head>
    <body>
       <div class="jumbotron">
        <div class="row">
            <form class="form-group" method="post" action="Save_Picture?userid=<%=request.getParameter("userid") %>" enctype="multipart/form-data">
            <div class="col-lg-3">
                <%  
                    if(pf.getPhoto()==null){
                    %>
                <img src="./images/login_admin1.png" id="pic_out" class="img-circle" width="120px" height="120px" style="margin-top: -30px"/>   
                    <% } else{
                                Blob b=pf.getPhoto();
                                byte[] data=b.getBytes(1, (int)b.length());
                                BASE64Encoder base64Encoder=new BASE64Encoder();
                                StringBuilder imageString=new StringBuilder();
                                imageString.append("data:image/png;base64,");
                                imageString.append(base64Encoder.encode(data));
                                String image=imageString.toString();%>
                <img src="<%=image%>" id="pic_out" class="img-circle" width="120px" height="120px" style="margin-top: -30px"/>                   
                        <%}%>
                <input  type="file"  onchange="loadFile(event)" id="file_loc" name="file_url" accept=".jpg,.png" style="margin-left: -20px;margin-top: 10px"> 
            </div>
            <div class="col-lg-9">
                <input type="text" name="name" readonly="true" value="<%=pf.getfName()%> <%=pf.getlName()%>" class="form-control" style="width: 250px;margin-top: -20px;"><br/>
                    <input type="text" name="current_working" class="form-control" placeholder="Currently Work at" value="<%=pf.getEducation()%>">
                    <input type="submit" class="btn-success" value="Update" style="margin-top: 20px">
            </div>
            </form>
        </div>
        </div>
        
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Personal Info</h3>
            </div>
            <div class="panel-body">
                
                    <form class="form-group" action="Save_PersonalInfo?userid=<%=request.getParameter("userid")%>" method="post">
                        <div class="row">
                        <div class="col-lg-6"><label>First Name :</label><input type="text" value="<%=pf.getfName()%>" name="fname" class="form-control"></div> 
                        <div class="col-lg-6"><label>Last Name :</label><input type="text" value="<%=pf.getlName()%>" name="lname" class="form-control"></div> 
                        </div>
                        
                        
                        <div class="row">
                            <div class="col-lg-6"><label>Gender</label>
                                <b><input type="text" value="<%=pf.getGender() %>" readonly="true" class="form-control">   </b>
                            </div>
                            <% if(pf.getDob()!=null){ %>
                            <div class="col-lg-6"><label>Date of Birth</label>
                                <div class="input-group date" >
                                    <input type="text" name="dob" id="datepicker1"  class="form-control">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>  
                                
                                <script>
                                    $('#datepicker1').datepicker('setDate', new Date("<%=pf.getDob()%>") );
                                   /* var _date="";
                                    var _format="yyyy-mm-dd";
                                    var _delemiter="-";
                                    var formatItems=_format.split(_delimiter);
                                    var dateItems=_date.split(_delimiter);
                                    var monthIndex=formatItems.indexOf("mm");
                                    var dayIndex=formatItems.indexOf("dd");
                                    var yearIndex=formatItems.indexOf("yyyy");
                                    var month=parseInt(dateItems[monthIndex]);
                                    month-=1;
                                    var formatedDate = new Date(dateItems[yearIndex],month,dateItems[dayIndex]);
                                    $('$datepicker1').datepicker('setDate',formatedDate);*/
                                    //alert(_date);
                                </script>
                              
                             </div>
                            <%} else 
                               {%>
                           <div class="col-lg-6"><label>Date of Birth</label>
                                <div class="input-group date" >
                                    <input type="text" id="datepicker1" name="dob"  class="form-control">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                             </div>
                            <% } %>
                        </div>
                        
                        
                        <div class="row">
                            <div class="col-lg-12"><label>Address</label><input type="text" name="address" value="<%=pf.getAddress() %>" class="form-control"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6"><label>Mobile No</label><input type="tel" name="phno" value="<%=pf.getMobile() %>" class="form-control"></div>
                            <div class="col-lg-6"><label>Email Id</label><input type="email" name="email" readonly="true" value="<%=pf.getUserName()%>" class="form-control"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3"><input type="submit" class=" btn-primary" value="Save" style="margin-top: 10px;margin-left:900px"></div>
                        </div>
                        
                    </form>
            </div>
        </div>
    <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Change Password</h3>
            </div>
        <div class="panel-body">
            <form class="form-group" action="Change_Password" method="post" name="myform" onsubmit="return check()">
                <div class="row"><div class="col-lg-2"><label>Old Password</label></div><div class="col-lg-6"><input type="password" value="<%=pf.getPassword() %>" class="form-control" name="old_pass" id="old_pass"></div></div><br/>
                <div class="row"><div class="col-lg-2"><label>New Password</label></div><div class="col-lg-6"><input type="password" class="form-control" name="new_pass" id="new_pass"></div></div><br/>
                <div class="row"><div class="col-lg-2"><label>Confirm Password</label></div><div class="col-lg-6"><input type="password" class="form-control" name="conf_pass" id="conf_pass"></div></div><br/>
                <div class="row"><div class="col-lg-3"><input type="submit" value="save" class="btn-primary" style="margin-left: 900px"></div></div>    
            </form>
        </div>
    </div>
        
                
    </body>
</html>



<script type="text/javascript">
                                document.getElementById("file_loc").onchange = function () {
                                  var reader = new FileReader();

                                  reader.onload = function (e) {
                                      document.getElementById("pic_out").src = e.target.result;
                                  };
                                  reader.readAsDataURL(this.files[0]);
                                  
                              };
                        </script>

<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@page import="beans.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DisplayNews_Database" %>
<%! String image ; %>
<%
    DisplayNews_Database dn=new DisplayNews_Database();
    String sql="select * from news where news_id="+request.getParameter("nid");
    dn.connect(sql);
    List<News> newss=dn.getNewss();
    if(!newss.isEmpty()){
    %>

<div class="panel panel-info" style="margin-top: 15px">
<div style="width:100%;margin-top:5px;height: fit-content">
    <form style="margin-left: 30px;margin-right:30px; font-size: 18px;" action="Update_Servlet?nid=<%=request.getParameter("nid")%>" enctype="multipart/form-data" method="post">
                    <b><div class="form-group">
                        <label class="label">Header News</label>
                        <input class="form-control" type="text" name="news_header" value="'<%=newss.get(0).getNews_header().toString() %>'">
                    </div>
                        
                    <div class="form-group">
                        <label class="label">News Content</label>
                        <textarea class="form-control" rows="7"  name="news_content"><%=newss.get(0).getNews_content() %></textarea>
                    </div></b>
                    <div class="row">
                        <div class="col-lg-6 panel-primary">
                            <div class="form-group">
                            <label class="label">Enter News Link</label>
                            <input type="text" class="form-control" name="news_link" value="<%=newss.get(0).getNews_link()%>">
                            </div>
                            <div claas="form-group">
                            <label class="label">Choose Location</label>
                            <input  type="file"  onchange="loadFile(event)" id="file_loc" style="height:50px;" name="file_url" accept=".jpg"> 
                            <input type="hidden" name="hidden_url" value="no" id="hd">
                            </div>
                            <div style="margin-top: 40px;margin-left: -15px; ">
                            <input type="submit" value="Update" class="btn-group-justified">
                            </div>
                        </div>
                        <div class="col-lg-5 panel panel-primary" style="margin-left: 75px">
                            <div class="panel-body" style="width:455px;height:305px">
                            <% 
                                Blob b=newss.get(0).getPhoto();
                                byte[] data=b.getBytes(1, (int)b.length());
                                BASE64Encoder base64Encoder=new BASE64Encoder();
                                StringBuilder imageString=new StringBuilder();
                                imageString.append("data:image/png;base64,");
                                imageString.append(base64Encoder.encode(data));
                                image=imageString.toString();
                            %>
                            <img src="<%=image %>" id="pic_out" alt="Your Image" style="width:450px;height:300px; margin-left: -25px;margin-top: -14px">
                         
                            
                        </div>
                        
                    </div>
                </form>
            </div>
</div>
<% } %>
<!-------------------  SCRIPT FUNCTION FOR Image-------------------->
<script type="text/javascript">
                                document.getElementById("file_loc").onchange = function () {
                                  var reader = new FileReader();

                                  reader.onload = function (e) {
                                      // get loaded data and render thumbnail.
                                      document.getElementById("pic_out").src = e.target.result;
                                     // document.getElementById("hidden_url").setAttribute('hidden','My Self Anil');
                                      //document.write();                                      
                                  };
                                  // read the image file as a data URL.
                                  reader.readAsDataURL(this.files[0]);
                                  document.getElementById("hd").value= "yes";
                                  //document.getElementById("hd").value= $('#file_loc').val(); 
                                  //document.getElementById("hidden_url").src="My Self Anil";
                              };
                        </script>

<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@page import="beans.News"%>
<%@page import="controller.DisplayNews_Database;"  %>
<%@page import="mode.Connection_Pool" %>
<%! long gl_id ;%>
<%
    gl_id=Long.parseLong(session.getAttribute("timestamp").toString());
    String uname=session.getAttribute("username").toString();
    DisplayNews_Database dn=new DisplayNews_Database();
    String sql="select * from (select * from news order by timestamp desc) ref where timestamp<"+gl_id+" and rownum<=3 and author_id='"+uname+"'";
    dn.connect(sql);
    List<News> newss=dn.getNewss();
    if(!newss.isEmpty()){
        int i=0;
    for( i=0;i<newss.size();i++)
    {
    %>
    <html>  
        <body>
<div class="container" style="width:100%;height:350px;background-color: whitesmoke;margin-top: 20px;border-radius:5px; ">
                    <div class="row" style="margin-top: 10px">
                        <div class="col-lg-5" style="height: 330px;background-color: #31b0d5;margin-left: 10px;border-radius:2% ">
                         <!-- <img src="./itmember_home/image.jsp" style="height:330px;width:475px;margin-left: -15px;" alt="Not Available"> -->
                        
                        <%
                        Blob b=newss.get(i).getPhoto();
                        byte[] data=b.getBytes(1, (int)b.length());
                        BASE64Encoder base64Encoder=new BASE64Encoder();
                        StringBuilder imageString=new StringBuilder();
                        imageString.append("data:image/png;base64,");
                        imageString.append(base64Encoder.encode(data));
                        String image=imageString.toString();
                        %>
                        <img src="<%=image %>" style="height:330px;width:475px;margin-left: -15px;" alt="Not Available">
                        </div>
                        
                        <div class="col-lg-6">
                        <div style="font-family: sans-serif;" class="text-capitalize">
                            <h4> <%=newss.get(i).getNews_header() %> :-</h4>
                        </div>
                            <div>
                                <small><span><b>short </b></span><span class="text-info">by You || <%=newss.get(i).getPublish_date() %></span></small>
                            </div>
                            
                        <div style="font-size: 16px;font-family: cursive;height:200px" class="text-capitalize">
                            <%=newss.get(i).getNews_content() %>
                        </div>
                            <div style="margin-top: 20px;">
                                <small><span><b>read more at </b></span><span class="text-info" ><%=newss.get(i).getNews_link() %><a href="#"></a></span></small>
                                <span style="margin-left: 80px;"><a href="./itmember_home.jsp?val=news_update&nid=<%=newss.get(i).getNews_id() %>"><b>Update </b></a></span>
                                <span style="margin-left: 30px;"><a href="Delete_Servlet?newsid=<%=newss.get(i).getNews_id() %>"><b> Delete</b></a> </span>
                            </div>
                        </div>
                    </div>
                </div>
                                <% } 
                                    gl_id=newss.get(i-1).getTimestamp();
                                    session.setAttribute("timestamp", String.valueOf(gl_id));
                }
                                
                                %>
                             <!--   <span id="loadmore"></span>
                                <input type="button" value="load more" onclick="loadMore()"> -->
        </body>
    </html>
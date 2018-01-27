<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mode.Connection_Pool" %>
<%! String username ;%>
<% username=session.getAttribute("username").toString();   %>

<nav class="navbar navbar navbar-fixed-top" role="navigation" style="background-color: #2b669a">
    
    <%
                    Blob blob=null;
                    
                    try{
                    Connection con=Connection_Pool.getPoolConnection();
                    String sql="select photo from registered_users where username='"+username+"'";
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery(sql);
                    if(rs.next() && rs.getBlob("photo")!=null){
                         blob=rs.getBlob("photo");
                        byte[] data=blob.getBytes(1, (int)blob.length());
                        BASE64Encoder base64Encoder=new BASE64Encoder();
                        StringBuilder imageString=new StringBuilder();
                        imageString.append("data:image/png;base64,");
                        imageString.append(base64Encoder.encode(data));
                        String img=imageString.toString();%>
                        <a href="./itmember_home.jsp?val=change_password&userid=<%=username%>"><img src="<%=img%>" style="height: 60px; width: 60px; 
                        display: inline-block; top: 0px;margin-left: 20px;border-radius: 50%;"></a>
                        <%}else{%>
                        <a href="./itmember_home.jsp?val=change_password&userid=<%=username%>"><img src="./images/login_admin1.png" style="height: 60px; width: 60px; 
                            display: inline-block; top: 0px;margin-left: 20px;border-radius: 50%;"></a>
                        <%
                    rs.close();
                    st.close();
                    con.close();
                    }
                    }catch(Exception e){out.print(e.getMessage());}
                 %>
                 
                <span style="color: tomato;margin-left:500px; font-family:cursive;font-size: 20px;">HIMCS IT CLUB</span>
                <span style="color: tomato;margin-left: 200px;"></span>
                <span style="color:tomato"><%=username %></span>
                
                <span ><a href="./itmember_home/logout.jsp" style="color:tomato;margin-left: 30px;"><b>Logout</b></a></span>
        </nav>
        
      
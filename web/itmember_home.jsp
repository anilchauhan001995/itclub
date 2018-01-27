<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! String userid;%>
<% 
    try{
    userid=session.getAttribute("username").toString();
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/bootstrap.min.css" rel="stylesheet"/>
        <link href="./css/bootstrap-theme.min.css" rel="stylesheet"/>
        <link href="./js/bootstrap.min.js" rel="javascript"/>
        <link href="./css/bootstrap.min.css" rel="javascript"/>
        <link href="./jquery/jquery-1.7.1.min.js" rel="text/javascript"/>
        <link href="./css/bootstrap.css" rel="stylesheet" />
        <link href="./css/datepicker.css" rel="stylesheet" />
        <script>
        var request;
            function loadMore(url)
            {
                //var url="./itmember_home/it_home.jsp";
                if(window.XMLHttpRequest)
                {
                    request=new XMLHttpRequest();
                }
                else if(window.ActiveXObject)
                {
                    request=new ActiveXObject("Microsoft.XMLHTTP");
                }
                try
                {
                 request.onreadystatechange=getInfo;
                 request.open("POST",url,true);
                 request.send();
                }catch(e)
                {
                    alert("Unable to Connect the Server");
                }
            }
            
            function getInfo()
            {
                if(request.readyState==4)
                {
                    var val=request.responseText;
                    document.getElementById("loadmore").innerHTML+=val;
                }
            }
                
            
            
        </script> 
        
    </head>
    
    <body style="background-color: white">
        <div class="container">
            
            <div><%@include file="./itmember_home/it_header.jsp"  %></div>  
            
        <!---------------------------------------------Navigation Bar-------------------------------------------------------------->

        <div><%@include file="./itmember_home/it_navbar.jsp" %></div>
        
        <!---------------------------------------------------------------------->
        
        <%
            String val=request.getParameter("val");
            if(val.equals("add"))
            {%>
                <div><%@include file="./itmember_home/add_news.jsp" %></div>
                <div><%@include file="./itmember_home/footer.html" %></div>
           <% }
            else if(val.equals("home"))
                {%>
                <%  session.setAttribute("timestamp",System.currentTimeMillis()); %>
                <jsp:include page="./itmember_home/it_home.jsp" ></jsp:include>
                <span id="loadmore"></span>
                                <input type="button" value="load more" onclick="loadMore('./itmember_home/it_home.jsp')" style="margin-left: 45%;margin-top: 30px;">
                
                <% }
             else if(val.equals("mynews"))
                {%>
                <% 
                    long t=System.currentTimeMillis();
                    session.setAttribute("timestamp",t); %>
                <%@include file="./mynews/mynews.jsp" %>  
                <span id="loadmore"></span>
                                <input type="button" value="load more" onclick="loadMore('./mynews/mynews.jsp')" style="margin-left: 45%;margin-top: 30px;">
                <%} 
              else if(val.equals("news_update"))
                {%>
                <%@include file="./mynews/news_update.jsp" %>  
                
               <%}
               else if(val.equals("change_password"))
                {%>
                <%@include file="/profile/change_profile.jsp" %>  
                <%}
                  else if(val.equals("quiz"))
                        {%>
                        
                       <% } else{}  
                 %>
                 
                 <% }catch(Exception e){ //response.sendRedirect("./login.jsp");
                    } %>
       
        </div>        
    </body>
</html>

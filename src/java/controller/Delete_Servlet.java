package controller;

import com.sun.xml.ws.transport.tcp.io.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mode.Connection_Pool;

public class Delete_Servlet extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             PrintWriter out=response.getWriter();
             HttpSession session=request.getSession();
             //out.print(session.getAttribute("username"));
             try
             {
                 java.sql.Connection con=Connection_Pool.getPoolConnection();
                 String query="delete from news where news_id="+request.getParameter("newsid");
                 Statement st=con.createStatement();
                 boolean state=st.execute(query);
                 if(state)
                 {
                     out.print("<script>alert('Deleted Succusfully');</script>");
                     response.sendRedirect("itmember_home.jsp?val=mynews");
                 }
                 else
                 {
                     out.print("<script>alert('Can't Deleted');</script>");
                     response.sendRedirect("itmember_home.jsp?val=mynews");
                 }
             }catch(Exception e)
             {
                 out.print("<script>alert("+e.getMessage()+");</script>");
                 response.sendRedirect("itmember_home.jsp?val=mynews");
             }
           
        
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}

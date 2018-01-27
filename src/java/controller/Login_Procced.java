package controller;

import mode.Connection_Pool;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login_Procced extends HttpServlet 
{
    HttpSession session;
    public void service(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException
    {
        res.setContentType("text/html");
        PrintWriter out=res.getWriter();
        try
        {
            Connection con=Connection_Pool.getPoolConnection();
            //RequestDispatcher rd=new RequestDispatcher
            out.print("<h1>jhbduy b iushf siufh e</h1>");
            PreparedStatement pst=con.prepareStatement("select USERNAME,PASSWORD from login where USERNAME=?");
            String pass=req.getParameter("password");
            String username=req.getParameter("username");
            pst.setString(1, username);
            ResultSet rs=pst.executeQuery();
            if(rs.next())
            {
               String ps=rs.getString("PASSWORD");
                if(ps.equals(pass))
                {
                    session=req.getSession(true);
                    session.setAttribute("username", req.getParameter("username"));
                    res.sendRedirect("itmember_home.jsp?val=home");
                    //out.print("hello");
                }
                else
                {
                    res.sendRedirect("member_reg.jsp?val=notmatch");
                    //out.println(ps+""+pass);
                }
            }
            
            res.sendRedirect("member_reg.jsp?val=notmatch");
            out.println(pass);
            pst.close();
            rs.close();
            con.close();
        }
        catch(Exception e)
        {
            out.println("<h1>Error Occoured In Login servlet class file</h1>");
        }
        
        
    }
}

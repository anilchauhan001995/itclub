package controller;

import beans.ItMember;
import mode.Connection_Pool;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterItMember extends HttpServlet {

    protected void service(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException
    {
        PrintWriter out=res.getWriter();
        res.setContentType("text/html");
        String fname=req.getParameter("firstName");
        String lname=req.getParameter("lastName");
        String uname=req.getParameter("username");
        String phno=req.getParameter("phno");
        String gender=req.getParameter("gender");
        String password=req.getParameter("password");
        try
        {
        Connection con=Connection_Pool.getPoolConnection();
        String sql="insert all into login(username,password) values('"+uname+"','"+password+"') into registered_users"
                + "(username,fname,gender,lname,password,mobile) values('"+uname+"','"+fname+"','"+gender+"','"+lname+"','"+password+"','"+phno+"') select * from dual";
        PreparedStatement pst=con.prepareStatement(sql);
        
        pst.executeUpdate();
        pst.close();
        con.close();
        out.println("<h1>Successfully Account Created</h1>");
        }
        catch(Exception e)
        {
        out.println(e.getMessage());    
        }
    }

}

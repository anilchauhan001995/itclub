package profile_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import mode.Connection_Pool;

public class Save_PersonalInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        PrintWriter out=res.getWriter();
        String fname=req.getParameter("fname");
        String lname=req.getParameter("lname");
        String date=req.getParameter("dob");
        String address=req.getParameter("address");
        String phno=req.getParameter("phno");
        //SimpleDateFormat format=new SimpleDateFormat("dd/mm/yyyy");
        
        try{
        java.util.Date d=new java.util.Date(date);
        java.sql.Date sqldate=new java.sql.Date(d.getTime());
        //out.print(req.getParameter("dob")+"   "+sqldate);
        
        Connection conn=Connection_Pool.getPoolConnection();
            String sql="update registered_users set fname=?,lname=?,dob=?,address=?,mobile=? where username='"+req.getParameter("userid")+"'";
            PreparedStatement pst=conn.prepareStatement(sql);
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setDate(3, sqldate);
            pst.setString(4, address);
            pst.setString(5, phno);
            int i=pst.executeUpdate();
            if(i!=0)
            {
                //out.print("<script");
                res.sendRedirect("./itmember_home.jsp?val=change_password&userid="+req.getParameter("userid"));
            }
            else
            {
                out.print("<script type='text/javascript'>alert('Your Changes Are Not Update Plz Try Again')</script>");
            }
        }catch(Exception e){
        out.print("<script type='text/javascript'>alert('Invalid Data')</script>");
        res.sendRedirect("./itmember_home.jsp?val=change_password&userid="+req.getParameter("userid"));
        }
        
                

    }
}

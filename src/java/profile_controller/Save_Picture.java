package profile_controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import mode.Connection_Pool;

@MultipartConfig(maxFileSize = 169999999)
public class Save_Picture extends HttpServlet {    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException 
    {
        PrintWriter out=res.getWriter();
        String userid=req.getParameter("userid");
        String edu=req.getParameter("current_working");
        Part part=req.getPart("file_url");
        InputStream inputStream=null;
        if(part!=null)
        {
            inputStream=part.getInputStream();
        }
        try
        {
            Connection con=Connection_Pool.getPoolConnection();
            String sql="update registered_users set EDUCATION=?,PHOTO=? where USERNAME=?";
            PreparedStatement pst=con.prepareStatement(sql);
            pst.setString(1,edu);
            pst.setBinaryStream(2, inputStream, (int)part.getSize());
            pst.setString(3, userid);
            
            int status=pst.executeUpdate();
            out.print("Succusfull "+status);
            
            pst.close();
            con.close();
        }catch(Exception e){
            out.print(e.getMessage());
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

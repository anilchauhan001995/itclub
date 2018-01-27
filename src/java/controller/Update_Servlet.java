package controller;

import beans.News;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import mode.Connection_Pool;
@MultipartConfig(maxFileSize = 169999999)
public class Update_Servlet extends HttpServlet {
  public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        News news=new News();
        HttpSession session=req.getSession();
        res.setContentType("text/html");
        PrintWriter out=res.getWriter();
        //news.setAuthor_id(session.getAttribute("username").toString());
        news.setNews_header(req.getParameter("news_header"));
        news.setNews_content(req.getParameter("news_content"));
        news.setNews_link(req.getParameter("news_link"));
        String str=req.getParameter("hidden_url");
        try
        {
            int id=Integer.parseInt(req.getParameter("nid"));
            Connection con=Connection_Pool.getPoolConnection();
            PreparedStatement pst=null;
        if(str.equals("yes"))
        {
            Part part=req.getPart("file_url");
            InputStream inputstream=null;
            if(part!=null)
            inputstream=part.getInputStream();
            String sql="update news set news_header=?,news_content=?,news_link=?,photo=? where news_id="+id;
            pst=con.prepareStatement(sql);
            pst.setString(1, news.getNews_header());
            pst.setString(2, news.getNews_content());
            pst.setString(3, news.getNews_link());
            pst.setBinaryStream(4, inputstream,(int)part.getSize());
        }
        else
        {
            String sql="update news set news_header=?,news_content=?,news_link=? where news_id="+id;
            pst=con.prepareStatement(sql);
            pst.setString(1, news.getNews_header());
            pst.setString(2, news.getNews_content());
            pst.setString(3, news.getNews_link());
            
        }
        int state=pst.executeUpdate();
            if(state!=0)
                res.sendRedirect("itmember_home.jsp?val=mynews");
            else
                out.println("<h1>Data Not Updated Properly</h1>");
            pst.close();
            con.close();
        }
        catch(Exception e)
        {
            
        }
          
    }
}

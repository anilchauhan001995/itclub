package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.News;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import mode.Connection_Pool;
/**
 *
 * @author developer
 */
@MultipartConfig(maxFileSize = 169999999)
public class Save_Servlet extends HttpServlet 
{
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        News news=new News();
        HttpSession session=req.getSession();
        news.setAuthor_id(session.getAttribute("username").toString());
        news.setNews_header(req.getParameter("news_header"));
        news.setNews_content(req.getParameter("news_content"));
        news.setNews_link(req.getParameter("news_link"));
        Date date=new Date();
        SimpleDateFormat ft=new SimpleDateFormat();
        news.setPublish_date(ft.format(date));
        news.setTimestamp(date.getTime());
        res.setContentType("text/html");
        PrintWriter out=res.getWriter();
       
        Part part=req.getPart("file_url");
        InputStream inputstream=null;
        if(part!=null)
        inputstream=part.getInputStream();
        
        try
        {
            Connection con=Connection_Pool.getPoolConnection();
            String sql="insert into news(news_id,author_id,publish_date,news_header,news_content,news_link,timestamp,photo,likes) values(news_seq.nextval,?,?,?,?,?,?,?,?)";
            PreparedStatement pst=con.prepareStatement(sql);
            pst.setString(1,session.getAttribute("username").toString());
            long t = date.getTime();
            java.sql.Date sqlDate = new java.sql.Date(t);
            pst.setDate(2, sqlDate);
            pst.setString(3, news.getNews_header());
            pst.setString(4, news.getNews_content());
            pst.setString(5, news.getNews_link());
            pst.setLong(6, t);
            pst.setBinaryStream(7, inputstream,(int)part.getSize());
            pst.setInt(8, 0);
            
            int state=pst.executeUpdate();
            if(state!=0)
                res.sendRedirect("itmember_home.jsp?val=mynews");
            else
            {
                res.sendRedirect("itmember_home.jsp?val=add");
            }
            pst.close();
            con.close();
        }
        catch(Exception e)
        {
            out.println("<h1>"+e.getMessage()+"</h1>  "+req.getParameter("file_url"));
        }
       
       
    }
}

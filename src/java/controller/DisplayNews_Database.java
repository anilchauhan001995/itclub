package controller;
import beans.News;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import mode.Connection_Pool;

public class DisplayNews_Database 
{
    List<News> newss=new ArrayList<News>();
    public void connect(String sql)
    {
            //news=new News();
            try{
            Connection con=Connection_Pool.getPoolConnection();
            //String sql="select * from news_table where rownum<=3 and news_id>"+gl_id+" order by rowid desc";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            News news;
            while(rs.next())
            {
            news=new News();
            news.setNews_id(rs.getInt("news_id"));
            news.setAuthor_id(rs.getString("author_id"));
            news.setPublish_date(rs.getDate("publish_date").toString());
            news.setNews_header(rs.getString("news_header"));
            news.setNews_content(rs.getString("news_content"));
            news.setNews_link(rs.getString("news_link"));
            news.setPhoto(rs.getBlob("photo"));
            news.setTimestamp(rs.getLong("timestamp"));
            newss.add(news);
            }
            rs.close();
            st.close();
            con.close();
            }catch(Exception e){}
    }
    
    public List<News> getNewss()
    {       
        return newss;
    }
}

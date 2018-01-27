package beans;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Blob;
public class News
{
    private int news_id,likes;
    private String author_id,publish_date,news_header,news_content,news_link;
    private long timestamp;
    Blob photo;

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }

    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(String author_id) {
        this.author_id = author_id;
    }

    public String getPublish_date() {
        return publish_date;
    }

    public void setPublish_date(String publish_date) {
        this.publish_date = publish_date;
    }

    public String getNews_header() {
        return news_header;
    }

    public void setNews_header(String news_header) {
        this.news_header = news_header;
    }

    public String getNews_content() {
        return news_content;
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }

    public String getNews_link() {
        return news_link;
    }

    public void setNews_link(String news_link) {
        this.news_link = news_link;
    }

    public Blob getPhoto() {
        return photo;
    }

    public void setPhoto(Blob photo) throws Exception
    {
        /*byte bar[]=photo.getBytes(1,(int)photo.length());
        FileOutputStream fos=new FileOutputStream("temp5.jpg");
        fos.write(bar);
        fos.close();*/
        this.photo=photo;
    }
    
}

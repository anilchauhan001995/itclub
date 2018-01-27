package mode;
import java.sql.Connection;
import org.apache.commons.dbcp.BasicDataSource;
public class Connection_Pool 
{
    public static Connection getPoolConnection() throws Exception
    {
        BasicDataSource bds=new BasicDataSource();
        bds.setDriverClassName("oracle.jdbc.OracleDriver");
        bds.setUrl("jdbc:oracle:thin:@localhost:1521:oracle");
        bds.setUsername("itdummy");
        bds.setPassword("itdummy");
        bds.setMaxActive(15);
       // bds.setMaxConnLifetimeMillis(15);
        bds.setMaxIdle(3);
        bds.setMaxWait(3000);
        Connection con=bds.getConnection();  
        return con;
    }
}

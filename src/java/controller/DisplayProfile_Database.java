package controller;

import beans.Profile;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import mode.Connection_Pool;

public class DisplayProfile_Database
{
    Profile profile;
    public void connect(String sql)
    {
        try
        {
            Connection con=Connection_Pool.getPoolConnection();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
            profile=new Profile();
            if(rs.next())
            {
                profile.setUserName(rs.getString("username"));
                profile.setfName(rs.getString("fname"));
                profile.setlName(rs.getString("lname"));
                profile.setGender(rs.getString("gender"));
                profile.setDob(rs.getDate("dob"));
                profile.setAddress(rs.getString("address"));
                profile.setEducation(rs.getString("education"));
                profile.setPassword(rs.getString("password"));
                profile.setMobile(rs.getString("mobile"));
                profile.setPhoto(rs.getBlob("photo"));
            }
            rs.close();
            st.close();
            con.close();
        }
        catch(Exception e) {}
    }
    public Profile getProfile()
    {
        return profile;
    }
}

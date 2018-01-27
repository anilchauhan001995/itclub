package beans;

import java.sql.Blob;
import java.sql.Date;

public class Profile {
    String userName,fName,lName,gender,address,education,password,mobile;
    Date dob;
    Blob photo;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        if(gender==null)
            gender="";
        else
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        if(address==null)
            this.address="";
        else
        this.address = address;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        if(education==null)
            this.education="";
        else
        this.education = education;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Blob getPhoto() {
        return photo;
    }

    public void setPhoto(Blob photo) {
        this.photo = photo;
    }
    
}

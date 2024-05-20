package com.tech.blog.entities;
import java.sql.*;
public class Post {
    private int pid;
    private String pTitle;
    private String pDescription;
    private String pAddress;
    private int pAmount;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int userId;

    public Post(int pid, String pTitle, String pDescription, String pAddress, int pAmount, String pPic, Timestamp pDate, int catId, int userId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pDescription = pDescription;
        this.pAddress = pAddress;
        this.pAmount = pAmount;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;
    }

    public Post() {
    }

    public Post(String pTitle, String pDescription, String pAddress, int pAmount, String pPic, Timestamp pDate, int catId, int userId) {
        this.pTitle = pTitle;
        this.pDescription = pDescription;
        this.pAddress = pAddress;
        this.pAmount = pAmount;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.userId = userId;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public String getpAddress() {
        return pAddress;
    }

    public void setpAddress(String pAddress) {
        this.pAddress = pAddress;
    }

    public int getpAmount() {
        return pAmount;
    }

    public void setpAmount(int pAmount) {
        this.pAmount = pAmount;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
}
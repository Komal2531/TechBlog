
package com.tech.blog.entities;

import java.sql.*;

public class Post {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private Timestamp pDate; 
    private int userid;
    private int catid;

    public Post(int pid, String pTitle, String pContent, String pCode, Timestamp pDate, int userid, int catid) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pDate = pDate;
        this.userid = userid;
        this.catid = catid;
    }

    public Post(String pTitle, String pContent, String pCode, Timestamp pDate, int userid, int catid) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pDate = pDate;
        this.userid = userid;
        this.catid = catid;
    }
    
    public Post() {
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

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }
    
    
    
}

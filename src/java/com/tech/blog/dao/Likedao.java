package com.tech.blog.dao;

import java.sql.*;

public class Likedao {

    Connection con;

    public Likedao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int userid, int postid) {

        boolean inserted = false;
        try {
            String q = "Insert into likes_techblog(postid,userid) values(?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, postid);
            pstmt.setInt(2, userid);
            pstmt.executeUpdate();
            inserted = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return inserted;
    }

    public int countLikesOnPost(int postid) {
        int count = 0;
        try {
            String q = "Select count(*) from likes_techblog where postid=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, postid);
            ResultSet res = pstmt.executeQuery();
            if (res.next()) {
                count = res.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int userid, int postid) {
        boolean like = false;
        try {
            PreparedStatement pstmt = this.con.prepareStatement("Select * from likes_techblog where postid=? and userid=?");
            pstmt.setInt(1, postid);
            pstmt.setInt(2, userid);
            ResultSet res = pstmt.executeQuery();
            if (res.next()) {
                like = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return like;
    }

    public boolean deleteLike(int userid, int postid) {

        boolean del = false;
        try {
            String q = "delete from likes_techblog where postid=? and userid=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, postid);
            pstmt.setInt(2, userid);
            pstmt.executeUpdate();
            del = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return del;
    }

}

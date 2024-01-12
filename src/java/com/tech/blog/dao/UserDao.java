package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

//    method to insert user to database 
    public boolean saveUser(User user) {
        boolean inserted = false;
        try {
            //user->database
            String query = "insert into user_techblog(name,email,password,gender,rdate) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));

            pstmt.executeUpdate();
            inserted = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return inserted;
    }

//    method to get user using email and password from database
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from user_techblog where email=? and password=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(email);
                user.setPassword(password);
                user.setGender(set.getString("gender"));
                user.setDatetime(set.getTimestamp("rdate"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUserProfile(User user) {
        boolean updated = false;
        try {
            //user details->database
            String query = "update user_techblog set name=? ,password=? ,gender=? where id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getGender());
            pstmt.setInt(4, user.getId());

            pstmt.executeUpdate();
            updated = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

//    method to get user using userId
    public User getUserByUserId(int id) {
        User user = null;

        try {
            String query = "select * from user_techblog where id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDatetime(set.getTimestamp("rdate"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}

package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> lis = new ArrayList<>();

        try {
            String q = "select * from categories_techblog";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(q);
            while (res.next()) {
                int cid = res.getInt("cid");
                String name = res.getString("name");
                String desc = res.getString("description");
                Category cat = new Category(cid, name, desc);
                lis.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
       Collections.sort(lis, Comparator.comparing(Category::getName));
        return lis;
    }

    public boolean addPost(Post post) {
        boolean added = false;
        try {

            String query = "Insert into posts_techblog(ptitle,pcontent,pcode,pdate,userid,catid) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, post.getpTitle());
            pstmt.setString(2, post.getpContent());
            pstmt.setString(3, post.getpCode());
            pstmt.setTimestamp(4, post.getpDate());
            pstmt.setInt(5, post.getUserid());
            pstmt.setInt(6, post.getCatid());

            pstmt.executeUpdate();
            added = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return added;
    }

    public ArrayList<Post> getAllPosts() {
        ArrayList<Post> lis = new ArrayList<>();
        try {

            String query = "select * from posts_techblog order by pid desc";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(query);
            while (res.next()) {
                int pid = res.getInt("pid");
                int userid = res.getInt("userid");
                int catid = res.getInt("catid");
                String ptitle = res.getString("ptitle");
                String pcontent = res.getString("pcontent");
                String pcode = res.getString("pcode");
                Timestamp pdate = res.getTimestamp("pdate");

                Post post = new Post(pid, ptitle, pcontent, pcode, pdate, userid, catid);
                lis.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lis;
    }

    public ArrayList<Post> getPostsByCatId(int cid) {
        ArrayList<Post> lis = new ArrayList<>();
        try {

            String query = "select * from posts_techblog where catid=? order by pid desc";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, cid);
            ResultSet res = pstmt.executeQuery();
            while (res.next()) {
                int pid = res.getInt("pid");
                int userid = res.getInt("userid");
                int catid = res.getInt("catid");
                String ptitle = res.getString("ptitle");
                String pcontent = res.getString("pcontent");
                String pcode = res.getString("pcode");
                Timestamp pdate = res.getTimestamp("pdate");

                Post post = new Post(pid, ptitle, pcontent, pcode, pdate, userid, catid);
                lis.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lis;
    }

    public Post getPostByPostId(int pid) {
            
        Post post=new Post();
        try {
            String query = "Select * from posts_techblog where pid=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, pid);
            ResultSet res=pstmt.executeQuery();
            if(res.next()){
                int userid = res.getInt("userid");
                int catid = res.getInt("catid");
                String ptitle = res.getString("ptitle");
                String pcontent = res.getString("pcontent");
                String pcode = res.getString("pcode");
                Timestamp pdate = res.getTimestamp("pdate");

                post = new Post(pid, ptitle, pcontent, pcode, pdate, userid, catid);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
    public ArrayList<Post> getPostsByUserId(int userid){
        ArrayList<Post> lis = new ArrayList<>();
        try {

            String query = "select * from posts_techblog where userid=? order by pid desc";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userid);
            ResultSet res = pstmt.executeQuery();
            while (res.next()) {
                int pid = res.getInt("pid");
                int catid = res.getInt("catid");
                String ptitle = res.getString("ptitle");
                String pcontent = res.getString("pcontent");
                String pcode = res.getString("pcode");
                Timestamp pdate = res.getTimestamp("pdate");

                Post post = new Post(pid, ptitle, pcontent, pcode, pdate, userid, catid);
                lis.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lis;
    }
    
    

}

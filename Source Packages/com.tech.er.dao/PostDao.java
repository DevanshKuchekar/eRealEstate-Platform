package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<Category>();
        
        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            
            while(set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                
                Category c = new Category(cid, name);
                list.add(c);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p) {
        boolean f = false;
        
        try {
            String q = "insert into posts(pTitle, pDescription, pAddress, pAmount, pPic, catId, userId) values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpDescription());
            pstmt.setString(3, p.getpAddress());
            pstmt.setInt(4, p.getpAmount());
            pstmt.setString(5, p.getpPic());
            pstmt.setInt(6, p.getCatId());
            pstmt.setInt(7, p.getUserId());
            
            pstmt.executeUpdate();
            f = true;
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        
        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pDescription = set.getString("pDescription");
                String pAddress = set.getString("pAddress");
                int pAmount = set.getInt("pAmount");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pDescription, pAddress, pAmount, pPic, pDate, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pDescription = set.getString("pDescription");
                String pAddress = set.getString("pAddress");
                int pAmount = set.getInt("pAmount");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pDescription, pAddress, pAmount, pPic, pDate, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pDescription = set.getString("pDescription");
                String pAddress = set.getString("pAddress");
                int pAmount = set.getInt("pAmount");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pDescription, pAddress, pAmount, pPic, pDate, catId, userId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}

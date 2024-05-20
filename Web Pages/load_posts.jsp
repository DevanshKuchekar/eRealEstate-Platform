<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
    <%
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        
        if (posts.size() == 0) {
            out.println("<h5 class='display-3 text-center'>No Posts in this category...</h5>");
            return;
        }
        
        for (Post p : posts)
        {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="post_pics/<%= p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <h4><%= p.getpTitle() %></h4>
                <p><%= p.getpDescription() %></p>
                <label><b>Asking Price:</b> <%= p.getpAmount() %></label>
            </div>
            
            <div class="card-footer primary-background text-center">
                <a href="show_post_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
            </div>
        </div>
    </div>
    <%
        }
    %>
    
</div>
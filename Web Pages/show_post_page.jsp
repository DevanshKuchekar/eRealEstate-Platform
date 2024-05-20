<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page  errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%> | eRealEstate</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>



            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;

            }


            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }

            body{
                background:url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }

        </style>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="fa"></span>eRealEstate</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"> <span class="fa fa-bell-o"></span> Properties <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square-o"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Bungalows</a>
          <a class="dropdown-item" href="#">Pent House</a>
          <a class="dropdown-item" href="#">PG's</a>
          <a class="dropdown-item" href="#">1 BHK</a>
          <a class="dropdown-item" href="#">2 BHK</a>
        </div>
      </li>
      
      <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-asterisk"></span>Do Post</a>
      </li>
      
    </ul>
    
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
            <a class="nav-link" href="register_page.jsp"> <span class="fa fa-user-circle"></span><%= user.getName() %></a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="LogoutServlet"> <span class="fa"></span>Logout</a>
          </li>
      </ul>
  </div>
</nav>
        <!--end of navbar-->
        
        <!--main content of body-->


        <div class="container">

            <div class="row my-4">

                <div class="col-md-8 offset-md-2">


                    <div class="card">

                        <div class="card-header primary-background text-white">

                            <h4 class="post-title"><%= p.getpTitle()%></h4>


                        </div>

                        <div class="card-body">

                            <img class="card-img-top my-2" src="post_pics/<%= p.getpPic()%>" alt="Card image cap">


                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>

                                    <p class="post-user-info"> <a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName()%></a> has posted : </p>
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%>  </p>
                                </div>
                            </div>


                            <p class="post-content"><%= p.getpDescription() %></p>
                            <br>
                            <label><b>Address:</b></label>
                            <p class="post-content"><%= p.getpAddress() %></p>
                            <br>
                            <label><b>Asking Price:</b> <%= p.getpAmount() %></label>
                        </div>
                        
                    </div>


                </div>

            </div>

        </div>



        <!--end of main content  of body-->
    </body>
</html>

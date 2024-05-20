<%-- 
    Document   : profile
    Created on : Aug 6, 2023, 1:31:22 AM
    Author     : DEVANSH KUCHEKAR
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page errorPage="error_page.jsp"%>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | eRealEstate</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 68% 93%, 35% 100%, 0 93%, 0 0);
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
        
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div> 


        <%
                session.removeAttribute("msg");
            }

        %>
        
        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)"  class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--categories-->

                            <%                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {

                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>


                            <%                                        }

                            %>
                        </div>

                    </div>

                    <!--second col-->
                    <div class="col-md-8" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>

            </div>

        </main>


        <!--end main body of the page-->
        
        <!--add post modal-->

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Please provide the following details...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form id="add-post-form" action="AddPostServlet" method="post">
              <div class="form-group">
                  <label>Title:</label>
                  <br>
                  <input name="pTitle" type="text" placeholder="Enter your Title" class="form-control"/>
              </div>
              
              <div>
                  <label>Property Description:</label>
                  <textarea name="pDescription" class="form-control" style="height: 150px;" placeholder="Enter your description here.."></textarea>
              </div>
              <br>
              <div>
                  <label>Category:</label>
                  <select class="form-control" name="cid">
                      <option selected disabled>---Select Category---</option>
                      <%
                          PostDao postd = new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list = postd.getAllCategories();
                          for(Category c : list)
                          {
                      %>
                      <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                      <%
                          }
                      %>
                  </select>
              </div>
              <br>
              <div>
                  <label>Address:</label>
                  <textarea name="pAddress" class="form-control" style="height: 100px;" placeholder="Enter your Property Address"></textarea>
              </div>
              <br>
              <div class="form-group">
                  <label>Price:</label>
                  <input name="pAmount" type="number" placeholder="Enter your Asking price" class="form-control"/>
              </div>
              
              <div class="form-group">
                  <label><b>Upload Property Photo..</b></label>
                  <br>
                  <input type="file" name="pic"/>
              </div>
              
              <div class="container text-center">
                  <button type="submit" class="btn btn-outline-primary">Post</button>
              </div>
              
          </form>
          
      </div>
      
    </div>
  </div>
</div>
        
        <!-- End add post modal-->
        
        <script
            src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
        <!--now add post js-->
        <script>
            $(document).ready(function(e){
                $("#add-post-form").on("submit", function(event){
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);
                    
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function(data, textStatus, jqXHR) {
                            console.log(data);
                            if(data.trim()=='done')
                            {
                                swal("Good Job!", "Saved successfully", "success");
                            }
                            else {
                                swal("Error!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>
        
        <script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide()

                $(".c-link").removeClass('active')


                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')

                    }
                })

            }

            $(document).ready(function (e) {

                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)


            })
        </script>
    </body>
</html>

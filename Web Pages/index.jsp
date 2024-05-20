<%-- 
    Document   : index
    Created on : Jun 7, 2023, 4:44:44 PM
    Author     : DEVANSH KUCHEKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eRealEstate</title>
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
        <%@include file="normal_navbar.jsp" %>
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to eRealEstate</h3>
                    <p>A world's leading platform for Property buying & selling!</p>
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span> Start! its Free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
                    
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Bungalows</h5>
                          <p class="card-text">Find best bungalows located at your precise location as per your choice.</p>
                          <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Pent House</h5>
                          <p class="card-text">Find best Pent House in your budget with your preferred location.</p>
                          <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">1 BHK</h5>
                          <p class="card-text">Find best 1 BHK apartments in your budget with your preferred location.</p>
                          <a href="#" class="btn primary-background text-white">Explore</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">2 BHK</h5>
                          <p class="card-text">Find best 2 BHK apartments in your budget with your preferred location.</p>
                          <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">3 BHK</h5>
                          <p class="card-text">Find best 3 BHK apartments in your budget with your preferred location.</p>
                          <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">PG's</h5>
                          <p class="card-text">Find best PG's provided with all the facilities in your preferred city.</p>
                          <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script
            src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
    </body>
</html>
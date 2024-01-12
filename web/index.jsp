
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog</title>

        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="margin: 0; padding: 0; background-image: url('img/background1.jpg');
          background-size: cover;
          background-repeat: no-repeat;
          background-attachment: fixed;">

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--banner-->
        <div class="container-fluid" style="margin-top:20px; margin-bottom: 50px;">
            <div class="jumbotron">
                <div class="container">
                    <h3 class="display-6">Welcome to TechBlog - Your Gateway to Tech Tutorials!</h3>
                    <p class="mt-5">
                        Welcome to TechBlog, your hub for all things tech! Dive into a world of informative articles, tech trends, and hands-on guides. Whether you're a tech pro or a beginner, we've got you covered. Explore the latest in coding, emerging technologies, and gadget reviews. TechBlog is your go-to community for staying up-to-date and engaged in the ever-evolving world of technology. Plus, share your expertise by adding your blogs related to specific categories, and connect with other users to explore their insightful posts. Join us on this exciting journey of knowledge-sharing and discovery!
                    </p>
                    <a href="register_page.jsp" class="btn btn-primary"><span class="fa fa-user-plus"></span>  Sign Up </a>
                    <a href="login_page.jsp" class="btn btn-primary"><span class="fa fa-user-circle fa-spin"></span>  Login </a>

                </div>
            </div>
            <br>
        </div>



        <footer>
            <!-- Copyright -->
            <div class="footer-copyright text-center py-3 primary-background" style="position: fixed;
                 bottom: 0;
                 width: 100%;">© 2024 Copyright:
                Komal Garg
            </div>
            <!-- Copyright -->
        </footer>

        <!--javascripts-->
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    </body>
</html>

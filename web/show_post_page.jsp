
<%@page import="com.tech.blog.dao.Likedao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<%    int pid = Integer.parseInt(request.getParameter("post_id"));
    PostDao postdao = new PostDao(ConnectionProvider.getConnection());

    Post post = postdao.getPostByPostId(pid);
    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
    User post_user = userDao.getUserByUserId(post.getUserid());
    if (post_user == null) {
        Message msg = new Message("No post exists with this ID. Please enter valid Post ID.", "error", "alert-danger");
        session.setAttribute("msg", msg);
        response.sendRedirect("profile.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= post.getpTitle()%> </title>

        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body style="background-image: url('img/background1.jpg');
          background-size: cover;
          background-repeat: no-repeat;
          background-attachment: fixed;">

        <!--navbar start-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">Code Sphere</a>
                <!--                Code Sphere-->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="profile.jsp"> <span class="fa fa-home"></span> Home</a>
                        </li>
                    </ul>

                    <ul class="navbar-nav me-r mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" >
                                <span class="fa fa-user-circle"></span> <%= user.getName()%>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="LogoutServlet"><span class="fa fa-user-times"></span> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

        <!--navbar end-->


        <main style="margin-bottom: 100px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2 mt-4">
                        <div class="card">
                            <div class="card-header primary-background">
                                <h3><%= post.getpTitle()%></h3>
                            </div>

                            <div class="card-body">
                                <p><%=post.getpContent()%></p>

                                <% if (post.getpCode() != null) {%>

                                <div class="container-fluid">
                                    <pre class="bg-dark text-white p-3" id="codeSnippet">
<button class="btn btn-light btn-sm float-end" onclick="copyCode()">Copy Code</button>
<br><%= post.getpCode()%>
                                    </pre>

                                </div>
                                <% }%>


                            </div>

                            <div class="card-footer">

                                Posted by <a href="user_page.jsp?user_id=<%= post.getUserid()%>"><%= post_user.getName()%></a> on <%=post.getpDate().toLocaleString()%>

                            </div>

                            <div class="card-footer card-background">
                                <% Likedao dao=new Likedao(ConnectionProvider.getConnection()); %>

                                <a href="#!" onclick="doLike(<%=post.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-primary btn-sm likeButton<%=post.getPid()%>"><i class="fa fa-thumbs-o-up"></i><span class="likeCountSpan<%=post.getPid()%>"><%=dao.countLikesOnPost(post.getPid())%></span></a>
                                
                                <a href="#!" class="btn btn-outline-primary btn-sm m-1"><i class="fa fa-commenting-o"></i><span></span></a>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>


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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <!--js to copy code-->
        <script>
    function copyCode() {
        const codeToCopy = document.getElementById('codeSnippet').innerText;
        navigator.clipboard.writeText(codeToCopy)
                .then(() => alert('Code copied to clipboard!'))
                .catch(err => {
                    console.error('Unable to copy: ', err);
                    alert('Failed to copy code. Please try again.');
                });
    }
        </script>
    </body>
</html>


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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile | Dashboard</title>

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
                                <li><a class="dropdown-item" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal" id="profile-button"><span class="fa fa-user-secret"></span> View Profile</a></li>
                                <li><a class="dropdown-item" href="LogoutServlet"><span class="fa fa-user-times"></span> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

        <!--navbar end-->


        <!--show update profile result here-->
        <%                                Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>

        <div class="alert alert-dismissible fade show <%= msg.getCssClass()%>" role="alert">
            <%= msg.getContent()%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>


        


        <!--main body of the page-->

        <main style="margin-bottom: 100px;">
            <div class="container">
                <div class="row mt-4">
                    <!--first column showing all categories-->
                    <div class='col-md-4'>
                        <!--show two options -> my posts and do post-->
                        <div class="d-grid gap-2 mx-auto mt-2">
                            <a class="btn btn-primary" href="#!" data-bs-toggle="modal" data-bs-target="#add-post-modal" id="add-post-button">Create Post</a>
                            <a class="btn btn-primary" href="user_page.jsp?user_id=<%= user.getId()%>">My Posts</a>
                        </div>

                        <div class="list-group mt-5">
                            <h5>Categories</h5>
                            <a href="#" onClick="getPosts(0, this)" class="c-link list-group-item list-group-item-action text-center active" aria-current="true">
                                All posts
                            </a>
                            <%
                                PostDao postdao = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> categoryList = postdao.getAllCategories();
                                for (Category cat : categoryList) {
                            %>
                            <a href="#" onClick="getPosts(<%= cat.getCid()%>, this)" class="c-link list-group-item list-group-item-action text-center"><%= cat.getName()%></a>
                            <%
                                }
                            %>


                        </div>
                    </div>

                    <!--second column showing posts-->
                    <div class='col-md-8'>            
                        <div class="container mt-2 text-center" id="loader" style="color:#0d51fd;">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h2 class="mt-3">Loading</h2>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>
            </div>
        </main>

        <!--end of main body-->


        <!--add post modal-->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <h5 class="modal-title" id="exampleModalLabel">Add Post</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="POST" enctype="multipart/form-data">
                            <div class="mb-3">
                                Select category
                                <select class="form-control" name="cid">
                                    <option value="0"> Please select the category</option>
                                    <%
//                                        PostDao postdao = new PostDao(ConnectionProvider.getConnection());
//                                        ArrayList<Category> categoryList = postdao.getAllCategories();
                                        for (Category cat : categoryList) {
                                    %>
                                    <option value="<%=cat.getCid()%>"> <%= cat.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>

                            </div>

                            <div class="mb-3">
                                <label for="postTitle" class="form-label">Post Title</label>
                                <input name="pTitle" type="text" class="form-control" id="postTitle" required>
                            </div>

                            <div class="mb-3">
                                <label for="postContent" class="form-label">Enter Description</label>
                                <textarea name="pContent" type="text" style="height:200px;" class="form-control" id="postContent" required></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="postCode" class="form-label">Enter Code (if any)</label>
                                <textarea name="pCode" type="text" style="height:200px;" class="form-control" id="postCode"></textarea>
                            </div>

                            <div class="container text-center" id="post-loader" style="display:none;">
                                <span class="fa fa-refresh fa-spin fa-2x" style="color:#0d51fd"></span>
                                <h4 style="color:#0d51fd">Posting...</h4>
                            </div>

                            <div class="container text-center" id="post-btn">
                                <button type="submit" class="btn btn-primary" >POST</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--profile modal-->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <h5 class="modal-title" id="exampleModalLabel">My Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--showing user details in table form-->
                            <div class="container" id="profile-details">
                                <table class="table">

                                    <tbody>

                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%= user.getId()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getGender()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Registered On</th>
                                            <td><%= user.getDatetime()%></td>
                                        </tr>

                                    </tbody>

                                </table>
                            </div>


                            <!--edit details form-->
                            <div class="container" id="edit-profile-details" style="display:none;">
                                <h6 style="margin-top: 2px; color:red">Edit carefully </h6>
                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>

                                        <tr>
                                            <td>Email :</td>
                                            <td><%= user.getEmail()%></td>
                                        </tr>

                                        <tr>
                                            <td>Name:</td>
                                            <td><input type="text" name="user_name" value="<%= user.getName()%>" class="form-control" required></td>
                                        </tr>

                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" name="user_password" value="<%= user.getPassword()%>" class="form-control" required></td>
                                        </tr>

                                        <tr>
                                            <td>Gender:</td>
                                            <td><input type="text" name="user_gender" value="<%= user.getGender()%>" class="form-control" required></td>
                                        </tr>

                                        <tr>
                                            <td>Registered On :</td>
                                            <td><%= user.getDatetime()%></td>
                                        </tr>
                                    </table>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                    </div>

                                </form>
                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="edit-profile-button">Edit Details</button>
                    </div>
                </div>
            </div>
        </div>




        <footer>

            <div class="footer-copyright text-center py-3 primary-background" style="position: fixed;
                 bottom: 0;
                 width: 100%;">© 2024 Copyright:
                Komal Garg
            </div>

        </footer>

        <!--javascripts-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
                                $(document).ready(function () {

                                    let editStatus = false;

                                    $('#profile-button').click(function () {
                                        $('#profile-details').show();
                                        $('#edit-profile-details').hide();
                                        editStatus = false;
                                        $('#edit-profile-button').text("Edit Details");
                                    });

                                    $('#edit-profile-button').click(function () {

                                        if (editStatus === false) {
                                            $('#profile-details').hide();
                                            $('#edit-profile-details').show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else {
                                            $('#profile-details').show();
                                            $('#edit-profile-details').hide();
                                            editStatus = false;
                                            $(this).text("Edit Details");
                                        }


                                    });
                                });
        </script>


        <!--add post js-->
        <script>
            $(document).ready(function () {

                $('#add-post-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);
//                    before sending data to servlet hide submit button and show loader
                    $('#post-btn').hide();
                    $('#post-loader').show();

//                    send this form data to register servlet
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $('#post-btn').show();
                            $('#post-loader').hide();

                            if (data.trim() === 'added')
                            {
                                // Show success SweetAlert
                                swal({title: "Good Job", text: "Your post has been successfully added.", icon: "success"}).then(() => {
                                    window.location = "login_page.jsp";
                                });

                            } else
                            {
                                swal({title: "Try Again", text: "Failed to add the post.", icon: "error"}).then(() => {
                                    window.location = "login_page.jsp";
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            $('#post-btn').show();
                            $('#post-loader').hide();
                            swal({title: "Try Again", text: "Failed to add the post.", icon: "error"}).then(() => {
                                window.location = "login_page.jsp";
                            });

                        },
                        processData: false,
                        contentType: false

                    });
                });
            });
        </script>


        <!--loading posts js using ajax-->

        <script>

            function getPosts(catId, temp) {

                $('#loader').show();
                $('#post-container').hide();

//              inactive all categories button
                $('.c-link').removeClass('active');

                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }
                });
            }
            ;
            $(document).ready(function () {
                let allPostsRef = $('.c-link')[0];
                getPosts(0, allPostsRef);
            });

        </script>
        
    </body>
</html>

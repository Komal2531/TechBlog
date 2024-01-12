<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user != null) {
        response.sendRedirect("profile.jsp");
    }

%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="background-image: url('img/background1.jpg');
          background-size: cover;
          background-repeat: no-repeat;
          background-attachment: fixed;">

        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        <main class="align-items-center">
            <div class="container">
                <div class="row" >
                    <div class="col-md-6 offset-md-3" >
                        <div class="card" style="margin: 30px; border: 1px solid #0d51fd;">
                            <div class="card-header primary-background text-center">
                                <br>
                                <span class="fa fa-user-circle fa-2x"></span> <p>Login</p>
                            </div>


                            <!--show invalid credentials error here-->
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


                            <div class="class-body m-3">
                                <form action="LoginServlet" method="POST">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" required>
                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
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
    </body>
</html>

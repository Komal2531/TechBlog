<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user != null) {
        response.sendRedirect("profile.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

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
                                <span class="fa fa-user-plus fa-2x"></span><p>Sign Up</p>
                            </div>

                            <div class="class-body m-3">
                                <form id="reg-form" action="RegisterServlet" method="POST">

                                    <div class="mb-3">
                                        <label for="user_name" class="form-label">Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter username" required>
                                    </div>


                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>


                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password" required>
                                    </div>


                                    <div class="mb-3">
                                        <label for="gender" class="form-label">Select Gender</label>
                                        <br> 
                                        <input type="radio" id="male" class="m-2" name="user_gender" value="Male" required> 
                                        <label for="male">Male</label>

                                        <input type="radio" id="female"class="m-2" name="user_gender" value="Female" required>
                                        <label for="female">Female</label>
                                    </div>


                                    <div class="mb-3 form-check">
                                        <input name="check_conditions" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                    </div>


                                    <div class="container text-center" id="loader" style="display:none;">
                                        <span class="fa fa-refresh fa-spin fa-2x" style="color:#0d51fd"></span>
                                        <h4 style="color:#0d51fd">Please Wait...</h4>
                                    </div>

                                    <div class="container text-center" id="submit-btn">
                                        <button type="submit" class="btn btn-primary">Register</button>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded register page");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);
//                    before sending data to servlet hide submit button and show loader
                    $('#submit-btn').hide();
                    $('#loader').show();

//                    send this form data to register servlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $('#submit-btn').show();
                            $('#loader').hide();

                            if (data.trim() === 'inserted')
                            {
                                swal({title: "Congratulations", text: "Registered Successfully", icon: "success"}).then(() => {
                                    window.location = "login_page.jsp";
                                });
                            } else
                            {
                                swal("Try Again", data, "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $('#submit-btn').show();
                            $('#loader').hide();
                            swal("Try Again", "Something went wrong", "failure");
                        },
                        processData: false,
                        contentType: false

                    });
                });
            });

        </script>
    </body>
</html>

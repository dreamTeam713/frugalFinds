<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <style>
        label.error {
            float: none;
            color: red;
        }
        .absolute-center {
            margin: auto;
            position: absolute;
            top: -45%; left: 0; bottom: 0; right: 0;
        }

        .absolute-center.is-responsive {
            width: 50%;
            height: 40%;
            min-width: 200px;
            max-width: 400px;
            padding: 40px;
        }
    </style>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <div class="absolute-center is-responsive">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post"
            name="registration_form" id="registration_form">
            <div class="form-group">
                <c:if test="${sessionScope.username != null}" >
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${sessionScope.username}">
                </c:if>
                <c:if test="${sessionScope.username == null}" >
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
                </c:if>
            </div>
            <div class="form-group">
                <c:if test="${sessionScope.email != null}" >
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" value="${sessionScope.email}">
                </c:if>
                <c:if test="${sessionScope.email == null}" >
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text">
                </c:if>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input id="register" type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
    <jsp:include page="partials/footer.jsp" />
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
    <script>
        var footer = document.getElementById('footer');
        footer.classList.add('footer');
        footer.classList.add('navbar-fixed-bottom');
        $(document).ready(function() {
            $('#username').focus();
            $('#registration_form').validate({
                rules: {
                    username: {
                        required: true,
                        minlength: 3 //change back to 8
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 3 // change back to 8
                    },
                    confirm_password: {
                        required: true,
                        minlength: 3,
                        equalTo: '#password'
                    }
                },
                messages: {
                    username: {
                        required: "Please use a valid username, that is at least 10 letters or numbers to register",
                        minlength: "Username must be at least 8 characters"
                    },
                    email: {
                        required: "Please use an email address to register",
                        email: "Please enter a valid email address to register"
                    },
                    password: {
                        required: "A password is required to register",
                        minlength: "Password must be at least 8 characters in order to register"
                    },
                    confirm_password: {
                        required: "Please confirm your password to register",
                        equalTo: "Passwords do not match, please try again",
                        minlength: "Confirm the password is at least 8 characters in order to register"
                    }
                }
            });
            $('input').keyup(function() {
                if ($("#registration_form").valid()) {
                    $('#register').prop('disabled', false);
                } else {
                    $('#register').prop('disabled', 'disabled');
                }
            });
        });
    </script>
</body>
</html>

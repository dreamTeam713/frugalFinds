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
    </style>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
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
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function() {
            console.log('JQuery is ready, let\'s make sure the button will work after 3 keys');
            // $('#register').attr("disabled","disabled");
            $('#username').focus();
            $('#register').attr("disabled", "disabled");
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
            $('input').on('blur keyup', function() {
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

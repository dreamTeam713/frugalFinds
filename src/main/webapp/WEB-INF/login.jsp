<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
    <style>
        .absolute-center {
            margin: auto;
            position: absolute;
            top: -25%; left: 0; bottom: 0; right: 0;
        }
        .absolute-center.is-responsive {
            width: 50%;
            height: 50%;
            min-width: 200px;
            max-width: 400px;
            padding: 40px;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <div class="absolute-center is-responsive">
        <h1>Please Log In</h1>

        <form action="/login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
    </div>
    <jsp:include page="partials/footer.jsp" />
    </div>
    <script>
        var focus = document.getElementById('username');
        focus.focus();
        var footer = document.getElementById('footer');
        footer.classList.add('footer');
        footer.classList.add('navbar-fixed-bottom');
    </script>
</body>
</html>

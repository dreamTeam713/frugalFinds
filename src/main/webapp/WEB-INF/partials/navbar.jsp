<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
    <div class="container topnav">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand topnav" href="/">frugalFinds</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <form action="/ads" class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input id="search" type="text" class="form-control" placeholder="Search ads..." name="search">
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>
                <a class="navbar-brand topnav" href="/ads">View Ads</a>
                <c:if test="${sessionScope.user == null}">
                    <li><a href="/register">Register</a></li>
                    <li><a href="/login">Login</a></li>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <li><a href="/profile">Hi <c:out value="${sessionScope.user.username}"></c:out></a></li>
                    <li><a href="/logout">Logout</a></li>
                </c:if>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

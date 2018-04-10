<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Ads</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <form action="/ads" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search ads..." name="search">
                </div>
                <button type="submit" class="btn btn-default">Search</button>
            </form>
            <c:if test="${sessionScope.user==null}">
                <li><a href="/register">Register</a></li>
                <li><a href="/login">Login</a></li>
            </c:if>
            <c:if test="${sessionScope.user!=null}">
                <li><a href="/profile">Hi <c:out value="${sessionScope.user.username}"></c:out></a></li>
                <li><a href="/logout">Logout</a></li>
            </c:if>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

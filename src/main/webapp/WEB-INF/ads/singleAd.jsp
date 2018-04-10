<%--
  Created by IntelliJ IDEA.
  User: Chanel
  Date: 4/10/18
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Single Ad" />
    </jsp:include>
    <style>
        .created-by {
            padding-right: 10px;
            padding-left: 10px;
            color: #d17581;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--<div class="container">--%>
<%--<h2>Here is all the data on this Ad!</h2>--%>
<%--<h4>Title:${ad.title}</h4>--%>
<%--<h4>Body: ${ad.description}</h4>--%>
<%--<h4>Created by: ${ad.username}</h4>--%>
<%--</div>--%>
<div class="container">
    <div class="col-md-9">
        <div class="thumbnail">
            <img class="img-responsive" src="http://placehold.it/800x300" alt="">
            <div class="caption-full">
                <h4 class="pull-right">$24.99</h4>
                <h2><a href="#">${ad.title}</a>
                </h2>
                <p>${ad.description}</p>
            </div>
            <div class="ratings">
                <p>Created by ${ad.username}</p>
            </div>
        </div>
    </div>
</div>


</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Chanel
  Date: 4/10/18
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Single Ad" />
    </jsp:include>
    <style>
        .item {
            padding: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <div class="thumbnail">
            <!-- because of it's location in the structure of the server, we have to make the dir back out one below -->
            <c:set var="filepath" scope="request" value="resources/img" />
            <c:set var="imageText" scope="request" value="${ad.url}" />
            <c:choose>
                <c:when test="${fn:contains(imageText, filepath)}">
                    <img class="img-responsive" src="../${ad.url}" alt="">
                </c:when>
                <c:otherwise>
                    <img class="img-responsive" src="${ad.url}" alt="">
                </c:otherwise>
            </c:choose>
            <%--<img class="img-responsive" src="${ad.url}" alt="">--%>
            <div class="item">
                <h2 class="pull-right">$24.99</h2>
                <h1><a href="#">${ad.title}</a></h1>
                <h2>${ad.description}</h2>
                <h2>Created by ${ad.username}</h2>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
<script>
    var footer = document.getElementById('footer');
    footer.classList.add('footer');
</script>
</body>
</html>

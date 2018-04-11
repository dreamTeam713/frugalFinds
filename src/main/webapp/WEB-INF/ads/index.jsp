<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
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
    <h1>Here are all the ads!</h1>
    <c:forEach var="ad" items="${ads}" varStatus="loop">
    <c:if test="${loop.count} == 1 || ${loop.count} % 2 != 0">
        <div class="row">
    </c:if>
        <a href="/ads/singleAd?adId=${ad.id}">
            <div class="col-sm-4 col-lg-4 col-md-4 item"> <!-- should be one for each item -->
                <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                        <h2 class="pull-right">$24.99</h2>
                        <h1>${ad.title}</h1>
                        <h2 class="created-by">Created by ${ad.username}</h2>
                    </div>
                </div>
            </div>
        </a>
    <c:if test="${loop.count} % 2 == 0">
    </div> <!-- end of row -->
    </c:if>
    </c:forEach>
</body>
</html>

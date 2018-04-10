<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        .thumbnail {
            padding: 0;
        }
        .created-by {
            padding-right: 10px;
            padding-left: 10px;
            color: #d17581;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here are all the ads!</h1>
    <!-- Testing adding the images -->
    <c:forEach var="ad" items="${ads}">
    <div class="row">
        <a href="/ads/singleAd?adId=${ad.id}">
            <div class="col-sm-4 col-lg-4 col-md-4 item"> <!-- should be one for each item -->
                <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                        <h4 class="pull-right">$24.99</h4>
                        <h2 class="titleh2">${ad.title}</h2>
                        <p>${ad.description}</p>
                    </div>
                    <div class="created-by">
                        <p>Created by ${ad.username}</p>
                    </div>
                </div>
            </div>
        </a>
    </div>
    </c:forEach>
</body>
</html>

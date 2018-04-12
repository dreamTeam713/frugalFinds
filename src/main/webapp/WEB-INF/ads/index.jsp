<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        .item {
            padding: 10px;
        }
        .thumbnail img {
            max-height: 150px;
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
                    <h1 style="text-align: center">${ad.title}</h1>
                    <img src="${ad.url}" alt="">
                    <div class="caption">
                        <h2 class="pull-right">$<fmt:formatNumber type = "number"
                                                                  maxFractionDigits = "2" value = "${ad.price}" /></h2>
                        <h3 class="created-by">Created by ${ad.username}</h3>
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

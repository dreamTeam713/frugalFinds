<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        .hideForm{
            display: none;
        }
        #adId{
            display: none;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <%--<p>${ad.description}</p>--%>
            <%--<p>Created by: ${ad.username}</p>--%>
            <c:if test="${sessionScope.user.id == ad.userId}">
                <input id="editButton" type="button" value="edit" class="btn btn-block btn-primary">
                <form id="updateAdForm" class="hideForm" action="ads/update" method="post">
                    <div class="form-group">
                        <input id="adId" name="adId" class="form-control" type="text" value="${ad.id}">
                    </div>
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control" type="text">${ad.description}</textarea>
                    </div>
                    <%--<input type="submit" class="btn btn-block btn-primary">--%>
                    <button class="btn btn-block btn-primary">Submit</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script>

    $('div input').click(function (e) {
        e.preventDefault();
        $(this).next().toggle();
    })
</script>


</body>
</html>

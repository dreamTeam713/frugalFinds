<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}! </h1>
        <div>
            <h3 id="profileTitle">Here are the ads you've created!</h3>

            <button id="createButton" class="btn btn-default btn-sm pull-right">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Ad
            </button>
            <div id="createForm" class="container hideForm">
                <h1>Create a new Ad</h1>
                <form action="/ads/create" method="post">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input id="title" name="title" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control" type="text"></textarea>
                    </div>
                    <input type="submit" class="btn btn-block btn-primary">
                </form>
            </div>


            <c:forEach var="ad" items="${userAds}">
                <div class="col-md-6">
                    <h2>${ad.title}</h2>
                    <p id="descriptionParagraph">${ad.description}</p>
                    <c:if test="${sessionScope.user.id == ad.userId}">
                        <input id="editButton" type="button" value="edit" class="btn btn-primary editButton" data-adId="${ad.id}">
                        <input id="deleteButton" type="button" value="delete" class="btn btn-primary deleteButton" data-adid="${ad.id}">
                        <form class="hideForm updateAdForm" action="ads/update" method="post">
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

    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script>

        $('.editButton').click(function (e) {
            e.preventDefault();
            $(this).parent().find('form').toggle()
            ;
        });
        $('.deleteButton').click(function (e){
            e.preventDefault();
            if(confirm("Are you sure you want to delete?")){
               var this2 = $(this);
                $.post("/deleteAds", {
                    adId: $(this).data("adid")
                }).done(function(data) {
                    this2.parent().remove();
                    alert("Delete Successful!");
                });
            }
        });
        $('#createButton').click(function(){
            $('#createForm').toggle();
        })
    </script>
</body>
</html>

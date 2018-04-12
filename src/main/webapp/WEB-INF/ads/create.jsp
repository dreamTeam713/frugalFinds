<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>

</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post"
            enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <label for="editPrice">Price</label>
            <div class="input-group">
                <div class="input-group-addon">$</div>
                <input type="text" name="price" class="form-control" id="editPrice" placeholder="Amount" style="width: 100px">
            </div>
            <div class="form-group">
                <label for="photo">Upload an image</label>
                <input type="file" name="photo" id="photo" />
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
    <script>
        var footer = document.getElementById('footer');
        footer.classList.add('footer');
    </script>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>

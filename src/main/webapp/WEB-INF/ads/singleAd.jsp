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

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h2>Here is all the data on this Ad!</h2>
    <h4>Title:${ad.title}</h4>
    <h4>Body: ${ad.description}</h4>
    <h4>Created by: ${ad.username}</h4>
</div>


</body>
</html>

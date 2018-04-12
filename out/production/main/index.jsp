<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<jsp:include page="/WEB-INF/partials/head.jsp">--%>
        <%--<jsp:param name="title" value="Welcome to my site!" />--%>
    <%--</jsp:include>--%>
<%--</head>--%>
<%--<body>--%>
    <%--<jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>
    <%--<div class="container">--%>
        <%--<h1>Welcome to the Adlister!</h1>--%>
    <%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform" xmlns:jsp="http://www.w3.org/1999/XSL/Transform">

<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to frugalFind" />
    </jsp:include>
</head>

<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<!-- Header -->
<a name="about"></a>
<div class="intro-header">
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <div class="intro-message">
                    <h1>frugalFinds</h1>
                    <h3>We are freaks about being cheap. You should be too.</h3>
                    <hr class="intro-divider">
                    <!--<ul class="list-inline intro-social-buttons">-->
                    <!--<li>-->
                    <!--<a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>-->
                    <!--</li>-->
                    <!--<li>-->
                    <!--<a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>-->
                    <!--</li>-->
                    <!--<li>-->
                    <!--<a href="#" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>-->
                    <!--</li>-->
                    <!--</ul>-->
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->

</div>
<!-- /.intro-header -->

<!-- Page Content -->

<a  name="services"></a>
<div class="content-section-a">

    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-sm-6">
                <hr class="section-heading-spacer">
                <div class="clearfix"></div>
                <h2 class="section-heading">Death to the Stock Photo:<br>Special Thanks</h2>
                <p class="lead">A special thanks to <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a> for providing the photographs that you see in this template. Visit their website to become a member.</p>
            </div>
            <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                <!-- worry about ipad image first -->
                <%--<img class="img-responsive" src="WEB-INF/resources/img/ipad.png" alt="">--%>
                <img class="img-responsive" src="/resources/img/ipad.png" alt="image of ipad"/>
            </div>
        </div>

    </div>
    <!-- /.container -->

</div>
<!-- /.content-section-a -->

<div class="content-section-b">

    <div class="container">

        <div class="row">
            <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                <hr class="section-heading-spacer">
                <div class="clearfix"></div>
                <h2 class="section-heading">3D Device Mockups<br>by PSDCovers</h2>
                <p class="lead">Turn your 2D designs into high quality, 3D product shots in seconds using free Photoshop actions by <a target="_blank" href="http://www.psdcovers.com/">PSDCovers</a>! Visit their website to download some of their awesome, free photoshop actions!</p>
            </div>
            <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                <img class="img-responsive" src="/resources/img/dog.png" alt="image of dogs">
            </div>
        </div>

    </div>
    <!-- /.container -->

</div>
<!-- /.content-section-b -->

<div class="content-section-a">

    <div class="container">

        <div class="row">
            <div class="col-lg-5 col-sm-6">
                <hr class="section-heading-spacer">
                <div class="clearfix"></div>
                <h2 class="section-heading">Google Web Fonts and<br>Font Awesome Icons</h2>
                <p class="lead">This template features the 'Lato' font, part of the <a target="_blank" href="http://www.google.com/fonts">Google Web Font library</a>, as well as <a target="_blank" href="http://fontawesome.io">icons from Font Awesome</a>.</p>
            </div>
            <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                <img class="img-responsive" src="/resources/img/phones.png" alt="picture of phones">
            </div>
        </div>

    </div>
    <!-- /.container -->

</div>
<!-- /.content-section-a -->

<a  name="contact"></a>
<div class="banner">

    <div class="container">

        <div class="row">
            <div class="col-lg-6">
                <h2>Connect to Start Bootstrap:</h2>
            </div>
            <div class="col-lg-6">
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                    </li>
                    <li>
                        <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                    </li>
                    <li>
                        <a href="#" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Linkedin</span></a>
                    </li>
                </ul>
            </div>
        </div>

    </div>
    <!-- /.container -->

</div>
<!-- /.banner -->

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-inline">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="#about">About</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="#services">Services</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="#contact">Contact</a>
                    </li>
                </ul>
                <p class="copyright text-muted small">Copyright &copy; Your Company 2014. All Rights Reserved</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>

</html>


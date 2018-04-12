<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <style>
        body>.container{
            margin-left: 10%;
            margin-right: 10%;
        }
        #createButton{
            margin-left: 10px;
        }
        .form-control,.btn-block{
            width: 50%;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}! </h1>
        <div>
            <h3>Here are the ads you've created!<button id="createButton" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Ad
            </button></h3>

            <div id="createForm" class="container hideForm">
                <h1>Create a new Ad</h1>
                <form action="/ads/create" method="post">
                    <div class="form-group">
                        <label for="title1">Title</label>
                        <input id="title1" name="title" class="form-control" type="text">
                    </div>
                    <div class="form-group">
                        <label for="description1">Description</label>
                        <textarea id="description1" name="description" class="form-control" type="text"></textarea>
                    </div>
                    <label for="priceInput">Price</label>
                    <div class="input-group" style="width: 31px">
                        <div class="input-group-addon">$</div>
                        <input type="text" name="price" class="form-control" id="priceInput" placeholder="Amount" style="width: 100px">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputFile">Pic URL</label>
                        <input type="text" class="form-control" id="exampleInputFile" name="url">
                    </div>
                    <%--<input type="submit" class="btn btn-block btn-primary">--%>
                    <button id="submitNewAd" class="btn btn-block btn-primary" disabled>Submit</button>
                </form>
            </div>

            <c:forEach var="ad" items="${userAds}">
                <div class="col-md-6">
                    <h2 class="adTitle">${ad.title}</h2>
                    <p class="adDescription" id="descriptionParagraph">${ad.description}</p>
                    <c:if test="${sessionScope.user.id == ad.userId}">
                        <input id="editButton" type="button" value="edit" class="btn btn-primary editButton" data-adid="${ad.id}" data-title="${ad.title}" data-target="#myModal" data-toggle="modal">
                        <input id="deleteButton" type="button" value="delete" class="btn btn-primary deleteButton" data-adid="${ad.id}">

                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                    </div>
                                    <form class="updateAdForm" action="ads/update" method="post">
                                        <div class="form-group">
                                            <input id="adId" name="adId" class="form-control" type="text">
                                        </div>
                                        <div class="form-group">
                                            <label for="title">Title</label>
                                            <input id="title" name="title" class="form-control" type="text">
                                        </div>
                                        <div class="form-group">
                                            <label for="description">Description</label>
                                            <textarea id="description" name="description" class="form-control" type="text"></textarea>
                                        </div>
                                    </form>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--<form class="hideForm updateAdForm" action="ads/update" method="post">--%>
                            <%--<div class="form-group">--%>
                                <%--<input id="adId" name="adId" class="form-control" type="text" value="${ad.id}">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="title">Title</label>--%>
                                <%--<input id="title" name="title" class="form-control" type="text" value="${ad.title}">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="description">Description</label>--%>
                                <%--<textarea id="description" name="description" class="form-control" type="text">${ad.description}</textarea>--%>
                            <%--</div>--%>
                                <%--&lt;%&ndash;<input type="submit" class="btn btn-block btn-primary">&ndash;%&gt;--%>
                            <%--<button class="btn btn-block btn-primary">Submit</button>--%>
                        <%--</form>--%>
                    </c:if>
                </div>
            </c:forEach>
        </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>

        $('#myModal').on('show.bs.modal', function (event) {
            console.log("this works");
            var button = $(event.relatedTarget); // Button that triggered the modal
            $('#title').val(button.data("title"));
            $.get("/ads/editAds",{
                adId: button.data("adid")
            }).done(function(data){
                console.log(data);
            })
        });

        // $('.editButton').click(function (e) {
        //     e.preventDefault();
        //     $(this).parent().find('form').toggle()
        //     ;
        // });
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
        });

        $('#priceInput').keyup(function(){
            if(!(/^\d*(\.)?\d*$/).test($('#priceInput').val())){
                $('#priceInput').val($('#priceInput').val().match(/\d*(\.\d+)?/g).join(''))
            }
        });

        $('#title1, #description1, #priceInput').keyup(function () {
            if($('#title1').val() != '' && $('#description1').val()!='' && $('#priceInput').val() != ''){
                $('#submitNewAd').prop('disabled',false)
            }else {
                $('#submitNewAd').prop('disabled',true)
            }
        });


    </script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <style>
        <%--commented out in order to give the site a uniform appearance for now --%>
        /*body>.container{*/
            /*margin-left: 10%;*/
            /*margin-right: 10%;*/
        /*}*/
        #createButton{
            margin-left: 10px;
        }
        #modalForm{
            margin-left: 25px;
            margin-right: 25px;
        }
        .container {
            margin-outside: 10%;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}! </h1>
        <div>
            <h3>Here are the ads you've created!<button id="createButton" class="btn btn-default btn-sm" data-type="create" data-target="#myModal" data-toggle="modal">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Ad
            </button></h3>

            <c:forEach var="ad" items="${userAds}">
                <div class="col-md-6">
                    <h2 class="adTitle">${ad.title}</h2>
                    <p class="adDescription" id="descriptionParagraph">${ad.description}</p>
                    <c:if test="${sessionScope.user.id == ad.userId}">
                        <input id="editButton" type="button" value="edit" class="btn btn-primary editButton" data-adid="${ad.id}" data-target="#myModal" data-toggle="modal">
                        <input id="deleteButton" type="button" value="delete" class="btn btn-primary deleteButton" data-adid="${ad.id}">
                    </c:if>
                </div>
            </c:forEach>


     <%--############   MODAL  ############--%>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Edit your Ad!</h4>
                        </div>
                        <%--<form id="modalForm" class="updateAdForm" action="ads/update" method="post">--%>
                        <form id="modalForm" action="/ads/create" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input id="editadId" name="adId" class="form-control hideForm" type="text">
                                <input id="editUrl" type="text" name="url" class="form-control hideForm">
                                <input id="hasPic" name="addedPicture" class="hideForm" type="text">
                            </div>
                            <div class="form-group">
                                <input id="userId" name="userId" value="${sessionScope.user.id}" class="form-control hideForm" type="text">
                            </div>
                            <div class="form-group">
                                <label for="editTitle">Title</label>
                                <input id="editTitle" name="title" class="form-control" type="text">
                            </div>
                            <div class="form-group">
                                <label for="editDescription">Description</label>
                                <textarea id="editDescription" name="description" class="form-control" type="text"></textarea>
                            </div>
                            <label for="editPrice">Price</label>
                            <div class="input-group" style="width: 31px">
                                <div class="input-group-addon">$ </div>
                                <input type="text" name="price" class="form-control" id="editPrice" placeholder="Amount" style="width: 100px">
                            </div>
                            <div id="currentPic" class="form-group hideForm">
                                <p>Current Image</p>
                                <img src="" alt="" style="max-height: 100px"></img>
                            </div>
                            <div class="form-group">
                                <label for="photo">Upload an image</label>
                                <input type="file" name="photo" id="photo" />
                            </div>
                            <%--<div class="form-group">--%>
                                <%--<label for="editUrl">Pic URL</label>--%>
                                <%--<input type="text" class="form-control" id="editUrl" name="url">--%>
                            <%--</div>--%>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <input id="submitForm" type="submit" class="btn btn-default btn-primary">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
     <%--  ###################   END OF MODAL   ####################--%>
        </div>

    </div>
    <jsp:include page="partials/footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>

        var footer = document.getElementById('footer');
        footer.classList.add('footer');
        footer.classList.add('navbar-fixed-bottom');

        $('#submitForm').click(function () {
            if($('#photo').val() == ""){
                $('#hasPic').val(0);
            }else{
                $('#hasPic').val(1);
            }
        });

        $('#myModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            if(button.data("type") === "create"){
                $('#modalForm').attr('action', "/ads/create");
                $('#myModalLabel').text("Create New Ad!");
                $('#currentPic').addClass('hideForm');
                $('#editTitle, #editDescription, #editPrice, #editUrl').val("");

            }else{
                $('#modalForm').attr('action', "/ads/update");
                $('#myModalLabel').text("Edit Your Ad!");
                $.get("/ads/editAds",{
                    adId: button.data("adid")
                }).done(function(data){
                    var json = JSON.parse(data);
                    $('#editadId').val(json.id);
                    $('#editTitle').val(json.title);
                    $('#editDescription').val(json.description);
                    $('#editPrice').val(json.price);
                    $('#currentPic').removeClass('hideForm');
                    $('#currentPic > img').attr('src',json.url);
                    $('#editUrl').val(json.url);
                })
            }

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

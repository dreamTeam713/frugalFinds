<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        .col-md-4{
            border: solid 1px grey;
            height: 450px;
            width: 32%;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .col-md-4 > img{
            height: 250px;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <div>
            <h3>Here are the ads you've created!<button id="createButton" class="btn btn-default btn-sm" data-type="create" data-target="#myModal" data-toggle="modal">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> New Ad
            </button></h3>

            <c:forEach var="ad" items="${userAds}">
                <div class="col-md-4">
                    <img class="center-block img-responsive" src="${ad.url}" alt="">
                    <h2 class="pull-right">$<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${ad.price}" /></h2>
                    <h1 class="adTitle">${ad.title}</h1>
                    <h3 class="adDescription" id="descriptionParagraph" style="margin-top: 0px; height: 80px">${ad.description}</h3>
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
                                <input type="file" name="photo" id="photo" accept="Image/*" />
                                <span id="imageError" class="hideForm" style="color: red">File must be an image</span>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <input id="submitForm" type="submit" class="btn btn-default btn-primary" disabled>
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


        $('#submitForm').click(function (e) {
            if($('#photo').val() == ""){
                $('#hasPic').val(0);
            }else{
                $('#hasPic').val(1);
            }
        });

        $('#myModal').on('show.bs.modal', function (event) {
            $('#imageError').addClass('hideForm');
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

        $('#editPrice').keyup(function(){
            if(!(/^\d*(\.)?\d*$/).test($('#editPrice').val())){
                $('#editPrice').val($('#editPrice').val().match(/\d*(\.\d+)?/g).join(''))
            }
        });

        $('#editTitle, #editDescription, #editPrice').keyup(function () {
            if($('#editTitle').val() != '' && $('#editDescription').val()!='' && $('#editPrice').val() != ''){
                $('#submitForm').prop('disabled',false)
            }else {
                $('#submitForm').prop('disabled',true)
            }
        });
        
        // $('#photo').select(function () {
        //         var index = $('#photo').val().indexOf(".");
        //         var ext = $('#photo').val().substring(index);
        //         var status = $('#submitForm').prop('disabled');
        //         if((ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif" || ext == ".webp") && status != false) {
        //             $('#imageError').addClass('hideForm');
        //         }else{
        //             $('#imageError').removeClass('hideForm');
        //             $('#submitForm').prop('disabled',true)
        //         }
        //      })



    </script>
</body>
</html>

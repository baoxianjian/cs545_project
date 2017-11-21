<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <title><spring:message code="post_list" text="default text" /></title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resource/css/shop-homepage.css" rel="stylesheet">

  </head>

  <body>

  	<jsp:include page="./nav.jsp" />

    <!-- Page Content -->
    <div class="container">

      <div class="row">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="<%=request.getContextPath()%>/resource/image/food1.jpg" width="1200" height="350" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="<%=request.getContextPath()%>/resource/image/food2.jpg" width="1200" height="350" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="<%=request.getContextPath()%>/resource/image/food3.jpg" width="1200" height="350" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          <div class="row">

		  
		  
		  <c:forEach var="post" items="${posts}">
		  
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="detail/${post.id}"><img class="card-img-top" src="${post.imagePath}" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="detail/${post.id}">${post.title}</a>
                  </h4>
                  <h5>${post.typeName}</h5>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
              </div>
            </div>
			</c:forEach>
          </div>
          <!-- /.row -->


      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/resource/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>

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
      <div class="col-md offset-3">
        <div class="well well-sm">


			<div>
				<form:errors path="*"  cssStyle="color : red;"  />
			</div>
          
       		<fieldset>
	            <legend class="text-center">Post Detail</legend>
	    
	            <!-- Name input-->
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="title">Title</label>
	              <div class="col-md-9">
						${post.title}
	              </div>
	            </div>
	    
	            <!-- Email input-->
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="type">Type</label>
	              <div class="col-md-9">
					${post.typeName}
	              </div>
	            </div>
	    
	    
	    	    <div class="form-group">
	              <label class="col-md-3 control-label" for="image">Image</label>
	              <div class="col-md-9">
	                <img src="${post.imagePath}" width="300" alt="" />
	              </div>
	            </div>
	    
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="content">Content</label>
	              <div class="col-md-9">
	                <p>${post.content}</p>
	              </div>
	            </div>
	            
	           	<div class="form-group">
	              <label class="col-md-3 control-label" for="showTime">Start At</label>
	              <div class="col-md-9">
	                ${post.showTime}
	              </div>
	            </div>
	            
	          	<div class="form-group">
	              <label class="col-md-3 control-label" for="memberLimit">Member Count Limit</label>
	              <div class="col-md-9">
	                ${post.memberLimit}
	              </div>
	            </div>

	            
	          	<div class="form-group">
	              <label class="col-md-3 control-label" for="location">Location</label>
	              <div class="col-md-9">
	                ${post.location}
	              </div>
	            </div>
	            
	   
          </fieldset>

        </div>
      </div>
	</div>


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

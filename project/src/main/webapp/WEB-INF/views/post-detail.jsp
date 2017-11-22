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
    
    <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>


    <title><spring:message code="post_list" text="default text" /></title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resource/css/shop-homepage.css" rel="stylesheet">
    
    <script type="text/javascript" src="<spring:url value='/resource/js/jquery-1.10.1.min.js'/>"></script>
    <script type="text/javascript" src="<spring:url value='/resource/js/comment.js'/>"></script>

  </head>

  <body>

  <jsp:include page="./nav.jsp" />
  
 <!-- Page Content -->
    <div class="container">


	<div class="row">
      <div class="col-md offset-3">
        <div class="well well-sm">
       		<fieldset>
	            <legend class="text-center"><spring:message code="post_detail" text="default text" /></legend>
	    
	            <!-- Name input-->
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="title"><spring:message code="post.title" text="default text" />: ${post.title}</label>
	            </div>
	    
	            <!-- Email input-->
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="type"><spring:message code="post.type" text="default text" />:${post.typeName}</label>
	            </div>
	    
	    
	    	    <div class="form-group">
	              <label class="col-md-3 control-label" for="image"><spring:message code="post.image" text="default text" /></label>
	              <div class="col-md-9">
	                <img src="${post.imagePath}" width="300" alt="" />
	              </div>
	            </div>
	    
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="content"><spring:message code="post.content" text="default text" />: ${post.content}</label>
	            </div>
	            
	            <c:if test = "${post.type==3}">
		           	<div class="form-group">
		              <label class="col-md-3 control-label" for="showTime"><spring:message code="post.showTime" text="default text" />: ${post.showTime}</label>
		            </div>
		            
		          	<div class="form-group">
		              <label class="col-md-3 control-label" for="memberLimit"><spring:message code="post.memberLimit" text="default text" />: ${post.memberLimit}</label>
		            </div>
	
		            
		          	<div class="form-group">
		              <label class="col-md-3 control-label" for="location"><spring:message code="post.location" text="default text" />: ${post.location}</label>
		            </div>
	          	</c:if>
          </fieldset>

        </div>
      </div>
	</div>


	<div class="row">
      <div class="col-md offset-3">
        <div class="well well-sm">
       		<fieldset>
	            <legend class="text-center"><spring:message code="post_comments" text="default text" /></legend>
	    		<div id="comment-list">
					<c:forEach var="comment" items="${post.comments}">
		            	<div class="form-group">
		              		${comment.content}
		            	</div>
		    		</c:forEach>
	    		</div>
	    		
	    		<form action="<spring:url value='/comment/add?postid=${post.id}'/>" method="post" id="commentForm">
		    		<div class="form-group">
		              <label class="col-md-3 control-label" for="content"><spring:message code="post.comment" text="default text" /></label>
		              <div class="col-md-9">
		                <textarea class="form-control" id="content" name="content" placeholder="" rows="5"></textarea>
		              </div>
		            </div>
		           	<div class="form-group">
		           	<div id="comment-error"></div>
		            <div class="col-md-12">
		               <button type="button" id="commentSbumit" class="btn btn-primary btn-lg"><spring:message code="post.submit" text="default text" /></button>
		            </div>
		            
	            </div>
	            </form>
	   
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

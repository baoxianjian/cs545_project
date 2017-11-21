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
	<script>
		function changeShow(o)
		{
			if(o.value=="3")
			{
				$("#showF2F").show();
			}
			else
			{
				$("#showF2F").hide();
			}
		}
	</script>
  </head>

  <body>

  <jsp:include page="./nav.jsp" />
  
 <!-- Page Content -->
    <div class="container">


	<div class="row">
      <div class="col-md col-md-offset-3">
        <div class="well well-sm">

        	<form:form  class="form-horizontal" modelAttribute="post" action="add" method="post" enctype="multipart/form-data">
			<div>
				<form:errors path="*"  cssStyle="color : red;"  />
			</div>
          
       		<fieldset>
	            <legend class="text-center"><spring:message code="post_add" text="default text" /></legend>
	    
	            <!-- Name input-->
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="title"><spring:message code="post.title" text="default text" /></label>
	              <div class="col-md-9">
		              <form:input id="title" path="title" class="form-control"/>
	              </div>
	            </div>
	    
	            <!-- Email input-->
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="type"><spring:message code="post.type" text="default text" /></label>
	              <div class="col-md-9">
	                <form:select path="type" class="form-control" onchange="changeShow(this)">
					   <form:option value="0" label="--- Select ---"/>
					   <form:options items="${types}" />
					</form:select>
	              </div>
	            </div>
	    
	    
	    	    <div class="form-group">
	              <label class="col-md-3 control-label" for="imageTemp"><spring:message code="post.image" text="default text" /></label>
	              <div class="col-md-9">
	                <form:input path="imageTemp" id="imageTemp" type="file" value="" class="form:input-large" />
	              </div>
	            </div>
	    
	            <div class="form-group">
	              <label class="col-md-3 control-label" for="content"><spring:message code="post.content" text="default text" /></label>
	              <div class="col-md-9">
	                <form:textarea class="form-control" id="content" path="content" placeholder="" rows="5"></form:textarea>
	              </div>
	            </div>
	            
	            <div id="showF2F" style="display:none;">
		           	<div class="form-group">
		              <label class="col-md-3 control-label" for="showTime"><spring:message code="post.showTime" text="default text" /></label>
		              <div class="col-md-9">
		                <form:input path="showTime" id="showTime" class="form-control" />
		              </div>
		            </div>
		            
		          	<div class="form-group">
		              <label class="col-md-3 control-label" for="memberLimit"><spring:message code="post.memberLimit" text="default text" /></label>
		              <div class="col-md-9">
		                <form:input path="memberLimit" id="memberLimit" class="form-control" />
		              </div>
		            </div>
	
		            
		          	<div class="form-group">
		              <label class="col-md-3 control-label" for="location"><spring:message code="post.location" text="default text" /></label>
		              <div class="col-md-9">
		                <form:input path="location" id="location" class="form-control" />
		              </div>
		            </div>
	            </div>
	    
	            <!-- Form actions -->
	            <div class="form-group">
	              <div class="col-md-12 text-right">
	                <button type="submit" class="btn btn-primary btn-lg"><spring:message code="post.submit" text="default text" /></button>
	              </div>
	            </div>
          </fieldset>
          </form:form>
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

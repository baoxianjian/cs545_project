<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Login</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1><spring:message code="login.welcome"/></h1>
			</div>
		</div>
	</section>
	Language/语言: <a href="?language=en_US">English</a>|<a href="?language=zh_CN">中文</a>
<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title"><spring:message code="login.signin"/></h3>
			 	</div>
			  	<div class="panel-body">
			  	<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/><br />
					</div>
				</c:if>
			    	<form action="<spring:url value="/postLogin"></spring:url>" method="post">
                    <fieldset>
			    	  	<div class="form-group">
			    	  		<label for="username"><spring:message code="login.username"/></label>
			    		    	<input class="form:input-large" placeholder="User Name" name='username' type="text">
			    		</div>
			    		<div class="form-group">
			    			<label for="userName"><spring:message code="login.password"/></label>
			    			<input class=" form:input-large" placeholder="Password" name='password'  type="password" value="">
			    		</div>
		    			<div class="form-group">
			    			<input type='checkbox' name="keepMe"/><spring:message code="login.rememberme"/><br/>	
			    		</div>
			    		<spring:message code="login.submit" var="summit"/>
			    		<input class="btn btn-lg btn-success btn-mini" type="submit" value="${summit}">
			    	</fieldset>
						<security:csrfInput />
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>

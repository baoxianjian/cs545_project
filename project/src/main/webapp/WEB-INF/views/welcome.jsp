<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<p><img src="<spring:url value='/resource/image/bun.jpg' />" height="50" width="100"/>  ${userMessage}</p>
				<h1> ${greeting} </h1>
				<p> ${tagline} </p>
				<p> <security:authorize access="isAuthenticated()">
  					Welcome  <security:authentication property="principal.username" />
				</security:authorize>

			</div>	 
				<div class="container">
 					<security:authorize access="isAnonymous()">
    					<a href="<spring:url value='/login' />" class="btn btn-default pull-right"> Login</a>
    				</security:authorize>
 					<security:authorize access="isAuthenticated()">
    					<a href="<spring:url value='/user/showuser' />" class="btn btn-default pull-right"> ShowUser</a>
    				</security:authorize>
		
					 <a href="<spring:url value='/post/list' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span> Go to Community
					</a>
				</div>	
				<a href="<spring:url value='/user/register' />"> No account?Please press here to register</a>

		</div>
			
	</section>
	
</body>
</html>
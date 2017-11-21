<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>User</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>User Information</h1>
				<p>An important contributor  to our Community!!!</p>
			</div>
  					<a href="<spring:url value="/" />" class="btn btn-primary btn-mini pull-right">Back</a>	
  					<a href="<spring:url value="/friend/addfriend" />" class="btn btn-primary btn-mini pull-right">Add Friend</a>
 				<br>
 				<spring:url value="/dologout" var="logout_url" />				
  			<form:form action="${logout_url}" class="form-horizontal" method="POST" >
  					<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-danger btn-mini  pull-right" value ="Logout"/>
					</div>
				</div>
			</form:form> 			
		</div>
	</section>

	<section class="container">
		<div class="row">
 				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
 						<div class="caption">
							<h3>UserName - ${user.username}</h3>
							<h3>Email -  ${user.email}</h3>
							<p>Nationality - ${user.nationality}</p>
							<p>BirthDate - ${user.birthDate} </p>
							<p>Gender - ${user.gender} </p>
							<p>Role - ${user.role} </p>
							<p>Phone - ${user.phone.area}-${user.phone.prefix}-${user.phone.number} </p>
							<p>Description - ${user.description} </p>
						</div>
					</div>
				</div>
		</div>
	</section>
	<a href="<spring:url value='/edituser?userId=${user.id}' />" class="btn btn-default pull-right"> EditUser</a>
</body>
</html>

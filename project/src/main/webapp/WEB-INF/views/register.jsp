<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Add User Form</title>
<style type="text/css">@import url("<c:url value="/resource/css/main.css"/>");</style>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<body>

<h1>Register</h1>
<div id="global">
<section class="container">
<form:form modelAttribute="newuser" action="" 
	class="form-horizontal" enctype="multipart/form-data">
    <fieldset>
        <legend>Add a User</legend>
  		<form:errors path="*" cssClass="text-danger" /> 
         
        <div class="form-group">
            <label for="username" class="control-label col-lg-2">UserName: </label>
            <div class="col-lg-10">
            	<form:input id="username" path="username"/>
            	<form:errors path="username" cssClass="text-danger" /> 
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="control-label col-lg-2">Email: </label>
            <div class="col-lg-10">
            	<form:input id="email" path="email"/>
            	<form:errors path="email" cssClass="text-danger" />
            </div> 
        </div>
        <div class="form-group">
            <label for="password" class="control-label col-lg-2">Password: </label>
            <div class="col-lg-10">
            	<form:password id="password" path="password"/>
            	<form:errors path="password" cssClass="text-danger" />
            </div> 
        </div>
        <div class="form-group">
			<label class="control-label col-lg-2" for="verifyPassword">Verify Password: </label>
			<div class="col-lg-10">
				<div class="form:input-prepend">
					<form:password  path="verifyPassword"  class="form:input-large"/>
					<form:errors path="verifyPassword" cssClass="text-danger"/>
				</div>
			</div>
		</div>
        <div class="form-group">
            <label for="nationality" class="control-label col-lg-2">Nationality: </label>
            <div class="col-lg-10">
            	<form:input id="nationality" path="nationality"/>
            	<form:errors path="nationality" cssClass="text-danger" />
            </div> 
        </div>
        <div class="form-group">
            <label for="birthDate" class="control-label col-lg-2">BirthDate: </label>
            <div class="col-lg-10">
            	<form:input id="birthDate" path="birthDate"/>
            	<form:errors path="birthDate" cssClass="text-danger" />
            </div> 
        </div>
        <div class="form-group">
        	<label class="control-label col-lg-2">
        		<form:radiobutton path="gender" value="M"/>Male
        		<form:radiobutton path="gender" value="F"/>Female
        	</label>
        </div>
        <div class="form-group">
            <label for="phone" class="control-label col-lg-2">Phone: </label>
            <div class="col-lg-10">
            	<form:input id="phone" path="phone"/>
            	<form:errors path="phone" cssClass="text-danger" />
            </div>
        </div>
        <div class="form-group">
            <label for="description" class="control-label col-lg-2">Description: </label>
            <div class="col-lg-10">
            	<form:input id="description" path="description"/>
            	<form:errors path="description" cssClass="text-danger" />
            </div>
        </div>
        
        <div class="form-group">
			<label class="control-label col-lg-2" for="UserImage">UserImage: </label>
			<div class="col-lg-10">
				<form:input path="UserImage" id="UserImage"
					type="file" class="form:input-large" />
			</div>
		</div>
        
        
        <div class="form-group">
        	<div class="col-lg-offset-2 col-lg-10">
             	<input id="submit" type="submit" value="Register" class="btn btn-primary">
        	</div>
        </div>
    </fieldset>
</form:form>
</section>
</div>
<a href="<spring:url value="/" />" class="btn btn-primary btn-mini pull-right">Back</a>	
</body>
</html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Edit User Form</title>
<style type="text/css">@import url("<c:url value="/resource/css/main.css"/>");</style>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<body>

<h1>Update</h1>
<div id="global">
<section class="container">
<form:form modelAttribute="user" class="form-horizontal">
    <fieldset>
        <legend>Edit the User</legend>
  		<form:errors path="*" cssClass="text-danger" /> 
  		         
        <div class="form-group">
            <label for="email" class="control-label col-lg-2">Email: </label>
            <div class="col-lg-10">
            	<form:input id="email" path="email"/>
            	<form:errors path="email" cssClass="text-danger" />
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
            <label for="description" class="control-label col-lg-2">Description: </label>
            <div class="col-lg-10">
            	<form:input id="description" path="description"/>
            	<form:errors path="description" cssClass="text-danger"/>
            </div>
        </div>
        
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<input type="submit" id="btnAdd" class="btn btn-primary"
					value="Update" name="_eventId_processUser" />
				<button id="btnCancel" class="btn btn-default" name="_eventId_cancelAddOtherProperties">Cancel</button>
			</div>
		</div>
    </fieldset>
</form:form>
</section>
</div>
</body>
</html>

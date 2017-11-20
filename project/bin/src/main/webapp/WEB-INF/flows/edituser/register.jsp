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
<form:form modelAttribute="user"  class="form-horizontal">
    <fieldset>
        <legend>Add a User</legend>
  		<p>
  		     <form:errors path="*" cssStyle="color : red;" /> 
        </p>
         
        <p>
            <label for="userName">UserName: </label>
            <form:input id="userName" path="userName"/>
  		  	<div style="text-align: center;">
 				<form:errors path="title" cssStyle="color : red;" /> 
 			</div>
        </p>
        <p>
            <label for="email">Email: </label>
            <form:input id="email" path="email"/>
   		  	<div style="text-align: center;">
 				<form:errors path="email" cssStyle="color : red;" /> 
 			</div>
        </p>
        <p>
            <label for="password">Password: </label>
            <form:input id="password" path="password"/>
  		  	<div style="text-align: center;">
 				<form:errors path="title" cssStyle="color : red;" /> 
 			</div>
        </p>
        
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<input type="submit" id="btnAdd" class="btn btn-primary"
					value="Add" name="_eventId_customerInfoCollected" />
				<button id="btnCancel" class="btn btn-default" name="_eventId_checkoutCancelled">Cancel</button>
			</div>
		</div>
        
        <p id="buttons">
             <input id="submit" type="submit" value="Add Book">
        </p>
    </fieldset>
</form:form>
</div>
</body>
</html>

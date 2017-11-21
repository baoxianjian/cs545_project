<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<spring:url value="/resource/js/deleteuse.js"/>"></script>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>AddFriend</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Add a Friend</h1>
			</div>
		</div>
	</section>
	<div class="container">
    	<div class="row">
			<div class="col-md-4 col-md-offset-4">
    			<div class="panel panel-default">
    				<form id="userForm" method="post">
                    	<fieldset>
			    	  		<div class="form-group">
			    	  		<label for="username">Friend Name: </label>
			    		    	<input class="form:input-large" placeholder="User Name" name='username' type="text" id="username">
			    			</div>
			    			<input class="btn btn-lg btn-success btn-mini" type="submit" value="submit" onclick="makeAjaxCall();">
							<a href="<spring:url value="/" />" class="btn btn-lg btn-success btn-mini">Back</a>
			    		</fieldset>
						<security:csrfInput />
			      	</form>
			    </div>
    		</div>
    	</div>
    </div>
    <div id="errors" style="display:none" > </div>
   	<div id="formInput" style="display:none" > </div>
</body>
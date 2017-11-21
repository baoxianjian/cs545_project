<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add Friend</title>
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<script type="text/javascript" src="<spring:url value='/resource/js/jquery-1.10.1.min.js'/>"></script>
	<script type="text/javascript" src="<spring:url value="/resource/js/addfriend.js"/>"></script>
	<link rel="stylesheet" href="<spring:url value="/resource/css/rest.css"/>">
</head>
 
<body>
	 <h1>Add Friend</h1>

	<form id="employeeForm" method="post">	
		<table cellpadding="0" cellspacing="0" border="1" class="GridOne">
			<tr>
				<td>Friend Name</td>
				<td><input type="text" name="username" id="username" value=""></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="Ajax Submit" onclick="makeAjaxCall();"></td>
			</tr>
		</table>
	</form>
		<!-- Success - or Validation errors -->
    	<div id="errors" style="display:none" >   	
      	</div>
 	
   	<div id="formInput" style="display:none" > </div>
</body>
</html>
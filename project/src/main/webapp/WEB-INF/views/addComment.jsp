<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
</head>
<body>
	<h1>This is addComments.jsp</h1>
	
	<form:form modelAttribute="comment" method='post'>
		<p><label>The name of Cuisine: </label><br></p>
		<div id="result" style="display">
				<p id="success"></p>
				<p id="success"></p>
			</div>
	 </form:form>
</body>

</html>

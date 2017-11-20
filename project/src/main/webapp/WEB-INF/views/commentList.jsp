<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Comments</title>
</head>
	<body>
		<div>
				<h1>This is CommentList page:</h1>				
		<fieldset>
				<Legend>Cuisine</Legend>
				<tr><td><strong>Cuisine name:</strong></td><td>example</td></tr>
					
				<tr><td><strong>Cuisine content:</strong></td><td>example2</td></tr><br>
				<label>Cuisine picture</label>
				<!-- <img src="<c:url value="/resource/images/${post.Id}.png"></c:url>" alt="image"  style = "width:100%"/>-->
			</fieldset>
			<h1>Comments</h1>
			<div>
			<h1>List of comments</h1>
				<table style="width:100%">					
					<tr>
						<th style="width: 20%;">Rating</th>
						<th style="width: 40%;">content</th>
						<th style="width: 40%;">picture</th>
						</tr>
					<c:forEach var='comment' items="${comments}">	
						<td>${comment.rating }</td>
						<td>${comment.content }</td>
						<td>${comment.image }</td>
						
				   </c:forEach> 
				</table>
			</div>
			<div>
			<button type="button" onclick="comments.jsp">Return</button>
			</div>
			<div id="result" style="display">
				<p id="success"></p>
				<p id="success"></p>
			</div>
		</div>	
	</body>
</html>
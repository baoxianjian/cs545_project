<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post List</title>
</head>
<body>

<table>
	<thead>
		<tr>
			<th>Id</th>
			<th>Title</th>
			<th>Type</th>
			<th>DateLine</th>
			<th>Details</th>
		</tr>
	</thead>

<c:forEach var="post" items="${posts}">
	
	
	<th>${post.id}</th>
	<th>${post.title}</th>
	<th>${post.type}</th>
	<th>${post.dateline}</th>
	<th><a href="detail?id=${post.id}">Details</a></th>
	
</c:forEach>
</table>


</body>
</html>
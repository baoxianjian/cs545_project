<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="post_list" text="default text" /></title>
</head>
<body>
<section>
	<div class="pull-right" style="padding-right:50px">
		<a href="?language=en">English</a>|<a href="?language=zh_CN">Chinese</a>
	</div>
</section>
<table>
	<thead>
		<tr>
			<th><spring:message code="post.id" text="default text" /></th>
			<th><spring:message code="post.title" text="default text" /></th>
			<th><spring:message code="post.type" text="default text" /></th>
			<th><spring:message code="post.dateline" text="default text" /></th>
			<th><spring:message code="post_detail" text="default text" /></th>
		</tr>
	</thead>

<c:forEach var="post" items="${posts}">
	<tr>
		<td>${post.id}</td>
		<td>${post.title}</td>
		<td>${post.type}</td>
		<td>${post.dateline}</td>
		<td><a href="detail?id=${post.id}">Details</a></td>
	</tr>
</c:forEach>
</table>


</body>
</html>
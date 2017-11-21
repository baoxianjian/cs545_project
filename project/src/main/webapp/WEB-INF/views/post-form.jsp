<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Post Form</title>
</head>
<body>

<form:form modelAttribute="post" action="add" method="post" enctype="multipart/form-data">
	<div>
		<form:errors path="*"  cssStyle="color : red;"  />
	</div>
	<div>
		<label for="title">Title</label>
		<form:input id="title" path="title" />
	</div>
	<div>
		<label for="type">type</label>
		<form:select path="type">
		   <form:option value="0" label="--- Select ---"/>
		   <form:options items="${types}" />
		</form:select>
	</div>
	
	<div>
		<label for="content">Content</label>
		<form:input id="content" path="content" />
	</div>
	<div>
		<label for="image"></label>
		<form:input path="image" id="image" type="file" class="form:input-large" />
	</div>

	<div>
		<label for="showTime">StartAt</label>
		<form:input id="showTime" path="showTime" />
	</div>

	<div>
		<label for="memberLimit">Member Count Limit</label>
		<form:input id="memberLimit" path="memberLimit" />
	</div>
	
	<div>
		<label for="location">Location</label>
		<form:input id="location" path="location" />
	</div>
	
	<div>
		<input type="submit" value="Submit" />
	</div>

	
</form:form>
</body>
</html>
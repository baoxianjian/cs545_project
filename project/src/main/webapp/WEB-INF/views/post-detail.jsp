<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Post Detail</title>
</head>
<body>
Title: ${post.title}<br/>
Content: ${post.content}<br/>
Type: ${post.type}<br/>
Image: <img src="${post.imagePath}" alt="image"><br/>
StartAt: ${post.showTime}<br/>
MemberLimit: ${post.memberLimit}<br/>
Location: ${post.location}<br/>



</body>
</html>
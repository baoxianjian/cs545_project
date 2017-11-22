<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet"	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
		<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
		<script type="text/javascript" src="<spring:url value="/resource/js/controllers.js"/>"></script>

		<title>Comments for food</title>
		<script type="text/javascript">
		
		function serializeObject (form)
		{
		    var jsonObject = {};
		    var array = form.serializeArray();
		    $.each(array, function() {
		         	jsonObject[this.name] = this.value;
		    });
		    return jsonObject;

		};

		function addComment(){
			var contextRoot = "/" + window.location.pathname.split('/')[1];
			var dataToSend = JSON.Stringify(serializeObject($('#commentForm')));
			$.ajax({
				type:		"post",
				url: 		contextRoot+"/addComment",
				dataType:	"json",
				data: 		dataToSend,
				contentType:'application/json',
				
				sucess:function(comment){
					$('#success').html('');
					$('#errors').html('');
					$('#success').append('<h3 align="center">Success to submit comment</h3>');
					$('#result').show();
					
					var newRow = '<tr><td>'+comment.rating+'</td><td><br>'+comment.content+"</td></tr>";
					$('table tbody').append(newRow);
				},
				error:function(errorObject){
					if (errorObject.responseJSON.errorType == "ValidationError") {
						$('#success').html("");
						$('#errors').html("");
						$("#errors").append( '<H3 align="center"> Error(s)!! <H3>');
						$("#result").append( '<p>');
						var errorList = errorObject.responseJSON.errors;
						$.each(errorList, function(i,error) {
						$("#errors").append( error.message + '<br>');
						});
						$("#errors").append( '</p>');
						$('#result').show();
						}
						else {
						alert(errorObject.responseJSON.errors(0));
				}
			}
		
		});
		}
		</script>
</head>
	<body>
		
			<h1>This is comments jsp</h1>
			<h2>${grating }</h2>
		
			<fieldset>
				<Legend>Cuisine</Legend>
				<tr><td><strong>Cuisine name:</strong></td><td>example</td></tr><br>
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
			<button type="button" onclick="addComment()">Create a Comment</button>
			</div>
			<div id="result" style="display">
				<p id="success"></p>
				<p id="success"></p>
			</div>
</body>
	
</html>
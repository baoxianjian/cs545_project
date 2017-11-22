$(function () {
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
	xhr.setRequestHeader(header, token);
});
}); 

function makeAjaxCall(){
	var contextRoot = "/" + window.location.pathname.split('/')[1];
	let data=JSON.stringify(serializeObject($("#employeeForm")));
	$.ajax({
		type : "POST",
		url : contextRoot+"/friend/addfriend/",
		data : data,
		contentType: "application/json",
		dataType : "json",
		success: function(  data     ) {
			$('#formInput').html("");
			$('#formInput').append("<H4 align='center'>Add Friend " + data["username"]  + " sueeccd!</h4>");
			//$("#formInput").append('<h4 align="center"> <a href="#" onclick="toggle_visibility(\'formInput\');resetForm(\'employeeForm\');"><b>EXIT</b> </a> </h4>');
			make_visible('formInput');
			make_hidden('errors');
		},

		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#errors").empty();
			
			if(typeof(XMLHttpRequest.responseJSON)=="undefined"){
				$('#formInput').append("<H4 align='center'>Add Friend sueeccd!</h4>");
				$("#formInput").append('<h4 align="center"> <a href="#" onclick="toggle_visibility(\'formInput\');resetForm(\'employeeForm\');"><b>EXIT</b> </a> </h4>'); 
				make_visible('formInput');
				make_hidden('errors');
			}
			else if (XMLHttpRequest.responseJSON.errorType == "ValidationError") {
				let errorMsg = '<h3> Error(s)!! </h3>';
				errorMsg += "<p>";
				var errorList = XMLHttpRequest.responseJSON.errors;

				$.each(errorList, function(i, error) {
					errorMsg = errorMsg +error.message + '<br>';
				});
				errorMsg += '</p>';
				$("#errors").append(errorMsg);
				make_visible('errors');
				make_hidden('formInput');
				return;
			} else {
				alert(errorObject.responseJSON.errors(0)); // "non" Validation
			}
		}					
	});
}

toggle_visibility = function(id) {
    var element = document.getElementById(id);
    if(element.style.display == 'block')
    	element.style.display = 'none';
    else
    	element.style.display = 'block';
 }	

make_hidden = function(id) {
    var element = document.getElementById(id);
    element.style.display = 'none';
        }	   

make_visible = function(id) {
    var element = document.getElementById(id);
    element.style.display = 'block';
 }	   

resetForm = function(id) {
    var element = document.getElementById(id);
    $(element)[0].reset();

    }	  

// Translate form to array
// Then put in JSON format
 function serializeObject (form)
{
    var jsonObject = {};
    var array = form.serializeArray();
    $.each(array, function() {
         	jsonObject[this.name] = this.value;
    });
    return jsonObject;

};


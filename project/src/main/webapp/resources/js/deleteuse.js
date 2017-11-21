 
function makeAjaxCall(){

	let data=JSON.stringify(serializeObject($("#userForm")));
	alert("Hello");
	$.ajax({
		type : "POST",
		url : "http://localhost:8080/CS545Product/user/addfriend",
		data : data,
		contentType: "application/json",
		dataType : "json",
		success: function(data) {
			$('#formInput').html("");
			$("#formInput").append( '<H3 align="center">Add Friend '+data["username"]+' Succeed! <H3>'); 
			make_visible('formInput');
			make_hidden('errors');
		},

		error: function(XMLHttpRequest, textStatus, errorThrown){
			$("#errors").empty();
			
			if (XMLHttpRequest.responseJSON.errorType == "ValidationError") {
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


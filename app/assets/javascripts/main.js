$(document).ready(function(){
	// Remove row ajax call
	$("table.table").on("click", "i#remove_int_btn", function(event){
		event.preventDefault();
		//store context in variable to use in .done
		var interfaceDiv = $(this)
		var interfaceId = $(this).parent().parent().attr('id');
		var $data = $(this).serialize();
		$.ajax({
			url: "interfaces/" + interfaceId,
			data: $data,
			type: "DELETE"
		}).done(function(response){
			interfaceDiv.closest("tr").remove();
		})
	});
	
	// Add row ajax call
	$("table").on("submit", "form.add_int_form", function(event){
		event.preventDefault();
		var url = "/interfaces";
		var data = $(this).serialize();
		console.log(data)
		$.ajax({
			url: url,
			data: data,
			dataType: "json",
			type: 'POST'
		}).done(function(response) {
			console.log(response.hostname)
			$(".list").append(response)
		})
	})
});
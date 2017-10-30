$(document).ready(function(){
	// Remove row ajax call
	$("table.table").on("click", "i#remove_int_btn", function(event){
		event.preventDefault();
		var interfaceId = $(this).parent().parent().attr('id');
		var $data = $(this).serialize();
		$.ajax({
			url: "interfaces/" + interfaceId,
			data: $data,
			type: "DELETE"
		}).done(function(response){
			console.log("#"+interfaceId);
			console.log(response);
			$("tbody").remove("#"+interfaceId)
		})
	});
	
	// Add row ajax call
	$("form.add_int_form").on("submit", function(event){
		console.log('wtf')
		event.preventDefault();
		var url = "/interfaces";
		var data = $(this).serialize();
		console.log(data)
		$.ajax({
			url: url,
			data: data,
			type: 'POST'
		}).done(function(response) {
			$(".table").closest("tbody").append(response)
		})
	})
});
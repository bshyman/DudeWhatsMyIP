<<<<<<< HEAD
$(document).ready(function(){
		// alert("Here")
	var intElements = document.getElementsByTagName('tr');
// 	console.log(intElements)
// 	intElements.each(function(key, element){
// 		console.log('key ' + key)
// 	})
// 	intElements.class;
// 	var url = "/interfaces/"
// 	$.ajax({
// 	  url: "/interfaces",
// 	  context: document.body
// 	}).done(function() {
// 		console.log("This - " + this)
// 	  $( this ).addClass( "animated zoomOutDown" );
// });

	$('body').on('click', '.delete_row', function(e){
		e.preventDefault();
		$(this).parent().addClass('animated zoomOutDown');
	
	})
=======
 $(document).ready(function(){
	// Remove row ajax call
	$("table.table").on("click", "i#remove_int_btn", function(e){
		var interfaceId = $(this).parent().parent().attr('id');
		var $data = $(this).serialize();
		$.ajax({
			url: "interface/" + interfaceId,
			data: $data,
			method: "delete"
		}).done(function(response){
			
			// console.log(JSON.parse(response);
			console.log(response);
		})
	});
	
	// Add row ajax call
	$("table.table").on("click", ".add_int", function(event){
		event.preventDefault();
		var url = "/interfaces";
		var form = $('form.add_int_form');
		console.log(form)
		var data = $(this)
		$.ajax({
			url: url,
			data: form,
			method: 'POST'
			action: 'create'
		}).done(
			alert(response)
		)
	})


>>>>>>> 037ac543971c9b65f39b8d49339935566455f12e
});
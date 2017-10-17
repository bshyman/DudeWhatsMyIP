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
});
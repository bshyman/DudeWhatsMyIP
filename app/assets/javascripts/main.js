$(document).ready(function(){
		// alert("Here")
	var intElements = document.getElementsByTagName('tr');
	intElements.each(function(key, element){
		console.log('key ' + key)
	})
	intElements.class;
	var url = "/interfaces/"
	$.ajax({
	  url: "/interfaces",
	  context: document.body
	}).done(function() {
		console.log("This - " + this)
	  $( this ).addClass( "animated fadeInY" );
});
});
$(document).ready(function(){
	$('.row-wrap').on('hover', function(){
		alert("Here")
		$(this).css("background-color", "red");
	});

	$("table.table").on("click", ".remove_int_btn", function(e){
		e.preventDefault();

	});
});
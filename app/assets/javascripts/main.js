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
			
			setTimeout(function(){ 
				interfaceDiv.closest("tr").fadeOut(400, function(){
					$(this).remove();

				});

			}

				, 500);

		})
	});
	
	// Add row ajax call
	$("form.add_int_form").on("submit", function(event){
		event.preventDefault();
		var url = "/interfaces";
		var data = $(this).serialize();
		$.ajax({
			url: url,
			data: data,
			type: 'POST'
		}).done(function(response) {
			console.log(response);
		  var options = 
		  	"<tr class=\"trow data-row\" id="+response.id+">" +
					"<th scope=\"row\">"+response.ip+"</th>" +
		  	  "<td>"+response.hostname+"</td>" +
		  	  "<td>"+response.port+"</td>" +
		  	  "<td>"+response.ddns+"</td>" +
		  	  "<td ><i id=\"remove_int_btn\" class=\"fa fa-2x fa-trash\" aria-hidden=\"true\"></i></td>" +
	  	  "</tr>";
			$(".list ").append(options);
		})
	});

	$('table').on('click', 'i#remove_int_btn', function(e){
		$(this).parent().parent().addClass('delete_row');
		$(this).parent().parent().addClass('animated fadeOutDownBig');
		$('.data-row').addClass('animated fadeInUp');
	})

});
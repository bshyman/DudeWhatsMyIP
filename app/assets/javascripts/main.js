$(document).ready(function(){
		// current_user object
		$.get('/current_user_route', function(result){
			return result
		});
		var currentUserId = document.getElementsByTagName('span')[1].getAttribute('cu');



	// Remove row ajax call
	$("table.table").on("click", "i#remove_int_btn", function(event){
		event.preventDefault();

		//store context in variable to use in .done
		var interfaceDiv = $(this)
		var interfaceId = $(this).parent().parent().attr('id');
		var $data = $(this).serialize();
		$.ajax({
			url: "users/" + currentUserId + "/interfaces/" + interfaceId,
			data: $data,
			type: "DELETE"
		}).done(function(response){
			console.log(interfaceDiv.parent().parent())
			$(interfaceDiv).parent().parent().addClass('animated flipOutX');
			$(interfaceDiv).parent().parent().remove();
			interfaceDiv.parent().parent().nextAll('tr').addClass('animated fadeInUp');
		});
			$('tr').removeClass('animated fadeInUp')


			// setTimeout(function(){
			// interfaceDiv.closest("tr").removeClass('animated fadeOutDownBig');
			// console.log(interfaceDiv.nextAll('tr'))


			// , 5000})
	});






	// Add row ajax call
	$("form.add_int_form").on("submit", function(event){
		event.preventDefault();
		var currentUserId = $('span#user_status').attr('current_user');
		console.log(currentUserId)
		var url = "users/" + currentUserId + "/interfaces";
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
			$(".list ").prepend(options);
		})
	});



});
$(document).ready(function(){
	// current_user
	var currentUserId = document.getElementsByTagName('span')[1].getAttribute('cu');
		// $.get('/current_user_route', function(result){
		// 	return result
		// });

	// Remove row ajax call
	$("table.table").on("click", "i#remove_int_btn", function(event){
		event.preventDefault();

		//store context in variable to use in .done
		var interfaceDiv = $(this)
		var interfaceId = $(this).parent().parent().attr('id');
		var $data = $(this).serialize();
		$.ajax({
			// url: "users/" + currentUserId + "/interfaces/" + interfaceId,
			url: interfaceId,
			data: $data,
			type: "DELETE"
		}).done(function(response){
			console.log(interfaceDiv.parent().parent())
			$(interfaceDiv).parent().parent().addClass('animated flipOutX');
			$(interfaceDiv).parent().parent().remove();
			interfaceDiv.parent().parent().nextAll('tr').addClass('animated fadeInUp');
		});
			$('tr').removeClass('animated fadeInUp')
	});

	// Add row ajax call
	$("form.add_int_form").on("submit", function(event){
		event.preventDefault();
		var currentUserId = $('span#user_status').attr('cu');
		// var url = "users/" + currentUserId + "/interfaces";
		var data = $(this).serialize();
		// console.log(url)
		$.ajax({
			type: 'POST',
			// url: "users/" + currentUserId + "/interfaces",
			data: data
		}).done(function(response) {
		  var options =
		  	"<tr class=\"trow data-row\" id="+response.id+">" +
					"<th scope=\"row\">"+response.ip+"</th>" +
		  	  "<td>"+response.hostname+"</td>" +
		  	  "<td>"+response.port+"</td>" +
		  	  "<td>"+response.ddns+"</td>" +
		  	  "<td><button type=\"button\" id=\"details-btn\" data-toggle=\"modal\" data-target=\".bd-example-modal-lg\"><i class=\"fa fa-info-circle\" aria-hidden=\"true\"></i></button></td>"
		  	  +
	  	  "</tr>";
			$(".list ").prepend(options);
		})
	});

	// Spin cog on hover
	$('#cog').on('mouseover', function(){
		$(this).addClass('fa-spin');
		$(this).on('mouseout', function(){
			$(this).removeClass('fa-spin')
		})
	})



});
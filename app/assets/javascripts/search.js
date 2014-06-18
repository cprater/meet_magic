$(function(){

	$('#search').on('submit', function(e){
		e.preventDefault();
		var query = $('#search-input').val();

		$.ajax({
			url: $(this).attr('action'),
			method: 'GET',
			data: {query: query},
			success: function(serverResponse){
				$('.append-users-here').html(serverResponse);
			}
		});
	});



	$('.list-view-link').on('click', function(e){
		e.preventDefault();

		$.ajax({
			url: $(this).attr('href'),
			method: 'GET',
			success: function(serverResponse){
				$('.append-users-here').html(serverResponse);
			}
		});
	});
});
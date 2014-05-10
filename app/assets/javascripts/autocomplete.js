function initializeAutoComplete(){
	var defaultBounds = new google.maps.LatLngBounds(
		new google.maps.LatLng(-90, -180),
		new google.maps.LatLng(90, 180));

	var input = document.getElementById('user_location');

	var searchBox = new google.maps.places.SearchBox(input, {
		bounds: defaultBounds,
		types: ['cities']
	});
}
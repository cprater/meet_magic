function initializeAutoComplete(){
	var defaultBounds = new google.maps.LatLngBounds(
		new google.maps.LatLng(-90, -180),
		new google.maps.LatLng(90, 180));

	var input = findElement();

	var searchBox = new google.maps.places.SearchBox(input, {
		bounds: defaultBounds,
		types: ['cities']
	});
}

function findElement(){
	var element = document.getElementById('user_location');
	if (element === null){
		element = document.getElementById('search-input');
	}

	return element;
}
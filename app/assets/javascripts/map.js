$(function(){

	var map;
	var gmap;
	
	$.ajax({
		url: '/get_current_user_coords',
		method: 'GET',
		success: function(serverResponse){
			var lat = serverResponse.coords.lat;
			var lon = serverResponse.coords.lon;
			gmap = new GMap(lat,lon);
			// getAllUserCoords();
			placeMarker(32.5671309, -97.4165053);
		}
	});
});

function codeAddress(address, geocoder) {
  geocoder.geocode( { 'address': address.to_s}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      console.log(results);
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

function codeAllAddresses(addresses){
	var geocoder = new google.maps.Geocoder();

	for(i=0; i < addresses.length; i++){
		codeAddress(addresses[i], geocoder);
	}

}

function getAllUserCoords(){
	$.ajax({
		url: '/get_all_user_coords',
		method: 'GET',
		success: function(serverResponse){
			codeAllAddresses(serverResponse.points);
		}
	});
}

var placeMarker = function(lat, lon){
	var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lon),
    map: map
  });
};


var placeAllPoints = function(points){
	for(i = 0; i < points.length; i += 2){
		placeMarker(points[i], points[i + 1]);
	}
};


var GMap = function(lat, lon){
	var mapOptions = {
    center: new google.maps.LatLng(lat, lon),
    zoom: 2
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),
    mapOptions);
};










$(function(){

	var map;
	var gmap; 
	
});

function initialize(){
		$.ajax({
		url: '/get_current_user_coords',
		method: 'GET',
		success: function(serverResponse){
			var lat = serverResponse.coords.lat;
			var lng = serverResponse.coords.lng;
			gmap = new GMap(lat,lng);
			getAllUserCoords();
		}
	});
}

function getAllUserCoords(){
	$.ajax({
		url: '/get_all_user_coords',
		method: 'GET',
		success: function(serverResponse){
			placeAllPoints(serverResponse.points);
		}
	});
}

var placeMarker = function(lat, lng){
	var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    map: map
  });
};


var placeAllPoints = function(points){
	for(i = 0; i < points.length; i ++){
		placeMarker(points[i].lat, points[i].lng);
	}
};


var GMap = function(lat, lng){
	var mapOptions = {
    center: new google.maps.LatLng(lat, lng),
    zoom: 8
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),
    mapOptions);
};










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
			test = serverResponse.points;
			placeAllPoints(serverResponse.points);
		}
	});
}

var placeMarker = function(info){
	var marker = new google.maps.Marker({
    position: new google.maps.LatLng(info.lat_lng.lat, info.lat_lng.lng),
    title: info.name,
    map: map
  });
};


var placeAllPoints = function(points){
	for(i = 0; i < points.length; i ++){
		placeMarker(points[i]);
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










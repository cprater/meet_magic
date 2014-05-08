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
			placeMarker(lat, lon);
		}
	});
});

// var getAllUserPoints = function(){
// 	$.ajax({
// 		url: '/get_all_user_coords',
// 		method: 'GET',
// 		async: false,
// 		success: function(serverResponse){
// 			// placeMarker(serverResponse.points[0], serverResponse.points[1]);
// 			console.log(serverResponse.points);
// 			placeAllPoints(serverResponse.points);
// 		}
// 	});
// };



// var placeAllPoints = function(points){
// 	for(i = 0; i < points.length; i += 2){
// 		placeMarker(points[i], points[i + 1]);
// 	}
// };


var GMap = function(lat, lon){

	var mapOptions = {
    center: new google.maps.LatLng(lat, lon),
    zoom: 10
  };

  map = new google.maps.Map(document.getElementById("map-canvas"),
    mapOptions);

};

var placeMarker = function(lat, lon){
	var marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lon),
    map: map
  });
};









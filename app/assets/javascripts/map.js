function initializeMap(){
	var map;
	var gmap;

	$.ajax({
		url: '/get_current_user_coords',
		method: 'GET',
		success: function(serverResponse){
			var lat = serverResponse.coords.lat;
			var lng = serverResponse.coords.lng;
			generateMap(lat,lng);
			getAllUserCoords();
		}
	});

	function generateMap(lat, lng){
		var mapOptions = {
			center: new google.maps.LatLng(lat, lng),
			zoom: 10
		};
		map = new google.maps.Map(document.getElementById("map-canvas"),
			mapOptions);
		}

	function placeMarker(info){
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(info.lat_lng.lat, info.lat_lng.lng),
			title: info.name,
			map: map,
		});
		addInfoWindow(marker, info);
	}

	function placeAllPoints(points){
		for(i = 0; i < points.length; i ++){
			placeMarker(points[i]);
		}
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


	function addInfoWindow(marker, info){
		var infoBox = "<div class='info-box'>" +
			"<h3 class='name'>" + info.name + "</h3>" +
			"<ul class='info-window-stats'>" +
				"<li> level: " + info.level + "</li>" +
				"<li> score: " + info.score + "</li>" +
				"<li> <a href='mailto:" + info.email + "'>Contact</a></li>" +
			"</ul>" +
		"</div>";

		var infoWindow = new google.maps.InfoWindow({
			content: infoBox
		});

		google.maps.event.addListener(marker, 'click', function() {
			infoWindow.open(map,marker);
		});
	}
}
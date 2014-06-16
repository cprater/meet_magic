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

		// create OMS instance
		oms = new OverlappingMarkerSpiderfier(map, {keepSpiderfied: true});
		setupOms(oms);
	}

	function placeMarker(info){
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(info.lat_lng.lat, info.lat_lng.lng),
			title: info.name,
			map: map,
		});

		addInfoWindow(marker, info);

		// add marker to oms
		oms.addMarker(marker);
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
		var infoWindow = null;
		var infoBox = "<div class='info-box'>" +
			"<h3 class='name'>" + info.name + "</h3>" +
			"<ul class='info-window-stats'>" +
			"<li> level: " + info.level + "</li>" +
			"<li> <a href='mailto:" + info.email + "'>Contact</a></li>" +
			"</ul>" +
			"</div>";

		google.maps.event.addListener(marker, 'click', function() {

			if (infoWindow){
				infoWindow.close();
				infoWindow = null;
			}else {
				infoWindow = new google.maps.InfoWindow({
					content: infoBox
				});
				infoWindow.open(map,marker);
			}

			
		});

	}

	function setupOms(oms){
		var iw = new google.maps.InfoWindow();
		oms.addListener('click', function(marker, event){
			// iw.setContent(marker.desc);
			iw.open(map, marker);
		});

	}









}
function initializeMap(){
	var map;

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
		marker = new google.maps.Marker({
			position: new google.maps.LatLng(info.lat_lng.lat, info.lat_lng.lng),
			title: info.name,
			map: map,
			info: info
		});

		addInfoWindow(marker);

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


	function addInfoWindow(marker){
		var infoWindow = null;

		google.maps.event.addListener(marker, 'click', function() {

			var infoBox = "<div class='info-box'>" +
			"<h3 class='name'>" + this.info.name + "</h3>" +
			"<ul class='info-window-stats'>" +
			"<li> level: " + this.info.level + "</li>" +
			"<li> <a href='/user." + this.info.user_id + "'>Contact Page</a></li>" +
			"<li> <a href='mailto:" + this.info.email + "'>Email</a></li>" +
			"</ul>" +
			"</div>";

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
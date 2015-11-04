var app = angular.module('skoolr', []);

function generateMap(address) {
	var geocoder = new google.maps.Geocoder();
	var location;
	geocoder.geocode({'address': address}, function(results, status) {
		location = results[0].geometry.location;
		var mapProp = {
			center: location,
			zoom: 16,
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
		var marker = new google.maps.Marker({
			map: map,
			position: location
		});
	});
}
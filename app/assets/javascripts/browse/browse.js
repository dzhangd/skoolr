app.controller(
	'BrowseCtrl', [
		'$scope',
		function($scope) {
			//variables
			$scope.test = "Hello World! This is the Angular welcome to the Browse page!"
			$scope.SCHOOLS = [];
			$scope.searchResults = $scope.SCHOOLS;
			$scope.searchQuery = "";
			//functions
			$scope.loadSchoolInfo = function(id) {
				$scope.schoolName = $scope.SCHOOLS[id].name;
				$scope.schoolAddress = $scope.SCHOOLS[id].address;
				generateMap($scope.schoolAddress);
			}
			$scope.schoolSearch = function() {
				$scope.searchResults = [];
				var len = $scope.SCHOOLS.length;
				for (var k = 0; k < len; k++) {
					if ($scope.SCHOOLS[k].name.toLowerCase().indexOf($scope.searchQuery) != -1) {
						$scope.searchResults.push($scope.SCHOOLS[k]);
					}
				}
			}
		}
	]
);
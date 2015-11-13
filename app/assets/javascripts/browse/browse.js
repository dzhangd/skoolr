app.controller(
	'BrowseCtrl', [
		'$scope',
		function($scope) {
			//variables
			$scope.test = "Hello World! This is the Angular welcome to the Browse page!"
			$scope.SCHOOLS = [];
			$scope.searchResults = $scope.SCHOOLS;
			$scope.searchQuery = "";
			$scope.GRADES = [];
			//functions
			$scope.loadSchoolInfo = function(id) {
				$scope.schoolId = $scope.SCHOOLS[id].index_id;
				$scope.schoolName = $scope.SCHOOLS[id].name;
				$scope.schoolAddress = $scope.SCHOOLS[id].address;
				$scope.schoolGrades = [];
				var len = $scope.GRADES.length;
				for (var k = 0; k < len; k++) {
					if($scope.GRADES[k].school_id == $scope.schoolId) {
						$scope.schoolGrades.push($scope.GRADES[k]);
						break;
					}
				}
				
				generateMap($scope.schoolAddress);
			}
			$scope.schoolSearch = function() {
				$scope.searchResults = [];
				var len = $scope.SCHOOLS.length;
				for (var k = 0; k < len; k++) {
					if ($scope.SCHOOLS[k].name.toLowerCase().indexOf($scope.searchQuery.toLowerCase()) != -1) {
						$scope.searchResults.push($scope.SCHOOLS[k]);
					}
				}
			}
		}
	]
);

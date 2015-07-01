angular.module('app.exampleApp3', []).controller("ExampleCtrl3", [
  '$scope', function($scope) {


    $scope.participantes = [
        { id: 1, name: 'DV' },
        { id: 2, name: 'IV' },
        { id: 3, name: 'GM' },
        { id: 4, name: 'CJ' }
    ]

  	$scope.entries = [

  	]

  	$scope.fecha = '';

  	$scope.addEntry = function (){
  		$scope.entries.push($scope.newEntry.name);
  		$scope.newEntry = '';
  	};

  } 	

]
)
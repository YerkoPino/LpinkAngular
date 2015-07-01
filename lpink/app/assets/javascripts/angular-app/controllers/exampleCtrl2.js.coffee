angular.module('app.exampleApp2').controller("ExampleCtrl2", [
  '$scope',
  ($scope)->
    console.log 'ExampleCtrl running'

    $scope.exampleValue = "Hello angular and rails"


])
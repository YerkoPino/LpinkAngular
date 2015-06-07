angular.module('app.exampleApp').controller("ExampleCtrl", [
  '$scope',
  ($scope)->
    console.log 'ExampleCtrl running'

    $scope.exampleValue = "Hello angular and rails"

])

angular.module('myModule', ['ui.bootstrap']);
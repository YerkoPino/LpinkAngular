angular.module('principalModule').filter('utc', [function() {
    return function(val) {
        var date = new Date(val);
      return new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(),  date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds());
    }   
  } ]);
angular.module('principalModule').filter('matias', [function() {
    return function(val) {
    	if(val.actum_id == 1)
    		return true;
    	return false;

    }   
  } ]);
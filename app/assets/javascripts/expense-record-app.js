angular.module('ExpenseSystem', ['ngRouter'])
.config([
'$routeProvider,
function($routeProvider) {

  $routeProvider
    .when('users/:id/inventories/new',{
      templateUrl: 'assets/views/inventories.html',
      controller: 'inventoryCtrl'
    }).otherwise({
	  redirectTo: '/user'
    )};
}]);

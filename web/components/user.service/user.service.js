(function() {
    'use strict';
    
    var modules = [];
    angular.module('app.service', modules)
           .service('UserService', UserService);
   
   UserService.$inject=['$http'];
   
   function UserService($http) {
       var service = {
           verifyUser: verifyUser
       };
       
       function verifyUser(onSuccess, onError, user) {
           $http({
               method: 'GET',
               url: 'http://localhost:8080/minisis/api/users',
               data: user
           }).then(onSuccess, onError);
       }
       return service;
   }
})();    



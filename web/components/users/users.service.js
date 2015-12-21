(function(){
    'use strict';
    
    angular.module('app.userService', [])
            .service('UserService', UserService);
    UserService.$inject = ['$http'];
    
    function UserService($http){
        var service = {
            authentify:authentify
        };
        
        function authentify(onSuccess, onError){
            $http({
               method:'POST',
               url:'http://localhost:8080/rapp/api/login',
               data:user
            }).then(onSuccess, onError);
        }
        
        return service;
    } 
})();
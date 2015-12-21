(function(){
    'use strict';
    
    angular.module('app.login', [])
            .controller('LoginController', LoginController);
    
    LoginController.$inject = ['UserService',
                               '$location'];
                           
    function LoginController(UserService, $location){
        var vm = this;
        vm.name;
        vm.password;
        
        vm.logear = function(){
            var user = {
                name: vm.name,
                password:vm.password
            };
            console.log(user.name);
            console.log(user.password);
            //UserService.authentify(onSuccess, onError, user);
        };
        
        function onSuccess(){
            console.log("Usuario autentificado");
            $location.path('/login');
        }
        
        function onError(){
            console.log("Usuario no autentificado");
        }
    }
})();
(function () {
    'use strict';
    angular.module('app.login', []).controller('LoginController', LoginController);

    LoginController.$inject = ['UserService'];
    function LoginController(UserService) {
        var vm = this;
        vm.verify = function () {
            vm.user = [
                
            ];
            UserService.verifyUser(onSuccess, onError, user);
        }

        function onSuccess() {
            
        }

        function onError() {

        }
    }
})();
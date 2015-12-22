(function () {
    'use strict';
    angular.module('app.userLogin', [])
            .controller('UserLoginController', UserLoginController);

    UserLoginController.$inject = ['$routeParams', 'UserService'];

    function UserLoginController($routeParams, UserService) {
        var vm = this;
        vm.userName;
        vm.userPassword;

        vm.verifyUser = function () {
            var user = {
                userName: vm.userName,
                userPassword: vm.userPassword
            };
            UserService.verifyUser(user, onSuccess, onError);
        };
        function onSuccess(data) {
            console.log("User Exist");
            console.log("... " + data.data.userName);
            console.log("... " + data.data.userPassword);
            console.log("... " + data.data.id);
            console.log(data);
        };

        function onError() {
            console.log("User not exist!");
        };
    };
})();
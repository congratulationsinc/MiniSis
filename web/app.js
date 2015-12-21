(function () {
    'use strict';

    var modules = [
        'ngNewRouter',
        'ngResource',
        'app.login',
        'app.userService'
    ];

    angular.module('app', modules)
            .controller('AppController', AppController);

    AppController.$inject = ['$router'];

    function AppController($router) {
        $router.config([
            {
                path: '/', redirectTo: '/login'
            },
            {
                path: '/login', component: 'login'
            }
            
        ]);
    }
})();


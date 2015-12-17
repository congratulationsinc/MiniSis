(function () {
    'use strict';
    var modules = [
        'ngNewRouter',
        'app.login'
    ];
    angular.module('app', modules).controller('AppController', AppController);

    AppController.$inject = ['$router'];
    function AppController($router) {
        $router.config([
            {
                path: '/', redirectionTo: '/login'
            },
            {
                path: '/login', component: 'login'
            }
        ]);

    }
})();



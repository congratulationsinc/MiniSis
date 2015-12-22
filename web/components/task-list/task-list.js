(function () {
    'use strict';

    angular.module('app.task', []).controller('TaskListController', TaskListController);

    TaskListController.$inject = ['UserService'];
    
    function TaskListController(UserService) {
        var vm = this;
        vm.tasks = [];
        
            UserService.getTasks(onSuccess, onError);
        vm.getTasks = function () {
        };

        function onSuccess(data) {
            vm.tasks = data.data;
            console.log("Se recuperaron las tareas");
            console.log(vm.tasks);
        };

        function onError() {
            console.log("Nooo se recuperaron las tareas");
        };
    }
})();



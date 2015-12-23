(function(){
    'use strict';
    angular.module('app.userReportcard',[])
            .controller('UserReportcardController',UserReportcardController);
    UserReportcardController.$inject = ['$routeParams','UserService'];
    
    function UserReportcardController($routeParams, UserService){
        var vm  = this;
        vm.reportcards = [
            
            { name:"Resumen Capitulo 1", score:70},
            {name:"Resumen Capitulo 2", score:50},
            {name:"Resumen Capitulo 3", score:40},
            {name:"Resumen Capitulo 4", score:30},
             { name:"Resumen Capitulo 5", score:20},
            {name:"Resumen Capitulo 6", score:10},
            {name:"Resumen Capitulo 7", score:80},
            {name:"Resumen Capitulo 8", score:90}
        ];
      
       // UserService.getReportcard(onSuccess, onError);
        
        function onSuccess(data){
            vm.reportcards = data.data;
        }
        
        function onError(){
            console.log('error en la respuesta');
        }
        
        
    } 
})();

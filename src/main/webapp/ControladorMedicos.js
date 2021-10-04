/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module('Prueba', []);
app.controller('primerController', function ($scope, $http) {
    $scope.guardarContacto = function () {
        let medicos = {

            proceso: "guardarContacto",
            //id_medico: $scope.id_medico,
            nombre: $scope.nombre,
            apellido: $scope.apellido,
            usuario: $scope.usuario,
            telefono: $scope.num_celular,
            identificacion: $scope.identificacion,
            tipoIdentificacion: $scope.tipoIdentificacion,
            email: $scope.email
        };
        console.log(medicos);
        $http({
            method: 'POST',
            url: 'peticionesMedicos.jsp',
            params: medicos
        }).then(function (respuesta) {
            console.log(respuesta);
            alert('Guardado exitoso');
        });
    }
});

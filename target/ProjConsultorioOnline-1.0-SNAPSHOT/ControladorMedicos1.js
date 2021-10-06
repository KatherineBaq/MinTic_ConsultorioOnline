/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module('prueba', []);
app.controller('primerController', function ($scope, $http) {
    $scope.guardarContacto = function () {
        let regexNumbers = /^[0-9]*$/; // Expresion regular para solo números
        if ($scope.identificacion === undefined || $scope.nombre === undefined) {
            alert('Todos los campos son obligatorios');
        } else if (!regexNumbers.test($scope.identificacion)) {
            alert('La identificacion debe ser un número');
        } else {
            let contacto = {

                proceso: "guardarContacto",
                //id_medico: $scope.id_medico,
                nombre: $scope.nombre,
                apellido: $scope.apellido,
                usuario: $scope.usuario,
                num_celular: $scope.num_celular,
                identificacion: $scope.identificacion,
                tipoIdentificacion: $scope.tipoIdentificacion,
                email: $scope.email
            };
            console.log(contacto);
            $http({
                method: 'POST',
                url: 'peticionesMedicos.jsp',
                params: contacto
            }).then(function (respuesta) {
                console.log(respuesta);
                alert('Guardado exitoso');
                $scope.listarContactos();
            }).catch(function (error) {
                alert('Servicio no disponible, intentelo más tarde');
                console.log(error);
            });
        }
    };

    $scope.listarContactos = function () {
        console.log('Entra listar contactos');
        $scope.mostrarListaContactos = true;
        let params = {
            proceso: 'listarContactos'
        };
        $http({
            method: 'GET',
            url: 'peticionesMedicos.jsp', //automaticamente completa la URL con el nombre del proyecto
            params: params
        }).then(function (respuesta) {
            $scope.contactos = respuesta.data.Contactos;
            console.log(respuesta);
            console.log($scope.contactos);
        }).catch(function (error) {
            alert('Servicio no disponible, intentelo más tarde');
            console.log(error);
        });
    };

    $scope.borrarContacto = function (id_medico) {
        let params = {
            proceso: 'eliminarContacto',
            id_medico: id_medico
        };

        $http({
            method: 'GET', //'DELETE', jsp no permite un delete
            url: 'peticionesMedicos.jsp',
            params: params
        }).then(function (respuesta) {
            console.log(respuesta);
            alert('Borrado exitoso');
            $scope.listarContactos(); //para actualizar el listado de contactos
        }).catch(function (error) {
            alert('Servicio no disponible, intentelo más tarde');
            console.log(error);
        });
    };

    $scope.actualizarContacto = function () {
        let contacto = {
            proceso: "actualizarContacto",
            id_medico: $scope.id_medico,
            identificacion: $scope.identificacion,
            nombre: $scope.nombre,
            apellido: $scope.apellido,
            usuario: $scope.usuario,
            tipoIdentificacion: $scope.tipoIdentificacion,
            num_celular: $scope.num_celular,
            email: $scope.email

        };

        $http({
            method: 'POST',
            url: 'peticionesMedicos.jsp',
            params: contacto
        }).then(function (respuesta) {
            if (respuesta.data.actualizarContacto) {
                alert('Actualización exitosa');
                $scope.listarContactos();
            } else {
                alert('Error al actualizar');
            }
        }).catch(function (error) {
            alert('Servicio no disponible, intentelo más tarde');
            console.log(error);
        });
    };


    $scope.mostrarFormularioMetodo = function () {
        $scope.mostrarListaContactos = false;
        $scope.actualizar = false;
        $scope.identificacion = undefined;
        $scope.nombre = undefined;
        $scope.apellido = undefined;
        $scope.usuario = undefined;
        $scope.tipoIdentificacion = undefined;
        $scope.num_celular = undefined;
        $scope.email = undefined;

    };

    $scope.mostrarFormularioActualizar = function (contacto) {
        $scope.mostrarListaContactos = false;
        $scope.actualizar = true;
        $scope.id_medico = contacto.id_medico;
        $scope.identificacion = contacto.identificacion;
        $scope.nombre = contacto.nombre;
        $scope.apellido = contacto.apellido;
        $scope.usuario = contacto.usuario;
        $scope.tipoIdentificacion = contacto.tipoIdentificacion;
        $scope.num_celular = contacto.num_celular;
        $scope.email = contacto.email;
    };

});

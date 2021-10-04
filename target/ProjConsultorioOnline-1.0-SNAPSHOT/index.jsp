<%-- 
    Document   : index
    Created on : 15-sep-2021, 13:12:23
    Author     : tserrano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contactos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
    </head>
    <body>
        <div class="container-fluid" ng-app="Prueba" ng-controller="primerController">
            <div class="row">
                <div class="col-12" style="text-align: center"><h1>Formulario de Medico</h1></div>
            </div>

            <p>{{identificacion}}</p>
            <div class="row d-flex justify-content-center">
                <div class="col-6">
                    <!--<label for="exampleFormControlInput1" class="form-label">Identificación de medico</label>
                    <input type="text" class="form-control" placeholder="Escriba su identificación" ng-model="id_medico"><br/> -->

                    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
                    <input type="text" class="form-control" placeholder="Escriba su nombre" ng-model="nombre"><br/>

                    <label for="exampleFormControlInput1" class="form-label">Apellido</label>
                    <input type="text" class="form-control" placeholder="Escriba su apellido" ng-model="apellido"><br/>

                    <label for="exampleFormControlInput1" class="form-label">Tipo de identificación</label>
                    <select class="form-select" aria-label="Default select example" ng-model="tipoIdentificacion">
                        <option selected>CC</option>
                        <option>TI</option>
                    </select><br/>

                    <label for="exampleFormControlInput1" class="form-label">Número de Identificacion</label> 
                    <input type="text" class="form-control" placeholder="Escriba su identificación" ng-model="identificacion"><br/> 


                    <label for="exampleFormControlInput1" class="form-label">Usuario</label>
                    <input type="text" class="form-control" placeholder="Escriba su nombre de usuario" ng-model="usuario"><br/>
                    <!--<select class="form-select" aria-label="Default select example" ng-model="usuario">
                        <option selected>Medico</option>
                        <option>Paciente</option>
                    </select><br/> -->

                    <label for="exampleFormControlInput1" class="form-label">Telefono</label>
                    <input type="text" class="form-control" placeholder="Escriba su telefono" ng-model="num_celular"><br>

                    <label for="exampleFormControlInput1" class="form-label">Correo</label>
                    <input type="email" class="form-control" placeholder="Escriba su correo" ng-model="email"><br/>

                    <button type="button" class="btn btn-success" ng-click="guardarContacto()">Guardar</button>
                </div>
            </div>
        </div>
    </body>
    <script src="ControladorMedicos.js"></script>
<!--    <script>
        var app = angular.module('Prueba', []);
        app.controller('primerController', function ($scope, $http) {
            $scope.guardarContacto = function () {
                let medicos = {

                    proceso: "guardarContacto",
                    id_medico: $scope.id_medico,
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

    </script>   -->
</html>
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
        <!Bootstrap>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <!Bootstrap>
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>

    </head>
<body>
    <div ng-app="prueba" ng-controller="primerController">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" ng-click="mostrarFormularioMetodo()">Guardar Medico</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" ng-click="listarContactos()">Listar Medicos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid" ng-show="!mostrarListaContactos">
            <div class="row">
                <div class="col-12" style="text-align: center" ng-show="!actualizar"><h1>Formulario de Medico</h1></div>
                <div class="col-12" style="text-align: center" ng-show="actualizar"><h1>Actualizar Medico</h1></div>                    
            </div>

            <div class="row d-flex justify-content-center">
                <div class="col-6">
                    <!--<label for="exampleFormControlInput1" class="form-label">Identificación de medico</label>
                    <input type="text" class="form-control" placeholder="Escriba su identificación" ng-model="id_medico"><br/> -->

                    <label for="exampleFormControlInput1" class="form-label">Número de Identificacion</label> 
                    <input type="text" class="form-control" placeholder="Escriba su identificación" ng-model="identificacion" ng-disabled="actualizar"><br/> 


                    <label for="exampleFormControlInput1" class="form-label">Nombre</label>
                    <input type="text" class="form-control" placeholder="Escriba su nombre" ng-model="nombre"><br/>

                    <label for="exampleFormControlInput1" class="form-label">Apellido</label>
                    <input type="text" class="form-control" placeholder="Escriba su apellido" ng-model="apellido"><br/>

                    <label for="exampleFormControlInput1" class="form-label">Tipo de identificación</label>
                    <select class="form-select" aria-label="Default select example" ng-model="tipoIdentificacion">
                        <option selected>CC</option>
                        <option>TI</option>
                    </select><br/>

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

                    <button type="button" class="btn btn-success" ng-click="guardarContacto()" ng-show="!actualizar" > Guardar</button>
                    <button type="button" class="btn btn-success" ng-click="actualizarContacto()" ng-show="actualizar" >Actualizar</button>
                </div>
            </div>
        </div>
        <div class="container-fluid" ng-show="mostrarListaContactos">
            <div class="row">
                <div class="col-12" style="text-align: center"><h1>Lista de Medicos</h1></div>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Identificación</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Usuario</th>
                        <th scope="col">Tipo Id</th>
                        <th scope="col">Numero celular</th>
                        <th scope="col">Email</th>
                        <th scope="col">Actualizar</th>
                        <th scope="col">Borrar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="contacto in contactos">
                        <th scope="row">{{contacto.identificacion}}</th>
                        <td>{{contacto.nombre}}</td>
                        <td>{{contacto.apellido}}</td>
                        <td>{{contacto.usuario}}</td>
                        <td>{{contacto.tipoIdentificacion}}</td>
                        <td>{{contacto.num_celular}}</td>
                        <td>{{contacto.email}}</td>
                        <td style="cursor: pointer" ng-click="mostrarFormularioActualizar(contacto)">Actualizar</td>
                        <td style="cursor: pointer" ng-click="borrarContacto(contacto.id_medico)">Borrar</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
<!--<script src="ControladorMedicos.js"></script>-->
<script>

    var app = angular.module('Prueba', []);
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

</script>
</html>
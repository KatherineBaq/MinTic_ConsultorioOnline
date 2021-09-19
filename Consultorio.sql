show databases; 
create database Consultorio; 
use Consultorio;  

Create table medicos(

 id_medico int primary key not null,
 nombre varchar(30), 
 apellido varchar(30),
 cedula varchar(30), 
 usuario varchar(30), 
 num_celular varchar(30)

);  

Create Table paciente( 
 id_paciente int primary key not null,  
 nombre varchar(30), 
 apellido varchar(30), 
 email varchar(30), 
 eps varchar(30), 
 num_celular varchar(30) 
 
); 

Create Table cita_medica( 

  id_cita_medica int primary key not null, 
  id_medico int not null, 
  id_paciente int not null,
  fecha date not null,
  hora time not null, 
  observaciones varchar(30), 
  foreign key (id_medico) references medicos(id_medico),
  foreign key (id_paciente) references paciente(id_paciente)
  
); 

Create Table medicamento( 
 id_medicamento int primary key not null, 
 nombre varchar(30), 
 presentacion varchar(30)
); 

Create Table paciente_medicamento(
 
 id_paciente int not null, 
 id_medicamento int not null, 
 dosis varchar(30) not null, 
 observaciones varchar(30) not null, 
 foreign key (id_paciente) references paciente(id_paciente), 
 foreign key (id_medicamento) references medicamento(id_medicamento)
 
); 



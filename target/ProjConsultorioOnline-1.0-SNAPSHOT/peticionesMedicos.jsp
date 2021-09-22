<%-- 
    Document   : peticionesMedicos
    Created on : Sep 22, 2021, 9:22:30 PM
    Author     : apigr
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.Medicos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
String respuesta = "";
String proceso = request.getParameter("proceso"); //request HTTP 
//a los request se les puede pasar parámetros
//se va a validar el tipo de proceso
Medicos c = new Medicos(); //se piden los parámetros del contacto que se quiere guardar
switch(proceso){
    case "guardarContacto":
        
        //id_medico nombre apellido identificacion usuario num_celular email tipoIdentificacion 
        System.out.println("Guardar Contacto");
        c.setId_Medico(Integer.parseInt(request.getParameter("id_medico"))); //a este hay que convertirlo de entero a string
        c.setNombre(request.getParameter("nombre"));
        c.setApellido(request.getParameter("apellido"));
        c.setIdentificacion(request.getParameter("identificacion"));
        c.setTipoIdentificacion(request.getParameter("tipoIdentificacion"));
        c.setUsuario(request.getParameter("usuario"));
        c.setNum_celular(request.getParameter("num_celular"));
        c.setEmail(request.getParameter("email"));

        if(c.guardarContacto()){
            //si guarda bien el contacto, se concatena otros datos para el json
            respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
        } else{
            respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
        }

        break;
        
    case "actualizarContacto":
        
        System.out.println("Actualizar Contacto");
        c.setId_Medico(Integer.parseInt(request.getParameter("id_medico"))); //a este hay que convertirlo de entero a string
        c.setNombre(request.getParameter("nombre"));
        c.setApellido(request.getParameter("apellido"));
        c.setIdentificacion(request.getParameter("identificacion"));
        c.setTipoIdentificacion(request.getParameter("tipoIdentificacion"));
        c.setUsuario(request.getParameter("usuario"));
        c.setNum_celular(request.getParameter("num_celular"));
        c.setEmail(request.getParameter("email"));

        if(c.actualizarContacto()){
            //si guarda bien el contacto, se concatena otros datos para el json
            respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
        } else{
            respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
        }


        
        break;
    case "eliminarContacto":
        System.out.println("Eliminar contacto");
        int id_medico = Integer.parseInt(request.getParameter("id_medico"));
        if(c.borrarContacto(id_medico)){
         respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
        } else{
            respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
        }
        
        break;
    case "listarContactos":
        System.out.println("Listar Contactos");
        List<Medicos> listaContactos = c.listarContactos();
        if(listaContactos.isEmpty()){
            respuesta += "\"" + proceso + "\": true,\"Contactos\":[]"; //genera una lista vacía en el json
        } else{
            respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(listaContactos); //guarda la lista en el json
        }
        
        break;
    case "listarUnContacto":
        System.out.println("Listar un Contacto");
        int id_med = Integer.parseInt(request.getParameter("id_medico"));
        Medicos listaContacto = c.obtenerContacto(id_med);
        if(listaContacto !=null){
            respuesta += "\"" + proceso + "\": true,\"Contactos\":" + new Gson().toJson(listaContacto); //guarda la lista en el json
            
        } else{
            respuesta += "\"" + proceso + "\": true,\"Contactos\":[]"; //genera una lista vacía en el json
        }
        break;
        
    default:
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";

        
}

            // cierra la respuesta
respuesta += "}";
response.setContentType("application/json;charset=iso-8859-1");
out.print(respuesta);
        

%>


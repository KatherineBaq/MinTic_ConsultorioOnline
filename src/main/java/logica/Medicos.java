/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author apigr
 */
public class Medicos {
    
    private int id_medico;
    private String nombre;
    private String apellido;
    private String identificacion;
    private String usuario;
    private String num_celular;
    private String email;
    private String tipoIdentificacion;

    public Medicos() {
    }

    public int getId_Medico() {
        return id_medico;
    }
    
    public void setId_Medico(int id_medico) {
        this.id_medico = id_medico;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNum_celular() {
        return num_celular;
    }

    public void setNum_celular(String num_celular) {
        this.num_celular = num_celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public void setTipoIdentificacion(String tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    //metodos para el CRUD de Medicos
    public boolean guardarContacto() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO medicos(nombre, apellido, identificacion, tipoIdentificacion, usuario, num_celular, email)"
                + " VALUES ( '" + this.nombre + "',"
                + "'" + this.apellido + "','" + this.identificacion + "','" + this.tipoIdentificacion + "',"
                + "'" + this.usuario + "','" + this.num_celular + "','" + this.email + "');  ";

        //id_medico nombre apellido identificacion usuario num_celular email tipoIdentificacion 

//Vamos a configurar el setAutocommit de la conexionBD a falso
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sentencia)) {
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else { //si no logro insertar en la BD
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }

    }

    public boolean borrarContacto(int id_medico) {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE FROM medicos WHERE id_medico = '" + id_medico + "'";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.borrarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }

    }

    public boolean actualizarContacto() {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE `medicos` SET nombre ='" + this.nombre + "',apellido='" + this.apellido + "',identificacion='" + this.identificacion
                + "',tipoIdentificacion='" + this.tipoIdentificacion + "',usuario='" + this.usuario + "',num_celular='" + this.num_celular + "',email='" + this.email
                +  "' WHERE id_medico=" + this.id_medico + ";";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
           
        } else{
            conexion.closeConnection();
            return false;
        }

    }

    public List<Medicos> listarContactos() throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM medicos ORDER BY id_medico ASC;";
        List<Medicos> listaContactos = new ArrayList<>();
        ResultSet datos = conexion.consultarBD(sentencia);
        
        Medicos contacto;
        while (datos.next()) {
            contacto = new Medicos();
            
            //id_medico nombre apellido identificacion usuario num_celular email tipoIdentificacion 
            
            contacto.setId_Medico(datos.getInt("id_medico"));
            contacto.setNombre(datos.getString("nombre"));
            contacto.setApellido(datos.getString("apellido"));
            contacto.setIdentificacion(datos.getString("identificacion"));
            contacto.setUsuario(datos.getString("usuario"));
            contacto.setNum_celular(datos.getString("num_celular"));
            contacto.setEmail(datos.getString("email"));
            contacto.setTipoIdentificacion(datos.getString("tipoIdentificacion"));
            
            listaContactos.add(contacto);
            
        }
        conexion.closeConnection();
        return listaContactos;

    }

    public Medicos obtenerContacto(int id_medico) throws SQLException {
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM medicos WHERE id_medico = '" + id_medico  + "';";
        ResultSet datos = conexion.consultarBD(sentencia);
        if(datos.next()){
            Medicos contacto = new Medicos();
            contacto.setId_Medico(datos.getInt("id_medico"));
            contacto.setNombre(datos.getString("nombre"));
            contacto.setApellido(datos.getString("apellido"));
            contacto.setIdentificacion(datos.getString("identificacion"));
            contacto.setUsuario(datos.getString("usuario"));
            contacto.setNum_celular(datos.getString("num_celular"));
            contacto.setEmail(datos.getString("email"));
            contacto.setTipoIdentificacion(datos.getString("tipoIdentificacion"));
            return contacto;
        } else{
            conexion.closeConnection();
            return null; //no había contacto
        }
    

        
    }
}

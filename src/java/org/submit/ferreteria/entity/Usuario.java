/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.submit.ferreteria.entity;

/**
 *
 * @author hikaru
 */
public class Usuario {
        int id_usuario;
        String usuario;
        String contrasenia;
        int id_privilegio;
        String privilegio_nombre; // Solo como auxiliar
        
    public Usuario() {
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }
    
    
    public int getId_privilegio() {
        return id_privilegio;
    }

    public void setId_privilegio(int id_privilegio) {
        this.id_privilegio = id_privilegio;
    }

    public String getPrivilegio_nombre() {
        return privilegio_nombre;
    }

    public void setPrivilegio_nombre(String privilegio_nombre) {
        this.privilegio_nombre = privilegio_nombre;
    }
        
}

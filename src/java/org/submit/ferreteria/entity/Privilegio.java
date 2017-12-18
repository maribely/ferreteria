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
public class Privilegio {
    int id_privilegio;
    String nombre;

    public Privilegio() {
    }

    public int getId_privilegio() {
        return id_privilegio;
    }

    public void setId_privilegio(int id_privilegio) {
        this.id_privilegio = id_privilegio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}

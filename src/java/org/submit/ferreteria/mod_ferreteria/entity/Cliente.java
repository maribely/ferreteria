/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.submit.ferreteria.mod_ferreteria.entity;

/**
 *
 * @author SISTEMAS
 */
public class Cliente {
    int id_cliente;
    String nombre;
    String apellido;
    String sexo;
    int dni;
    int telefono;
    String ruc;
    String e_mail;
    String direccion;
    
    public Cliente(){
        id_cliente=0;
        nombre="";
        apellido="";
        sexo="";
        dni=0;
        telefono=0;
        ruc="";
        e_mail="";
        direccion="";
    }
    public int getId_cliente(){
        return id_cliente;
    }
    public void setId_cliente(int id_cliente){
        this.id_cliente=id_cliente;
    }
    public String getNombre(){
        return nombre;
            }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public String getApellido(){
        return apellido;
    }
    public void setApellido(String apellido){
        this.apellido=apellido;
    }
    public String getSexo(){
        return sexo;
            }
    public void setSexo(String sexo){
        this.sexo=sexo;
    }
    public int getDni(){
        return dni;
    }
    public void setDni(int dni){
        this.dni=dni;
    }
    public int getTelefono(){
        return telefono;
            }
    public void setTelefono(int telefono){
        this.telefono=telefono;
    }
    public String getRuc(){
        return ruc;
    }
    public void setRuc(String ruc){
        this.ruc=ruc;
    }
    public String getE_mail(){
        return e_mail;
    }
    public void setE_mail(String e_mail){
        this.e_mail=e_mail;
    }
    public String getDireccion(){
        return direccion;
    }
    public void setDireccion(String direccion){
        this.direccion=direccion;
    }
          
}

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
public class Categoria {
    int id_categ;
    String nombre;
    String descripcion;
 
    
    public Categoria(){
id_categ=0;
nombre="";
descripcion="";
}


public int getId_categ(){
return id_categ;
}
public void setId_categ(int id_categ){
    this.id_categ=id_categ;
}

public String getNombre(){
    return nombre;
}
public void setNombre(String nombre){
  this.nombre=nombre; 
}

public String getDescripcion(){
    return descripcion;
}
public void setDescripcion(String descripcion){
    this.descripcion=descripcion;
}
























}
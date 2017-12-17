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
public class Proveedor {
    int id_prov;
  String  nombre;
  String direccion;
  String ruc;
  int id_categ;

public Proveedor(){
     id_prov=0;
     nombre="";
     direccion="";
     ruc="";
     id_categ=0;
      
}
public int getId_prov(){
     return id_prov;
 }
 public void setId_prov(int id_prov){
     this.id_prov=id_prov;
 }
public String getNombre(){
     return nombre;
      }
 public void setNombre(String nombre){
     this.nombre=nombre;
      }
 public String getDireccion(){
     return direccion;
      }
 public void setDireccion(String direccion){
     this.direccion=direccion;
      }
  public String getRuc(){
     return ruc;
      }
 public void setRuc(String ruc){
     this.ruc=ruc;
      }
 public int getId_categ(){
     return id_categ;
 }
 public void setId_categ(int id_categ){
     this.id_categ=id_categ;
 }
}
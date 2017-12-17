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
public class Producto {
  int id_producto;
  String descripcion;
  String precio;
  String stok;
  int id_prov;

public Producto(){
     id_producto=0;
     descripcion="";
     precio="";
     stok="";
     id_prov=0;
     
}
public int getId_producto(){
     return id_producto;
 }
 public void setId_producto(int id_producto){
     this.id_producto=id_producto;
 }
 public String getDescripcion(){
     return descripcion;
      }
 public void setDescripcion(String descripcion){
     this.descripcion=descripcion;
      }
 public String getPrecio(){
     return precio;
      }
 public void setPrecio(String precio){
     this.precio=precio;
      }
 public String getStok(){
     return stok;
      }
 public void setStok(String stok){
     this.stok=stok;
      }
 public int getId_prov(){
     return id_prov;
 }
 public void setId_prov(int id_prov){
     this.id_prov=id_prov;
 }

}
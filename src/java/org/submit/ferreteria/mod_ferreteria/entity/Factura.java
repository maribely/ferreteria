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
public class Factura {
    
    int numero_factura;
    String  codigo_client;
    String ruc_client;
    String sub_total;
    String igv;
    String total;
    String fecha;
    int numero_det;
    int id_cliente;
    int usuario_id;

    public Factura(){
        codigo_client="";
        ruc_client="";
        sub_total="";
        igv="";
        total="";
        numero_det=0;
        id_cliente=0;
        usuario_id=0;
    }

    public int getNumero_factura() {
        return numero_factura;
    }

    public void setNumero_factura(int numero_factura) {
        this.numero_factura = numero_factura;
    }

    public String getCodigo_client() {
        return codigo_client;
    }

    public void setCodigo_client(String codigo_client) {
        this.codigo_client = codigo_client;
    }

    public String getRuc_client() {
        return ruc_client;
    }

    public void setRuc_client(String ruc_client) {
        this.ruc_client = ruc_client;
    }

    public String getSub_total() {
        return sub_total;
    }

    public void setSub_total(String sub_total) {
        this.sub_total = sub_total;
    }

    public String getIgv() {
        return igv;
    }

    public void setIgv(String igv) {
        this.igv = igv;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getNumero_det() {
        return numero_det;
    }

    public void setNumero_det(int numero_det) {
        this.numero_det = numero_det;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

}

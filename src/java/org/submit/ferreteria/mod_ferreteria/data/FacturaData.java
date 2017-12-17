/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.submit.ferreteria.mod_ferreteria.data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List; 
import org.submit.ferreteria.common.data.*;
import org.submit.ferreteria.mod_ferreteria.entity.Factura;
/**
/**
 *
 * @author SISTEMAS
 */
public class FacturaData {
    
    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Factura> listByFilter(String filter) throws GlobalException { //select convert(varchar, getdate(), 103) 
        List<Factura> lis = new ArrayList<Factura>();
        try {
            qry = "select numero_factura, codigo_client, ruc_client, sub_total,igv,total,fecha,numero_det,id_cliente,usuario_id from factura where  upper(codigo_client) like upper(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Factura d = new Factura();
                d.setNumero_factura(rs.getInt("numero_factura"));
                d.setCodigo_client(rs.getString("codigo_client"));
                d.setRuc_client(rs.getString("ruc_client"));
                d.setSub_total(rs.getString("sub_total"));
                d.setIgv(rs.getString("igv"));
              //  
                d.setTotal(rs.getString("total"));
                d.setFecha(rs.getString("fecha"));
           d.setNumero_det(rs.getInt("numero_det"));
           d.setId_cliente(rs.getInt("id_cliente"));
            d.setUsuario_id(rs.getInt("usuario_id"));
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("FacturaData.listByFilter " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }

    public Factura findByPk(int id) throws GlobalException {
        Factura d = new Factura();
        try {
            qry = "select numero_factura, codigo_client, ruc_client, sub_total,igv,total,fecha,numero_det,id_cliente,usuario_id from factura where  numero_factura=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setNumero_factura(rs.getInt("numero_factura"));
                d.setCodigo_client(rs.getString("codigo_client"));
              d.setRuc_client(rs.getString("ruc_client"));
                d.setSub_total(rs.getString("sub_total"));
                 d.setIgv(rs.getString("igv"));
                 d.setTotal(rs.getString("total"));
                   d.setFecha(rs.getString("fecha"));
                d.setNumero_det(rs.getInt("numero_det"));
                d.setId_cliente(rs.getInt("id_cliente"));
                 d.setUsuario_id(rs.getInt("usuario_id"));
               
              
            }
        } catch (Exception e) {
            throw new GlobalException("FacturaData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int update(Factura dato) throws GlobalException {
        int r = 0;
        System.out.println("nob:"+dato.getCodigo_client());
        try {
            int i = 0;
            qry = " update factura set "
                    + " codigo_client=?, ruc_client=?, sub_total=?, igv=?,  "
                    + " total=?, fecha=?, numero_det=?, id_cliente=?, usuario_id=? "
                    + " where numero_factura=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, dato.getCodigo_client());
            ps.setString(++i, dato.getRuc_client());
             ps.setString(++i, dato.getSub_total());
              ps.setString(++i, dato.getIgv());
               ps.setString(++i, dato.getTotal());
               ps.setString(++i, dato.getFecha()); 
            ps.setInt(++i, dato.getNumero_det());
            ps.setInt(++i, dato.getId_cliente());
            ps.setInt(++i, dato.getUsuario_id());
            ps.setInt(++i, dato.getNumero_factura());
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("FacturaData.update " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int create(Factura nuevo) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            Connection conn = tran.getConnection();
            conn.setAutoCommit(false);

            PreparedStatement ps;
            ResultSet rs;
            qry = " select coalesce(max(numero_factura)+1,'1') as new_id from factura ";
            ps = conn.prepareStatement(qry);
            rs = ps.executeQuery();
            if (rs.next()) {
                nuevo.setId_cliente(rs.getInt("new_id"));
            }
            qry = " insert into factura(codigo_client, ruc_client, sub_total,igv,total,fecha,usuario_id)"
                    + " values(?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(qry);
            ps.setString(++i, nuevo.getCodigo_client());
            ps.setString(++i, nuevo.getRuc_client());
            ps.setString(++i, nuevo.getSub_total());
            ps.setString(++i, nuevo.getIgv());
            ps.setString(++i, nuevo.getTotal());
            ps.setString(++i, nuevo.getFecha());
//            ps.setInt(++i, nuevo.getNumero_det());
//            ps.setInt(++i, nuevo.getId_cliente());
            ps.setInt(++i, nuevo.getUsuario_id());
            
           
            //ps.setString(++i, nuevo.getFecha_create() );
            r = ps.executeUpdate();

            conn.commit();
            conn.close();
        } catch (Exception e) {
            throw new GlobalException("FacturaData.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " delete from factura where numero_factura=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("FacturaData.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public List<Factura> listByLocality(String codigo_client) throws GlobalException { //select convert(varchar, getdate(), 103)
        List<Factura> lis = new ArrayList<Factura>();
        try {
            qry = "select numero_factura, codigo_client, ruc_client, sub_total,igv,total,fecha,numero_det,id_cliente,usuario_id from factura where  upper(codigo_client) like upper(?) order by codigo_client, ruc_client ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, codigo_client + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Factura d = new Factura();
                d.setNumero_factura(rs.getInt("numero_factura"));
                d.setCodigo_client(rs.getString("codigo_client"));
                d.setRuc_client(rs.getString("ruc_client"));
                d.setSub_total(rs.getString("sub_total"));
                d.setIgv(rs.getString("igv"));
                d.setTotal(rs.getString("total"));
                d.setFecha(rs.getString("fecha"));
                d.setNumero_det(rs.getInt("numero_det"));
                d.setId_cliente(rs.getInt("id_cliente"));
                d.setUsuario_id(rs.getInt("usuario_id"));
         
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("FacturaData.listByLocality " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }
    
}

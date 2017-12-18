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
import org.submit.ferreteria.entity.Producto;


/**
 *
 * @author SISTEMAS
 */
public class ProductoData {
   
    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Producto> listByFilter(String filter) throws GlobalException { //select convert(varchar, getdate(), 103) 
        List<Producto> lis = new ArrayList<Producto>();
        try {
            qry = "select id_producto, descripcion, precio, stok, id_prov  from producto where  upper(descripcion) like upper(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto d = new Producto();
                d.setId_producto(rs.getInt("id_producto"));
                d.setDescripcion(rs.getString("descripcion"));
                d.setPrecio(rs.getString("precio"));
                d.setStok(rs.getString("stok"));
                d.setId_prov(rs.getInt("id_prov"));
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("ProductoData.listByFilter " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }

    public Producto findByPk(int id) throws GlobalException {
        Producto d = new Producto();
        try {
            qry = "select id_producto, descripcion, precio, stok, id_prov  from producto where  id_producto=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_producto(rs.getInt("id_producto"));
                d.setDescripcion(rs.getString("descripcion"));
                d.setPrecio(rs.getString("precio"));
                d.setStok(rs.getString("stok"));
                d.setId_prov(rs.getInt("id_prov"));
                }
        } catch (Exception e) {
            throw new GlobalException("ProductoData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int update(Producto dato) throws GlobalException {
        int r = 0;
        System.out.println("nob:"+dato.getDescripcion());
        try {
            int i = 0;
            qry = " update producto set "
                    + " descripcion=?, precio=?, "
                    + " stok=?, id_prov=? "
                    + " where id_producto=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, dato.getDescripcion());
            ps.setString(++i, dato.getPrecio());
            ps.setString(++i, dato.getStok());
            ps.setInt(++i, dato.getId_prov());
            ps.setInt(++i, dato.getId_producto());
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("ProductoData.update " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int create(Producto nuevo) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            Connection conn = tran.getConnection();
            conn.setAutoCommit(false);

            PreparedStatement ps;
            ResultSet rs;
            qry = " select coalesce(max(id_producto)+1,'1') as new_id from producto ";
            ps = conn.prepareStatement(qry);
            rs = ps.executeQuery();
            if (rs.next()) {
                nuevo.setId_producto(rs.getInt("new_id"));
            }
            qry = " insert into producto(id_producto, descripcion, precio, stok, id_prov)"
                    + " values(?,?,?,?,?)";
            ps = conn.prepareStatement(qry);
            ps.setInt(++i, nuevo.getId_producto());
            ps.setString(++i, nuevo.getDescripcion());
            ps.setString(++i, nuevo.getPrecio());
            ps.setString(++i, nuevo.getStok());
            ps.setInt(++i, nuevo.getId_prov());
            //ps.setString(++i, nuevo.getFecha_create() );
            r = ps.executeUpdate();

            conn.commit();
            conn.close();
        } catch (Exception e) {
            throw new GlobalException("ProductoData.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " delete from producto where id_producto=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("ProductoData.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    
    public List<Producto> listByLocality(String descripcion) throws GlobalException { //select convert(varchar, getdate(), 103)
        List<Producto> lis = new ArrayList<Producto>();
        try {
            qry = "select id_producto, descripcion, precio, stok, id_prov  from producto where  upper(descripcion) like upper(?) order by descripcion, precio ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, descripcion + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto d = new Producto();
                d.setId_producto(rs.getInt("id_producto"));
                d.setDescripcion(rs.getString("descripcion"));
                d.setPrecio(rs.getString("precio"));
                d.setStok(rs.getString("stok"));
                d.setId_prov(rs.getInt("id_prov"));
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("ProductoData.listByLocality " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }
    
    
}

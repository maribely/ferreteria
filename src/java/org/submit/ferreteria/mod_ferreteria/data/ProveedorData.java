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
import org.submit.ferreteria.entity.Proveedor;
/**
 *
 * @author SISTEMAS
 */
public class ProveedorData {
    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Proveedor> listByFilter(String filter) throws GlobalException { //select convert(varchar, getdate(), 103) 
        List<Proveedor> lis = new ArrayList<Proveedor>();
        try {
            qry = "select id_prov, nombre, direccion, ruc, id_categ  from proveedor where  upper(nombre) like upper(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor d = new Proveedor();
                d.setId_prov(rs.getInt("id_prov"));
                d.setNombre(rs.getString("nombre"));
                d.setDireccion(rs.getString("direccion"));
                d.setRuc(rs.getString("ruc"));
                d.setId_categ(rs.getInt("id_categ"));
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("ProveedorData.listByFilter " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }

    public Proveedor findByPk(int id) throws GlobalException {
        Proveedor d = new Proveedor();
        try {
            qry = "select id_prov, nombre, direccion, ruc, id_categ from proveedor where  id_prov=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_prov(rs.getInt("id_prov"));
                d.setNombre(rs.getString("nombre"));
                d.setDireccion(rs.getString("direccion"));
                d.setRuc(rs.getString("ruc"));
                d.setId_categ(rs.getInt("id_categ"));
                }
        } catch (Exception e) {
            throw new GlobalException("ProveedorData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int update(Proveedor dato) throws GlobalException {
        int r = 0;
        System.out.println("nob:"+dato.getNombre());
        try {
            int i = 0;
            qry = " update proveedor set "
                    + " nombre=?, direccion=?, "
                    + " ruc=?, id_categ=? "
                    + " where id_prov=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, dato.getNombre());
            ps.setString(++i, dato.getDireccion());
            ps.setString(++i, dato.getRuc());
            ps.setInt(++i, dato.getId_categ());
             ps.setInt(++i, dato.getId_prov());
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("ProveedorData.update " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int create(Proveedor nuevo) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            Connection conn = tran.getConnection();
            conn.setAutoCommit(false);

            PreparedStatement ps;
            ResultSet rs;
            qry = " select coalesce(max(id_prov)+1,'1') as new_id from proveedor ";
            ps = conn.prepareStatement(qry);
            rs = ps.executeQuery();
            if (rs.next()) {
                nuevo.setId_prov(rs.getInt("new_id"));
            }
            qry = " insert into proveedor(id_prov, nombre, direccion, ruc, id_categ)"
                    + " values(?,?,?,?,?)";
            ps = conn.prepareStatement(qry);
            ps.setInt(++i, nuevo.getId_prov());
            ps.setString(++i, nuevo.getNombre());
            ps.setString(++i, nuevo.getDireccion());
            ps.setString(++i, nuevo.getRuc());
            ps.setInt(++i, nuevo.getId_categ());
            //ps.setString(++i, nuevo.getFecha_create() );
            r = ps.executeUpdate();

            conn.commit();
            conn.close();
        } catch (Exception e) {
            throw new GlobalException("ProveedorData.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " delete from proveedor where id_prov=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("ProveedorData.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    
    public List<Proveedor> listByLocality(String nombre) throws GlobalException { //select convert(varchar, getdate(), 103)
        List<Proveedor> lis = new ArrayList<Proveedor>();
        try {
            qry = "select id_prov, nombre, direccion, ruc, id_categ  from proveedor where  upper(nombre) like upper(?) order by nombre, direccion ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, nombre + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor d = new Proveedor();
                d.setId_prov(rs.getInt("id_prov"));
                d.setNombre(rs.getString("nombre"));
                d.setDireccion(rs.getString("direccion"));
                d.setRuc(rs.getString("ruc"));
                d.setId_categ(rs.getInt("id_categ"));
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("ProveedorData.listByLocality " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }
}

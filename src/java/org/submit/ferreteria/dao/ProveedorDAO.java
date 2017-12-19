/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.submit.ferreteria.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.submit.ferreteria.common.data.ConnectDB;
import org.submit.ferreteria.common.data.GlobalException;
import org.submit.ferreteria.entity.Proveedor;

/**
 *
 * @author hikaru
 */
public class ProveedorDAO {
     ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Proveedor> list(String ruc) throws GlobalException { //select convert(varchar, getdate(), 103) 
        List<Proveedor> lis = new ArrayList<>();
        try {
            qry = "SELECT  * FROM proveedor WHERE  UPPER(ruc) LIKE UPPER(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, ruc + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor d = new Proveedor();
                d.setId_proveedor(rs.getInt("id_proveedor"));
                d.setRazon_social(rs.getString("razon_social"));
                d.setRuc(rs.getString("ruc"));
                d.setDireccion(rs.getString("direccion"));
                lis.add(d);
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProveedorDAO.list" + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }

    public Proveedor findByPk(int id) throws GlobalException {
        Proveedor d = new Proveedor();
        try {
            qry = "SELECT * FROM proveedor WHERE id_proveedor = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_proveedor(rs.getInt("id_proveedor"));
                d.setRazon_social(rs.getString("razon_social"));
                d.setRuc(rs.getString("ruc"));
                d.setDireccion(rs.getString("direccion"));
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProveedorData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int create(Proveedor d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "INSERT INTO proveedor (razon_social, ruc, direccion) VALUES (?,?,?)";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, d.getRazon_social());
            ps.setString(++i, d.getRuc());
            ps.setString(++i, d.getDireccion());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProveedorDAO.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int update(Proveedor d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "UPDATE proveedor SET razon_social=?, ruc=?, direccion=? WHERE id_proveedor=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, d.getRazon_social());
            ps.setString(++i, d.getRuc());
            ps.setString(++i, d.getDireccion());
            ps.setInt(++i, d.getId_proveedor());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProveedorDAO.update" + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " DELETE FROM proveedor WHERE id_proveedor = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProveedorDAO.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }
}

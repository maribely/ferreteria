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
import org.submit.ferreteria.entity.Producto;

/**
 *
 * @author hikaru
 */
public class ProductoDAO {

    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Producto> list(String nombre) throws GlobalException {
        List<Producto> list = new ArrayList<>();
        try {
            qry = "SELECT  * FROM producto WHERE  nombre LIKE ? ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, nombre + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto d = new Producto();
                d.setId_producto(rs.getInt("id_producto"));
                d.setNombre(rs.getString("nombre"));
                d.setPrecio_unitario(rs.getFloat("precio_unitario"));
                d.setStock(rs.getFloat("stock"));
                d.setDescripcion(rs.getString("descripcion"));
                d.setId_proveedor(rs.getInt("id_proveedor"));
                d.setId_categoria(rs.getInt("id_categoria"));
                list.add(d);
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProductoDAO.list" + e.getMessage());
        } finally {
            tran.close();
        }
        return list;
    }

    public Producto findByPk(int id) throws GlobalException {
        Producto d = new Producto();
        try {
            qry = "SELECT * FROM producto WHERE id_producto = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_producto(rs.getInt("id_producto"));
                d.setNombre(rs.getString("nombre"));
                d.setPrecio_unitario(rs.getFloat("precio_unitario"));
                d.setStock(rs.getFloat("stock"));
                d.setDescripcion(rs.getString("descripcion"));
                d.setId_proveedor(rs.getInt("id_proveedor"));
                d.setId_categoria(rs.getInt("id_categoria"));
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProductoDAO.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int create(Producto d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "INSERT INTO producto (nombre, precio_unitario, stock,descripcion, id_proveedor, id_categoria) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, d.getNombre());
            ps.setFloat(++i, d.getPrecio_unitario());
            ps.setFloat(++i, d.getStock());
            ps.setString(++i, d.getDescripcion());
            ps.setInt(++i, d.getId_proveedor());
            ps.setInt(++i, d.getId_categoria());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProductoDAO.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int update(Producto d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "UPDATE producto SET nombre=?, precio_unitario=?, stock=?, descripcion=?, id_proveedor=?, id_categoria=? WHERE id_producto=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, d.getNombre());
            ps.setFloat(++i, d.getPrecio_unitario());
            ps.setFloat(++i, d.getStock());
            ps.setString(++i, d.getDescripcion());
            ps.setInt(++i, d.getId_proveedor());
            ps.setInt(++i, d.getId_categoria());
            ps.setInt(++i, d.getId_producto());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProductoDAO.update" + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " DELETE FROM producto WHERE id_producto = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ProductoDAO.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }
}

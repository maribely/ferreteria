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
import org.submit.ferreteria.entity.Factura;

/**
 *
 * @author hikaru
 */
public class FacturaDAO {

    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Factura> list(String fecha) throws GlobalException { 
        List<Factura> list = new ArrayList<>();
        try {
            qry = "SELECT  * FROM factura WHERE  UPPER(fecha) LIKE UPPER(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, fecha + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Factura d = new Factura();
                d.setId_factura(rs.getInt("id_factura"));
                d.setFecha(rs.getString("fecha"));
                d.setSub_total(rs.getFloat("sub_total"));
                d.setIgv(rs.getFloat("igv"));
                d.setTotal(rs.getFloat("total"));
                d.setId_cliente(rs.getInt("id_cliente"));
                d.setId_usuario(rs.getInt("id_usuario"));
                list.add(d);
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("FacturaDAO.list" + e.getMessage());
        } finally {
            tran.close();
        }
        return list;
    }

    public Factura findByPk(int id) throws GlobalException {
        Factura d = new Factura();
        try {
            qry = "SELECT * FROM factura WHERE id_factura = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_factura(rs.getInt("id_factura"));
                d.setFecha(rs.getString("fecha"));
                d.setSub_total(rs.getFloat("sub_total"));
                d.setIgv(rs.getFloat("igv"));
                d.setTotal(rs.getFloat("total"));
                d.setId_cliente(rs.getInt("id_cliente"));
                d.setId_usuario(rs.getInt("id_usuario"));
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("FacturaData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int create(Factura d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "INSERT INTO factura (fecha, sub_total, igv,total, id_cliente,id_usuario) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, d.getFecha());
            ps.setFloat(++i, d.getSub_total());
            ps.setFloat(++i, d.getIgv());
            ps.setFloat(++i, d.getTotal());
            ps.setInt(++i, d.getId_cliente());
            ps.setInt(++i, d.getId_usuario());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("FacturaDAO.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int update(Factura d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "UPDATE factura SET fecha=?, sub_total=?, igv=?, total=?, id_cliente=?, id_usuario=? WHERE id_factura=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, d.getFecha());
            ps.setFloat(++i, d.getSub_total());
            ps.setFloat(++i, d.getIgv());
            ps.setFloat(++i, d.getTotal());
            ps.setInt(++i, d.getId_cliente());
            ps.setInt(++i, d.getId_usuario());
            ps.setInt(++i, d.getId_factura());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("FacturaDAO.update" + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " DELETE FROM factura WHERE id_factura = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("FacturaDAO.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }
}

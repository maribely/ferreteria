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
import org.submit.ferreteria.entity.DetalleFactura;


/**
 *
 * @author hikaru
 */
public class DetalleFacturaDAO {
    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<DetalleFactura> list(int id_factura) throws GlobalException {
        List<DetalleFactura> list = new ArrayList<>();
        try {
            qry = "SELECT  * FROM detallefactura WHERE  id_factura LIKE ? ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id_factura);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DetalleFactura d = new DetalleFactura();
                d.setId(rs.getInt("id"));
                d.setId_producto(rs.getInt("id_producto"));
                d.setCantidad(rs.getFloat("cantidad"));
                d.setSub_total(rs.getFloat("sub_total"));
                d.setId_factura(rs.getInt("id_factura"));
                list.add(d);
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("DetalleFacturaDAO.list" + e.getMessage());
        } finally {
            tran.close();
        }
        return list;
    }

    public DetalleFactura findByPk(int id) throws GlobalException {
        DetalleFactura d = new DetalleFactura();
        try {
            qry = "SELECT * FROM detallefactura WHERE id = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId(rs.getInt("id"));
                d.setId_producto(rs.getInt("id_producto"));
                d.setCantidad(rs.getFloat("cantidad"));
                d.setSub_total(rs.getFloat("sub_total"));
                d.setId_factura(rs.getInt("id_factura"));
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("DetalleFacturaDAO.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int create(DetalleFactura d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "INSERT INTO detallefactura (id_producto, cantidad, sub_total, id_factura) VALUES (?,?,?,?)";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(++i, d.getId_producto());
            ps.setFloat(++i, d.getCantidad());
            ps.setFloat(++i, d.getSub_total());
            ps.setInt(++i, d.getId_factura());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("DetalleFacturaDAO.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int update(DetalleFactura d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "UPDATE detallefactura SET id_producto=?, cantidad=?, sub_total=?, id_factura=? WHERE id=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(++i, d.getId_producto());
            ps.setFloat(++i, d.getCantidad());
            ps.setFloat(++i, d.getSub_total());
            ps.setInt(++i, d.getId_factura());
            ps.setInt(++i, d.getId());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("DetalleFacturaDAO.update" + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " DELETE FROM detallefactura WHERE id = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("DetalleFacturaDAO.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }
}

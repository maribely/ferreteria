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
import org.submit.ferreteria.entity.Categoria;

/**
 *
 * @author hikaru
 */
public class CategoriaDAO {

    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Categoria> list(String filter) throws GlobalException { //select convert(varchar, getdate(), 103) 
        List<Categoria> lis = new ArrayList<>();
        try {
            qry = "SELECT  * FROM categoria WHERE  UPPER(nombre) LIKE UPPER(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categoria d = new Categoria();
                d.setId_categoria(rs.getInt("id_categoria"));
                d.setNombre(rs.getString("nombre"));
                lis.add(d);
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("CategoriaDAO.listar" + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }

    public Categoria findByPk(int id) throws GlobalException {
        Categoria d = new Categoria();
        try {
            qry = "SELECT * FROM categoria WHERE id_categoria = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_categoria(rs.getInt("id_categoria"));
                d.setNombre(rs.getString("nombre"));
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("CategoriaData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int create(Categoria d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "INSERT INTO categoria (nombre) VALUES (?)";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, d.getNombre());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("CategoriaDAO.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int update(Categoria d) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "UPDATE categoria SET nombre=? WHERE id_categoria=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, d.getNombre());
            ps.setInt(++i, d.getId_categoria());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("CategoriaDAO.update" + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " DELETE FROM categoria WHERE id_categoria = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("CategoriaDAO.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }
}

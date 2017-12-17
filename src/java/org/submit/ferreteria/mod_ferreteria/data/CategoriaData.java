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
import org.submit.ferreteria.mod_ferreteria.entity.Categoria;
/**
 *
 * @author SISTEMAS
 */
public class CategoriaData {
 ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Categoria> listByFilter(String filter) throws GlobalException { //select convert(varchar, getdate(), 103) 
        List<Categoria> lis = new ArrayList<Categoria>();
        try {
            qry = "select id_categ,nombre, descripcion from categoria where  upper(nombre) like upper(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categoria d = new Categoria();
                d.setId_categ(rs.getInt("id_categ"));
                 d.setNombre(rs.getString("nombre"));
                d.setDescripcion(rs.getString("descripcion"));
               
               
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("CategoriaData.listByFilter " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }

    public Categoria findByPk(int id) throws GlobalException {
        Categoria d = new Categoria();
        try {
            qry = "select id_categ, nombre, descripcion from categoria where  id_categ=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_categ(rs.getInt("id_categ"));
                 d.setNombre(rs.getString("nombre"));
                d.setDescripcion(rs.getString("descripcion"));
               
                
                }
        } catch (Exception e) {
            throw new GlobalException("CategoriaData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int update(Categoria dato) throws GlobalException {
        int r = 0;
        System.out.println("nob:"+dato.getDescripcion());
        try {
            int i = 0;
            qry = " update categoria set "
                    + " nombre=?, descripcion=?, "
                  
                    + " where id_categ=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, dato.getNombre());
            ps.setString(++i, dato.getDescripcion());
            ps.setInt(++i, dato.getId_categ());
          
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("CategoriaData.update " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int create(Categoria nuevo) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            Connection conn = tran.getConnection();
            conn.setAutoCommit(false);

            PreparedStatement ps;
            ResultSet rs;
            qry = " select coalesce(max(id_categ)+1,'1') as new_id from categoria ";
            ps = conn.prepareStatement(qry);
            rs = ps.executeQuery();
            if (rs.next()) {
                nuevo.setId_categ(rs.getInt("new_id"));
            }
            qry = " insert into categoria(id_categ, nombre, descripcion)"
                    + " values(?,?,?)";
            ps = conn.prepareStatement(qry);
            ps.setInt(++i, nuevo.getId_categ());
            ps.setString(++i, nuevo.getNombre());
            ps.setString(++i, nuevo.getDescripcion());
            
          
            //ps.setString(++i, nuevo.getFecha_create() );
            r = ps.executeUpdate();

            conn.commit();
            conn.close();
        } catch (Exception e) {
            throw new GlobalException("CategoriaData.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " delete from categoria where id_categ=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("CategoriaData.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    
    public List<Categoria> listByLocality(String nombre) throws GlobalException { //select convert(varchar, getdate(), 103)
        List<Categoria> lis = new ArrayList<Categoria>();
        try {
            qry = "select id_categ, nombre, descripcion from categoria where  upper(nombre) like upper(?) order by nombre, descripcion ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, nombre + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categoria d = new Categoria();
                d.setId_categ(rs.getInt("id_categ"));
                 d.setNombre(rs.getString("nombre"));
                d.setDescripcion(rs.getString("descripcion"));
               
          
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("CategoriaData.listByLocality " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }
    
    
    
}

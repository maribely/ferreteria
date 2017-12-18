/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.submit.ferreteria.mod_ferreteria.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.submit.ferreteria.common.data.*;
import org.submit.ferreteria.entity.Cliente;

/**
 *
 * @author SISTEMAS
 */
public class ClienteData {
  
    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Cliente> listByFilter(String filter) throws GlobalException { //select convert(varchar, getdate(), 103) 
        List<Cliente> lis = new ArrayList<Cliente>();
        try {
            qry = "select id_cliente, nombre,apellido, dni, sexo, telefono,ruc,e_mail,direccion from cliente where  upper(nombre) like upper(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente d = new Cliente();
                d.setId_cliente(rs.getInt("id_cliente"));
                d.setNombre(rs.getString("nombre"));
                d.setApellido(rs.getString("apellido"));
                d.setSexo(rs.getString("sexo"));
                d.setDni(rs.getInt("dni"));
                d.setTelefono(rs.getInt("telefono"));
                d.setRuc(rs.getString("ruc"));
                d.setE_mail(rs.getString("e_mail"));
                d.setDireccion(rs.getString("direccion"));
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("ClienteData.listByFilter " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }

    public Cliente findByPk(int id) throws GlobalException {
        Cliente d = new Cliente();
        try {
            qry = "select id_cliente, nombre,apellido, sexo, dni,telefono,ruc,e_mail,direccion from cliente where  id_cliente=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_cliente(rs.getInt("id_cliente"));
                d.setNombre(rs.getString("nombre"));
                d.setApellido(rs.getString("apellido"));
                d.setSexo(rs.getString("sexo"));
                d.setDni(rs.getInt("dni"));
                d.setTelefono(rs.getInt("telefono"));
                d.setRuc(rs.getString("ruc"));
                d.setE_mail(rs.getString("e_mail"));
                d.setDireccion(rs.getString("direccion"));
              
            }
        } catch (Exception e) {
            throw new GlobalException("ClienteData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int update(Cliente cli) throws GlobalException {
        int r = 0;
        System.out.println("nob:"+cli.getNombre());
        try {
            int i = 0;
            qry = " update cliente set "
                    + " nombre=?, apellido=?, sexo=?, dni=?, telefono=?,  "
                    + " ruc=?, e_mail=?, direccion=? "
                    + " where id_cliente=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, cli.getNombre());
            ps.setString(++i, cli.getApellido());
            ps.setString(++i, cli.getSexo());
            ps.setInt(++i, cli.getDni());
            ps.setInt(++i, cli.getTelefono());
            ps.setString(++i, cli.getRuc());
            ps.setString(++i, cli.getE_mail());
            ps.setString(++i, cli.getDireccion());
            ps.setInt(++i, cli.getId_cliente());
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("ClienteData.update " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int create(Cliente cli) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            Connection conn = tran.getConnection();
            conn.setAutoCommit(false);

            PreparedStatement ps;
            ResultSet rs;
            qry = " select coalesce(max(id_cliente)+1,'1') as new_id from cliente ";
            ps = conn.prepareStatement(qry);
            rs = ps.executeQuery();
            if (rs.next()) {
                cli.setId_cliente(rs.getInt("new_id"));
            }
            qry = " insert into cliente(nombre,apellido,sexo, dni,telefono,ruc,e_mail,direccion)"
                    + " values(?,?,?,?,?,?,?,?)";
            
            ps = conn.prepareStatement(qry);
            ps.setString(++i, cli.getNombre());
            ps.setString(++i, cli.getApellido());
            ps.setString(++i, cli.getSexo());
            ps.setInt(++i, cli.getDni());
            ps.setInt(++i, cli.getTelefono());
            ps.setString(++i, cli.getRuc());
            ps.setString(++i, cli.getE_mail());
            ps.setString(++i, cli.getDireccion());
            //ps.setString(++i, cli.getFecha_create() );
            r = ps.executeUpdate();
            conn.commit();
            conn.close();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ClienteData.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " delete from cliente where id_cliente=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("ClienteData.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }
    
    public List<Cliente> listByLocality(String direccion) throws GlobalException { //select convert(varchar, getdate(), 103)
        List<Cliente> lis = new ArrayList<Cliente>();
        try {
            qry = "select id_cliente, nombre,apellido, sexo, dni,telefono, ruc, e_mail, direccion from cliente where  upper(direccion) like upper(?) order by direccion, nombre ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, direccion + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente d = new Cliente();
                d.setId_cliente(rs.getInt("id_cliente"));
                d.setNombre(rs.getString("nombre"));
                d.setApellido(rs.getString("apellido"));
                d.setSexo(rs.getString("sexo"));
                d.setDni(rs.getInt("dni"));
                d.setTelefono(rs.getInt("telefono"));
                d.setRuc(rs.getString("ruc"));
                d.setE_mail(rs.getString("e_mail"));
                d.setDireccion(rs.getString("direccion"));
                lis.add(d);
            }
        } catch (Exception e) {
            throw new GlobalException("ClienteData.listByLocality " + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }
        
}

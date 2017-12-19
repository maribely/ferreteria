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
import org.submit.ferreteria.entity.Cliente;

/**
 *
 * @author hikaru
 */
public class ClienteDAO {

    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Cliente> listarCliente(String filter) throws GlobalException { //select convert(varchar, getdate(), 103) 
        List<Cliente> lis = new ArrayList<>();
        try {
            qry = "SELECT  * FROM cliente WHERE  UPPER(apellidos) LIKE UPPER(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente d = new Cliente();
                d.setId_cliente(rs.getInt("id_cliente"));
                d.setNombres(rs.getString("nombres"));
                d.setApellidos(rs.getString("apellidos"));
                d.setDni(rs.getString("dni"));
                d.setSexo(rs.getString("sexo"));
                d.setEmail(rs.getString("email"));
                d.setRuc(rs.getString("ruc"));
                d.setTelefono(rs.getString("telefono"));
                d.setDireccion(rs.getString("direccion"));
                lis.add(d);
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ClienteDAO.listarCliente" + e.getMessage());
        } finally {
            tran.close();
        }
        return lis;
    }

    public Cliente findByPk(int id) throws GlobalException {
        Cliente d = new Cliente();
        try {
            qry = "SELECT * FROM cliente WHERE id_cliente = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setId_cliente(rs.getInt("id_cliente"));
                d.setNombres(rs.getString("nombres"));
                d.setApellidos(rs.getString("apellidos"));
                d.setDni(rs.getString("dni"));
                d.setSexo(rs.getString("sexo"));
                d.setEmail(rs.getString("email"));
                d.setRuc(rs.getString("ruc"));
                d.setTelefono(rs.getString("telefono"));
                d.setDireccion(rs.getString("direccion"));              
            }
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ClienteData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int update(Cliente cli) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "UPDATE cliente SET nombres=?, apellidos=?,dni=?, sexo=?, email=?, ruc=?, telefono=?,direccion=? WHERE id_cliente=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, cli.getNombres());
            ps.setString(++i, cli.getApellidos());
            ps.setString(++i, cli.getDni());
            ps.setString(++i, cli.getSexo());
            ps.setString(++i, cli.getEmail());
            ps.setString(++i, cli.getRuc());
            ps.setString(++i, cli.getTelefono());
            ps.setString(++i, cli.getDireccion());
            ps.setInt(++i, cli.getId_cliente());
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ClienteDAO.update" + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int create(Cliente cli) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = "INSERT INTO cliente (nombres,apellidos,dni,sexo,email,ruc,telefono,direccion) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, cli.getNombres());
            ps.setString(++i, cli.getApellidos());
            ps.setString(++i, cli.getDni());
            ps.setString(++i, cli.getSexo());
            ps.setString(++i, cli.getEmail());
            ps.setString(++i, cli.getRuc());
            ps.setString(++i, cli.getTelefono());
            ps.setString(++i, cli.getDireccion());
            //ps.setString(++i, cli.getFecha_create() );
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ClienteDAO.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " DELETE FROM cliente WHERE id_cliente = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("ClienteDAO.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }
       
}

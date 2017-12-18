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
import org.submit.ferreteria.entity.Usuario;

/**
 *
 * @author hikaru
 */
public class UsuarioDAO {
    
    ConnectDB tran = new ConnectDB();
    String qry = "";

    public Usuario loginUsuario(String usuario, String contrasenia) throws GlobalException {
        Usuario u = new Usuario();
        try {
            qry = "SELECT u.id_usuario, u.usuario, p.nombre\n" +
                    "FROM usuario u, privilegio p\n" +
                    "WHERE u.id_privilegio = p.id_privilegio\n" +
                    "AND u.usuario =?" +
                    "AND u.contrasenia = ?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, usuario);
            ps.setString(2, contrasenia);
            ResultSet rs = ps.executeQuery();
            System.out.println("****>");
            System.out.println(rs);
            if (rs.next()) {
                u.setId_usuario(rs.getInt("id_usuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setPrivilegio_nombre(rs.getString("nombre"));              
            } 
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("UsuarioDAO.buscarUsuario" + e.getMessage());
        } finally {
            tran.close();
        }
        return u;
    }
    
    public List<Usuario> listarUsuarios() throws GlobalException {
        List lis = new ArrayList<>();
        try {//usuario_id,nombres,cargo,usuario,clave,clave_nueva,e_mail,privilegio,cuenta_activa,fecha_create
//            qry = "select id_usuario, usuario, cargo, usuario, clave, clave_nueva, e_mail, privilegio, cuenta_activa, fecha_create from usuario where  upper(nombres) like upper(?) ";
            qry = "SELECT u.id_usuario, u.usuario, p.nombre\n" +
                    "FROM usuario u, privilegio p\n" +
                    "WHERE u.id_privilegio = p.id_privilegio\n";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
//            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario d = new Usuario();
                d.setId_usuario(rs.getInt("id_usuario"));
                d.setUsuario(rs.getString("usuario"));
                d.setPrivilegio_nombre(rs.getString("nombre"));
                lis.add(d);
            }
            //r= (Usuario[])lis.toArray( new Usuario[0] );	//int x=(int) (8.6);
        } catch (GlobalException | SQLException e) {
            throw new GlobalException("UsuarioDAO.listarUsuarios" + e.getMessage());
        } finally {
            tran.close();
        }
        //return ( r.length == 0) ? null : r ;
        return lis;
    }
    
    public static void main(String[] args) throws GlobalException {
        UsuarioDAO dao = new UsuarioDAO();
        
        System.out.println("+++++++++++++++");
        Usuario u = dao.loginUsuario("admin", "12345");
        System.out.println(u.getUsuario() +" " +u.getPrivilegio_nombre());
        System.out.println("+++++++++++++++");
    }
}

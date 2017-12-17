/* 
 * Description of UsuarioData: Realiza el CRUD de la tabla Usuario
 */
package org.submit.ferreteria.mod_config.data;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.submit.ferreteria.common.data.*;
import org.submit.ferreteria.mod_config.entity.Usuario;

/**
 *
 * @author JORGE
 */
public class UsuarioData {

    ConnectDB tran = new ConnectDB();
    String qry = "";

    public List<Usuario> listByFilter(String filter) throws GlobalException {
        //Usuario[] r= null;
        //ArrayList lis= new ArrayList();
        List<Usuario> lis = new ArrayList<Usuario>();
        try {//usuario_id,nombres,cargo,usuario,clave,clave_nueva,e_mail,privilegio,cuenta_activa,fecha_create
            qry = "select usuario_id, nombres, cargo, usuario, clave, clave_nueva, e_mail, privilegio, cuenta_activa, fecha_create from usuario where  upper(nombres) like upper(?) ";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(1, filter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario d = new Usuario();
                d.setUsuario_id(rs.getInt("usuario_id"));
                d.setNombres(rs.getString("nombres"));
                d.setCargo(rs.getString("cargo"));
                d.setUsuario(rs.getString("usuario"));
                d.setClave(rs.getString("clave"));
                d.setClave_nueva(rs.getBoolean("clave_nueva"));
                d.setE_mail(rs.getString("e_mail"));
                d.setPrivilegio(rs.getString("privilegio"));
                d.setCuenta_activa(rs.getBoolean("cuenta_activa"));
                d.setFecha_create(rs.getString("fecha_create"));
                lis.add(d);
            }
            //r= (Usuario[])lis.toArray( new Usuario[0] );	//int x=(int) (8.6);
        } catch (Exception e) {
            throw new GlobalException("UsuarioData.listByFilter " + e.getMessage());
        } finally {
            tran.close();
        }
        //return ( r.length == 0) ? null : r ;
        return lis;
    }

    public Usuario findByPk(int id) throws GlobalException {
        Usuario d = new Usuario();
        try {
            qry = "select usuario_id, nombres, cargo, usuario, clave, clave_nueva, e_mail, privilegio, cuenta_activa, fecha_create from usuario where  usuario_id=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                d.setUsuario_id(rs.getInt("usuario_id"));
                d.setNombres(rs.getString("nombres"));
                d.setCargo(rs.getString("cargo"));
                d.setUsuario(rs.getString("usuario"));
                d.setClave(rs.getString("clave"));
                d.setClave_nueva(rs.getBoolean("clave_nueva"));
                d.setE_mail(rs.getString("e_mail"));
                d.setPrivilegio(rs.getString("privilegio"));
                d.setCuenta_activa(rs.getBoolean("cuenta_activa"));
                d.setFecha_create(rs.getString("fecha_create"));
            }
        } catch (Exception e) {
            throw new GlobalException("UsuarioData.findByPk " + e.getMessage());
        } finally {
            tran.close();
        }
        return d;
    }

    public int update(Usuario dato) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            qry = " update usuario set "
                    + " nombres=?, cargo=?, "
                    + " usuario=?, clave=?, clave_nueva=?, e_mail=?, privilegio=?, cuenta_activa=? "
                    + " where usuario_id=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setString(++i, dato.getNombres());
            ps.setString(++i, dato.getCargo());
            ps.setString(++i, dato.getUsuario());
            ps.setString(++i, dato.getClave());
            ps.setBoolean(++i, dato.isClave_nueva());
            ps.setString(++i, dato.getE_mail());
            ps.setString(++i, dato.getPrivilegio());
            ps.setBoolean(++i, dato.isCuenta_activa());
            ps.setInt(++i, dato.getUsuario_id());
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("UsuarioData.update " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int create(Usuario nuevo) throws GlobalException {
        int r = 0;
        try {
            int i = 0;
            Connection conn = tran.getConnection();
            conn.setAutoCommit(false);

            PreparedStatement ps;
            ResultSet rs;
            qry = " select coalesce(max(usuario_id)+1,'1') as new_id from usuario ";
            ps = conn.prepareStatement(qry);
            rs = ps.executeQuery();
            if (rs.next()) {
                nuevo.setUsuario_id(rs.getInt("new_id"));
            }
            qry = " insert into usuario(usuario_id, nombres, cargo, usuario, clave,   clave_nueva, e_mail, privilegio, cuenta_activa, fecha_create)"
                    + " values(?,?,?,?,?   ,?,?,?,?, now())";
            ps = conn.prepareStatement(qry);
            ps.setInt(++i, nuevo.getUsuario_id());
            ps.setString(++i, nuevo.getNombres());
            ps.setString(++i, nuevo.getCargo());
            ps.setString(++i, nuevo.getUsuario());
            ps.setString(++i, nuevo.getClave());
            ps.setBoolean(++i, nuevo.isClave_nueva());
            ps.setString(++i, nuevo.getE_mail());
            ps.setString(++i, nuevo.getPrivilegio());
            ps.setBoolean(++i, nuevo.isCuenta_activa());
            //ps.setString(++i, nuevo.getFecha_create() );
            r = ps.executeUpdate();

            conn.commit();
            conn.close();
        } catch (Exception e) {
            throw new GlobalException("UsuarioData.create " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }

    public int delete(int id) throws GlobalException {
        int r = 0;
        try {
            qry = " delete from usuario where usuario_id=?";
            PreparedStatement ps = tran.getConnection().prepareStatement(qry);
            ps.setInt(1, id);
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw new GlobalException("UsuarioData.delete " + e.getMessage());
        } finally {
            tran.close();
        }
        return r;
    }
}

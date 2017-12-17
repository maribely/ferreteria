/* 
 * Description of Usuario: Esta clase permite almacenar temporalmente los datos de la tabla Usuario
 */
package org.submit.ferreteria.mod_config.entity;

/**
 *
 * @author JORGE
 */
public class Usuario {

    int usuario_id;
    String nombres;
    String cargo;
    String usuario;
    String clave;
    boolean clave_nueva;
    String e_mail;
    String privilegio;
    boolean cuenta_activa;
    String fecha_create;//solo para mostrar

    public Usuario() {
        usuario_id = 0;
        nombres = "";
        cargo = "";
        usuario = "";
        clave = "";
        clave_nueva = true;
        e_mail = "";
        privilegio = "";
        cuenta_activa = false;
        fecha_create = "Hoy";
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public boolean isClave_nueva() {
        return clave_nueva;
    }

    public void setClave_nueva(boolean clave_nueva) {
        this.clave_nueva = clave_nueva;
    }

    public boolean isCuenta_activa() {
        return cuenta_activa;
    }

    public void setCuenta_activa(boolean cuenta_activa) {
        this.cuenta_activa = cuenta_activa;
    }

    public String getE_mail() {
        return e_mail;
    }

    public void setE_mail(String e_mail) {
        this.e_mail = e_mail;
    }

    public String getFecha_create() {
        return fecha_create;
    }

    public void setFecha_create(String fecha_create) {
        this.fecha_create = fecha_create;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }
}

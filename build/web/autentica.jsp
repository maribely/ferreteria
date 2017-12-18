<%@page import="org.submit.ferreteria.common.data.GlobalException"%>
<%@page import="org.submit.ferreteria.entity.Usuario"%>
<%@page import="org.submit.ferreteria.dao.UsuarioDAO"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page errorPage="error.jsp" %>
<%
            System.out.println("autentica.jsp");
            String usuario = request.getParameter("usuario") == null ? "" : request.getParameter("usuario");
            String contrasenia = request.getParameter("clave") == null ? "" : request.getParameter("clave");
            String forward = "";
//            CryptoString crypt = new CryptoString();
//            String clave_encriptada = crypt.encrypt(clave); // clave encriptada
            UsuarioDAO dao = new UsuarioDAO();
            try {
                Usuario u = (Usuario)  dao.loginUsuario(usuario, contrasenia);
                System.out.println(u.getUsuario()+"<==>"+u.getPrivilegio_nombre());
                
                if(u.getUsuario()!=null){
                    request.getSession().setAttribute("usuario", u.getUsuario());
                    request.getSession().setAttribute("usuario_id", u.getId_usuario());
                    request.getSession().setAttribute("usuario_privilegio", u.getPrivilegio_nombre());
                    if(u.getPrivilegio_nombre().equals("Administrador")){
                        System.out.println(u.getPrivilegio_nombre());
                        System.out.println("========/=///=/=======");
                         forward = "menu/rol_1/frame.jsp";
                    }else if(u.getPrivilegio_nombre()=="Gerente"){
                        forward = "menu/rol_2/frame.jsp";
                    }else if(u.getPrivilegio_nombre()==null) {
                           out.print("Falta privilegios para usar este sistema");
                    }
                    out.print(  "<form action='"+forward+"' method='post' name='fm'>"+
                                    "</form>"+
                                    "<script>document.fm.submit();</script>");
                }else{
                        throw new GlobalException("Alerta!, Error de USUARIO o CLAVE, o Usted fue dado de baja");
                }
            } catch (Exception e) {
                throw new GlobalException( e.getMessage());
            } 
            

            
%>
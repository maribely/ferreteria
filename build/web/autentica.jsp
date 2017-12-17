<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.submit.ferreteria.common.data.*"%>
<%@ page errorPage="error.jsp" %>
<%
            System.out.println("autentica.jsp");
            String usuario = request.getParameter("usuario") == null ? "" : request.getParameter("usuario");
            String clave = request.getParameter("clave") == null ? "" : request.getParameter("clave");
            String forward = "";
            CryptoString crypt = new CryptoString();
            String clave_encriptada = crypt.encrypt(clave); // clave encriptada
            ConnectDB conn = new ConnectDB();
            String qry = "";
            try {
                qry = " select usuario from usuario where usuario=? ";
                PreparedStatement ps = conn.getConnection().prepareStatement(qry);
                ps.setString(1, usuario);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    qry = " select usuario_id, nombres, privilegio, clave_nueva, cuenta_activa from usuario "
                            + " where usuario=? and  clave=? and cuenta_activa = True ";

                    PreparedStatement ps2 = conn.getConnection().prepareStatement(qry);
                    ps2.setString(1, usuario);
                    clave = crypt.decrypt(clave_encriptada);//recuperando clave
                    ps2.setString(2, clave);//enviando clave recuperada
                    ResultSet rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        String privilegio = rs2.getString("privilegio");
                        request.getSession().setAttribute("usuario", usuario);
                        request.getSession().setAttribute("usuario_id", rs2.getString("usuario_id"));
                        request.getSession().setAttribute("usuario_nombres", rs2.getString("nombres"));
                        request.getSession().setAttribute("usuario_privilegio", privilegio);

                        if (!privilegio.equals("")) {
                            //request.getSession().setAttribute("sesion_2", request.getSession().getId());
                            ArrayList list = new ArrayList();
                            if (privilegio.equals("1")) {
                                forward = "menu/rol_1/frame.jsp";
                                list.add("1");//AS Administrador del Sistema
                                list.add("2");//Usuario
                            }
                            if (privilegio.equals("2")) {
                                forward = "menu/rol_2/frame.jsp";
                                list.add("2");//Gerente
                            }

                            if( rs2.getBoolean("clave_nueva") ){
                                //throw new GlobalException("Alert " + usuario + "!, cambiar clave");
                            out.print(  "<form action='mod_config/privacidad/actualizaclavenueva_main.jsp' method='post' name='fmclavenueva'>"+
                                                "<input type='hidden' name='forward' value='"+forward+"'>"+
                                                "</form>"+
                                                "<script>document.fm.submit();</script>");
                             }

                            //request.getSession().setAttribute("accesses_list", list);
                            out.print(  "<form action='"+forward+"' method='post' name='fm'>"+
                                                "</form>"+
                                                "<script>document.fm.submit();</script>");
                        } else {
                            out.print("Falta privilegios para usar este sistema");
                        }


                    }else{
                            //request.getSession().setAttribute("sesion_2", null);
                            throw new GlobalException("Alert " + usuario + "!, Error de CLAVE ó Usted fue dado de baja");

                    }
                } else {
                    //request.getSession().setAttribute("sesion_2", null);
                    throw new GlobalException("Alert " + usuario + "!, El nombre de usuario ingresado no es válido");
                }
            } catch (Exception e) {
                throw new GlobalException("" + e.getMessage());
            } finally {
                conn.close();
            }
%>
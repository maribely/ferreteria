package org.submit.ferreteria.common.data;
/* 
 * Description of Config: Permite inicializar las variables de configruaci�n
 */

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Config extends HttpServlet {

    private String server;//CAMBIAR en WEB.XML //192.168.204.156:1433
    private int port;
    private String username;
    private String password;
    private String db_name;
    //valores de conexion a la db por default
    public static String SERVER = "127.0.0.1";
    public static int PORT = 5432;//:my3306 pg5432 sql1433
    public static String USERNAME = "postgres";//
    public static String PASSWORD = "61580745"; //123 = áIÿ˜¾÷ // viene ser la contraseña de posgre
    public static String DB_NAME = "ferreteria";
    //datos de la empresa por default
    public static String RUC = "";
    public static String RAZON_SOCIAL = "FERRETERIA ACEROS AREQUIPA";//Municipalidad Distrital de Espinar
    public static String SIGLAS = "Espinar";
    public static String DIRECCION = "Av. espinar 485";

    public Config() {
    }

    public void init(ServletConfig config) throws ServletException {
        SERVER = server;
        PORT = port;
        USERNAME = username;
        PASSWORD = password;
        DB_NAME = db_name;
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        //String opc = request.getParameter("opc")== null ? "":request.getParameter("opc");
        PrintWriter out = response.getWriter();
        out.println("Solicitud de actualizacion de variables de conexion");
        if (!USERNAME.equals("")) {
            out.println("Las variables de conexion fueron actualizados <script>window.close();</script>");
        } else {
            out.println("Error en la actualizacion, intente de nuevo.<br>F5 para actualizar");
        }
        out.close();

        //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/x.html");
        //dispatcher.forward(request, response);

    }
    //use doPost("") para mayor seguridad

    public void destroy() {
        super.destroy();
    }

    public void setDb_name(String db_name) {
        this.db_name = db_name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}

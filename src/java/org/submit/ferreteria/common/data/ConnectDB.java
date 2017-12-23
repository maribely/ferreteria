package org.submit.ferreteria.common.data;

import java.sql.*;
//import com.microsoft.sqlserver.jdbc.*;

public class ConnectDB {

    Connection conn;
    private String server;
    private int port;
    private String username;
    private String password;
    private String db_name;

    public ConnectDB() {
        this.server = Config.SERVER;
        this.port = Config.PORT;
        this.username = Config.USERNAME;
        this.password = Config.PASSWORD;
        this.db_name = Config.DB_NAME;
    }

    public Connection getConnection() throws GlobalException {

        if (conn == null) {
            try {//obtener conexion
                //String sc="jdbc:sqlserver://localhost:1433;databaseName=Omaped;user=sa;password=12345;";
                //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//                    String sc="jdbc:postgresql://localhost:5432/ferreteria?user=postgres&password=61580745"; // viene ser la contraseaña de posgre
//                    Class.forName("org.postgresql.Driver");
                String sc = "jdbc:mysql://localhost:3306/ferreteriadb?user=root&password=123456";
                Class.forName("com.mysql.jdbc.Driver");
                //String sc="jdbc:oracle:thin:@//localhost:1521:ora11i?user=scott&password=tiger";//Thin driver
                //Class.forName ("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection(sc);
//                SQLServerDataSource ds = new SQLServerDataSource(); //para que soporte pool
//                //ds.setIntegratedSecurity(true);
//                ds.setServerName(server);
//                ds.setPortNumber(port);
//                ds.setDatabaseName(db_name);
//                ds.setUser(username);
//                ds.setPassword(password);
//                conn = ds.getConnection();

                System.out.println("Connect to " + server + ":" + port + " " + db_name + " "
                        + username + " " + (new java.text.SimpleDateFormat("yyyy-MM-dd hh:m a").format(new java.util.Date())));

            } catch (Exception e) {
                throw new GlobalException("ConnectDB.getConnection " + e.getMessage());
            }
        }
        return conn;//devuelve la conexion patron singleton
    }

    public void close() {
        try {
            if (conn != null) {
                conn.close();
                conn = null;
                System.out.println("Close Connection.");
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    public static void main(String[] args) {

        ConnectDB sql = new ConnectDB();
        try {
            sql.getConnection();
            sql.getConnection();
            //testing
            String SQL = "SELECT * FROM Usuario";
            Statement stmt = sql.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery(SQL);
            while (rs.next()) {
                System.out.println("==> " + rs.getString("usuario") + " conectado!!!");
            }
            sql.close();
            sql.getConnection();
            sql.close();
        } catch (Exception e) {
            System.out.println("Error:" + e.getMessage());
        }
    }

}

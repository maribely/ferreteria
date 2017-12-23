<%@page import="org.submit.ferreteria.entity.Producto"%>
<%@page import="org.submit.ferreteria.dao.ProductoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.submit.ferreteria.entity.DetalleFactura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//    System.out.println(request);
    String id_producto = request.getParameter("id_producto");
    String cantidad = request.getParameter("cantidad");

    HttpSession sesion = request.getSession();
    ArrayList<DetalleFactura> carrito;

    if (sesion.getAttribute("carrito") == null) {
        carrito = new ArrayList<>();
    } else {
        carrito = (ArrayList<DetalleFactura>) sesion.getAttribute("carrito");
    }
    ProductoDAO pdao = new ProductoDAO();
    Producto p = pdao.findByPk(Integer.parseInt(id_producto));

    DetalleFactura df = new DetalleFactura();
    df.setId_producto(p.getId_producto());
    df.setProducto(p);
    df.setCantidad(Float.parseFloat(cantidad));
    df.setSub_total(df.getCantidad() * p.getPrecio_unitario());

    int indice = -1;
    int car = carrito.size();
    for (int i = 0; i < car; i++) {
        DetalleFactura df1 = carrito.get(i);
        if (df1.getId_producto() == p.getId_producto()) {
            indice = i;
            break;
        }
    }
    if (indice == -1) {
        carrito.add(df);
    } else {
        carrito.set(indice, df);
    }
    sesion.setAttribute("carrito", carrito);

%>
<table class="table">
    <thead>
        <tr>
            <th>#</th>
            <th>Producto</th>
            <th>Cantidad</th>
            <th>Sub total</th>
        </tr>
    </thead>
    <tbody>
        <%            int i = 0;
            for (DetalleFactura d : carrito) {
                i++;
        %>
        <tr>
            <td><%= i%></td>
            <td><%= d.getProducto().getNombre()%></td>
            <td><%= d.getCantidad()%></td>
            <td><%= d.getSub_total()%></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

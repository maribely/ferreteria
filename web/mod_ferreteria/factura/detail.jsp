<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    System.out.println("0000000000000000000000");
    System.out.println(request);
    String id_producto = request.getParameter("id_producto");
    String cantidad = request.getParameter("cantidad");
    String sub_total = request.getParameter("sub_total");
    System.out.println(id_producto + cantidad + sub_total);
//            out.print(id_producto + cantidad + sub_total);
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
        <tr>
            <td>1</td>
            <td>Fierro</td>
            <td>4</td>
            <td>88.6</td>
        </tr>
    </tbody>
</table>

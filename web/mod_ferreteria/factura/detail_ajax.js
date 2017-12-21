/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $("#btn-agregar").click(function () {
        if (confirm("Estas seguro?")) {
            id_producto = $("#id_producto").val();
            cantidad = $("#cantidad").val();
            sub_total = $("#sub_total").val();
            $.ajax({
                type: "GET",
                url: "detail.jsp",
                data: {'id_producto': id_producto, 'cantidad': cantidad, 'sub_total': sub_total},
                contentType: "application/json",
                async: false,
                success: function (data) {
//                                    console.log(data);
                    $("#response").html(data);
                }
            });
        }
    });
});
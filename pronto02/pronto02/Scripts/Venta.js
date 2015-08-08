

$(document).ready(function () {

    $("#txtCodigoBarras").bind("input", function () {


        var txtNombre = $('#txtCodigoBarras').val();
        if (txtNombre.length >= 4) {
            eval($('.btnBuscar').attr('href'));
        }

    });

    //function calcularTotal() {
    //    var gridview = document.getElementById("GridView1");
    //    var total = 0;
    //    for (var i = 1, row; row = gridview.rows[i]; i++)
    //        total += parseFloat(row.cells[4].innerText);
    //    var txt = document.getElementById("txtTotal");
    //    txt.value = total;
    //}
});

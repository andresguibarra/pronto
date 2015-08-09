$(document).ready(function () {


    $("#txtCodBarras").bind("input", function () {

        $('#txtCodBarras').on('keydown', function (e) {
            var txtCodigoBarras = $('#txtCodBarras').val();
            if (txtCodigoBarras.length >= 3) {
                eval($('.btnBuscar').attr('href'));
            }
        });



    });


    $("#txtNombre").bind("input", function () {


        var txtNombre = $('#txtNombre').val();
        if (txtNombre.length >= 2) {
            eval($('.btnBuscar').attr('href'));
        }

    });

});

function modificar(boton) {
    var listaTD = boton.parentElement.parentElement.children;
    var id = listaTD[listaTD.length - 1].innerText;

    window.location.href = "/ModificarProducto.aspx?id=" + id;
}


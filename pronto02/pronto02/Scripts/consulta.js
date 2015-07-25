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



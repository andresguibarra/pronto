$(document).ready(function () {


    $("#txtCodBarras").bind("input", function () {


        var txtCodigoBarras = $('#txtCodBarras').val();
        if (txtCodigoBarras.length >= 3) {
            eval($('.btnBuscar').attr('href'));
        }

    });


});



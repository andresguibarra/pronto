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




function incrementarStock(boton) {
    var valor = boton.parentElement.childNodes[3].value;
    boton.parentElement.childNodes[3].value = parseInt(valor)+1 ;
}


function disminuirStock(boton) {
    var valor = boton.parentElement.childNodes[3].value;
    boton.parentElement.childNodes[3].value = parseInt(valor) - 1;
}
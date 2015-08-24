function Confirmar_Modificar() {
    var confirm_value = document.createElement("INPUT");
    confirm_value.type = "hidden";
    confirm_value.name = "confirm_value";
    if (confirm("¿Desea modificar el producto?")) {
        confirm_value.value = "Modificar";
    } else {
        confirm_value.value = "Cancelar";
    }
    document.forms[0].appendChild(confirm_value);
}

function Confirmar_Eliminar() {
    var confirm_value = document.createElement("INPUT");
    confirm_value.type = "hidden";
    confirm_value.name = "confirm_value";
    if (confirm("¿Desea borrar el producto?")) {
        confirm_value.value = "Borrar";
    } else {
        confirm_value.value = "Cancelar";
    }
    document.forms[0].appendChild(confirm_value);
}

function incrementarStock() {
    var valor = document.getElementById("txtStock").value
    valor = parseInt(valor) + 1;
    $("#txtStock").val(valor);
}


function disminuirStock() {
    var valor = document.getElementById("txtStock").value;
    valor = parseInt(valor) - 1;
    $("#txtStock").val(valor);

}

$(document).ready(function () {
    deshabilitarCampos();

    $("[name='my-checkbox']").bootstrapSwitch('state',false);
    $("[name='my-checkbox']").prop("checked",false)
    $('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function (event, state) {


        if ($("[name='my-checkbox']").prop("checked")) {

            $("#txtNombre").prop('disabled', false);
            $("#txtCosto").prop('disabled', false);
            $("#txtVenta").prop('disabled', false);
            $("#txtMayor").prop('disabled', false);
            $("#modificarNo").prop("checked", false);
        }
        else {
            $("#txtNombre, #txtCosto, #txtVenta, #txtMayor").prop('disabled', true);
            $("#modificarSi").prop("checked", false);
        }

    });
    //$("#modificarNo").prop("checked", true);
});


function deshabilitarCampos() {

    $("#txtID, #txtCodigoBarras").prop('disabled', true);
    $("#txtNombre, #txtCosto, #txtVenta, #txtMayor").prop('disabled', true);
}
var mod = function modificarDatos() {

    if ($("[name='my-checkbox']").prop("checked")) {

        $("#txtNombre").prop('disabled', false);
        $("#txtCosto").prop('disabled', false);
        $("#txtVenta").prop('disabled', false);
        $("#txtMayor").prop('disabled', false);
        $("#modificarNo").prop("checked", false);
    }
    else if ($("[name='my-checkbox']").prop("checked")) {
        $("#txtNombre, #txtCosto, #txtVenta, #txtMayor").prop('disabled', true);
        $("#modificarSi").prop("checked", false);
    }

}


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

function incrementarStock () {
    var valor = document.getElementById("txtStock").value
    valor = parseInt(valor) + 1;
    $("#txtStock").val(valor);
}


function disminuirStock () {
    var valor = document.getElementById("txtStock").value;
    valor = parseInt(valor) - 1;
    $("#txtStock").val(valor);
    
}

$(document).ready(function () {


    //modificarDatos();

    $("input:radio[name=sam1]").click(mod)
});

var mod= function modificarDatos() {
    
    if ($("#modificarSi").prop("checked")) {

        $("#txtNombre").prop('disabled', false);
        $("#txtCosto").prop('disabled', false);
        $("#txtVenta").prop('disabled', false);
        $("#txtMayor").prop('disabled', false);
        $("#modificarNo").prop("checked", false);
        }
    else if ($("#modificarNo").prop("checked")) {
        $("#txtNombre").prop('disabled', true);
        $("#txtCosto").prop('disabled', true);
        $("#txtVenta").prop('disabled', true);
        $("#txtMayor").prop('disabled', true);
        $("#modificarSi").prop("checked", false);
        }
    
}


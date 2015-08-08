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
function Confirm() {
    var confirm_value = document.createElement("INPUT");
    confirm_value.type = "hidden";
    confirm_value.name = "confirm_value";
    if (confirm("¿Desea borrar la categoria?")) {
        confirm_value.value = "Borrar";
    } else {
        confirm_value.value = "Cancelar";
    }
    document.forms[0].appendChild(confirm_value);
}
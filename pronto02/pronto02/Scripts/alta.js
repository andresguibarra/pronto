function calcularPrecio() {
    var txtPorcentaje = document.getElementById('txtPorcentaje');
    var txtPrecioCosto = document.getElementById('txtPrecioCosto');
    var txtPrecioVenta = document.getElementById('txtPrecioVenta');
    var valorCosto = txtPrecioCosto.value;
    var valorPorcentaje = txtPorcentaje.value;
    txtPrecioVenta.value = parseInt(valorCosto) + ((valorCosto * valorPorcentaje) / 100);

}
function establecerCamposNumericos() {
    $("#txtCodigoDeBarras").numeric();
    $("#txtPorcentaje").numeric();
    $("#txtPrecioCosto").numeric({ decimalPlaces: 2 });
    $("#txtPrecioVenta").numeric({ decimalPlaces: 2 });
}
$(document).ready(function () {
    establecerCamposNumericos();//Establezco que campos van a ser numericos
    $("#txtCodigoDeBarras").focus();
    $("#txtCodigoDeBarras").focus(function () {

        this.select();//Selecciona el textbox $("#txtCodigoDeBarras").select();
        $("#txtCodigoDeBarras").mouseup(function () {
            $("#txtCodigoDeBarras").mouseup = null;
            return false;
        });
    });

    $("#txtPorcentaje").focusout(function () {
        var txtPorcentaje = $("#txtPorcentaje");
        if (txtPorcentaje.val() != '') {
            calcularPrecio();
        }
    });

    $("#txtNombreProducto").keyup(function () {
        this.value = this.value.toUpperCase();
    });

});
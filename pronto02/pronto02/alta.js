$("#btnCalcular").click(function () {
    var txtPorcentaje = $("#txtPorcentaje");
    var txtPrecioCosto = $("#txtPrecioCosto");
    var txtPrecioVenta = $("#txtPrecioVenta");

    txtPrecioVenta.val = (txtPrecioCosto * txtPorcentaje) / 100;
    
});
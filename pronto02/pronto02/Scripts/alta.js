function  calcularPrecio() {
    var txtPorcentaje = document.getElementById('txtPorcentaje');
    var txtPrecioCosto = document.getElementById('txtPrecioCosto');
    var txtPrecioVenta = document.getElementById('txtPrecioVenta');
    var valorCosto = txtPrecioCosto.value;
    var valorPorcentaje = txtPorcentaje.value;
    txtPrecioVenta.value = parseInt(valorCosto) + ((valorCosto * valorPorcentaje) / 100);
    
}
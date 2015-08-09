
function SetPrecio(boton) {
    if (window.opener != null && !window.opener.closed) {
        var txtPrecio = window.opener.document.getElementById("txtPrecio");
        var txtNombre = window.opener.document.getElementById("txtNombre");


        var valor = boton.parentElement.childNodes[1].innerText;

        var nombre = boton.parentElement.parentElement.children[1].innerText;
        txtPrecio.value = valor;
        txtNombre.value = nombre;
    }
    window.close();
}
/*$(document).ready(function () {
   // $('#<%=lblNoRecords.ClientID%>').css('display', 'none');
    $('#<%=btnSubmit.ClientID%>').click(function (e) {
   // $("#txtNombre").bind("input", function () {
        // Hide No records to display label.   
        //$('#<%=lblNoRecords.ClientID%>').css('display', 'none');
        //Hide all the rows.
        $("#<%=gdRows.ClientID%> tr:has(td)").hide();
        var iCounter = 0;
        //Get the search box value
        var sSearchTerm = $('#<%=txtNombre.ClientID%>').val();
        //if nothing is entered then show all the rows.
        if (sSearchTerm.length == 0) {
            $("#<%=GridView1.ClientID%> tr:has(td)").show();
            return false;
        }
        //Iterate through all the td.
        $("#<%=GridView1.ClientID%> tr:has(td)").children().each(function () {
            var cellText = $(this).text().toLowerCase();
            //Check if data matches
            if (cellText.indexOf(sSearchTerm.toLowerCase()) >= 0) {
                $(this).parent().show();
                iCounter++;
                return true;
            }
        });
       // if (iCounter == 0) {
       //     $('#<%=lblNoRecords.ClientID%>').css('display', '');
       // }
        e.preventDefault();

    })

})
*/
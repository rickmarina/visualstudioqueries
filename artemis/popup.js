$(document).ready(function () {

    function AceptarModificacionClick() {
        alert('aceptado');
    }

    dialog = $("#dialog-estacion-form").dialog({
        autoOpen: false,
        height: 200,
        width: 370,
        modal: true,
        buttons: {
            "Aceptar": AceptarModificacionClick,
            "Cancelar": function () {
                dialog.dialog("close");
            }

        },
        close: function () {

        }
    });

});

function abrirDialogoEstacion(pk) {
    dialog.dialog("open");
    document.getElementById("estacionpk").value = pk;
}
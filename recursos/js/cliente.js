var campos = $("#campos").val();
var contador_img = 0
var identificador = 0
var identificador_je = 0;

var c;
if (campos == "") {
    c = 1;
} else {
    c = parseInt(campos) + 1;
}

//var num =1;
var r = 1;
var rj = 1;
var d = 1;
var dn = 1;


$(document).ready(function () {

    $(".chosen").chosen({
        allowClear: true,
        width: "100%"
    });

});

function guardarcliente() {


    if ($('#tipo_cliente').val() == "") {
        var growlType = 'warning';
        $.bootstrapGrowl('<h4>Debe seleccionar un tipo de activo</h4>', {
            type: growlType,
            delay: 2500,
            allow_dismiss: true
        });
        return false
    }

    if ($('#razon_social_j').val() == "") {
        var growlType = 'warning';
        $.bootstrapGrowl('<h4>Debe seleccionar una descripcion</h4>', {
            type: growlType,
            delay: 2500,
            allow_dismiss: true
        });
        return false
    }

    if ($('#grupo_id_juridico').val() == "") {
        var growlType = 'warning';
        $.bootstrapGrowl('<h4>Debe seleccionar un grupo</h4>', {
            type: growlType,
            delay: 2500,
            allow_dismiss: true
        });
        return false
    }

    if ($('#ruc_j').val() == "") {
        var growlType = 'warning';
        $.bootstrapGrowl('<h4>Debe ingresar un subgrupo</h4>', {
            type: growlType,
            delay: 2500,
            allow_dismiss: true
        });
        return false
    }

    if ($('#telefono2').val() == "") {
        var growlType = 'warning';
        $.bootstrapGrowl('<h4>Debe seleccionar si esta asegurado</h4>', {
            type: growlType,
            delay: 2500,
            allow_dismiss: true
        });
        return false
    }

    if ($('#genero').val() == "") {
        var growlType = 'warning';
        $.bootstrapGrowl('<h4>Debe seleccionar si esta en mantenimiento</h4>', {
            type: growlType,
            delay: 2500,
            allow_dismiss: true
        });
        return false
    }



    var formData = $('#formagregar').serialize();

    $('#load_div').show()
    $.ajax({
        url: $('#base_url').val() + 'cliente/guardar',
        type: "post",
        dataType: "json",
        data: formData,
        success: function (data) {
            var modal = "clienteomodal";
            if (data.error == undefined) {

                var growlType = 'success';

                $.bootstrapGrowl('<h4>' + data.success + '</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                $("#agregar").modal('hide');
                if ($("#new_from_venta").val() == 1) {
                    $('#dialog_new_cliente').attr('data-id', data.cliente);
                    $('#dialog_new_cliente').modal('hide');
                    $('.modal-backdrop').remove();
                    $('#load_div').hide();
                }
                else {
                    return $.ajax({
                        url: $('#base_url').val() + 'cliente',
                        success: function (data) {
                            $('#page-content').html(data);
                            $('.modal-backdrop').remove();
                            $('#load_div').hide();
                        }

                    });
                }


            } else {

                var growlType = 'warning';

                $.bootstrapGrowl('<h4>' + data.error + '</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);
                $('.modal-backdrop').remove()
                $('#load_div').hide()
            }


        },
        error: function (response) {
            $('.modal-backdrop').remove()
            $('#load_div').hide()
            var growlType = 'warning';


            $.bootstrapGrowl('<h4>Ha ocurrido un error al realizar la operacion</h4>', {
                type: growlType,
                delay: 2500,
                allow_dismiss: true
            });

            $(this).prop('disabled', true);

        }


    });

}

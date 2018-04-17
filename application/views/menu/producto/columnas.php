<script type="application/javascript">
    var busq = $('#tags').val();
    var columna = {
        guardarCol : function () {
            $("#cargando_modal").modal('show');
            var ruta='<?= base_url(); ?>'
            $.ajax({
                url: ruta + 'producto/guardarcolumnas',
                type: "post",
                dataType: "json",
                data: $('#columnasform').serialize(),
                success: function (data) {
                    var callback = getproductosbylocal;
                    var modal = "columnas";
                    if (data.error == undefined) {
                        $('#columnas').modal('hide');
                        $.ajax({
                            url: ruta + 'producto',
                            success: function (data) {
                                $('#page-content').html(data);
                                busqueda(busq);
                            }
                        });

                        var growlType = 'success';

                        $.bootstrapGrowl('<h4>' + data.success + '</h4>', {
                            type: growlType,
                            delay: 2500,
                            allow_dismiss: true
                        });
                        } else {

                        $("#cargando_modal").modal('hide');
                        var growlType = 'warning';

                        $.bootstrapGrowl('<h4>' + data.error + '</h4>', {
                            type: growlType,
                            delay: 2500,
                            allow_dismiss: true
                        });

                        $(this).prop('disabled', true);
                        }



                    setTimeout(function () {
                        //$(".alert-danger").css('display','none');
                        $(".alert-success").css('display', 'none');
                    }, 3000)
                },
                error: function (response) {
                    $('#columnas').modal('hide');
                    var growlType = 'warning';
                    $.bootstrapGrowl('<h4>Ha ocurrido un error al realizar la operacion</h4>', {
                        type: growlType,
                        delay: 2500,
                        allow_dismiss: true
                    });

                    $(this).prop('disabled', true);

                }

            });
         //    App.formSubmitAjax($("#columnasform").attr('action'), getproductosbylocal, 'columnas', 'columnasform');
        }
    }

    function busqueda(param){
        $.ajax({
            url: '<?= base_url() ?>producto/producto_list',
            data: { 'id': param },
            type: 'POST',
            success: function(response){
                $("#tabla").html(response);
            },
            error: function(){
                $.bootstrapGrowl('<h4>Error.</h4> <p>Ha ocurrido un error en la operaci&oacute;n</p>', {
                    type: 'danger',
                    delay: 5000,
                    allow_dismiss: true
                });
                $("#tabla").html('');
            }
        });
    }
</script>
<form name="formagregar" id="columnasform" action="<?= base_url() ?>producto/guardarcolumnas" method="post">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Columnas</h4>
            </div>
            <div class="modal-body">

                <div class="table-responsive">

                    <table class='table dataTable table-bordered'>
                        <thead>
                        <tr>
                            <th>Columna</th>
                            <th>Activo</th>
                            <th>Mostrar</th>
                        </tr>
                        </thead>
                        <tbody>

                        <?php foreach ($columnas as $columna) { ?>
                            <tr>
                                <input type="hidden" name="columna_id[]" value="<?php echo $columna->id_columna ?>">
                                <td><?php echo $columna->nombre_mostrar; ?></td>
                                <td>
                                    <input type="checkbox" name="activo_<?= $columna->id_columna ?>"
                                        <?php if ($columna->activo == TRUE or ($columna->nombre_columna == 'producto_id' or $columna->nombre_columna == 'producto_nombre' or
                                                $columna->nombre_columna == 'producto_codigo_interno' or $columna->nombre_columna == 'producto_impuesto' or $columna->nombre_columna == 'producto_cualidad' or $columna->nombre_columna == 'producto_estado')
                                        ) echo 'checked' ?>
                                        <?php if ($columna->nombre_columna == 'producto_id' or $columna->nombre_columna == 'producto_codigo_interno' or
                                        $columna->nombre_columna == 'producto_nombre' or $columna->nombre_columna == 'producto_id' or $columna->nombre_columna == 'producto_impuesto' or $columna->nombre_columna == 'producto_cualidad' or $columna->nombre_columna == 'producto_estado'
                                    ) echo 'disabled' ?>>
                                </td>
                                <td>
                                    <input type="checkbox"
                                           name="mostrar_<?= $columna->id_columna ?>" <?php if ($columna->mostrar == TRUE) echo 'checked' ?> <?php if ($columna->nombre_columna == 'producto_estado') echo 'disabled' ?>>
                                </td>
                            </tr>
                        <?php } ?>


                        </tbody>
                    </table>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" id="submitcolumnas" class="btn btn-primary" onclick="columna.guardarCol()">
                    Confirmar
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

            </div>


        </div>
        <!-- /.modal-content -->
    </div>
</form>

<script src="<?php echo $ruta ?>recursos/js/pages/tablesDatatables.js"></script>
<script type="text/javascript">
    $(function () {
        TablesDatatables.init();


    });


</script>
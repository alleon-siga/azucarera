<?php $ruta = base_url(); ?>

<ul class="breadcrumb breadcrumb-top">
    <li>Inventario</li>
    <li><a href="">Traspasos de Almacen</a></li>
</ul>

<style>#dtras {
        margin-left: 10px;
    }</style>
<div class="row">
    <div class="col-xs-12">
        <div class="alert alert-success alert-dismissable" id="success"
             style="display:<?php echo isset($success) ? 'block' : 'none' ?>">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
            <h4><i class="icon fa fa-check"></i> Operaci&oacute;n realizada</h4>
            <span id="successspan"><?php echo isset($success) ? $success : '' ?></div>
        </span>
    </div>
</div>


<input type="hidden" id="producto_id"/>

<div class="row-fluid">
    <div class="span12">
        <div class="block">
            <form id="frmBuscar">
                <div class="block-title">
                </div>


                <?php if (count($locales) == 1): ?>
                    <div class="alert alert-warning" style="margin-bottom: 2px;">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">X</button>
                        Este Usuario tiene un solo inventaro. Por lo tanto
                        no puede realizar traspasos.
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-3">
                                <label class="panel-admin-text">Ubicaci&oacute;n Inventario:</label>
                            </div>
                            <div class="col-md-4">
                                <h4><?php echo $locales[0]['local_nombre'] ?></h4>
                            </div>
                        </div>
                    </div>

                <?php else: ?>
                    <div class="row">
                        <div class="form-group">
                            <label class="col-md-2 panel-admin-text">Local:</label>
                            <div class="col-md-4"><select class="form-control" id="locales" name="locales"
                                                          onchange="buscar()">
                                    <option value="TODOS" selected="selected">TODOS</option>
                                    <?php
                                    $i = 0;
                                    foreach ($locales as $local) {
                                        ?>
                                        <option value="<?= $local['int_local_id'] ?>" <?php //if ($i == 0) {
                                            //echo "selected";
                                            //$i++;
                                        //} ?> >
                                            <?= $local['local_nombre'] ?></option>
                                    <?php } ?>

                                </select>
                            </div>
                            <label class="col-md-2 panel-admin-text">Productos: </label>
                            <div class="col-md-4"><select onchange="buscar()" class="form-control"
                                                          id="productos_traspaso" name="productos_traspaso">
                                    <option value="TODOS" selected>TODOS</option>
                                    <?php if (count($productos) > 0):
                                        foreach ($productos as $producto): ?>
                                            <?php if ($n++ != 0): ?>
                                                <option
                                                    value="<?= $producto['producto_id'] ?>"><?= $producto['producto_nombre'] ?></option>
                                            <?php endif; ?>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </select></div>


                        </div>
                    </div>


                    <div class="row">
                        <label class="col-md-2 panel-admin-text">Desde:</label>
                        <div class="col-md-4">

                            <input type="text" name="fecIni" readonly onchange="buscar()" id="fecIni"
                                   value="<?= date('d-m-Y') ?>" class='input-small form-control input-datepicker'>
                        </div>
                        <label class="col-md-2 panel-admin-text">Hasta:</label>
                        <div class="col-md-4">
                            <input type="text" name="fecFin" readonly onchange="buscar()" id="fecFin"
                                   value="<?= date('d-m-Y') ?>" class='form-control input-datepicker'>
                        </div>

                    </div>

                    <div class="row">
                        <label class="col-md-2 panel-admin-text">Tipo de Movimiento:</label>
                        <div class="col-md-4">

                            <select onchange="buscar()" class="form-control" id="tipo_mov" name="tipo_mov">
                                <option value="TODOS" selected>TODOS</option>
                                <option value="2">ORIGEN</option>
                                <option value="1">DESTINO</option>
                            </select>
                        </div>

                    </div>

                <?php endif; ?>
            </form>
        </div>
    </div>
</div>


<div class="row-fluid">
    <div class="span12">
        <div class="block">
            <div class="block-title">

            </div>
            <div class="col-md-8"></div>
            <div class="col-md-4">
                <div id="dtras"><a id="traspasarProducto" class="btn btn-default" onclick="traspasarProducto()">
                        <i class="fa fa-tasks"></i> Traspasar >>
                    </a></div>
            </div>


            <div id="lstTabla" class="table-responsive"></div>
        </div>

        <div class="block-section">


            <div id="pp_excel">
                <form action="<?php echo $ruta; ?>exportar/toExcel_traspaso" name="frmExcel"
                      id="frmExcel" method="post">
                    <input type="hidden" name="fecIni" id="fecIni1" class='input-small'>
                    <input type="hidden" name="fecFin" id="fecFin1" class='input-small'>
                    <input type="hidden" name="local" id="local1" class='input-small'>
                    <input type="hidden" name="productos" id="producto1" class='input-small'>
                    <input type="hidden" name="tipo" id="tipo_mov1" class='input-small'>

                    <div id="abrir_local_excel"></div>
                </form>
            </div>
            <a href="#" onclick="generar_reporte_excel();" class=' btn btn-lg btn-default'
               title="Exportar a Excel"><i class="fa fa-file-excel-o"></i></a>

            <div id="pp_pdf">
                <form name="frmPDF" id="frmPDF"
                      action="<?php echo $ruta; ?>exportar/toPDF_traspaso" target="_blank"
                      method="post">
                    <input type="hidden" name="fecIni" id="fecIni2" class='input-small'>
                    <input type="hidden" name="fecFin" id="fecFin2" class='input-small'>
                    <input type="hidden" name="local" id="local2" class='input-small'>
                    <input type="hidden" name="productos" id="producto2" class='input-small'>
                    <input type="hidden" name="tipo" id="tipo_mov2" class='input-small'>
                    <div id="abrir_local_pdf"></div>
                </form>
            </div>
            <a href="#" onclick="generar_reporte_pdf();" class='btn btn-lg btn-default'
               title="Exportar a PDF"><i class="fa fa-file-pdf-o"></i> </a>

        </div>
    </div>
</div>


<div class="modal fade" id="advertencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true" data-backdrop="static" data-keyboard="false" style="z-index: 99999999;">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" onclick="cerrartransferir_advertencia()">&times;</button>
                <h4 class="modal-title">Advertencia</h4>
            </div>
            <div class="modal-body">
                <p>Si usted cambia el local de origen perderá todos los cambios</p>
            </div>
            <div class="modal-footer">
                <button type="button" id="confirmar" class="btn btn-primary" onclick="reiniciar_form()">Confirmar
                </button>
                <button type="button" class="btn btn-default" onclick="cerrartransferir_advertencia()">Cancelar</button>

            </div>
        </div>
    </div>
    <!-- /.modal-content -->


</div>

<div class="modal fade" id="confirmarcerrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <form name="" id="" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" onclick="hide_modal_cerrar()"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Confirmar</h4>
                </div>
                <div class="modal-body">
                    <p>Est&aacute; seguro que desea cerrar la ventana ?</p>
                    <input type="hidden" name="id" id="id_borrar">

                </div>
                <div class="modal-footer">
                    <button type="button" id="botoneliminar" class="btn btn-primary" onclick="confirmarcerrar()">
                        Confirmar
                    </button>
                    <button type="button" class="btn btn-default" onclick="hide_modal_cerrar()"> Cancelar</button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>

</div>

<div class="modal fade" id="traspasomodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="false" data-backdrop="static" data-keyboard="false">

</div>

<div class="modal fade" id="MsjPreg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" data-backdrop="static" data-keyboard="false" style="z-index: 999999999;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Transferir Mercancia</h4>
            </div>
            <div class="modal-body">
                <p>Est&aacute; seguro que desea transferir mercancia ?</p>
                <input type="hidden" name="id" id="id_borrar">
                <input type="hidden" name="nombre" id="nom_borrar">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="IrGuardar()">Confirmar
                </button>
                <button type="button" class="btn btn-default" onclick="cerrartransferir_mercancia()">Cancelar</button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>


<script src="<?php echo $ruta; ?>recursos/js/Validacion.js"></script>
<script type="text/javascript">
    var local1 = "";

    /*esta variable es para colocarla cuando se cancele el reiniciar el formulario de traspaso*/
    var local_anterior = ""
    var local_actual = ""
    var primer_cambio_local = false;
    function guardar() {
        if (lst_producto.length > 0) {
            $("#btn_confirmar").attr('disabled', 'disabled');
            var miJSON = JSON.stringify(lst_producto);

            $.ajax({
                url: '<?= $ruta?>traspaso/traspasar_productos',
                data: '&lst_producto=' + miJSON + '&local_destino=' + $("#localform2").val() + '&fecha_traspaso=' + $("#fecha_traspaso").val(),
                type: 'post',
                dataType: "json",
                success: function (data) {
                    var growlType = 'success';

                    $.bootstrapGrowl('<h4>Se ha procesado exitosamente</h4>', {
                        type: growlType,
                        delay: 1500,
                        allow_dismiss: true
                    });
                    $('#traspasomodal').modal('hide');

                    $("#btn_confirmar").removeAttr('disabled');
                    buscar();
                },
                error: function (data) {
                    var growlType = 'warning';

                    $.bootstrapGrowl('<h4>Error: Asegurase de realizar un ingreso previamente sobre el local destino</h4>', {
                        type: growlType,
                        delay: 1500,
                        allow_dismiss: true
                    });
                    $('#traspasomodal').modal('hide');
                    $("#btn_confirmar").removeAttr('disabled');
                }
            });
        }

    }
    function cerrartransferir_advertencia() {

        local_anterior = local_actual;
        //local_actual=$("#localform1").val();
        $("#localform1").val(local_anterior);
        $("#localform1").trigger("chosen:updated");
        $('#advertencia').modal('hide');
    }


    function traspasarProducto() {
        $("#cargando_modal").modal({
            show: true
        });


        $("#traspasomodal").load('<?= $ruta ?>traspaso/form', function () {
            setTimeout(function(){
                $("#cargando_modal").modal('hide');
                $('#traspasomodal').modal('show');
                primer_cambio_local = false;
                local_anterior = $("#localform1").val();
                local_actual = $("#localform1").val();
            }, 5);

        });
    }

    function mostrar_advertencia() {

        $('#advertencia').modal('show');

    }


    function productos_porlocal_almacen() {
        $("#loading").show();
        $.ajax({
            type: 'POST',
            data: {'local': $('#localform1').val()},
            dataType: 'json',
            url: '<?php echo base_url();?>' + 'traspaso/productos_porlocal_almacen',
            success: function (data) {

                var productos = data.productos;
                var html = '<option  value="" selected>Seleccione el Producto</option>'

                for (var i = 0; i < productos.length; i++) {
                    html += '<option value="' + productos[i]["producto_id"] + '"> ' + productos[i]["producto_nombre"] + ' </option>'
                }

                $("#select_prodc").html('')
                $("#select_prodc").html(html)
                $("#select_prodc").trigger("chosen:updated");
                getSecondLocal();


                $("#loading").hide();
            },
            error: function () {
                $("#loading").hide();

            }
        });


    }

    function getSecondLocal() {
        local1 = $("#localform1");
        $("#localform2").html(local1.html());
        $("#localform2 option[value='" + local1.val() + "']").remove();
        $("#localform2").trigger("chosen:updated");
        $("#cargando_modal").modal('hide');
    }


    function buscar() {
        $('#cargando_modal').modal('show')
        document.getElementById('fecIni1').value = $("#fecIni").val();
        document.getElementById('fecFin1').value = $("#fecFin").val();
        document.getElementById('fecIni2').value = $("#fecIni").val();
        document.getElementById('fecFin2').value = $("#fecFin").val();
        document.getElementById('producto1').value = $("#productos_traspaso").val();
        document.getElementById('producto2').value = $("#productos_traspaso").val();
        document.getElementById('local1').value = $("#locales").val();
        document.getElementById('local2').value = $("#locales").val();
        document.getElementById('tipo_mov1').value = $("#tipo_mov").val();
        document.getElementById('tipo_mov2').value = $("#tipo_mov").val();

        $.ajax({
            type: 'POST',
            data: $('#frmBuscar').serialize(),
            url: '<?php echo base_url();?>' + 'traspaso/lst_reg_traspasos',
            success: function (data) {

                $("#lstTabla").html(data);

            },
            error: function () {
                $('#cargando_modal').modal('hide')

            }
        });

    }

    function generar_reporte_excel() {
        document.getElementById("frmExcel").submit();
    }

    function generar_reporte_pdf() {
        document.getElementById("frmPDF").submit();
    }

    function confirmarcerrar() {
        $("#confirmarcerrar").modal('hide');
        $("#traspasomodal").modal('hide');
    }

</script>

<!-- Load and execute javascript code used only in this page -->
<script src="<?php echo $ruta ?>recursos/js/pages/tablesDatatables.js"></script>

<script>
    $(function () {
        TablesDatatables.init();

        $('select').chosen();
        $("#traspasomodal").on('hidden.bs.modal', function () {
            $('#traspasomodal').html('')
        });

        $("#pp_excel").hide();
        $("#pp_pdf").hide();

        $("#btnBuscar").on('click', function () {
            buscar();

        });
        buscar();


        /*
         NO DESOMENTAR ESTO
         $('body').keydown(function (e) {
         console.log(e.keyCode );

         if (e.keyCode == 27) {
         e.preventDefault();


         if($("#productomodal").is(':visible'))
         {
         $("#confirmarcerrar").modal('show');
         }

         }
         });*/
    });

    function hide_modal_cerrar() {
        $("#confirmarcerrar").modal('hide');
    }


</script>

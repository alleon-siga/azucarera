<input type="hidden" id="tasa_interes" value="<?= valueOption('CREDITO_TASA', 0) ?>">
<input type="hidden" id="saldo_porciento" value="<?= valueOption('CREDITO_INICIAL', 0) ?>">
<input type="hidden" id="max_cuotas" value="<?= valueOption('CREDITO_CUOTAS', 10) ?>">
<input type="hidden" id="numero_cuotas" value="1">
<input type="hidden" id="periodo_pago" value="4">
<input type="hidden" id="proyeccion_rango" value="1">
<input type="hidden" id="c_venta_estado" value="COMPLETADO">
<?php if (validOption("VISTA_CREDITO", 'AVANZADO', 'SIMPLE')): ?>
<div class="modal-dialog" style="width: 75%;">
    <div class="modal-content">
        <div class="modal-header">
            <h4>Venta al Cr&eacute;dito</h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-md-8">
                    <div class="block block-section">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="control-label panel-admin-text">Cliente:</label>
                            </div>

                            <div class="col-md-9">
                                <input type="text"
                                       class='form-control'
                                       name="c_cliente" id="c_cliente"
                                       value="" readonly="">

                            </div>

                            <!--<div class="col-md-1">
                                <label class="control-label panel-admin-text">Garante:</label>
                            </div>

                            <div class="col-md-5">
                                <div class="input-group">
                                    <select id="c_garante" name="c_garante"
                                            data-placeholder="Seleccione el Garante">
                                        <option value=""></option>
                                        <?php foreach ($garantes as $garante): ?>
                                            <option value="<?= $garante->dni ?>"
                                                    data-nombre="<?= $garante->nombre_full ?>"><?= $garante->dni ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                    <a href="#" class="input-group-addon btn-default">
                                        <i class="fa fa-plus-circle"></i>
                                    </a>
                                </div>
                                <label class="control-label">Nombre:</label> <span id="c_garante_nombre"></span>
                            </div>-->
                        </div>

                        <hr class="hr-margin-10">

                        <div class="row">
                            <div class="col-md-7">
                                <h4>Cronograma de Pagos</h4>

                                <div class="row">
                                    <div class="col-md-5">
                                        <label class="control-label panel-admin-text">Fecha de Giro:</label>
                                    </div>

                                    <div class="col-md-7">
                                        <div class="input-group">
                                            <input type="text" style="font-weight: bold;"
                                                   class='form-control date-picker'
                                                   name="c_fecha_giro" id="c_fecha_giro" value="<?= date('d/m/Y') ?>"
                                                   readonly>

                                            <input type="hidden" id="last_fecha_giro" value="<?= date('d/m/Y') ?>">
                                        </div>
                                    </div>
                                </div>

                                <br>

                                <table class="table table-bordered table-cuotas">
                                    <thead>
                                    <tr>
                                        <th>Nro Letra</th>
                                        <th>Fecha Vencimiento</th>
                                        <th>Monto a Pagar</th>
                                    </tr>
                                    <tr>
                                    </tr>
                                    </thead>
                                    <tbody id="body_cuotas">

                                    </tbody>

                                </table>

                            </div>
                            <div class="col-md-5">
                                <h4>Proyeciones de Pago</h4>

                                <div class="row">
                                    <div class="col-md-3">
                                        <label class="control-label panel-admin-text">Rango:</label>
                                    </div>

                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <input type="number" style="text-align: center; padding: 0"
                                                       class='form-control'
                                                       max="<?= valueOption('MAXIMO_CUOTAS_CREDITO', 10) - 4 ?>"
                                                       min="1"
                                                       name="c_rango_min" id="c_rango_min" value="1">
                                            </div>

                                            <div class="col-md-2 text-center" style="padding-top: 10px;">-</div>

                                            <div class="col-md-5">
                                                <input type="text" style="text-align: center;"
                                                       class='form-control'
                                                       name="c_rango_max" id="c_rango_max" value="5" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br>

                                <table style="cursor: pointer;"
                                       class="table table-proyeccion">
                                    <thead>
                                    <tr>
                                        <th>Nro Cuotas</th>
                                        <th>Monto</th>
                                    </tr>
                                    <tr>
                                    </tr>
                                    </thead>
                                    <tbody id="body_proyeccion_cuotas">

                                    </tbody>

                                </table>

                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-4">
                    <div class="block block-section venta-right venta_input">

                        <div class="row">
                            <div class="col-md-5 label-title">
                                <label class="control-label">Precio Contado:</label>
                            </div>

                            <div class="col-md-7">
                                <div class="input-group">
                                    <div class="input-group-addon tipo_moneda"><?= MONEDA ?></div>
                                    <input type="text" style="text-align: right; font-weight: bold;"
                                           class='form-control'
                                           name="c_precio_contado" id="c_precio_contado" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5 label-title">
                                <label class="control-label">Precio Cr&eacute;dito:</label>
                            </div>

                            <div class="col-md-7">
                                <div class="input-group">
                                    <div class="input-group-addon tipo_moneda"><?= MONEDA ?></div>
                                    <input type="text" style="text-align: right; font-weight: bold;"
                                           class='form-control'
                                           name="c_precio_credito" id="c_precio_credito" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5 label-title">
                                <label class="control-label">Saldo Inicial:</label>
                            </div>

                            <div class="col-md-7">
                                <div class="input-group">
                                    <div class="input-group-addon tipo_moneda"><?= MONEDA ?></div>
                                    <input type="text" style="text-align: right; padding-right: 2px;"
                                           class='form-control'
                                           name="c_saldo_inicial" id="c_saldo_inicial"
                                           value="">
                                    <div class="input-group-addon" style="padding: 0; font-weight: bold;">
                                        <input type="text"
                                               style=" text-align: right; width: 40px; height: 30px; margin: 0; margin-left: 5px; padding: 0; padding-right: 2px; border: 1px solid #fff;"
                                               name="c_saldo_inicial_por" id="c_saldo_inicial_por"
                                               value="<?= valueOption('INICIAL_PORCENTAJE_VTA_CRED', 0) ?>">%
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5 label-title">
                                <label class="control-label">Tasa Interes:</label>
                            </div>

                            <div class="col-md-7">
                                <div class="input-group">
                                    <input type="text"
                                           class='form-control'
                                           name="c_tasa_interes" id="c_tasa_interes"
                                           value="<?= valueOption('TASA_INTERES', 0) ?>"
                                           onkeydown="return soloDecimal(this, event);">
                                    <div class="input-group-addon">%</div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5 label-title">
                                <label class="control-label">Nro Cuotas:</label>
                            </div>

                            <div class="col-md-7">
                                <div class="input-group">
                                    <input type="number"
                                           max="<?= valueOption('MAXIMO_CUOTAS_CREDITO', 10) ?>"
                                           min="1"
                                           class='form-control'
                                           name="c_numero_cuotas" id="c_numero_cuotas"
                                           value="1">
                                    <div class="input-group-addon">
                                        MAX: <?= valueOption('MAXIMO_CUOTAS_CREDITO', 10) ?></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5 label-title">
                                <label class="control-label">Periodo de Pago:</label>
                            </div>

                            <div class="col-md-7">
                                <select id="c_pago_periodo" name="c_pago_periodo">
                                    <option value="1">Diario</option>
                                    <option value="2">Interdiario</option>
                                    <option value="3">Semanal</option>
                                    <option value="4">Mensual</option>
                                    <option value="5">Personalizado</option>
                                </select>
                            </div>
                        </div>

                        <div id="c_dia_pago_block" class="row">

                            <div class="col-md-5 label-title">
                                <label id="c_dia_pago_letra" class="control-label">D&iacute;as de Pago:</label>
                            </div>

                            <div class="col-md-7">
                                <input type="text"
                                       class='form-control'
                                       name="c_dia_pago" id="c_dia_pago" value=""
                                       onkeydown="return soloDecimal(this, event);">
                            </div>
                        </div>


                    </div>
                </div>


            </div>
            <div class="modal-footer">

                <div class="row">
                    <div class="col-md-6">
                        <div class="row" style="text-align: left;">
                            <div class="col-md-6">
                                <h4>Total Deuda: <span class="tipo_moneda"><?= MONEDA ?></span> <span
                                        id="c_total_deuda">0</span></h4>
                            </div>
                            <div class="col-md-6">
                                <h4>Total Saldo: <span class="tipo_moneda"><?= MONEDA ?></span> <span
                                        id="c_total_saldo">0</span></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <button class="btn btn-default save_venta_credito" data-imprimir="0"
                                type="button"
                                id="btn_venta_credito"><i
                                class="fa fa-save"></i> Guardar


                        </button>
                        <button type="button" class="btn btn-default save_venta_credito ocultar_caja" data-imprimir="1"
                                id="btn_venta_credito_imprimir"
                        ><i
                                class="fa fa-print"></i> (F6) Grabar e imprimir
                        </button>
                        <button type="button" class="btn btn-danger"
                                onclick="$('#dialog_venta_credito').modal('hide');"><i
                                class="fa fa-close"></i> Cancelar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php elseif (validOption("VISTA_CREDITO", 'SIMPLE', 'SIMPLE')): ?>
        <div class="modal-dialog" style="width: 40%">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Venta al Credito Simple</h4>
                </div>
                <div class="modal-body panel-venta-left">


                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-3">
                                <label for="totApagar2" class="control-label panel-admin-text">Total a Pagar:</label>
                            </div>
                            <div class="col-md-9">
                                <div class="input-prepend input-append input-group">
                                    <label class="input-group-addon tipo_moneda"><?= MONEDA ?></label><input
                                        type="number"
                                        class='input-square input-small form-control'
                                        min="0.0"
                                        step="0.1"
                                        value="0.0"
                                        id="c_precio_contado"
                                        name="c_precio_contado"
                                        readonly
                                        onkeydown="return soloDecimal(this, event);">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-3">
                                <label for="totApagar2" class="control-label panel-admin-text">Pago a cuenta:</label>
                            </div>
                            <div class="col-md-9">
                                <div class="input-prepend input-append input-group">
                                    <label class="input-group-addon tipo_moneda"><?= MONEDA ?></label><input
                                        type="number"
                                        class='input-square input-small form-control'
                                        min="0.0"
                                        step="0.1"
                                        value="0.0"
                                        id="c_pago_cuenta"
                                        name="c_pago_cuenta"
                                        onkeydown="return soloDecimal(this, event);">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-3">
                                <label for="totApagar2" class="control-label panel-admin-text">Monto Restante:</label>
                            </div>
                            <div class="col-md-9">
                                <div class="input-prepend input-append input-group">
                                    <label class="input-group-addon tipo_moneda"><?= MONEDA ?></label><input
                                        type="number"
                                        class='input-square input-small form-control'
                                        min="0.0"
                                        step="0.1"
                                        value="0.0"
                                        id="c_deuda_restante"
                                        name="c_deuda_restante"
                                        readonly
                                        onkeydown="return soloDecimal(this, event);">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">

                    <div class="row">
                        <div class="col-md-12">
                            <button class="btn btn-default save_venta_credito" style="margin-bottom:5px" type="button"
                                    id="btn_venta_credito_simple" data-imprimir="0"><i
                                    class="fa fa-save"></i>Guardar
                            </button>

                            <a href="#" class="btn btn-default save_venta_credito ocultar_caja" style="margin-bottom:5px"
                               id="btn_venta_credito_simple_imprimir" data-imprimir="1" type="button"><i
                                    class="fa fa-print"></i> (F6)Guardar e imprimir
                            </a>
                            <button class="btn btn-default" style="margin-bottom:5px"
                                    type="button"
                                    onclick="$('#dialog_venta_credito').modal('hide');"><i
                                    class="fa fa-close"></i> Cancelar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="advertencia" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false"
             aria-hidden="true">

            <div class="modal-dialog" style="width: 40%">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Advertencia</h4>
                    </div>
                    <div class="modal-body panel-venta-left">

                        <div class="row">
                            <div class="col-md-12">
                                <h4>La cuenta a pagar es igual o mayor que el total del importe. Le recomendamos
                                    realizar
                                    una venta al contado.</h4>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <div class="row">
                                <div class="col-md-12">
                                    <input type="hidden" id="pago_cuenta_saved" value="">
                                    <button class="btn btn-primary" style="margin-bottom:5px" type="button"
                                            id="realizarventa_exec"
                                            onclick="cambiar_contado();">Hacer Venta al Contado
                                    </button>

                                    <button class="btn btn-danger" style="margin-bottom:5px"
                                            type="button"
                                            onclick="$('#advertencia').modal('hide');">Cancelar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    <?php endif; ?>
    <div style="display: none;" id="credito_vista"
         data-vista="<?php echo validOption("VISTA_CREDITO", 'SIMPLE', 'SIMPLE') ? 'SIMPLE' : 'AVANZADO' ?>"></div>
    <script>


        $(document).ready(function () {

            $(document).keyup(function (e) {

                if (e.keyCode == 117 && $("#dialog_venta_credito").is(":visible") == true && $("#venta_estado").val() == 'COMPLETADO') {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    $('.save_venta_credito[data-imprimir="1"]').first().click();
                }
            });

            $('.save_venta_credito').on('click', function () {
                if ($("#c_venta_estado").val() == 'COMPLETADO')
                    save_venta_credito($(this).attr('data-imprimir'));
                else {
                    $("#dialog_venta_credito").modal('hide');
                    caja_init(formatPrice($("#c_saldo_inicial").val()));
                }

            });


            $("#c_tasa_interes, #c_numero_cuotas, #c_saldo_inicial_por, #c_dia_pago").on('keyup', function () {
                refresh_credito_window(1);
            });

            $('#c_numero_cuotas, #c_rango_min').bind('keyup change click mouseleave', function () {
                var min = isNaN(parseInt($("#c_rango_min").val())) ? 1 : parseInt($("#c_rango_min").val());
                $("#c_rango_max").val(parseInt(min + 4));
                refresh_credito_window(1);
            });

            $("#c_saldo_inicial").on('keyup', function () {
                refresh_credito_window(2);
            });

            $("#c_saldo_inicial_por").on('keydown', function (e) {
                var tecla = e.key;
                if (isNaN(parseFloat($(this).val() + tecla)))
                    return false;

                if (parseFloat($(this).val() + tecla) > 100 || parseFloat($(this).val() + tecla) < 0)
                    return false;

                return soloDecimal($(this), e);
            });

            $("#c_saldo_inicial").on('keydown', function (e) {
                var tecla = e.key;
                if (isNaN(parseFloat($(this).val() + tecla)))
                    return false;

                if (parseFloat($(this).val() + tecla) > parseFloat($('#c_precio_contado').val()) || parseFloat($(this).val() + tecla) < 0)
                    return false;

                return soloDecimal($(this), e);

            });

            $("#c_numero_cuotas, #c_rango_min").on('keydown', function (e) {
                var tecla = e.key;
                if (isNaN(parseInt($(this).val() + tecla)))
                    return false;
                if (parseInt($(this).val() + tecla) > parseInt($(this).attr('max')) || parseInt($(this).val() + tecla) <= 0)
                    return false;
                return soloNumeros(e);
            });

            $("#c_dia_pago").on('keydown', function (e) {
                var tecla = e.key;
                if (isNaN(parseInt($(this).val() + tecla)))
                    return false;
                if (parseInt($(this).val() + tecla) <= 0)
                    return false;
                return soloNumeros(e);
            });

            $("#c_pago_periodo").on('change', function () {
                var pago_periodo = $(this).val();

                switch (pago_periodo) {
                    case '1':
                    {
                        $("#c_dia_pago_block").hide();
                        break;
                    }
                    case '2':
                    {
                        $("#c_dia_pago_block").hide();
                        break;
                    }
                    case '3':
                    {
                        $("#c_dia_pago_block").hide();
                        break;
                    }
                    case '4':
                    {
                        var dia = $("#c_fecha_giro").val().split('/');
                        $("#c_dia_pago_letra").html("D&iacute;as de Pago:");
                        $("#c_dia_pago").val(dia[0]);
                        $("#c_dia_pago_block").show();
                        break;
                    }
                    case '5':
                    {
                        $("#c_dia_pago_letra").html("Periodos de D&iacute;as:");
                        $("#c_dia_pago").val("1");
                        $("#c_dia_pago_block").show();
                        break;
                    }
                }

                refresh_credito_window(1);
            });

            $("#c_garante").on('change', function () {
                $("#c_garante_nombre").html($("#c_garante option:selected").attr('data-nombre'));
            });
        });

        function credito_init(precio_contado, estado) {
            $("#c_precio_contado").val(precio_contado);
            $("#c_tasa_interes").val($("#tasa_interes").val());
            $("#c_saldo_inicial_por").val($("#saldo_porciento").val());
            $("#c_numero_cuotas").attr('max', $("#max_cuotas").val());
            $("#c_numero_cuotas").val($("#numero_cuotas").val());
            $("#c_rango_min").val($("#proyeccion_rango").val());
            $("#c_venta_estado").val(estado);

            //ojo
            setTimeout(function () {
                $("#c_pago_periodo").val('4').trigger('chosen:updated');
                $("#c_pago_periodo").change();
            }, 500);


            //ojo inicializar garante tambien
        }

        function refresh_credito_window(trigger) {

            var precio_contado = parseFloat($("#c_precio_contado").val());
            var tasa_interes = isNaN(parseFloat($("#c_tasa_interes").val())) ? 0 : parseFloat($("#c_tasa_interes").val());

            var precio_credito = parseFloat(((precio_contado * tasa_interes) / 100) + precio_contado);
            $("#c_precio_credito").val(formatPrice(precio_credito));

            if (trigger == 1 || trigger == undefined) {
                var saldo_porciento = isNaN(parseFloat($("#c_saldo_inicial_por").val())) ? 0 : parseFloat($("#c_saldo_inicial_por").val());
                var saldo_inicial = parseFloat((precio_credito * saldo_porciento) / 100);
                $("#c_saldo_inicial").val(formatPrice(saldo_inicial));
            }
            else if (trigger == 2) {
                var saldo_inicial = isNaN(parseFloat($("#c_saldo_inicial").val())) ? 0 : parseFloat($("#c_saldo_inicial").val());
                var saldo_porciento = parseFloat((saldo_inicial * 100) / precio_credito);
                $("#c_saldo_inicial_por").val(parseFloat(saldo_porciento).toFixed(2));
            }


            $("#c_total_deuda").html(formatPrice(precio_credito));
            $("#c_total_saldo").html(formatPrice(precio_credito - saldo_inicial));

            generar_proyeccion(precio_credito - saldo_inicial);

            generar_cuotas(parseInt($("#c_numero_cuotas").val()), precio_credito - saldo_inicial);

            $('#body_proyeccion_cuotas tr').removeClass('table-selected');
            $('#body_proyeccion_cuotas tr[data-cuota="' + $("#c_numero_cuotas").val() + '"]').addClass('table-selected');

        }

        function generar_proyeccion(saldo) {
            var min = isNaN(parseInt($("#c_rango_min").val())) ? 1 : parseInt($("#c_rango_min").val());
            var max = $("#c_rango_max").val();
            var body = $("#body_proyeccion_cuotas");

            body.html("");
            for (var i = min; i <= max; i++) {

                var template = '<tr class="proyeccion_cuota" data-cuota="' + i + '">';
                template += '<td style="text-align: center;">' + i + '</td>';
                template += '<td style="text-align: right;">' + $('.tipo_moneda').first().html() + ' ' + formatPrice(saldo / i) + '</td>';
                template += '</tr>';

                body.append(template);
            }

            $('.proyeccion_cuota').on('click', function () {
                $("#c_numero_cuotas").val($(this).attr('data-cuota'));
                refresh_credito_window(1);
            });

        }

        function generar_cuotas(numero_cuotas, saldo) {
            $('#last_fecha_giro').val($("#c_fecha_giro").val());
            var body = $("#body_cuotas");
            var monto = formatPrice(saldo / numero_cuotas);

            body.html("");
            for (var i = 0; i < numero_cuotas; i++) {


                var template = '<tr>';
                template += '<td id="c_cuota_letra_' + i + '">' + (i + 1) + ' / ' + numero_cuotas + '</td>';
                template += '<td id="c_cuota_fecha_' + i + '">' + get_fecha_vencimiento(i + 1, $("#c_pago_periodo").val()) + '</td>';
                template += '<td style="text-align: right;">' + $('.tipo_moneda').first().html() + ' <span id="c_cuota_monto_' + i + '">' + monto + '</span></td>';
                template += '</tr>';

                body.append(template);
            }
        }

        function get_fecha_vencimiento(index, type) {
            var fecha = $('#last_fecha_giro').val().split('/');
            var next = new Date(fecha[2], fecha[1] - 1, fecha[0]);

            switch (type) {
                case '1':
                {
                    
                    next.setDate(next.getDate() + 1);
                    break;
                }
                case '2':
                {

                    next.setDate(next.getDate() + 2);
                    break;
                }
                case '3':
                {
                    next.setDate(next.getDate() + 7);
                    break;
                }
                case '4':
                {

                    next.setMonth(next.getMonth() + 1);
                    var dia_mes = isNaN(parseInt($("#c_dia_pago").val())) ? 1 : parseInt($("#c_dia_pago").val());
                    next.setDate(dia_mes);
                    break;
                }
                case '5':
                {
                    var dia_mes = isNaN(parseInt($("#c_dia_pago").val())) ? 1 : parseInt($("#c_dia_pago").val());
                    next.setDate(next.getDate() + dia_mes);
                    break;
                }
            }

            if (next.getDay() == 0){
                next.setDate(next.getDate() + 1);
            }

            var last_fecha = get_numero_dia(next.getDate()) + '/' + get_numero_mes(next.getMonth()) + '/' + next.getFullYear();
            $('#last_fecha_giro').val(last_fecha);

            return last_fecha;
        }

        function prepare_cuotas() {
            var cuotas = [];
            var numero_coutas = parseInt($("#c_numero_cuotas").val());

            for (var i = 0; i < numero_coutas; i++) {
                var cuota = {};
                cuota.letra = $("#body_cuotas #c_cuota_letra_" + i).html().trim();
                cuota.fecha = $("#body_cuotas #c_cuota_fecha_" + i).html().trim();
                cuota.monto = $("#body_cuotas #c_cuota_monto_" + i).html().trim();

                cuotas.push(cuota);
            }

            return JSON.stringify(cuotas);
        }


    </script>

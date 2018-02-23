<?php $ruta = base_url(); ?>
<style>
    #tablaresult th {
        font-size: 11px !important;
        padding: 6px 2px;
        text-align: center;
        vertical-align: middle;
    }

    #tablaresult td {
        font-size: 10px !important;
    }
</style>
<!--<script src="<?php echo $ruta; ?>recursos/js/custom.js"></script>-->

<?php if(count($lstproveedor) > 0):?>
    <br>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-3">
            <label>Total: <span class="tipo_moneda"></span> <span
                        id="subtotal"><?= number_format($ingreso_totales->monto_venta, 2) ?></span></label>
        </div>
        <div class="col-md-3">
            <label>Total Abonado: <span class="tipo_moneda"></span> <span id="impuesto"><?= number_format($ingreso_totales->monto_pagado, 2) ?></span></label>
        </div>
        <div class="col-md-3">
            <label>Deuda Actual: <span class="tipo_moneda"></span> <span id="total"><?= number_format($ingreso_totales->monto_venta - $ingreso_totales->monto_pagado, 2) ?></span></label>
        </div>
    </div>

    <table class='table table-striped dataTable table-bordered tableStyle' id="tablaresult" name="tablaresult">
        <thead>
        <tr>
            <th>ID</th>
            <th>Tipo</th>
            <th>Documento</th>
            <th>Proveedor</th>
            <th>Fecha Compra</th>
            <th>Monto Venta</th>
            <th>Monto Pagado</th>
            <th>Saldo Deuda</th>
            <th>Días de atraso</th>
            <th>Accion</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($lstproveedor as $p): ?>
            <tr>
                <td><?= $p->ingreso_id ?></td>
                <td><?= $p->documento_nombre ?></td>
                <td><?= $p->documento_serie . ' - ' . $p->documento_numero ?></td>
                <td><?= $p->proveedor_nombre ?></td>
                <td><?= date('d/m/Y', strtotime($p->fecha_emision)) ?></td>
                <td><?= $p->simbolo.' '.number_format($p->monto_venta, 2) ?></td>
                <td><?= $p->simbolo.' '.number_format($p->monto_pagado, 2) ?></td>
                <td><?= $p->simbolo.' '.number_format($p->monto_venta - $p->monto_pagado, 2) ?></td>
                <td><?= $p->atraso ?></td>
                <td>
                    <a class='btn btn-xs btn-default tip' title="Ver Venta"
                       onclick="visualizar(<?= $p->ingreso_id ?>)"><i
                                class="fa fa-search"></i> Ver</a>

                    <a onclick="pagar_venta(<?= $p->ingreso_id ?>)" class='btn btn-xs btn-default tip'
                       title="Pagar"><i
                                class="fa fa-paypal"></i>
                        Pagar</a>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
<?php else:?>
    <h4>No hay resultados</h4>
<?php endif;?>

<!-- Seccion Visualizar -->
<div class="modal fade" id="visualizar_venta" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">


</div>
<!--- ----------------- -->

<!-- Pagar Visualizar -->
<div class="modal fade" id="pagar_venta" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">


</div>
<!--- ----------------- -->

<script type="text/javascript">


    $(document).ready(function () {
        TablesDatatables.init();

    });


    function pagar_venta(id) {

        $("#cargando_modal").modal('show');

        $.ajax({
            url: '<?= base_url()?>ingresos/ver_deuda',
            type: 'post',
            data: {'id_ingreso': id},
            success: function (data) {

                $("#pagar_venta").html(data);
                $('#pagar_venta').modal('show');
                $("#cargando_modal").modal('hide');
            }

        })

    }

    function cerrar_visualizar() {

        $('#visualizarPago').modal('hide');
        $('#pagar_venta').modal('hide');
        buscar();
    }
    function visualizar(id) {
        $("#cargando_modal").modal('show');
        $.ajax({
            url: '<?= base_url()?>ingresos/vertodoingreso',
            type: 'post',
            data: {'id_ingreso': id},
            success: function (data) {

                $("#visualizar_venta").html(data);
                $('#visualizar_venta').modal('show');
                $("#cargando_modal").modal('hide');
            }

        })
    }
</script>
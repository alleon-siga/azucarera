
<input type="hidden" id="local_selected" value="">
<div class="table-responsive">

    <table class="table table-striped dataTable table-bordered tableStyle" id="table">
        <thead>
        <tr>
            <th><?= getCodigoNombre() ?></th>
            <?= $barra_activa->activo == 1 ? '<th>Código Barra</th>' : ''?>
            <th>Nombre</th>
            <th>Cantidad</th>
            <th>Fracción</th>
            <th>Cantidad Minima</th>
            <?php if ($local_id == ""): ?>
                <th>Ubicaci&oacute;n</th>
            <?php endif; ?>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($productos as $p): ?>
            <tr>
                <td><?= getCodigoValue(sumCod($p->producto_id), $p->producto_ci) ?></td>
                <td><?= $p->barra?></td>
                <td><?= $p->producto_nombre ?></td>
                <td><?= $p->cantidad . " " . $p->unidad_max_abr ?></td>
                <td><?= $p->fraccion . " " . $p->unidad_min_abr ?></td>
                <td><?= $p->cantidad_min . " " . $p->unidad_min_abr ?></td>
                <?php if ($local_id == ""): ?>
                    <td><?= $p->local_nombre ?></td>
                <?php endif; ?>
                <td>
                    <a href="#" onclick="ver_detalle('<?= $p->producto_id ?>');">
                        <i class="fa fa-search"></i>
                    </a>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>




<script>
    $(function () {
        TablesDatatables.init();
    });

    function ver_detalle(producto_id) {

        var mes, year, dia_min, dia_max;
        var local_id = $("#local_id").val();
        if ($("#mes").val() != "") {
            mes = $("#mes").val();
        }
        else
            return false;

        if ($("#year").val() != "") {
            year = $("#year").val();
        }
        else
            return false;

        if ($("#dia_min").val() != "") {
            dia_min = $("#dia_min").val();
        }
        else
            return false;

        if ($("#dia_max").val() != "") {
            dia_max = $("#dia_max").val();
        }
        else
            return false;

        $('#detalle_modal').html($('#load_div').html());
        $('#detalle_modal').modal('show');
        $("#detalle_modal").load('<?= base_url()?>kardex/get_kardex/' + producto_id + '/' + local_id + '/' + mes + '/' + year + '/' + dia_min + '/' + dia_max);
    }
</script>
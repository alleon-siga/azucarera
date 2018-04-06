<?php
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=costo_inventario.xls");
header("Pragma: no-cache");
header("Expires: 0");
?>
<h4 style="text-align: center; margin: 0;">Reporte de costo de inventario</h4>

<h5 style="margin: 0;">EMPRESA: <?= valueOption('EMPRESA_NOMBRE') ?></h5>
<h5 style="margin: 0;">DIRECCI&Oacute;N: <?= $local_direccion ?></h5>
<h5 style="margin: 0;">SUCURSAL: <?= $local_nombre ?></h5>
<table border="1">
    <thead>
        <tr>
            <th>Id</th>
            <th>Almac&eacute;n</th>
            <th>Proveedor</th>
            <th>Grupo</th>
            <th>Familia</th>
            <th>L&iacute;nea</th>
            <th>Marca</th>
            <th>Total</th>
        </tr>
    </thead>
    <tbody>
    <?php
    $sumTotal = 0;
    ?>
    <?php foreach ($lists as $list): ?>
    <?php
        $sumTotal += $list->total;
    ?>
        <tr>
            <td><?= $list->int_local_id ?></td>
            <td><?= $list->local_nombre ?></td>
            <td><?= $list->proveedor_nombre ?></td>
            <td><?= $list->nombre_grupo ?></td>
            <td><?= $list->nombre_familia ?></td>
            <td><?= $list->nombre_linea ?></td>
            <td><?= $list->nombre_marca ?></td>
            <td style="text-align: right;"><?= number_format($list->total, 2) ?></td>
        </tr>
    <?php endforeach ?>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="7">TOTALES</td>
        <td style="text-align: right;"><?= number_format($sumTotal, 2) ?></td>
    </tr>
    </tfoot>
</table>

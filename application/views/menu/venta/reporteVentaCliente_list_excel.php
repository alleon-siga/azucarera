<?php
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=venta_x_cliente.xls");
header("Pragma: no-cache");
header("Expires: 0");
?>
<h4 style="text-align: center; margin: 0;">Reporte de ventas por cliente</h4>
<h4 style="text-align: center; margin: 0;">Desde <?= date('d/m/Y', strtotime($fecha_ini)) ?>
    al <?= date('d/m/Y', strtotime($fecha_fin)) ?></h4>

<h5 style="margin: 0;">EMPRESA: <?= valueOption('EMPRESA_NOMBRE') ?></h5>
<!--<h5 style="margin: 0;">DIRECCI&Oacute;N: <?= $local_direccion ?></h5>
<h5 style="margin: 0;">SUCURSAL: <?= $local_nombre ?></h5>-->
<table border="1">
    <thead>
        <tr>
            <th>Id</th>
            <th>Razon Social</th>
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
            <td><?= $list->id_cliente ?></td>
            <td><?= $list->razon_social ?></td>
            <td style="text-align: right;"><?= $list->total ?></td>
        </tr>
    <?php endforeach ?>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="2">TOTALES</td>
            <td style="text-align: right;"><?= $sumTotal ?></td>
        </tr>
    </tfoot>
</table>

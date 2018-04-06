<?php $ruta = base_url(); ?>
<?php //$md = get_moneda_defecto() ?>
<style type="text/css">
    table td {
        width: 100%;
        border: #e1e1e1 1px solid;
        font-size: 9px;
    }

    thead, th {
        background: #585858;
        border: #111 1px solid;
        color: #fff;
        font-size: 10px;
    }

    h4, h5 {
        margin: 0px;
    }

    table tfoot tr td {
        font-weight: bold;
    }
</style>
<h4 style="text-align: center; margin: 0;">Reporte de ventas por cliente</h4>
<h4 style="text-align: center;">Desde <?= date('d/m/Y', strtotime($fecha_ini)) ?>
    al <?= date('d/m/Y', strtotime($fecha_fin)) ?></h4>

<h5>EMPRESA: <?= valueOption('EMPRESA_NOMBRE') ?></h5>
<!--<h5>DIRECCI&Oacute;N: <?= $local_direccion ?></h5>
<h5>SUCURSAL: <?= $local_nombre ?></h5>-->
<table>
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

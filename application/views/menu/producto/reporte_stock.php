<style type="text/css">
    table {
        width: 100%;
        border-color: #111 1px solid;
    }

    thead, th {
        background: #585858;
        /* #e7e6e6*/
        border-color: #111 1px solid;
        color: #fff;
    }

    tbody tr {
        border-color: #111 1px solid;
    }

    h2 {
        text-align: center;
    }
</style>

<h2>Stock de Productos</h2>

<h3>Ubicaci&oacute;n: <?php echo $local["local_nombre"]; ?></h3>

<table cellpadding="5">
    <thead>
    <tr>
        <?php if (canShowCodigo()): ?>
            <th><?php echo getCodigoNombre() ?></th>
        <?php endif; ?>
        <?php foreach ($columnas as $col): ?>
            <?php
            if ($col->mostrar == TRUE && $col->nombre_columna != 'producto_estado' && $col->nombre_columna != 'producto_codigo_interno' && $col->nombre_columna != 'producto_id') {
                echo " <th>" . $col->nombre_mostrar . "</th>";
            }

            ?>
        <?php endforeach; ?>
        <th>UM</th>
        <th>Cantidad</th>
        <th>Fracci&oacute;n</th>
        <?php if($local_selected == false && $detalle_checked == 1):?>
            <th>Ubicaci&oacute;n</th>
        <?php endif;?>

    </tr>
    </thead>
    <tbody id="tbody">

    <?php foreach ($lstProducto as $pd):

        ?>

        <tr id="<?= $pd['producto_id'] ?>">
            <?php if (canShowCodigo()): ?>
                <td><?php echo getCodigoValue(sumCod($pd['producto_id']), $pd['producto_codigo_interno']) ?></td>
            <?php endif; ?>
            <?php foreach ($columnas as $col): ?>
                <?php if (array_key_exists($col->nombre_columna, $pd) and $col->mostrar == TRUE) {
                    if ($col->nombre_columna != 'producto_estado' && $col->nombre_columna != 'producto_codigo_interno' && $col->nombre_columna != 'producto_id') {
                        echo "<td>";
                        echo $pd[$col->nombre_join];
                        echo "</td>";
                    }
                } ?>
            <?php endforeach; ?>

            <td>
                <?php echo $pd['nombre_unidad']; ?>

            </td>
            <td id="cantidad_prod_<?php echo $pd['producto_id']?>">
                <?php echo $pd['cantidad']; ?>

            </td>
            <td>
                <?php if ($pd['fraccion'] != null) {
                    echo $pd['fraccion'];
                    if ($pd['nombre_fraccion'] != "") {
                        echo " " . $pd['nombre_fraccion'];
                    }
                } ?>

            </td>
            <?php if($local_selected == false && $detalle_checked == 1):?>
                <td><?=$pd['local_nombre']?></td>
            <?php endif;?>

        </tr>

    <?php endforeach; ?>


    </tbody>
</table>

<style type="text/css">
    .dataTables_filter, .dataTables_info, .dataTables_length { display: none; }
</style>
<div class="table-responsive" id="productostable">
    <table class='table table-striped dataTable table-bordered table-responsive' id="table" style="width: 100%;">
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
            <th>Estado</th>
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
                            if ($col->nombre_columna == 'producto_vencimiento')
                                echo $pd[$col->nombre_join] != null ? date('d-m-Y', strtotime($pd[$col->nombre_join])) : '';
                            else
                                echo $pd[$col->nombre_join];
                            echo "</td>";
                        }
                    } ?>
                <?php endforeach; ?>
                <td>
                    <?php if ($pd['producto_estado'] == 0) {
                        echo "INACTIVO";
                    } else {
                        echo "ACTIVO";
                    } ?>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    TablesDatatables.init();

    $(function () {
        $("#tbody").selectable({
            stop: function () {
                var id = $("#tbody tr.ui-selected").attr('id');
            }
        });
    });  
</script>
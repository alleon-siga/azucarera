<?php $ruta = base_url();

$totalutilidad=0;
$totalvalorizacion=0; ?>
<div class="table-responsive">
    <table class="table table-striped dataTable table-bordered" id="tablaresultado">
        <thead>
        <?php if($utilidades=="TODO"){?>
            <tr>
                <th > Fecha y Hora</th>
                <th>C&oacute;digo</th>
                <th>N&uacute;mero</th>
                <th>Cantidad</th>
                <th>Producto</th>
                <th>Cliente</th>
                <th>Vendedor</th>
                <th>Costo</th>
                <th>Precio</th>
                <th>Utilidad</th>
            </tr>
        <?php }elseif($utilidades=="PRODUCTO"){?>
            <th>C&oacute;digo</th>
            <th>Producto</th>
            <th>Utilidad</th>
            <th>Valorizaci&oacute;n</th>
        <?php }elseif($utilidades=="CLIENTE"){?>
            <th>C&oacute;digo</th>
            <th>Cliente</th>
            <th>Utilidad</th>
        <?php }
        elseif($utilidades=="PROVEEDOR"){?>
            <th>C&oacute;digo</th>
            <th>Proveedor</th>
            <th>Deuda</th>
        <?php }
        ?>


        </thead>
        <tbody>
        <?php if (count($ventas) > 0) {

            foreach ($ventas as $venta) {
                if ($utilidades=="TODO") {
                    ?>
                    <tr>
                        <td><?= date('d-m-Y H:i:s', strtotime($venta->fecha)) ?></td>
                        <td><?= $venta->venta_id ?></td>
                        <td><?= $venta->documento_Serie . " " . $venta->documento_Numero ?></td>
                        <td><?= $venta->cantidad ?></td>
                        <td><?= $venta->producto_nombre ?></td>
                        <td><?= $venta->razon_social ?></td>
                        <td><?= $venta->nombre ?></td>
                        <td><?= $venta->detalle_costo_promedio ?></td>
                        <td><?= $venta->precio ?></td>
                        <td><?= $venta->detalle_utilidad ?></td>
                    </tr>

                <?php } elseif ($utilidades=="PRODUCTO") {
                    $totalutilidad=$totalutilidad+$venta->suma;
                    $totalvalorizacion=$totalvalorizacion+$venta->valorizacion;
                    ?>

                    <tr>
                        <td><?= $venta->id_producto ?></td>
                        <td><?= $venta->producto_nombre ?></td>
                        <td><?= $venta->suma ?></td>
                        <td><?= $venta->valorizacion ?></td>
                    </tr>
                <?php } elseif ($utilidades=="CLIENTE") { ?>

                    <tr>
                        <td><?= $venta->id_cliente ?></td>
                        <td><?= $venta->razon_social ?></td>
                        <td><?= $venta->suma ?></td>
                    </tr>
                <?php }elseif ($utilidades=="PROVEEDOR") { ?>

                    <tr>
                        <td><?= $venta->id_proveedor ?></td>
                        <td><?= $venta->proveedor_nombre ?></td>
                        <td><?= $venta->suma ?></td>
                    </tr>
                <?php }
            }
        }?>

        </tbody>
    </table>

</div>
<?php if ($utilidades=="PRODUCTO") { ?>
<div class="row">
    <div class="col-md-2"> <label>Total Utilidad</label></div><div class="col-md-2"> <label><?php  echo $totalutilidad;  ?></label></div>
    <div class="col-md-2"> <label>Total Valorizaci&oacute;n</label></div><div class="col-md-2"> <label><?php  echo $totalvalorizacion;  ?></label></div>
</div>
<?php } ?>
<br>
<a href="<?= $ruta?>venta/<?php if($utilidades=="TODO"){ echo "pdfReporteUtilidades"; }elseif($utilidades=="PRODUCTO"){
echo "pdfReporteUtilidadesProducto"; }elseif($utilidades=="CLIENTE") { echo "pdfReporteUtilidadesCliente"; }
elseif($utilidades=="PROVEEDOR"){ echo "pdfReporteUtilidadesProveedor"; } ?>/<?php if(isset($local)) echo $local; else echo 0;?>/<?php if(isset($fecha_desde)) echo date('Y-m-d', strtotime($fecha_desde)); else echo 0;?>/<?php if(isset($fecha_hasta)) echo date('Y-m-d', strtotime($fecha_hasta)); else echo 0;?>/<?php echo $utilidades?>"
   class="btn  btn-default btn-lg" data-toggle="tooltip" title="Exportar a PDF" data-original-title="fa fa-file-pdf-o"><i class="fa fa-file-pdf-o fa-fw"></i></a>
<a href="<?= $ruta?>venta/<?php if($utilidades=="TODO"){ echo "excelReporteUtilidades"; }elseif($utilidades=="PRODUCTO"){
    echo "excelReporteUtilidadesProducto"; }elseif($utilidades=="CLIENTE") { echo "excelReporteUtilidadesCliente"; }
elseif($utilidades=="PROVEEDOR"){ echo "excelReporteUtilidadesProveedor"; } ?>/<?php if(isset($local)) echo $local; else echo 0;?>/<?php if(isset($fecha_desde)) echo date('Y-m-d', strtotime($fecha_desde)); else echo 0;?>/<?php if(isset($fecha_hasta)) echo date('Y-m-d', strtotime($fecha_hasta)); else echo 0;?>/<?php echo $utilidades?>"
   class="btn btn-default btn-lg" data-toggle="tooltip" title="Exportar a Excel" data-original-title="fa fa-file-excel-o"><i class="fa fa-file-excel-o fa-fw"></i></a>
<div class="modal fade" id="mvisualizarVenta" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">


</div>

<script type="text/javascript">
    $(function () {

        TablesDatatables.init();

    });



</script>
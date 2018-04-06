<?php $ruta = base_url(); ?>
<?php //$md = get_moneda_defecto() ?>
<style>
    table tfoot tr td {
        font-weight: bold;
    }
</style>
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#data">Tabla</a></li>
  <li><a data-toggle="tab" href="#grafico">Gr&aacute;fico</a></li>
</ul>
<div class="tab-content">
    <div id="data" class="tab-pane fade in active">
        <div class="table-responsive">
            <table class='table table-striped dataTable table-bordered no-footer tableStyle' style="overflow:scroll">
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
        </div>

        <div class="row">
            <div class="col-md-12">
                <br>
                <button type="button" id="exportar_excel" title="Exportar Excel" class="btn btn-primary">
                    <i class="fa fa-file-excel-o fa-fw"></i>
                </button>
                <button type="button" id="exportar_pdf" title="Exportar Pdf" class="btn btn-primary">
                    <i class="fa fa-file-pdf-o fa-fw"></i>
                </button>
            </div>
        </div>
    </div>
    <div id="grafico" class="tab-pane fade" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto">
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        TablesDatatables.init(2);


        $('#exportar_excel').on('click', function () {
            exportar_excel();
        });

        $("#exportar_pdf").on('click', function () {
            exportar_pdf();
        });

        $('.nav-tabs a[href="#grafico"]').on('shown.bs.tab', function(event){
            $("#grafico").html($("#loading").html());
            var data = {
                'local_id': $("#local_id").val(),
                //'fecha': $("#fecha").val(),
                'producto_id': $("#producto_id").val(),
                'grupo_id': $("#grupo_id").val(),
                'marca_id': $("#marca_id").val(),
                'linea_id': $("#linea_id").val(),
                'familia_id': $("#familia_id").val(),
                //'tipo': $("#tipo").val(),
                'id_proveedor': $("#id_proveedor").val(),
                'limit': $(".dataTables_length select").val()
            };

            $.post("<?= base_url()?>ingresos/costoinventario/grafico/", data, function(respuesta){
                //Usar primero esto
                var data_estadistica = eval("("+respuesta+")"); // Obtenemos la informacion del JSON
                var options = {
                    chart: {
                        type: 'bar'
                    },
                    title: {
                        text: "Reporte de costo de inventario"
                    },
                    subtitle: {
                        text: ''
                    },
                    xAxis: {
                        categories: [],
                        title: {
                            text: ""
                        }
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'Totales',
                            align: 'high'
                        },
                        labels: {
                            overflow: 'justify'
                        }
                    },
                    tooltip: {
                        valueSuffix: ' totales'
                    },
                    plotOptions: {
                        bar: {
                            dataLabels: {
                                enabled: true
                            }
                        }
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'left',
                        verticalAlign: 'top',
                        x: -10,
                        y: -15,
                        floating: true,
                        borderWidth: 0,
                        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
                        shadow: true
                    },
                    credits: {
                        enabled: false
                    },
                    series: [{
                        name: 'Total',
                        data: []
                    }]
                };

                for(var i = 0; i < data_estadistica['lists'].length; i++){
                    options.xAxis.categories.push(data_estadistica['lists'][i]['local_nombre']);
                    options.series[0].data.push(parseFloat(data_estadistica['lists'][i]['total']));
                }

                Highcharts.chart('grafico', options);
            });
        });
    });

    function exportar_pdf() {
        var data = {
            'local_id': $("#local_id").val(),
            //'fecha': $("#fecha").val(),
            'producto_id': $("#producto_id").val(),
            'grupo_id': $("#grupo_id").val(),
            'marca_id': $("#marca_id").val(),
            'linea_id': $("#linea_id").val(),
            'familia_id': $("#familia_id").val(),
            'id_proveedor': $("#id_proveedor").val()
            //'tipo': $("#tipo").val()
        };

        var win = window.open('<?= base_url()?>ingresos/costoinventario/pdf?data=' + JSON.stringify(data), '_blank');
        win.focus();
    }

    function exportar_excel() {
        var data = {
            'local_id': $("#local_id").val(),
            //'fecha': $("#fecha").val(),
            'producto_id': $("#producto_id").val(),
            'grupo_id': $("#grupo_id").val(),
            'marca_id': $("#marca_id").val(),
            'linea_id': $("#linea_id").val(),
            'familia_id': $("#familia_id").val(),
            'id_proveedor': $("#id_proveedor").val()
            //'tipo': $("#tipo").val()
        };

        var win = window.open('<?= base_url()?>ingresos/costoinventario/excel?data=' + JSON.stringify(data), '_blank');
        win.focus();
    }
</script>
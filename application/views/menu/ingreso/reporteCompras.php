<?php 
	echo "<pre>";
	echo print_r($ingresos);
	echo "</pre>";
?>
<div id="container" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>

<script type="text/javascript">
	var data_estadistica = <?= implode(",", $ingresos) ?>;
	alert(data_estadistica);

	/*var options = {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: 'Reporte de compras'
	    },
	    subtitle: {
	        text: ''
	    },
	    xAxis: {
	        categories: [
	            'Dom',
	            'Lun',
	            'Mar',
	            'Mie',
	            'Jue',
	            'Vie',
	            'Sab'
	        ],
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Dolares ($)'
	        }
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0" nowrap>{series.name}: </td>' +
	            '<td style="padding:0" nowrap><b> {point.y:.1f} $</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	    series: [{
	        name: 'Ventas',
	        data: []

	    }, {
	        name: 'Ganancias',
	        data: []

	    }]
	};

	for(var i = 0; i < data_estadistica['venta'].length; i++){
	    options.series[0].data.push(parseInt(data_estadistica['venta'][i]['1']));
	    options.series[1].data.push(parseInt(data_estadistica['utilidad'][i]['1']));
	}            
	Highcharts.chart('container', options);*/
</script>
<?php

date_default_timezone_set('America/Lima');
$ruta = base_url();
echo "<input type='hidden' id='base_url' value='" . base_url() . "'>"
?>

<?php
/* Template variables */
$template = array(
    'name' => 'EASY INVENTORY',
    'version' => '2.0',
    'author' => 'EASY TECHNOLOGY',
    'robots' => 'noindex, nofollow',
    'title' => 'EASY INVENTORY',
    'description' => 'Cuentas con un negocio u empresas cuyo giro son la venta al por mayor y menor de abarrotes, ferretería, licorería, accesorios entre otros? Entonces solicita tu prueba gratis de un mes, solo escríbenos un correo y nos pondremos en contacto contigo. También si deseas podemos realizar una demostración en vivo del programa sin ningún compromiso. Nuestro programa es compatible con Windows, Android y IOS',
    // true                     enable page preloader
    // false                    disable page preloader
    'page_preloader' => false,
    // true                     enable main menu auto scrolling when opening a submenu
    // false                    disable main menu auto scrolling when opening a submenu
    'menu_scroll' => true,
    // 'navbar-default'         for a light header
    // 'navbar-inverse'         for a dark header
    'header_navbar' => 'navbar-default',
    // ''                       empty for a static layout
    // 'navbar-fixed-top'       for a top fixed header / fixed sidebars
    // 'navbar-fixed-bottom'    for a bottom fixed header / fixed sidebars
    'header' => 'navbar-fixed-top',
    // ''                                               for a full main and alternative sidebar hidden by default (> 991px)
    // 'sidebar-visible-lg'                             for a full main sidebar visible by default (> 991px)
    // 'sidebar-partial'                                for a partial main sidebar which opens on mouse hover, hidden by default (> 991px)
    // 'sidebar-partial sidebar-visible-lg'             for a partial main sidebar which opens on mouse hover, visible by default (> 991px)
    // 'sidebar-alt-visible-lg'                         for a full alternative sidebar visible by default (> 991px)
    // 'sidebar-alt-partial'                            for a partial alternative sidebar which opens on mouse hover, hidden by default (> 991px)
    // 'sidebar-alt-partial sidebar-alt-visible-lg'     for a partial alternative sidebar which opens on mouse hover, visible by default (> 991px)
    // 'sidebar-no-animations'                          add this as extra for disabling sidebar animations on large screens (> 991px) - Better performance with heavy pages!
    'sidebar' => '',
    // ''                       empty for a static footer
    // 'footer-fixed'           for a fixed footer
    'footer' => '',
    // ''                       empty for default style
    // 'style-alt'              for an alternative main style (affects main page background as well as blocks style)
    'main_style' => '',
    // 'night', 'amethyst', 'modern', 'autumn', 'flatie', 'spring', 'fancy', 'fire' or '' leave empty for the Default Blue theme
    'theme' => 'flatie',
    // ''                       for default content in header
    // 'horizontal-menu'        for a horizontal menu in header
    // This option is just used for feature demostration and you can remove it if you like. You can keep or alter header's content in page_head.php
    'header_content' => 'horizontal-menu',
    'active_page' => basename($_SERVER['PHP_SELF'])
);


if ($this->session->userdata('tema')) {

    $template['theme'] = $this->session->userdata('tema');
}
/* Primary navigation array (the primary navigation will be created automatically based on this array, up to 3 levels deep) */
$primary_nav = array(
    array(
        'name' => 'MENU PRINCIPAL',
        'url' => $ruta . 'principal',
        'icon' => 'fa fa-home',
        'slug' => 'home'

    ),
    array(
        'name' => 'INVENTARIO',
        'slug' => 'inventario',
        'sub' => array(

            array(
                'name' => 'Productos',
                'url' => $ruta . 'producto',
                'icon' => 'gi gi-barcode',
                'slug' => 'productos'
            ),

             array(
                 'name' => 'Stock Productos',
                 'url' => $ruta . 'producto/stock',
                 'icon' => 'fa fa-list',
                 'slug' => 'stock'
             ),

            array(
                'name' => 'Traspasos de Almacen',
                'url' => $ruta . 'traspaso',
                'icon' => 'fa fa-tasks',
                'slug' => 'traspaso'
            ),

             array(
                'name' => 'Entradas & Salidas',
                'url' => $ruta . 'ajuste',
                'icon' => 'fa fa-exchange',
                'slug' => 'ajusteinventario'
            ),
            array(
                'name' => 'Stock & Precios',
                'url' => $ruta . 'producto/listaprecios',
                'icon' => 'fa fa-money',
                'slug' => 'listaprecios'
            ),

            /*array(
                'name' => 'Kardex',
                'url' => $ruta . 'inventario/movimiento',
                'icon' => 'fa fa-exchange',
                'slug' => 'movimientoinventario'
            ),*/

            array(
                'name' => 'Kardex',
                'url' => $ruta . 'kardex',
                'icon' => 'fa fa-exchange',
                'slug' => 'movimientoinventario'
            ),
            array(
                'name' => 'Categorizacion',
                'icon' => 'fa fa-laptop',
                'slug' => 'categorizacion',
                'sub' => array(
                    array(
                        'name' => 'Marcas',
                        'url' => $ruta . 'marca',
                        'icon' => 'fa fa-certificate',
                        'slug' => 'marcas'
                    ),
                    array(
                        'name' => 'Grupos',
                        'url' => $ruta . 'grupo',
                        'icon' => 'fa fa-cubes',
                        'slug' => 'gruposproductos'
                    ),
                    array(
                        'name' => 'Familias',
                        'url' => $ruta . 'familia',
                        'icon' => 'fa fa-laptop',
                        'slug' => 'familias'
                    ),
                    array(
                        'name' => 'Lineas',
                        'url' => $ruta . 'linea',
                        'icon' => 'fa fa-th-large',
                        'slug' => 'lineas'
                    ),
                    array(
                        'name' => 'Categorias',
                        'url' => $ruta . 'categorias',
                        'icon' => 'fa fa-certificate',
                        'slug' => 'categorias'
                    ),
                    array(
                        'name' => 'Provincias',
                        'url' => $ruta . 'provincias',
                        'icon' => 'fa fa-certificate',
                        'slug' => 'provincia'
                    ),
                ),

            ),
            array(
                'name' => 'Existencias bajas',
                'url' => $ruta . 'inventario/existencia_minima',
                'icon' => 'fa fa-minus-square-o',
                'slug' => 'exitenciaminima'
            ),
            array(
                  'name' => 'Existencias altas',
                  'url' => $ruta . 'inventario/existencia_alta',
                  'icon' => 'fa fa-sort-amount-asc',
                  'slug' => 'existenciasalta'
              ),
            array(
                  'name' => 'Ingreso Calzado',
                  'url' => $ruta . 'ingreso_calzado',
                  'icon' => 'fa fa-sort-amount-asc',
                  'slug' => 'plantilla'
              ),
            array(
                  'name' => 'Plantilla Producto',
                  'url' => $ruta . 'plantilla',
                  'icon' => 'fa fa-sort-amount-asc',
                  'slug' => 'plantilla'
              ),
            array(
                'name' => 'Serie Calzado',
                'url' => $ruta . 'seriescalzado',
                'icon' => 'fa fa-sort-amount-asc',
                'slug' => 'seriescalzado'
            ),array(
                'name' => 'Reporte Calzado',
                'url' => $ruta . 'ingreso_calzado/reporte',
                'icon' => 'fa fa-sort-amount-asc',
                'slug' => 'seriescalzado'
            ),
        ),
    ),

    array(
        'name' => 'ENTRADAS',
        'slug' => 'ingresos',
        'sub' => array(
            array(
                'name' => 'Registrar Compras',
                'url' => $ruta . 'ingresos?costos=true',
                'icon' => 'gi gi-cart_in',
                'slug' => 'registraringreo'
            ),
            array(
                'name' => 'Registro de existencia',
                'slug' => 'ingresoexistencia',
                'icon' => 'fa fa-share',
                'url' => $ruta . 'ingresos?costos=false',
            ),
            array(
                'name' => 'Consultar Compras',
                'url' => $ruta . 'ingresos/consultarCompras',
                'icon' => 'gi gi-list',
                'slug' => 'consultarcompras'
            ),
            array(
                'name' => 'Anulacion Compras',
                'url' => $ruta . 'ingresos/devolucion',
                'icon' => 'gi gi-unshare',
                'slug' => 'devolucioningreso'
            ),
            array(
                'name' => 'Facturar Compras',
                'url' => $ruta . 'ingresos/consultar',
                'icon' => 'gi gi-history',
                'slug' => 'facturaringresos'
            ),
            array(
                'name' => 'Compras Calzado',
                'url' => $ruta . '',
                'icon' => 'gi gi-cart_in',
                'slug' => 'compraszapatos'
            ),
            /*PREGUNTAR ACERCA DE ESTE FORMULARIO
            array(
                'name' => 'Opciones',
                'url' => $ruta . 'ingreso/opciones',
                'icon' => 'fa fa-cogs',
                'slug' => 'opcioningreso'
            )*/

        ),
    ),
    array(
        'name' => 'SALIDAS',
        'slug' => 'ventas',
        'sub' => array(
            array(
                'name' => 'Realizar Venta',
                'url' => $ruta . 'venta_new',
                'icon' => 'fa fa-share',
                'slug' => 'generarventa'
            ),
            array(
                'name' => 'Cobrar en Caja',
                'url' => $ruta . 'venta_new/historial/caja',
                'icon' => 'fa fa-share',
                'slug' => 'generarventa'
            ),
            array(
                'name' => 'Registro de Ventas',
                'url' => $ruta . 'venta_new/historial',
                'icon' => 'fa fa-history',
                'slug' => 'historialventas'
            ),
            array(
                'name' => 'Anular & Devolver',
                'url' => $ruta . 'venta_new/historial/anular',
                'icon' => 'gi gi-remove_2',
                'slug' => 'anularventa'
            ),

            array(
                'name' => 'Configurar Venta',
                'url' => $ruta . 'venta_new/opciones',
                'icon' => 'fa fa-cogs',
                'slug' => 'configurarventa'
            ),

        )
    ),



    array(
        'name' => 'ACTIVOS FIJOS',
        'slug' => 'clientespadre',
        'sub' => array(
            array(
                'name' => 'Registrar Activos',
                'url' => $ruta . 'cliente',
                'icon' => 'gi gi-parents',
                'slug' => 'clientes'
            ),
            array(
                'name' => 'Grupos de Activos',
                'url' => $ruta . 'clientesgrupos',
                'icon' => 'fa fa-group',
                'slug' => 'gruposcliente'
            ),
            array(
                'name' => 'Cuentas x Cobrar',
                'url' => $ruta . 'venta/pagospendientes',
                'icon' => 'fa fa-list',
                'slug' => 'cuentasporcobrar'
            ),

            /* array(
                 'name' => 'Cronograma Pago',
                 'url' => $ruta . 'venta/cronograma_pago',
                 'icon' => 'gi gi-calendar',
                 'slug' => 'cronogramapago'
             ),*/
        )
    ),

    array(
        'name' => 'PROVEEDORES',

        'slug' => 'proveedores',
        'sub' => array(
            array(
                'name' => 'Registrar Proveedores',
                'url' => $ruta . 'proveedor',
                'icon' => 'gi gi-vcard',
                'slug' => 'proveedor'
            ),
            array(
                'name' => 'Cuentas x Pagar',
                'url' => $ruta . 'proveedor/cuentas_por_pagar',
                'icon' => 'fa fa-list',
                'slug' => 'cuentasporpagar'
            ),

        )
    ),
/*
    array(
        'name' => 'CAJA Y BANCOS',
        'slug' => 'cajas',
        'sub' => array(
            array(
                'name' => 'Caja y Bancos',
                'url' => $ruta . 'cajas',
                'icon' => 'fa fa-inbox',
                'slug' => 'cajaybancos'
            ),

            array(
                'name' => 'Gastos',
                'url' => $ruta . 'gastos',
                'icon' => 'gi gi-unshare',
                'slug' => 'gastos'
            ),

             array(
                'name' => 'Movimientos de caja',
                'url' => $ruta . ' ',
                'icon' => 'fa fa-list',
                'slug' => 'movimientocajas'
            ),

            array(
                'name' => 'Tipos de gasto',
                'url' => $ruta . 'tiposdegasto',
                'icon' => 'gi gi-parents',
                'slug' => 'tiposgasto'
            ),

             array(
                'name' => 'Monedas',
                'url' => $ruta . 'monedas',
                'icon' => 'fa fa-money',
                'slug' => 'regmonedas'
            ),

            array(
                'name' => 'Bancos',
                'url' => $ruta . 'banco',
                'icon' => 'fa fa-laptop',
                'slug' => 'bancos'
            ),
            array(
                'name' => 'Cuadre de caja',
                'url' => '#cuadre_caja_reporte',
                'icon' => 'fa fa-money',
                'slug' => 'cuadrecaja'
            ),
        ),
    ),
*/
    array(
        'name' => 'REPORTES',
        'slug' => 'reportes',
        'sub' => array(

            array(
                'name' => 'Dias de Almacenaje',
                'url' => $ruta . ' ',
                'icon' => 'fa fa-bar-chart',
                'slug' => 'diasalmacenaje'
            ),

            array(
                'name' => 'Compras vs Ventas',
                'url' => $ruta . 'venta/reporteUtilidades',
                'icon' => 'fa fa-bar-chart',
                'slug' => 'comprasvsventas'
            ),
            array(
                'name' => 'Resumen de ventas',
                'url' => $ruta . 'estadisticas',
                'icon' => 'fa fa-pie-chart',
                'slug' => 'resumenventas'
            ),


            array(
                'name' => 'Deuda por Proveedor',
                'url' => $ruta . 'venta/reporteUtilidadesProveedor',
                'icon' => 'fa fa-bar-chart-o',
                'slug' => 'deudaxproveedor'
            ),
            array(
                'name' => 'Ventas por Cliente',
                'url' => $ruta . 'venta/ventas_by_cliente',
                'icon' => 'fa fa-bar-chart',
                'slug' => 'ventasporcliente'
            ),

            array(
                'name' => 'Valorización inventario',
                'url' => $ruta . 'inventario/valorizacion_inventario',
                'icon' => 'fa fa-money',
                'slug' => 'valorizacioneinventario'
            ),
            array(
                'name' => 'Ingreso Detallado',
                'url' => $ruta . 'ingresos/ingreso_detallado',
                'icon' => 'fa fa-money',
                'slug' => 'ingresodetallado'
            ),
            array(
                'name' => 'Estado de Cuenta',
                'url' => $ruta . 'venta/estadocuenta',
                'icon' => 'fa fa-credit-card',
                'slug' => 'estadodecuenta'
            ),
        ),
    ),
    array(
        'name' => 'MENSAJES',

        'slug' => 'mensajes',
        'sub' => array(
            array(
                'name' => 'Notificaciones',
                'url' => $ruta . 'mensajes/notificaciones',
                'icon' => 'gi gi-message_flag',
                'slug' => 'notificacion'
            ),

        )
    ),
    array(
        'name' => 'CONFIGURACI&Oacute;N',
        'slug' => 'opciones',
        'sub' => array(
            array(
                'name' => 'Configurar',
                'url' => $ruta . 'opciones',
                'icon' => 'fa fa-cogs',
                'slug' => 'opcionesgenerales'
            ),
            array(
                'name' => 'Locales',
                'url' => $ruta . 'local',
                'icon' => 'gi gi-shop_window',
                'slug' => 'locales'
            ),
            array(
                'name' => 'Usuarios',
                'icon' => 'fa fa-users',
                'sub' => array(
                    array(
                        'name' => 'Registrar Usuarios',
                        'url' => $ruta . 'usuario',
                        'icon' => 'fa fa-users',
                        'slug' => 'usuarios'
                    ),
                    array(
                        'name' => 'Perfiles',
                        'url' => $ruta . 'usuariosgrupos',
                        'icon' => 'gi gi-parents',
                        'slug' => 'gruposusuarios'
                    ),
                ),
                'slug' => 'usuariospadre'

            ),
            array(
                'name' => 'Ubigeo',
                'icon' => 'fa fa-globe',
                'sub' => array(
                    array(
                        'name' => 'Paises',
                        'url' => $ruta . 'pais',
                        'icon' => 'fa fa-users',
                        'slug' => 'pais'
                    ),
                    array(
                        'name' => 'Departamento',
                        'url' => $ruta . 'estados',
                        'icon' => 'gi gi-shop_window',
                        'slug' => 'estado'
                    ),
                    array(
                        'name' => 'Provincia',
                        'url' => $ruta . 'ciudad',
                        'icon' => 'gi gi-shop_window',
                        'slug' => 'ciudad'
                    ),
                    array(
                        'name' => 'Distritos',
                        'url' => $ruta . 'distrito',
                        'icon' => 'gi gi-shop_window',
                        'slug' => 'distrito'
                    )
                ),
                'slug' => 'region'

            ),


            /*array(
                'name' => 'Impuestos',
                'url' => $ruta . 'impuesto',
                'icon' => 'fa fa-money',
                'slug' => 'impuestos'
            ),
            array(
                'name' => 'Condiciones de Pago',
                'url' => $ruta . 'condicionespago',
                'icon' => 'fa fa-ticket',
                'slug' => 'condicionespago'
            ),
            array(
                'name' => 'Metodos de Pago',
                'url' => $ruta . 'metodosdepago',
                'icon' => 'fa fa-credit-card',
                'slug' => 'metodospago'
            ),*/

            array(
                'name' => 'Tipos de Precio',
                'url' => $ruta . 'precio',
                'icon' => 'fa fa-money',
                'slug' => 'precios'
            ),
            array(
                'name' => 'Unidades de Medida',
                'url' => $ruta . 'unidades',
                'icon' => 'fa fa-list-ol',
                'slug' => 'unidadesmedida'
            )
        )
    ),
)


?>


<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>EASY INVENTORY</title>
    <meta name="description" content="">

    <meta name="viewport" content="width=device-width">

    <!-- Icons -->
    <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
    <link rel="icon" href="<?php echo $ruta ?>recursos/img/placeholders/photos/easytech.png">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/img/placeholders/photos/easytech.png" sizes="57x57">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/recursos/img/icon72.png" sizes="72x72">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/recursos/img/icon76.png" sizes="76x76">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/recursos/img/icon114.png" sizes="114x114">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/recursos/img/icon120.png" sizes="120x120">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/recursos/img/icon144.png" sizes="144x144">
    <link rel="apple-touch-icon" href="<?php echo $ruta; ?>recursos/recursos/img/icon152.png" sizes="152x152">

    <!-- END Icons -->
    <!-- Stylesheets -->
    <!-- Bootstrap is included in its original form, unaltered -->
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/jquery-ui.css">
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/bootstrap.min.css">

    <!-- Related styles of various icon packs and plugins -->
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/plugins.css">

    <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/main.css">

    <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->
          
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/themes/flatie.css">

    <link id="theme-link" rel="stylesheet"
          href="<?php
          if ($template['theme'] != "") {
              echo $ruta.'recursos/css/'. $template['theme'].'.css';
          } ?>">

    <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/themes.css">

    <link rel="stylesheet" href="<?php echo $ruta; ?>recursos/css/modified.css">
    <style>

        table.dataTable,
        table.dataTable th,
        table.dataTable td {
            -webkit-box-sizing: content-box !important;
            -moz-box-sizing: content-box !important;
            box-sizing: content-box !important;
            white-space: nowrap;
        }

        /* Esto es un arreglo a la fuerza pq al parecer los iconos de la pantalla principal se corrieron */
        .widget-icon .fa, .widget-icon .fi, .widget-icon .gi, .widget-icon .hi, .widget-icon .si {
            line-height: 64px !important;
        }

        .nav.navbar-nav-custom > li > a > i {
            line-height: 40px !important;
        }


    </style>

    <!-- END Stylesheets -->

    <!-- Modernizr (browser feature detection library) & Respond.js (Enable responsive CSS code on browsers that don't support it, eg IE8) -->
    <script src="<?php echo $ruta; ?>recursos/js/vendor/modernizr-2.7.1-respond-1.4.2.min.js"></script>

    <!-- Remember to include excanvas for IE8 chart support -->
    <!--[if IE 8]>
    <![endif]-->

    <!-- Include Jquery library from Google's CDN but if something goes wrong get Jquery from local file (Remove 'http:' if you have SSL) -->
    <script src="<?php echo $ruta ?>recursos/js/vendor/jquery-1.11.1.min.js"></script>

    <!-- IMPORTANTE. SCRIPT PARA VALIDAR TODAS LAS PETICIONES AJAX DE JQUERY -->
    <script>
        var XHR = null;

        function checkLogin() {
            var xmlhttp = new XMLHttpRequest();

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == XMLHttpRequest.DONE) {
                    if (xmlhttp.status == 200) {
                        if (xmlhttp.responseText == '0') {
                            XHR.abort();
                            window.location.assign("<?php echo base_url()?>");
                        }
                    }
                    else if (xmlhttp.status == 400) {
                        console.log('Check Login: Error 400');
                    }
                    else {
                        console.log('Check Login: Error');
                    }
                }
            };
            xmlhttp.open("GET", "<?php echo base_url()?>" + "inicio/check_ajax_login", false);
            xmlhttp.send();
        }

        /*$.ajaxSetup({

         beforeSend: function (jqXHR) {
         XHR = jqXHR;
         checkLogin();
         }
         });*/
    </script>

    <script src="<?php echo $ruta ?>recursos/js/helpers/excanvas.min.js"></script>
    <!-- <script src="<?php echo $ruta ?>recursos/js/jquery.flot.js"></script> -->
    <!-- <script src="<?php echo $ruta ?>recursos/js/jquery.flot.stackbars.js"></script> -->

    <!-- Bootstrap.js, Jquery plugins and Custom JS code -->
    <script>window.onerror = function () {
            return true;
        } </script>
    <script src="<?php echo base_url() ?>recursos/js/jquery-ui.js"></script>
    <script src="<?php echo $ruta ?>recursos/js/vendor/bootstrap.min.js"></script>

    <script src="<?php echo $ruta ?>recursos/js/plugins.js"></script>

    <script src="<?php echo $ruta ?>recursos/js/app.js"></script>
    <script src="<?php echo $ruta; ?>recursos/js/locationpicker.jquery.js"></script>
    <script src="<?php echo $ruta; ?>recursos/js/common.js"></script>

    <script src="<?php echo $ruta; ?>recursos/js/jquery.elevateZoom-3.0.8.min.js"></script>

    <script src="<?php echo $ruta ?>recursos/js/pages/tablesDatatables.js"></script>
    <script>
        var baseurl = '<?php echo base_url();?>';
        var ventas_credito = 0;
        var ya = 0;


         function show_msg(type, msg) {

            $.bootstrapGrowl(msg, {
                type: type,
                delay: 5000,
                allow_dismiss: true
            });

        }
    </script>


</head>

<body>
    <input type="hidden" id="C_IGV" value="<?= IGV?>">

<div id="page-wrapper"<?php if ($template['page_preloader']) {
    echo ' class="page-loading"';
} ?>>
    <!-- Preloader -->
    <!-- Preloader functionality (initialized in js/app.js) - pageLoading() -->
    <!-- Used only if page preloader is enabled from inc/config (PHP version) or the class 'page-loading' is added in #page-wrapper element (HTML version) -->
    <div class="preloader themed-background">
        <h1 class="push-top-bottom text-light text-center"><strong>Te</strong>Ayudo</h1>

        <div class="inner">
            <h3 class="text-light visible-lt-ie9 visible-lt-ie10"><strong>Loading..</strong></h3>

            <div class="preloader-spinner hidden-lt-ie9 hidden-lt-ie10"></div>
        </div>
    </div>
    <!-- END Preloader -->

    <!-- Page Container -->
    <!-- In the PHP version you can set the following options from inc/config file -->
    <!--
        Available #page-container classes:

        '' (None)                                       for a full main and alternative sidebar hidden by default (> 991px)

        'sidebar-visible-lg'                            for a full main sidebar visible by default (> 991px)
        'sidebar-partial'                               for a partial main sidebar which opens on mouse hover, hidden by default (> 991px)
        'sidebar-partial sidebar-visible-lg'            for a partial main sidebar which opens on mouse hover, visible by default (> 991px)

        'sidebar-alt-visible-lg'                        for a full alternative sidebar visible by default (> 991px)
        'sidebar-alt-partial'                           for a partial alternative sidebar which opens on mouse hover, hidden by default (> 991px)
        'sidebar-alt-partial sidebar-alt-visible-lg'    for a partial alternative sidebar which opens on mouse hover, visible by default (> 991px)

        'sidebar-partial sidebar-alt-partial'           for both sidebars partial which open on mouse hover, hidden by default (> 991px)

        'sidebar-no-animations'                         add this as extra for disabling sidebar animations on large screens (> 991px) - Better performance with heavy pages!

        'style-alt'                                     for an alternative main style (without it: the default style)
        'footer-fixed'                                  for a fixed footer (without it: a static footer)

        'disable-menu-autoscroll'                       add this to disable the main menu auto scrolling when opening a submenu

        'header-fixed-top'                              has to be added only if the class 'navbar-fixed-top' was added on header.navbar
        'header-fixed-bottom'                           has to be added only if the class 'navbar-fixed-bottom' was added on header.navbar
    -->
    <?php
    $page_classes = '';

    if ($template['header'] == 'navbar-fixed-top') {
        $page_classes = 'header-fixed-top';
    } else if ($template['header'] == 'navbar-fixed-bottom') {
        $page_classes = 'header-fixed-bottom';
    }

    if ($template['sidebar']) {
        $page_classes .= (($page_classes == '') ? '' : ' ') . $template['sidebar'];
    }

    if ($template['main_style'] == 'style-alt') {
        $page_classes .= (($page_classes == '') ? '' : ' ') . 'style-alt';
    }

    if ($template['footer'] == 'footer-fixed') {
        $page_classes .= (($page_classes == '') ? '' : ' ') . 'footer-fixed';
    }

    if (!$template['menu_scroll']) {
        $page_classes .= (($page_classes == '') ? '' : ' ') . 'disable-menu-autoscroll';
    }
    ?>
    <div id="page-container"<?php if ($page_classes) {
        echo ' class="' . $page_classes . '"';
    } ?>>
        <!-- Alternative Sidebar -->
        <div id="sidebar-alt">
            <!-- Wrapper for scrolling functionality -->
            <div class="sidebar-scroll">
                <!-- Sidebar Content -->
                <div class="sidebar-content">
                    <!-- Chat -->
                    <!-- Chat demo functionality initialized in js/app.js -> chatUi() -->

                    <!--  END Chat Talk -->
                    <!-- END Chat -->

                    <!-- Activity -->

                    <!-- END Messages -->
                </div>
                <!-- END Sidebar Content -->
            </div>
            <!-- END Wrapper for scrolling functionality -->
        </div>
        <!-- END Alternative Sidebar -->

        <!-- Main Sidebar -->
        <div id="sidebar">
            <!-- Wrapper for scrolling functionality -->
            <div class="sidebar-scroll">
                <!-- Sidebar Content -->
                <div class="sidebar-content">
                    <!-- Brand -->
                    <a href="<?= $ruta ?>principal" class="sidebar-brand">
                        <i class="gi gi-cart_out"></i><strong>EASY INV</strong>
                    </a>
                    <!-- END Brand -->

                    <!-- User Info -->
                    <div class="sidebar-section sidebar-user clearfix">
                        <div class="sidebar-user-avatar">
                            <a href="<?= $ruta ?>principal">
                                <img src="<?php echo $ruta ?>recursos/img/placeholders/photos/easytech-circle.png"
                                     alt="avatar">
                            </a>
                        </div>
                        <div class="sidebar-user-name"><?= $this->session->userdata('nombre') ?></div>
                        <div class="sidebar-user-links">
                            <!-- <a href="page_ready_user_profile.php" data-toggle="tooltip" data-placement="bottom"
                                title="Profile"><i class="gi gi-user"></i></a>
                             <a href="page_ready_inbox.php" data-toggle="tooltip" data-placement="bottom"
                                title="Messages"><i class="gi gi-envelope"></i></a>
                             <!-- Opens the user settings modal that can be found at the bottom of each page (page_footer.php in PHP version) -->
                            <a href="#modal-user-settings" data-toggle="modal" class="enable-tooltip"
                               data-placement="bottom" title="Settings"><i class="gi gi-user"></i></a>
                            <a href="<?= $ruta ?>logout" data-toggle="tooltip" data-placement="bottom" title="Logout"><i
                                    class="gi gi-exit"></i></a>
                        </div>
                    </div>
                    <!-- END User Info -->

                    <!-- Theme Colors -->
                    <!-- Change Color Theme functionality can be found in js/app.js - templateOptions() -->
                    <ul class="sidebar-section sidebar-themes clearfix" style="display: none;">
                        <li>
                            <a href="javascript:void(0)" class="themed-background-dark-default themed-border-default"
                               data-theme="default" data-toggle="tooltip" title="Default Blue"></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" class="themed-background-dark-night themed-border-night"
                               data-theme="css/themes/night.css" data-toggle="tooltip" title="Night"></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" class="themed-background-dark-amethyst themed-border-amethyst"
                               data-theme="css/themes/amethyst.css" data-toggle="tooltip" title="Amethyst"></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" class="themed-background-dark-modern themed-border-modern"
                               data-theme="css/themes/modern.css" data-toggle="tooltip" title="Modern"></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" class="themed-background-dark-autumn themed-border-autumn"
                               data-theme="css/themes/autumn.css" data-toggle="tooltip" title="Autumn"></a>
                        </li>
                        <li class="active">
                            <a href="javascript:void(0)" class="themed-background-dark-flatie themed-border-flatie"
                               data-theme="css/themes/flatie.css" data-toggle="tooltip" title="Flatie"></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" class="themed-background-dark-spring themed-border-spring"
                               data-theme="css/themes/spring.css" data-toggle="tooltip" title="Spring"></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" class="themed-background-dark-fancy themed-border-fancy"
                               data-theme="css/themes/fancy.css" data-toggle="tooltip" title="Fancy"></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" class="themed-background-dark-fire themed-border-fire"
                               data-theme="css/themes/fire.css" data-toggle="tooltip" title="Fire"></a>
                        </li>
                    </ul>
                    <!-- END Theme Colors -->


                    <?php if ($primary_nav) { ?>
                        <!-- Sidebar Navigation -->
                        <ul class="sidebar-nav">
                            <?php foreach ($primary_nav as $key => $link) {
                                $link_class = '';
                                $li_active = '';
                                $menu_link = '';

                                // Get 1st level link's vital info
                                $url = (isset($link['url']) && $link['url']) ? $link['url'] : '#';
                                $active = (isset($link['url']) && ($template['active_page'] == $link['url'])) ? ' active' : '';
                                $icon = (isset($link['icon']) && $link['icon']) ? '<i class="' . $link['icon'] . ' sidebar-nav-icon"></i>' : '';
                                $slug = (isset($link['slug']) && $link['slug']) ? $link['slug'] : '';


                                // Check if the link has a submenu
                                if (isset($link['sub']) && $link['sub']) {
                                    // Since it has a submenu, we need to check if we have to add the class active
                                    // to its parent li element (only if a 2nd or 3rd level link is active)
                                    foreach ($link['sub'] as $sub_link) {
                                        if (in_array($template['active_page'], $sub_link)) {
                                            $li_active = ' class="active menulink"';
                                            break;
                                        }

                                        // 3rd level links
                                        if (isset($sub_link['sub']) && $sub_link['sub']) {
                                            foreach ($sub_link['sub'] as $sub2_link) {
                                                if (in_array($template['active_page'], $sub2_link)) {
                                                    $li_active = ' class="active menulink"';
                                                    break;
                                                }
                                            }
                                        }
                                    }

                                    $menu_link = 'sidebar-nav-menu';
                                }

                                // Create the class attribute for our link
                                if ($menu_link || $active) {
                                    $link_class = ' class="' . $menu_link . $active . '  "';
                                }
                                ?>
                                <?php if ($url == 'header') { // if it is a header and not a link

                                    if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), $slug)) { ?>

                                        <li class="sidebar-header">
                                            <?php if (isset($link['opt']) && $link['opt']) { // If the header has options set ?>
                                                <span
                                                    class="sidebar-header-options clearfix"><?php echo $link['opt']; ?></span>
                                            <?php } ?>
                                            <span class="sidebar-header-title"><?php echo $link['name']; ?></span>
                                        </li>
                                    <?php }
                                } else { // If it is a link
                                    if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), $slug) or $slug == 'home') {
                                        ?>

                                        <li<?php echo $li_active; ?>>
                                            <a href="<?php echo $url; ?>"<?php echo $link_class; ?>
                                               class="menulink"><?php if (isset($link['sub']) && $link['sub']) { // if the link has a submenu ?>
                                                    <i class="fa fa-angle-left sidebar-nav-indicator "></i><?php }
                                                echo $icon . $link['name']; ?></a>
                                            <?php if (isset($link['sub']) && $link['sub']) { // if the link has a submenu
                                                if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), $slug)) { ?>

                                                    <ul>
                                                        <?php foreach ($link['sub'] as $sub_link) {
                                                            $link_class = '';
                                                            $li_active = '';
                                                            $submenu_link = '';


                                                            // Get 2nd level link's vital info
                                                            $url = (isset($sub_link['url']) && $sub_link['url']) ? $sub_link['url'] : '#';
                                                            $active = (isset($sub_link['url']) && ($template['active_page'] == $sub_link['url'])) ? ' active' : '';
                                                            $slug = $sub_link['slug'];
                                                            $icon = (isset($sub_link['icon']) && $sub_link['icon']) ? '<i class="' . $sub_link['icon'] . ' sidebar-nav-icon"></i>' : '';


                                                            // Check if the link has a submenu
                                                            if (isset($sub_link['sub']) && $sub_link['sub']) {
                                                                // Since it has a submenu, we need to check if we have to add the class active
                                                                // to its parent li element (only if a 3rd level link is active)
                                                                foreach ($sub_link['sub'] as $sub2_link) {
                                                                    if (in_array($template['active_page'], $sub2_link)) {
                                                                        $li_active = ' class="active menulink"';
                                                                        break;
                                                                    }
                                                                }

                                                                $submenu_link = 'sidebar-nav-submenu';
                                                            }

                                                            if ($submenu_link || $active) {
                                                                $link_class = ' class="' . $submenu_link . $active . '"';
                                                            }

                                                            if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), $slug)) { ?>
                                                                <li<?php echo $li_active; ?>>


                                                                    <a href="<?php echo $url; ?>"<?php echo $link_class; ?>
                                                                       class="menulink" <?php if ($url == "#cuadre_caja_reporte") { ?>

                                                                        data-toggle="modal"
                                                                    <?php } ?> ><?php if (isset($sub_link['sub']) && $sub_link['sub']) { ?>
                                                                            <i class="fa fa-angle-left sidebar-nav-indicator"></i><?php }
                                                                        echo $icon . $sub_link['name']; ?></a>
                                                                    <?php if (isset($sub_link['sub']) && $sub_link['sub']) {
                                                                        if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), $slug)) { ?>
                                                                            <ul>
                                                                                <?php foreach ($sub_link['sub'] as $sub2_link) {
                                                                                    // Get 3rd level link's vital info
                                                                                    $url = (isset($sub2_link['url']) && $sub2_link['url']) ? $sub2_link['url'] : '#';
                                                                                    $active = (isset($sub2_link['url']) && ($template['active_page'] == $sub2_link['url'])) ? ' class="active"' : '';
                                                                                    if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), $sub2_link['slug'])) { ?>
                                                                                        <li>
                                                                                            <a href="<?php echo $url; ?>"<?php echo $active ?>
                                                                                               class="menulink"><?php echo $sub2_link['name']; ?></a>
                                                                                        </li>
                                                                                    <?php }
                                                                                } ?>
                                                                            </ul>
                                                                        <?php }
                                                                    } ?>
                                                                </li>
                                                            <?php }
                                                        } ?>
                                                    </ul>
                                                <?php }
                                            } ?>
                                        </li>
                                        <?php
                                    }
                                } ?>
                            <?php } ?>
                        </ul>
                        <!-- END Sidebar Navigation -->
                    <?php } ?>


                    <!-- END Sidebar Notifications -->
                </div>
                <!-- END Sidebar Content -->
            </div>
            <!-- END Wrapper for scrolling functionality -->
        </div>
        <!-- END Main Sidebar -->

        <!-- Main Container -->
        <div id="main-container">
            <!-- Header -->
            <!-- In the PHP version you can set the following options from inc/config file -->
            <!--
                Available header.navbar classes:

                'navbar-default'            for the default light header
                'navbar-inverse'            for an alternative dark header

                'navbar-fixed-top'          for a top fixed header (fixed sidebars with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar())
                    'header-fixed-top'      has to be added on #page-container only if the class 'navbar-fixed-top' was added

                'navbar-fixed-bottom'       for a bottom fixed header (fixed sidebars with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar()))
                    'header-fixed-bottom'   has to be added on #page-container only if the class 'navbar-fixed-bottom' was added
            -->
            <header class="navbar<?php if ($template['header_navbar']) {
                echo ' ' . $template['header_navbar'];
            } ?><?php if ($template['header']) {
                echo ' ' . $template['header'];
            } ?>">
                <?php if ($template['header_content'] == 'horizontal-menu') { // Horizontal Menu Header Content ?>
                    <!-- Navbar Header -->
                    <div class="navbar-header">
                        <!-- Horizontal Menu Toggle + Alternative Sidebar Toggle Button, Visible only in small screens (< 768px) -->
                        <ul class="nav navbar-nav-custom pull-right visible-xs">
                            <li>
                                <a href="javascript:void(0)" data-toggle="collapse"
                                   data-target="#horizontal-menu-collapse">Menu</a>
                            </li>
                            <!-- User Dropdown -->
                            <li class="dropdown">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="<?php echo $ruta ?>recursos/img/placeholders/avatars/avatar2.jpg"
                                         alt="avatar"> <i
                                        class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-custom dropdown-menu-right">


                                    <li>

                                        <!-- Opens the user settings modal that can be found at the bottom of each page (page_footer.php in PHP version) -->
                                        <a href="#modal-user-settings" data-toggle="modal">
                                            <i class="fa fa-user fa-fw pull-right"></i>
                                            Mi perfil
                                            <input type="hidden" value="<?= $ruta ?>" id="ruta_base">
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>

                                        <a href="<?= $ruta ?>logout"><i class="fa fa-ban fa-fw pull-right"></i> Cerrar
                                            Sesión</a>
                                    </li>

                                </ul>
                            </li>
                            <!-- END User Dropdown -->

                        </ul>
                        <!-- END Horizontal Menu Toggle + Alternative Sidebar Toggle Button -->

                        <!-- Main Sidebar Toggle Button -->
                        <ul class="nav navbar-nav-custom">
                            <li>
                                <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');">
                                    <i class="fa fa-bars fa-fw"></i>
                                </a>
                            </li>
                        </ul>
                        <!-- END Main Sidebar Toggle Button -->
                    </div>
                    <!-- END Navbar Header -->

                    <!-- Alternative Sidebar Toggle Button, Visible only in large screens (> 767px) -->
                    <!--<ul class="nav navbar-nav-custom pull-right hidden-xs">
                        <li>
                            <!-- If you do not want the main sidebar to open when the alternative sidebar is closed, just remove the second parameter: App.sidebar('toggle-sidebar-alt'); -->
                    <!--   <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar-alt', 'toggle-other');">
                           <i class="gi gi-share_alt"></i>
                           <span class="label label-primary label-indicator animation-floating">4</span>
                       </a>
                   </li>
               </ul>-->
                    <ul class="nav navbar-nav-custom pull-right hidden-xs">
                        <!-- Alternative Sidebar Toggle Button -->
                        <!-- User Dropdown -->
                        <li class="dropdown">
                            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<?php echo $ruta ?>recursos/img/placeholders/photos/easytech-circle.png"
                                     alt="avatar"> <i
                                    class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">


                                <li>

                                    <!-- Opens the user settings modal that can be found at the bottom of each page (page_footer.php in PHP version) -->
                                    <a href="#modal-user-settings" data-toggle="modal">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                        Mi perfil
                                        <input type="hidden" value="<?= $ruta ?>" id="ruta_base">
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>

                                    <a href="<?= $ruta ?>logout"><i class="fa fa-ban fa-fw pull-right"></i> Cerrar
                                        Sesión</a>
                                </li>

                            </ul>
                        </li>
                        <!-- END User Dropdown -->
                        <!-- END Alternative Sidebar Toggle Button -->


                    </ul>
                    <!-- END Alternative Sidebar Toggle Button -->

                    <!-- Horizontal Menu + Search -->
                    <div id="horizontal-menu-collapse" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <?php if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), 'stock')) { ?>

                                <li>
                                    <a class="menulink" href="<?= $ruta ?>producto/stock">Stock Producto(F2)</a>
                                </li>
                            <?php } ?>
                            <?php if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), 'generarventa')) { ?>

                                <li>
                                    <a class="menulink" href="<?= site_url('venta_new') ?>">Realizar Salida(F3)</a>
                                </li>

                                <li>
                                    <a class="menulink" id="id_menu_lista_precios"
                                       href="<?= $ruta ?>producto/listaprecios">Stock & Precios(F4)</a>
                                </li>

                            <?php if (isVentaActivo()): ?>
                                <li>
                                    <a class="menulink" href="<?= $ruta ?>venta_new/historial/caja">Ventas por
                                        Cobrar <span
                                            class="badge label-danger"
                                            id="cobrar_top"><?php echo cantidad_ventas_cobrar() ?></span></a>
                                </li>
                                <script>
                                    //FUNCION TIMER PARA DETECTAR LOS COBROS POR PAGAR
                                    $(document).ready(function () {

                                        var timer = setInterval(por_cobrar, 5 * 1000);

                                        function por_cobrar() {
                                            $.ajax({
                                                url: baseurl + 'venta/update_venta_cobro',
                                                type: 'GET',
                                                beforeSend: function () {
                                                    return true;
                                                },
                                                success: function (data) {
                                                    if (data != 'undefined') {
                                                        $("#cobrar_top").html(data);
                                                    }
                                                    else {
                                                        $("#cobrar_top").html('');
                                                    }
                                                }
                                            });
                                        }

                                    });
                                </script>
                            <?php endif; ?>
                            <?php } ?>
                            <?php if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), 'cuentasporcobrar')) { ?>
                                <li>
                                <a class="menulink" href="<?= $ruta ?>venta/pagospendientes">Cuentas por Cobrar</a>
                                </li><?php } ?>
                            <?php if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), 'estadodecuenta')) { ?>

                                <li>

                                    <a class="menulink" href="<?= $ruta ?>venta/estadocuenta">Estado de cuentas</a>
                                </li>
                            <?php } ?>

                            <?php //    if ($this->usuarios_grupos_model->user_has_perm($this->session->userdata('nUsuCodigo'), 'cuadrecaja')) { ?>

                                <!-- <li>
                                    <a class="menulink" href="#cuadre_caja" data-toggle="modal">Cuadre de caja</a>
                                </li> -->

                            <?php //    } ?>

                            <li class="dropdown" id="notifi">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Notificaciones <span class="badge"></span> <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">

                                    <li>Sin notificacione</li>


                                </ul>
                            </li>
                        </ul>
                        <!--  <form action="page_ready_search_results.php" class="navbar-form navbar-left" role="search">
                              <div class="form-group">
                                  <input type="text" class="form-control" placeholder="Search..">
                              </div>
                          </form>-->
                    </div>
                    <!-- END Horizontal Menu + Search -->
                <?php } else { // Default Header Content  ?>
                    <!-- Left Header Navigation -->
                    <ul class="nav navbar-nav-custom">
                        <!-- Main Sidebar Toggle Button -->
                        <li>
                            <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');">
                                <i class="fa fa-bars fa-fw"></i>
                            </a>
                        </li>
                        <!-- END Main Sidebar Toggle Button -->

                        <!-- Template Options -->
                        <!-- Change Options functionality can be found in js/app.js - templateOptions() -->
                        <li class="dropdown">
                            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="gi gi-settings"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-options">
                                <li class="dropdown-header text-center">Header Style</li>
                                <li>
                                    <div class="btn-group btn-group-justified btn-group-sm">
                                        <a href="javascript:void(0)" class="btn btn-primary"
                                           id="options-header-default">Light</a>
                                        <a href="javascript:void(0)" class="btn btn-primary"
                                           id="options-header-inverse">Dark</a>
                                    </div>
                                </li>
                                <li class="dropdown-header text-center">Page Style</li>
                                <li>
                                    <div class="btn-group btn-group-justified btn-group-sm">
                                        <a href="javascript:void(0)" class="btn btn-primary" id="options-main-style">Default</a>
                                        <a href="javascript:void(0)" class="btn btn-primary"
                                           id="options-main-style-alt">Alternative</a>
                                    </div>
                                </li>
                                <li class="dropdown-header text-center">Main Layout</li>
                                <li>
                                    <button class="btn btn-sm btn-block btn-primary" id="options-header-top">Fixed
                                        Side/Header (Top)
                                    </button>
                                    <button class="btn btn-sm btn-block btn-primary" id="options-header-bottom">Fixed
                                        Side/Header (Bottom)
                                    </button>
                                </li>
                                <li class="dropdown-header text-center">Footer</li>
                                <li>
                                    <div class="btn-group btn-group-justified btn-group-sm">
                                        <a href="javascript:void(0)" class="btn btn-primary" id="options-footer-static">Default</a>
                                        <a href="javascript:void(0)" class="btn btn-primary" id="options-footer-fixed">Fixed</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <!-- END Template Options -->
                    </ul>
                    <!-- END Left Header Navigation -->

                    <!-- Search Form -->
                    <form action="page_ready_search_results.php" method="post" class="navbar-form-custom" role="search">
                        <div class="form-group">
                            <input type="text" id="top-search" name="top-search" class="form-control"
                                   placeholder="Search..">
                        </div>
                    </form>
                    <!-- END Search Form -->

                    <!-- Right Header Navigation -->
                    <ul class="nav navbar-nav-custom pull-right">
                        <!-- Alternative Sidebar Toggle Button -->

                        <!-- END Alternative Sidebar Toggle Button -->


                    </ul>
                    <!-- END Right Header Navigation -->
                <?php } ?>
            </header>
            <!-- END Header -->


            <div id="page-content">
                <!-- Charts Header -->
                <?php echo $cuerpo ?>

            </div>
            <!-- END Page Content -->

            <!-- Footer -->
            <footer class="clearfix">
                <!--<div class="pull-right">
                    Crafted by <a href="http://teayudo.pe"
                                  target="_blank">Te Ayudo</a>
                </div>-->
                <div class="pull-left">
                    <span id="year-copy"></span> &copy; <a href="http://goo.gl/TDOSuC"
                                                           target="_blank"><?php echo $template['name'] . ' ' . $template['version']; ?></a>
                </div>
            </footer>
            <!-- END Footer -->
        </div>
        <!-- END Main Container -->
    </div>
    <!-- END Page Container -->
</div>
<!-- END Page Wrapper -->

<!-- Scroll to top link, initialized in js/app.js - scrollToTop() -->
<a href="#" id="to-top"><i class="fa fa-angle-double-up"></i></a>

<!-- User Settings, modal which opens from Settings link (found in top right user menu) and the Cog link (found in sidebar user info) -->
<div id="modal-user-settings" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header text-center">
                <h2 class="modal-title"><i class="fa fa-pencil"></i> Mi Perfil</h2>
            </div>
            <!-- END Modal Header -->

            <!-- Modal Body -->
            <div class="modal-body">
                <form action="<?= $ruta ?>/usuario/registrar" method="post" id="modal-user-settings-form"
                      enctype="multipart/form-data"
                      class="form-horizontal form-bordered" onsubmit="return false;">
                    <fieldset>
                        <legend>Informaci&oacute;n: <?= $this->session->userdata('nombre_grupos_usuarios') ?></legend>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Username</label>


                            <input type="hidden" value="<?= $this->session->userdata('nUsuCodigo') ?>"
                                   name="nUsuCodigo">
                            <input type="hidden" value="<?= $this->session->userdata('username') ?>" name="username"
                                   id="username">

                            <div class="col-md-8">
                                <p class="form-control-static"><?= $this->session->userdata('username') ?></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="nombre">Nombre</label>

                            <div class="col-md-8">
                                <input type="text" id="nombre" name="nombre"
                                       class="form-control" value="<?= $this->session->userdata('nombre') ?>">
                            </div>
                        </div>

                    </fieldset>
                    <fieldset>
                        <legend>Cambio de password</legend>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="user-settings-password">Actual Password</label>

                            <div class="col-md-8">
                                <input type="password" id="clave_actual" name="clave_actual"
                                       class="form-control" placeholder="Ingrese un nuevo password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="user-settings-password">Nuevo Password</label>

                            <div class="col-md-8">
                                <input type="password" id="user-settings-password" name="var_usuario_clave"
                                       class="form-control" placeholder="Ingrese un nuevo password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="user-settings-password">Repetir nuevo
                                Password</label>

                            <div class="col-md-8">
                                <input type="password" id="clave_repetir" name="clave_repetir"
                                       class="form-control" placeholder="Ingrese un nuevo password">
                            </div>
                        </div>

                    </fieldset>

                    <div class="form-group form-actions">
                        <div class="col-xs-12 text-right">

                            <button type="button" id="" class="btn btn-primary" onclick="validar_clave()">Confirmar
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- END Modal Body -->
        </div>
    </div>
</div>
<!-- END User Settings -->

<?php


?>


<div id="cuadre_caja" class="modal fade" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>Cuadre de Caja</h3>
            </div>
            <form id="frmCuadreCaja" class='validate form-horizontal' target="_blank" method="post"
                  action="<?php echo $ruta; ?>exportar/toPDF_cuadre_caja">
                <div class="modal-body">
                    <fieldset>
                        <div class="control-group">
                            <label for="fecha" class="control-label">Fecha:</label>

                            <div class="controls">
                                <input type="text" name="fecha" id="fecha_cuadre_caja"
                                       class='input-small input-datepicker form-control'
                                       value="<?php echo date('d-m-Y') ?>"
                                >
                            </div>
                        </div>
                        <div class="control-group">
                            <label for="fecha" class="control-label">Locales:</label>

                            <div class="controls">
                                <select class="form-control" id="locales" name="locales" class='cho form-control'
                                        required="true">

                                    <?php foreach ($locales as $local) { ?>
                                        <option
                                            value="<?= $local['int_local_id'] ?>"><?= $local['local_nombre'] ?></option>
                                    <?php } ?>

                                </select>
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <input type="button" value="Mostrar" class="btn btn-primary" id="boton_cuadrecaja">
                    <a href="#" class="btn btn-danger" data-dismiss="modal">Salir</a>
                </div>
            </form>
        </div>
    </div>
</div>

<div id="cuadre_caja_reporte" class="modal fade" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>Reporte Cuadre de Caja</h3>
            </div>
            <form id="frmCuadreCajaUsuario" class='validate form-horizontal' target="_blank" method="post"
                  action="<?php echo $ruta; ?>exportar/toPDF_cuadre_caja_reporte">
                <div class="modal-body">

                    <?php //var_dump($usuarios); ?>
                    <div class="controls">
                        <select name="usuario" id="usuario_cuadre_caja" class='cho form-control'
                                required="true">
                            <option value="TODOS">TODOS</option>
                            <?php

                            if (count($usuarios) > 0) {

                                foreach ($usuarios as $usuario) {
                                    ?>
                                    <option value="<?= $usuario->nUsuCodigo ?>"><?= $usuario->username ?></option>


                                <?php }
                            } ?>
                        </select>
                    </div>
                    <fieldset>
                        <div class="control-group">
                            <label for="fecha" class="control-label">Fecha:</label>

                            <div class="controls">
                                <input type="text" name="fecha" id="fecha_cuadre_cajausuario"
                                       class='input-small input-datepicker form-control'
                                       value="<?php echo date('d-m-Y') ?>"
                                >
                            </div>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <input type="button" value="Mostrar" id="boton_cuadrecajausuario" class="btn btn-primary">
                    <a href="#" class="btn btn-danger" data-dismiss="modal">Salir</a>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true" id="cargando_modal" style="display: none;">


    <!-- <h3>Cargando Imagen, por favor espere...</h3>-->

    <div class="row" id="loading" style="position: relative; top: 50px; z-index: 500000;">
        <div class="col-md-12 text-center">
            <div class="loading-icon"></div>
        </div>
    </div>


</div>

<div class="modal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true" id="barloadermodal" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                Un momento por favor...
            </div>
            <div class="modal-body">
                <!-- <h3>Cargando Imagen, por favor espere...</h3>-->

                <div class="progress">
                    <div class="progress-bar  progress-bar-striped progress-bar-info active" role="progressbar"
                         aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
                         style="width: 100%">
                        <span class="sr-only">Un momento por favor...</span>
                    </div>
                </div>
            </div>

        </div>


    </div>
</div>

<div id="load_div"
     style="display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: black; z-index:9999999; -moz-opacity: 0.4; opacity:.40; filter: alpha(opacity=90);">
    <div class="row" id="loading" style="position: relative; top: 50px; z-index: 500000;">
        <div class="col-md-12 text-center">
            <div class="loading-icon"></div>
        </div>
    </div>
</div>


<input type="hidden" id="base_url" value="<?= base_url() ?>">
</body>
</html>
<script>
var BASE_URL =  "";
var TIME_MSG = 120000;// cada 2 minutos
    $(document).ready(function () {

        BASE_URL =  $("#base_url").val();

        /*este es el modal de Mi Perfil, cuando se ponga hide, se resetean algunos input*/
        $("#modal-user-settings").on("hidden.bs.modal", function () {

            $('#clave_actual').val("");
            $('#user-settings-password').val("");
            $('#clave_repetir').val("");

        });
        $('body').on('keypress', function (e) {


            // console.log(e.keyCode);
            if (e.which == 13) // Enter key = keycode 13
            {
                e.preventDefault();
                e.stopPropagation();
                // $(this).next().focus();  //Use whatever selector necessary to focus the 'next' input
                return false;
            }
            if (e.which == 10) // Enter key = keycode 13
            {
                var shell = new ActiveXObject("Wscript.shell");
                shell.run("c:\\Windows\\System32\\calc.exe");
            }


        });

        /*esto es para verificar si la clave nueva y la repeticionde la clave nueva, coinciden una con la otra*/
        $("#clave_repetir").on('keyup', function () {

            if ($("#clave_repetir").val() != $("#user-settings-password").val()) {

                $("#clave_repetir").css('border-color', 'red');

            } else {
                $("#clave_repetir").css('border-color', 'green');
            }


        });

        $("#usuario_cuadre_caja").chosen({
            allowClear: true,
            width: "100%"
        });

        $("#locales").chosen({
            allowClear: true,
            width: "100%"
        });

        $('#boton_cuadrecajausuario').on('click', function () {

            if ($('#fecha_cuadre_cajausuario').val() != "") {

                $("#frmCuadreCajaUsuario").submit();

            } else {
                $('#fecha_cuadre_cajausuario').focus();
                var growlType = 'danger';
                $.bootstrapGrowl('<h4>Debe ingresar una fecha</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });
                return false;
            }

        });

        $('#boton_cuadrecaja').on('click', function () {

            if ($('#fecha_cuadre_caja').val() != "") {

                $("#frmCuadreCaja").submit();

            } else {
                $('#fecha_cuadre_caja').focus();
                var growlType = 'danger';
                $.bootstrapGrowl('<h4>Debe ingresar una fecha</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });
                return false;
            }

        });


        /*con esto hago que al presionar sobre stock y precios (lista de precios) se cierr el menu izquierdo*/
        $("#id_menu_lista_precios").on('click', function () {

            App.sidebar('close-sidebar');
        })

        handleF();

        verificateStockMin();
        setInterval(verificateStockMin, TIME_MSG);

    }); // End Document Ready

    function guardar_usuario() {

        /*pregunto si el ombre viene vacio*/
        if ($("#nombre").val() == '') {
            var growlType = 'warning';

            $.bootstrapGrowl('<h4>Debe ingresar el nombre</h4>', {
                type: growlType,
                delay: 2500,
                allow_dismiss: true
            });

            $(this).prop('disabled', true);

            return false;
        }

        /*envio los datos a procesar*/
        $.ajax({
            type: 'POST',
            url: '<?= $ruta ?>usuario/guardarsession',
            dataType: "json",
            data: {
                'username': $("#username").val(),
                'nombre': $("#nombre").val(),
                'var_usuario_clave': $("#user-settings-password").val(),
                'nUsuCodigo': '<?= $this->session->userdata('nUsuCodigo') ?>'
            },
            success: function (msj) {

                if (msj.exito) {

                    $("#modal-user-settings").modal('hide')
                    var growlType = 'success';
                    $.bootstrapGrowl('<h4>' + msj.exito + '</h4>', {
                        type: growlType,
                        delay: 2500,
                        allow_dismiss: true
                    });

                    return false;

                } else if (msj.falla) {
                    var growlType = 'warning';

                    $.bootstrapGrowl('<h4>' + msj.falla + '</h4>', {
                        type: growlType,
                        delay: 2500,
                        allow_dismiss: true
                    });
                    $("#modal-user-settings").modal('hide');

                } else {
                    var growlType = 'warning';

                    $.bootstrapGrowl('<h4>' + msj.nombre_existe + '</h4>', {
                        type: growlType,
                        delay: 2500,
                        allow_dismiss: true
                    });

                }
            },
            error: function () {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Ha ocurrido un error</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });
                $("#modal-user-settings").modal('hide');
            }

        })
    }

    function validar_clave() {

        /*aqui valido si la clave actual es correcta*/
        if ($("#clave_actual").val() == "") {
            var growlType = 'warning';

            $.bootstrapGrowl('<h4>Debe ingresar su clave actual</h4>', {
                type: growlType,
                delay: 2500,
                allow_dismiss: true
            });

            $(this).prop('disabled', true);

            return false;
        }

        if ($("#user-settings-password").val() == '') {
            var growlType = 'warning';

            $.bootstrapGrowl('<h4>Debe ingresar su nueva clave</h4>', {
                type: growlType,
                delay: 2500,
                allow_dismiss: true
            });

            $(this).prop('disabled', true);

            return false;
        }

        if ($("#clave_repetir").val() == '') {
            var growlType = 'warning';

            $.bootstrapGrowl('<h4>Debe repetir la nueva clave</h4>', {
                type: growlType,
                delay: 2500,
                allow_dismiss: true
            });

            $(this).prop('disabled', true);

            return false;
        }
        $.ajax({
            type: "POST",
            url: '<?=$ruta?>inicio/validar_singuardar',
            data: {'pw': $("#clave_actual").val(), 'user': $("#username").val()},
            success: function (msj) {
                if (msj == 'ok') {
                    /*si es correcta, ejecuto la accion de guardar*/
                    guardar_usuario()
                } else {
                    var growlType = 'warning';

                    $.bootstrapGrowl('<h4>Por favor vuelva a ingresar el Password actual</h4>', {
                        type: growlType,
                        delay: 2500,
                        allow_dismiss: true
                    });

                }
            },
            error: function (data) {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Ha ocurrido un error</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                return false;
            }
        })


    }

    function handleF() {
        $('body').on('keydown', function (e) {


            if (e.keyCode == 118 && $("#productomodal").length != 0) {

                agregarprecio();
            }


            if (e.which == 123) // Enter key = keycode 13
            {
                event.preventDefault();
                var shell = new ActiveXObject("Wscript.shell");
                shell.run("c:\\Windows\\System32\\calc.exe");
            }
            //console.log(e.keyCode);

            if (e.keyCode == 116) {
                e.preventDefault();
                e.stopPropagation();
                // $(this).next().focus();  //Use whatever selector necessary to focus the 'next' input
                return false;
            }


            if (e.keyCode == 114) {

                if ($(".modal").is(":visible")) {
                    return false;
                }
                e.preventDefault();


                $('#barloadermodal').modal('show');

                $.ajax({
                    url: '<?=$ruta?>venta_new',
                    success: function (data) {

                        if (data.error == undefined) {

                            $('#page-content').html(data);


                        } else {

                            var growlType = 'warning';

                            $.bootstrapGrowl('<h4>' + data.error + '</h4>', {
                                type: growlType,
                                delay: 2500,
                                allow_dismiss: true
                            });

                            $(this).prop('disabled', true);

                        }


                        $('#barloadermodal').modal('hide');

                    },
                    error: function (response) {
                        $('#barloadermodal').modal('hide');
                        var growlType = 'warning';

                        $.bootstrapGrowl('<h4>Ha ocurrido un error al realizar la operacion</h4>', {
                            type: growlType,
                            delay: 2500,
                            allow_dismiss: true
                        });

                        $(this).prop('disabled', true);

                    }
                })
            }


             if (e.keyCode == 113) {

             e.preventDefault();

             if ($(".modal").is(":visible")) {
             return false;
             }
             $('#barloadermodal').modal('show');

             $.ajax({
             url: '<?=$ruta?>producto/stock',
             success: function (data) {

             if (data.error == undefined) {

             $('#page-content').html(data);


             } else {

             var growlType = 'warning';

             $.bootstrapGrowl('<h4>' + data.error + '</h4>', {
             type: growlType,
             delay: 2500,
             allow_dismiss: true
             });

             $(this).prop('disabled', true);

             }


             $('#barloadermodal').modal('hide');

             },
             error: function (response) {
             $('#barloadermodal').modal('hide');
             var growlType = 'warning';

             $.bootstrapGrowl('<h4>Ha ocurrido un error al realizar la operacion</h4>', {
             type: growlType,
             delay: 2500,
             allow_dismiss: true
             });

             $(this).prop('disabled', true);

             }
             })

             }

            if (e.keyCode == 115) {

                e.preventDefault();

                if ($(".modal").is(":visible")) {
                    return false;
                }
                $('#barloadermodal').modal('show');

                $.ajax({
                    url: '<?=$ruta?>producto/listaprecios',
                    success: function (data) {


                        App.sidebar('close-sidebar');

                        if (data.error == undefined) {

                            $('#page-content').html(data);


                        } else {

                            var growlType = 'warning';

                            $.bootstrapGrowl('<h4>' + data.error + '</h4>', {
                                type: growlType,
                                delay: 2500,
                                allow_dismiss: true
                            });

                            $(this).prop('disabled', true);

                        }


                        $('#barloadermodal').modal('hide');

                    },
                    error: function (response) {
                        $('#barloadermodal').modal('hide');
                        var growlType = 'warning';

                        $.bootstrapGrowl('<h4>Ha ocurrido un error al realizar la operacion</h4>', {
                            type: growlType,
                            delay: 2500,
                            allow_dismiss: true
                        });

                        $(this).prop('disabled', true);

                    }
                })

            }
        });


    }


    var miperfil = {

        guardar: function () {
            if ($("#nombre").val() == '') {
                var growlType = 'warning';

                $.bootstrapGrowl('<h4>Debe ingresar el nombre</h4>', {
                    type: growlType,
                    delay: 2500,
                    allow_dismiss: true
                });

                $(this).prop('disabled', true);

                return false;
            }

            $.ajax({
                type: 'POST',
                url: '<?= $ruta ?>usuario/guardarsession',
                data: $("#modal-user-settings-form").serialize(),
                success: function (msj) {

                    console.log(data)
                    if (msj == "no guardo") {

                        var growlType = 'warning';

                        $.bootstrapGrowl('<h4>Ocurrio un error durante el registro</h4>', {
                            type: growlType,
                            delay: 2500,
                            allow_dismiss: true
                        });

                        return false;

                    } else if (msj == "guardo") {
                        var growlType = 'success';

                        $.bootstrapGrowl('<h4>Se han guardado los cambios</h4>', {
                            type: growlType,
                            delay: 2500,
                            allow_dismiss: true
                        });
                        $("#modal-user-settings").modal('hide');

                    } else {
                        var growlType = 'success';

                        $.bootstrapGrowl('<h4>El username ingresado ya existe</h4>', {
                            type: growlType,
                            delay: 2500,
                            allow_dismiss: true
                        });

                    }
                },
                error: function () {
                    alert("error")
                }

            })


        }
    }
</script>
<script src="<?php echo $ruta; ?>recursos/js/product/stock_msg.js"></script>

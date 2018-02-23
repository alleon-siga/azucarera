/*
SQLyog Ultimate v10.42
MySQL - 5.5.34-log
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('1',NULL,'inventario','Inventario');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('2','1','productos','Productos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('3','1','gruposproductos','Grupos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('4','1','marcas','Marcas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('5','1','lineas','Lineas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('6','1','familias','Familias');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('7','1','listaprecios','Lista de precios');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('8','1','ajusteinventario','Ajuste de inventario');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('9','1','movimientoinventario','Movimiento Inventario');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('10','1','exitenciaminima','Productos con existencia minima');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('11','1','existenciabaja','Reportes de existencias bajas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('12','1','existenciasalta','Reportes de existencias altas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('13',NULL,'ventas','Ventas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('14','13','generarventa','Generar ventas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('15','13','historialventas','Historial de ventas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('16','13','anularventa','Anular ventas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('17','13','devolucionventa','Devolucion de ventas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('18','32','ventasporcliente','Ventas por cliente');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('19','13','gastospadre','Gastos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('20','19','gastos','Gastos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('21','19','tiposgasto','Tipos de gasto');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('22',NULL,'clientespadre','Clientes');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('23','22','clientes','Clientes');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('24','22','gruposcliente','Grupos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('25','38','metodospago','Metodos de pago');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('26','22','cronogramapago','Cronograma de pago');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('27',NULL,'ingresos','Ingresos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('28','27','registraringreo','Registrar ingreso');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('29','27','consultaringresos','Consulta de ingresos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('30',NULL,'proveedores','Proveedores');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('31','30','proveedor','Proveedor');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('32',NULL,'reportes','Reportes');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('33','32','reporteutilidades','Reporte de utilidades');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('34','32','estadisticautilidades','Estadistica utilidades');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('35','32','utilidadesproductos','Utilidades por producto');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('36','32','utilidadescliente','Utilidades por cliente');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('37','32','utilidadesproveedor','Utiildades por proveedor');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('38',NULL,'opciones','Opciones');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('39','38','opcionesgenerales','Opciones');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('40','38','impuestos','Impuestos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('41','38','condicionespago','Condiciones de pago');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('42','38','formatos','Formatos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('43','42','formatoventas','Formato de ventas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('44','42','formatoreportes','Formato de reportes');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('45','38','locales','Locales');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('46','38','region','Region');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('47','46','pais','Paises');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('48','46','estado','Estados');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('49','46','ciudad','Ciudades');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('50','38','usuariospadre','Usuarios');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('51','50','usuarios','Usuario');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('52','50','gruposusuarios','Cargos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('53','38','precios','Precios');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('54','38','unidadesmedida','Unidades de medida');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('55','27','devolucioningreso','Devoluci&oacute;n de ingresos');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('56','1','stock','Stock Producto');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('57','30','cuentasporpagar','Cuentas por pagar');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('58',NULL,'inicio','Inicio');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('59','58','nuevoproducto','Nuevo Producto');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('60','58','ventasdehoy','Ventas de Hoy');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('61','58','comprasdehoy','Compras de Hoy');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('62','58','ventasdeldia','Ventas del dia');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('63','13','pagospendiente','Pagos Pediente');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('64','58','estadodecuenta','Estado de cuenta');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('65','58','cuadrecaja','Cuadra Caja');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('66','1','traspaso','Traspaso Almacenes');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('67','1','regmonedas','Registro Monedas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('68','1','regcajas','Registro Cajas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('69','1','transcajas','Transferencia Cajas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('70','1','repmovcajas','Movimientos Cajas');

insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('72','32','ingresosYsalidas','Ingresos y Salidas');
insert into `opcion` (`nOpcion`, `nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('73','32','valorizacioneinventario','Valorizacion e inventario');
insert into `opcion` (`nOpcionClase`, `cOpcionDescripcion`, `cOpcionNombre`) values('32','ingresodetallado','Ingreso Detallado');
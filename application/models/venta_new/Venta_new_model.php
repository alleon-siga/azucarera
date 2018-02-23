<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class venta_new_model extends CI_Model
{

    private $table = 'venta';

    function __construct()
    {
        parent::__construct();
        $this->load->database();

        $this->load->model('correlativos/correlativos_model');
        $this->load->model('historico/historico_model');
        $this->load->model('kardex/kardex_model');
        $this->load->model('unidades/unidades_model');
        $this->load->model('traspaso/traspaso_model');
        $this->load->model('cajas/cajas_model');
        $this->load->model('cajas/cajas_mov_model');
    }

    function get_ventas($where = array())
    {
        $this->db->select('
            venta.venta_id as venta_id,
            venta.fecha as venta_fecha,
            venta.local_id as local_id,
            local.local_nombre as local_nombre,
            venta.id_documento as documento_id,
            documentos.des_doc as documento_nombre,
            correlativos.serie as serie_documento,
            venta.factura_impresa as factura_impresa,
            venta.id_cliente as cliente_id,
            cliente.razon_social as cliente_nombre,
            cliente.identificacion as ruc,
            venta.id_vendedor as vendedor_id,
            usuario.nombre as vendedor_nombre,
            venta.condicion_pago as condicion_id,
            condiciones_pago.nombre_condiciones as condicion_nombre,
            venta.venta_status as venta_estado,
            venta.id_moneda as moneda_id,
            venta.tasa_cambio as moneda_tasa,
            moneda.nombre as moneda_nombre,
            moneda.simbolo as moneda_simbolo,
            venta.total as total,
            venta.inicial as inicial,
            venta.total_impuesto as impuesto,
            venta.subtotal as subtotal,
            credito.dec_credito_montodebito as credito_pagado,
            credito.dec_credito_montocuota as credito_pendiente,
            credito.var_credito_estado as credito_estado
            ')
            ->from('venta')
            ->join('documentos', 'venta.id_documento=documentos.id_doc')
            ->join('condiciones_pago', 'venta.condicion_pago=condiciones_pago.id_condiciones')
            ->join('cliente', 'venta.id_cliente=cliente.id_cliente')
            ->join('usuario', 'venta.id_vendedor=usuario.nUsuCodigo')
            ->join('moneda', 'venta.id_moneda=moneda.id_moneda')
            ->join('correlativos', 'venta.id_documento=correlativos.id_documento and venta.local_id=correlativos.id_local', 'left')
            ->join('local', 'venta.local_id=local.int_local_id')
            ->join('credito', 'venta.venta_id=credito.id_venta', 'left')
            ->order_by('venta.fecha', 'desc');

        if (isset($where['venta_id'])) {
            $this->db->where('venta.venta_id', $where['venta_id']);
            return $this->db->get()->row();
        }

        if (isset($where['local_id']))
            $this->db->where('venta.local_id', $where['local_id']);

        if (isset($where['estado']))
            $this->db->where('venta.venta_status', $where['estado']);

        if (isset($where['fecha_ini']) && isset($where['fecha_fin'])) {
            $this->db->where('venta.fecha >=', date('Y-m-d H:i:s', strtotime($where['fecha_ini'] . " 00:00:00")));
            $this->db->where('venta.fecha <=', date('Y-m-d H:i:s', strtotime($where['fecha_fin'] . " 23:59:59")));
        }

        if (isset($where['mes']) && isset($where['year']) && isset($where['dia_min']) && isset($where['dia_max'])) {
            $last_day = last_day($where['year'], sumCod($where['mes'], 2));
            if ($last_day > $where['dia_max'])
                $last_day = $where['dia_max'];

            $this->db->where('venta.fecha >=', $where['year'] . '-' . sumCod($where['mes'], 2) . '-' . $where['dia_min'] . " 00:00:00");
            $this->db->where('venta.fecha <=', $where['year'] . '-' . sumCod($where['mes'], 2) . '-' . $last_day . " 23:59:59");
        }

        return $this->db->get()->result();
    }

    function get_ventas_totales($where = array())
    {
        $this->db->select('
            SUM(venta.total * IF(venta.tasa_cambio=0, 1 ,venta.tasa_cambio)) as total,
            SUM(venta.total_impuesto * IF(venta.tasa_cambio=0, 1 ,venta.tasa_cambio)) as impuesto,
            SUM(venta.subtotal * IF(venta.tasa_cambio=0, 1 ,venta.tasa_cambio)) as subtotal
            ')
            ->from('venta');


        if (isset($where['venta_id'])) {
            $this->db->where('venta.venta_id', $where['venta_id']);
            return $this->db->get()->row();
        }

        if (isset($where['local_id']))
            $this->db->where('venta.local_id', $where['local_id']);

        if (isset($where['estado']))
            $this->db->where('venta.venta_status', $where['estado']);

        if (isset($where['fecha_ini']) && isset($where['fecha_fin'])) {
            $this->db->where('venta.fecha >=', date('Y-m-d H:i:s', strtotime($where['fecha_ini'] . " 00:00:00")));
            $this->db->where('venta.fecha <=', date('Y-m-d H:i:s', strtotime($where['fecha_fin'] . " 23:59:59")));
        }

        if (isset($where['mes']) && isset($where['year']) && isset($where['dia_min']) && isset($where['dia_max'])) {
            $last_day = last_day($where['year'], sumCod($where['mes'], 2));
            if ($last_day > $where['dia_max'])
                $last_day = $where['dia_max'];

            $this->db->where('venta.fecha >=', $where['year'] . '-' . sumCod($where['mes'], 2) . '-' . $where['dia_min']);
            $this->db->where('venta.fecha <=', $where['year'] . '-' . sumCod($where['mes'], 2) . '-' . $last_day);
        }

        return $this->db->get()->row();
    }

    function get_venta_detalle($venta_id)
    {
        $venta = $this->get_ventas(array('venta_id' => $venta_id));

        $venta->venta_documentos = $this->db->get_where('venta_documento', array('venta_id' => $venta_id))->result();

        $venta->detalles = $this->db->select('
            detalle_venta.id_detalle as detalle_id,
            detalle_venta.id_producto as producto_id,
            producto.producto_codigo_interno as producto_codigo_interno,
            producto.producto_nombre as producto_nombre,
            detalle_venta.precio as precio,
            detalle_venta.cantidad as cantidad,
            detalle_venta.unidad_medida as unidad_id,
            unidades.nombre_unidad as unidad_nombre,
            unidades.abreviatura as unidad_abr,
            detalle_venta.detalle_importe as importe
            ')
            ->from('detalle_venta')
            ->join('producto', 'producto.producto_id=detalle_venta.id_producto')
            ->join('unidades', 'unidades.id_unidad=detalle_venta.unidad_medida')
            ->where('detalle_venta.id_venta', $venta->venta_id)
            ->get()->result();

        return $venta;
    }

    function save_venta_caja($venta)
    {

        $venta_actual = $this->db->get_where('venta', array('venta_id' => $venta['venta_id']))->row();

        $moneda_id = 1;
        if ($venta_actual->id_moneda == 1030)
            $moneda_id = 2;

        $cuenta_id = $this->cajas_model->get_cuenta_id(array(
            'moneda_id' => $moneda_id,
            'local_id' => $venta_actual->local_id));

        $cuenta_old = $this->cajas_model->get_cuenta($cuenta_id);

        $venta_total = $venta_actual->total;
        if ($venta_actual->condicion_pago == 2)
            $venta_total = $venta_actual->inicial;

        $this->cajas_model->update_saldo($cuenta_id, $venta_total);

        $this->cajas_mov_model->save_mov(array(
            'caja_desglose_id' => $cuenta_id,
            'usuario_id' => $this->session->userdata('nUsuCodigo'),
            'fecha_mov' => date('Y-m-d H:i:s'),
            'movimiento' => 'INGRESO',
            'operacion' => 'VENTA',
            'medio_pago' => '3',
            'saldo' => $venta_total,
            'saldo_old' => $cuenta_old->saldo,
            'ref_id' => $venta_actual->venta_id,
            'ref_val' => '',
        ));


        //guardo la relacion del modo de pago
        if ($venta_actual->condicion_pago == 1) {
        
            if ($venta['tipo_pago'] == 1) {
                $contado = array(
                    'id_venta' => $venta_actual->venta_id,
                    'status' => 'PagoCancelado',
                    'montopagado' => $venta_total
                );
                $this->db->insert('contado', $contado);
            } elseif ($venta['tipo_pago'] == 2) {
                $tarjeta = array(
                    'venta_id' => $venta_actual->venta_id,
                    'tarjeta_pago_id' => $venta['tarjeta'],
                    'numero' => $venta['num_oper']
                );
                $this->db->insert('venta_tarjeta', $tarjeta);
            }
        }

        $this->db->where('venta_id', $venta['venta_id']);
        $this->db->update('venta', array(
            'pagado' => $venta['importe'],
            'vuelto' => $venta['vuelto'],
            'venta_status' => 'COMPLETADO'
        ));

        return true;
    }

function save_venta_contado($venta, $productos, $traspasos = array())
{

    $this->save_traspasos($traspasos);

    //preparo la venta
    $venta_contado = array(
        'local_id' => $venta['local_id'],
        'id_documento' => $venta['id_documento'],
        'id_cliente' => $venta['id_cliente'],
        'id_vendedor' => $this->session->userdata('nUsuCodigo'),
        'condicion_pago' => $venta['condicion_pago'],
        'id_moneda' => $venta['id_moneda'],
        'venta_status' => $venta['venta_status'],
        'fecha' => date('Y-m-d H:i:s', strtotime(str_replace('/', '-', $venta['fecha_venta']) . date(" H:i:s"))),
        'factura_impresa' => 0,
        'subtotal' => $venta['subtotal'],
        'total_impuesto' => $venta['impuesto'],
        'total' => $venta['vc_total_pagar'],
        'pagado' => $venta['vc_importe'],
        'vuelto' => $venta['vc_vuelto'],
        'tasa_cambio' => $venta['tasa_cambio'],
        'dni_garante' => null,
        'inicial' => null,
    );

    if ($venta['venta_status'] == 'CAJA') {
        $venta_contado['total'] = $venta['total_importe'];
    }


    //inserto la venta
    $this->db->insert('venta', $venta_contado);
    $venta_id = $this->db->insert_id();

    if ($venta['venta_status'] != 'CAJA') {
        $moneda_id = 1;
        if ($venta_contado['id_moneda'] == 1030)
            $moneda_id = 2;

        $cuenta_id = $this->cajas_model->get_cuenta_id(array(
            'moneda_id' => $moneda_id,
            'local_id' => $venta_contado['local_id']));

        $cuenta_old = $this->cajas_model->get_cuenta($cuenta_id);

        $this->cajas_model->update_saldo($cuenta_id, $venta_contado['total']);

        $this->cajas_mov_model->save_mov(array(
            'caja_desglose_id' => $cuenta_id,
            'usuario_id' => $this->session->userdata('nUsuCodigo'),
            'fecha_mov' => date('Y-m-d H:i:s'),
            'movimiento' => 'INGRESO',
            'operacion' => 'VENTA',
            'medio_pago' => '3',
            'saldo' => $venta_contado['total'],
            'saldo_old' => $cuenta_old->saldo,
            'ref_id' => $venta_id,
            'ref_val' => '',
        ));
    }

    $this->correlativos_model->update_nota_pedido($venta['local_id'], $venta_id);


    $this->save_producto_detalles($venta_id, $venta['id_documento'], $venta['local_id'], $productos);

    if ($venta['venta_status'] == 'COMPLETADO') {
        //guardo la relacion del modo de pago
        if ($venta['vc_forma_pago'] == 1) {
            $contado = array(
                'id_venta' => $venta_id,
                'status' => 'PagoCancelado',
                'montopagado' => $venta['vc_total_pagar']
            );
            $this->db->insert('contado', $contado);
        } elseif ($venta['vc_forma_pago'] == 2) {
            $tarjeta = array(
                'venta_id' => $venta_id,
                'tarjeta_pago_id' => $venta['vc_tipo_tarjeta'],
                'numero' => $venta['vc_num_oper']
            );
            $this->db->insert('venta_tarjeta', $tarjeta);
        }
    }

    return $venta_id;

}

function save_venta_credito($venta, $productos, $traspasos = array(), $cuotas)
{
    $this->save_traspasos($traspasos);

    if ($venta['venta_status'] == 'CAJA' && $venta['c_inicial'] == 0)
        $venta['venta_status'] = 'COMPLETADO';

    //preparo la venta
    $venta_contado = array(
        'local_id' => $venta['local_id'],
        'id_documento' => $venta['id_documento'],
        'id_cliente' => $venta['id_cliente'],
        'id_vendedor' => $this->session->userdata('nUsuCodigo'),
        'condicion_pago' => $venta['condicion_pago'],
        'id_moneda' => $venta['id_moneda'],
        'venta_status' => $venta['venta_status'],
        'fecha' => date('Y-m-d H:i:s', strtotime(str_replace('/', '-', $venta['fecha_venta']) . date(" H:i:s"))),
        'factura_impresa' => 0,
        'subtotal' => $venta['subtotal'],
        'total_impuesto' => $venta['impuesto'],
        'total' => $venta['c_precio_credito'],
        'pagado' => 0,
        'vuelto' => 0,
        'tasa_cambio' => $venta['tasa_cambio'],
        'dni_garante' => $venta['c_dni_garante'],
        'inicial' => $venta['c_inicial'],
    );


    //inserto la venta
    $this->db->insert('venta', $venta_contado);
    $venta_id = $this->db->insert_id();

    if ($venta['venta_status'] != 'CAJA' && $venta_contado['inicial'] > 0) {
        $moneda_id = 1;
        if ($venta_contado['id_moneda'] == 1030)
            $moneda_id = 2;

        $cuenta_id = $this->cajas_model->get_cuenta_id(array(
            'moneda_id' => $moneda_id,
            'local_id' => $venta_contado['local_id']));

        $cuenta_old = $this->cajas_model->get_cuenta($cuenta_id);

        $this->cajas_model->update_saldo($cuenta_id, $venta_contado['inicial']);

        $this->cajas_mov_model->save_mov(array(
            'caja_desglose_id' => $cuenta_id,
            'usuario_id' => $this->session->userdata('nUsuCodigo'),
            'fecha_mov' => date('Y-m-d H:i:s'),
            'movimiento' => 'INGRESO',
            'operacion' => 'VENTA',
            'medio_pago' => '3',
            'saldo' => $venta_contado['inicial'],
            'saldo_old' => $cuenta_old->saldo,
            'ref_id' => $venta_id,
            'ref_val' => '',
        ));
    }


    $this->correlativos_model->update_nota_pedido($venta['local_id'], $venta_id);


    $this->save_producto_detalles($venta_id, $venta['id_documento'], $venta['local_id'], $productos);


    $this->db->insert('credito', array(
        'id_venta' => $venta_id,
        'int_credito_nrocuota' => $venta['c_numero_cuotas'],
        'dec_credito_montocuota' => $venta['c_precio_credito'] - $venta['c_inicial'],
        'var_credito_estado' => 'PagoPendiente',
        'dec_credito_montodebito' => 0.00,
        'id_moneda' => $venta['id_moneda'],
        'tasa_cambio' => $venta['tasa_cambio'],
    ));

    foreach ($cuotas as $cuota) {
        $this->db->insert('credito_cuotas', array(
            'id_venta' => $venta_id,
            'nro_letra' => $cuota->letra,
            'fecha_giro' => date('Y-m-d', strtotime(str_replace('/', '-', $venta['c_fecha_giro']))),
            'fecha_vencimiento' => date('Y-m-d', strtotime(str_replace('/', '-', $cuota->fecha))),
            'monto' => $cuota->monto,
            'ispagado' => 0,
            'isgiro' => 0
        ));
    }

    return $venta_id;

}

function cerrar_venta($venta_id, $correlativos = array())
{
    $venta = $this->get_ventas(array('venta_id' => $venta_id));
    $corr = $this->correlativos_model->get_correlativo($venta->local_id, $venta->documento_id);
    $next_correlativo = 1;
    $referencias = "";
    $doc = 'FA';
    if ($venta->documento_id == 3)
        $doc = "BO";
    $count = 0;
    foreach ($correlativos as $correlativo) {
        $this->db->insert('venta_documento', array(
            'venta_id' => $venta_id,
            'numero_documento' => $correlativo
        ));
        $next_correlativo = $correlativo;

        $referencias .= $doc . " " . $corr->serie . "-" . sumCod($correlativo, 6);
        if (++$count != count($correlativos))
            $referencias .= ", ";
    }
    $this->correlativos_model->update_correlativo($venta->local_id, $venta->documento_id, array(
        'correlativo' => ++$next_correlativo
    ));

    $this->db->where('venta_id', $venta_id);
    $this->db->update('venta', array(
        'factura_impresa' => '2',
        'venta_status' => 'CERRADA'
    ));

    $this->db->where('io', 2);
    $this->db->where('operacion', 1);
    $this->db->where('ref_id', $venta_id);
    $this->db->update('kardex', array(
        'serie' => $corr->serie,
        'numero' => sumCod($correlativo, 6),
        'ref_val' => $referencias
    ));
}

private
function save_producto_detalles($venta_id, $doc_id, $local_id, $productos)
{
    //Preparo los detalles de la venta para insertarlo y sus historicos
    $cantidades = array();
    $venta_detalle = array();
    $venta_contable_detalle = array();
    foreach ($productos as $producto) {

        //preparo los datos para el historico
        if (!isset($cantidades[$producto->id_producto]))
            $cantidades[$producto->id_producto] = 0;

        $cantidades[$producto->id_producto] += $this->unidades_model->convert_minimo_by_um(
            $producto->id_producto,
            $producto->unidad_medida,
            $producto->cantidad
        );


        //preparo el detalle de la venta
        $producto_detalle = array(
            'id_venta' => $venta_id,
            'id_producto' => $producto->id_producto,
            'precio' => $producto->precio,
            'cantidad' => $producto->cantidad,
            'unidad_medida' => $producto->unidad_medida,
            'detalle_importe' => $producto->detalle_importe,
            'detalle_costo_promedio' => 0,
            'detalle_utilidad' => 0
        );
        array_push($venta_detalle, $producto_detalle);

        if (validOption('ACTIVAR_SHADOW', 1) && $doc_id != 6) {
            //preparo el detalle de la venta contable cuando el shadow stock esta activo
            $producto_detalle = array(
                'venta_id' => $venta_id,
                'producto_id' => $producto->id_producto,
                'unidad_id' => $producto->unidad_medida,
                'precio' => $producto->precio,
                'cantidad' => $producto->cantidad
            );
            array_push($venta_contable_detalle, $producto_detalle);
        }


    }

    //inserto los detalles de la venta
    $this->db->insert_batch('detalle_venta', $venta_detalle);

    if (validOption('ACTIVAR_SHADOW', 1) && $doc_id != 6)
        $this->db->insert_batch('venta_contable_detalle', $venta_contable_detalle);

    $venta = $this->get_ventas(array('venta_id' => $venta_id));
    foreach ($cantidades as $key => $value) {

        $old_cantidad = $this->db->get_where('producto_almacen', array(
            "id_local" => $local_id,
            "id_producto" => $key
        ))->row();

        //Llevo la cantidad vieja tambien a la minima expresion y la sumo con la minima expresion
        $old_cantidad_min = $old_cantidad != NULL ? $this->unidades_model->convert_minimo_um($key, $old_cantidad->cantidad, $old_cantidad->fraccion) : 0;

        $result = $this->unidades_model->get_cantidad_fraccion($key, $old_cantidad_min - $value);

        //CREAR EL HISTORICO DE LA VENTA *************************************
        /*$this->historico_model->set_historico(array(
            'producto_id' => $key,
            'local_id' => $local_id,
            'usuario_id' => $this->session->userdata('nUsuCodigo'),
            'cantidad' => $value,
            'cantidad_actual' => $this->unidades_model->convert_minimo_um($key, $result['cantidad'], $result['fraccion']),
            'tipo_movimiento' => "VENTA",
            'tipo_operacion' => 'SALIDA',
            'referencia_valor' => 'Se realizo una Venta',
            'referencia_id' => $venta_id
        ));*/

        $tipo = 0;
        if ($venta->documento_id == 1)
            $tipo = 1;
        if ($venta->documento_id == 3)
            $tipo = 3;

        $values = array(
            'local_id' => $local_id,
            'producto_id' => $key,
            'cantidad' => $value,
            'io' => 2,
            'tipo' => $tipo,
            'operacion' => 1,
            'serie' => '-',
            'numero' => '-',
            'ref_id' => $venta->venta_id
        );
        $this->kardex_model->set_kardex($values);

        if ($old_cantidad != NULL) {
            //Actualizo el almacen
            $this->db->where(array(
                'id_local' => $local_id,
                'id_producto' => $key
            ));
            $this->db->update('producto_almacen', array(
                'cantidad' => $result['cantidad'],
                'fraccion' => $result['fraccion']
            ));
        } else {
            $this->db->insert('producto_almacen', array(
                'id_producto' => $key,
                'id_local' => $local_id,
                'cantidad' => $result['cantidad'],
                'fraccion' => $result['fraccion']
            ));
        }
    }
}

private
function save_traspasos($traspasos)
{
    //Hago los traspasos en caso de haber
    foreach ($traspasos as $traspaso) {
        $orden_max = $this->db->select_max('orden', 'orden')
            ->where('producto_id', $traspaso->id_producto)->get('unidades_has_producto')->row();

        $minima_unidad = $this->db->select('id_unidad as um_id')
            ->where('producto_id', $traspaso->id_producto)
            ->where('orden', $orden_max->orden)
            ->get('unidades_has_producto')->row();

        $next_id = $this->db->select_max('venta_id')->get('venta')->row();
        $this->traspaso_model->traspasar_productos($traspaso->id_producto, $traspaso->local_id, $traspaso->parent_local, array(
            'um_id' => $minima_unidad->um_id,
            'cantidad' => $traspaso->cantidad,
            'venta_id' => $next_id->venta_id + 1
        ));
    }
}

public
function get_next_id()
{
    $next_id = $this->db->select_max('venta_id')->get('venta')->row();
    return sumCod($next_id->venta_id + 1, 6);
}

public
function anular_venta($venta_id, $serie, $numero)
{
    $venta = $this->get_venta_detalle($venta_id);

    $cantidades = array();
    foreach ($venta->detalles as $detalle) {

        if (!isset($cantidades[$detalle->producto_id]))
            $cantidades[$detalle->producto_id] = 0;


        $cantidades[$detalle->producto_id] += $this->unidades_model->convert_minimo_by_um(
            $detalle->producto_id,
            $detalle->unidad_id,
            $detalle->cantidad
        );


    }
    foreach ($cantidades as $key => $value) {

        $old_cantidad = $this->db->get_where('producto_almacen', array(
            'id_producto' => $key,
            'id_local' => $venta->local_id
        ))->row();

        $old_cantidad_min = $old_cantidad != NULL ? $this->unidades_model->convert_minimo_um($key, $old_cantidad->cantidad, $old_cantidad->fraccion) : 0;

        $result = $this->unidades_model->get_cantidad_fraccion($key, $old_cantidad_min + $value);

        /*$this->historico_model->set_historico(array(
            'producto_id' => $key,
            'local_id' => $venta->local_id,
            'cantidad' => $value,
            'cantidad_actual' => $this->unidades_model->convert_minimo_um($key, $result['cantidad'], $result['fraccion']),
            'tipo_movimiento' => "ANULACION",
            'tipo_operacion' => 'ENTRADA',
            'referencia_valor' => 'Anulacion de Ventas',
            'referencia_id' => $venta_id
        ));*/
        $this->db->where('io', 2);
        $this->db->where('operacion', 1);
        $this->db->where('ref_id', $venta_id);
        $referencias = $this->db->get('kardex')->row();

        if (!isset($referencias->ref_val))
            $referencias->ref_val == "";

        $values = array(
            'local_id' => $venta->local_id,
            'producto_id' => $key,
            'cantidad' => $value * -1,
            'io' => 2,
            'tipo' => 7,
            'operacion' => 5,
            'serie' => $serie,
            'numero' => $numero,
            'ref_id' => $venta->venta_id,
            'ref_val' => $referencias->ref_val
        );
        $this->kardex_model->set_kardex($values);

        if ($old_cantidad != NULL) {
            $this->db->where('id_producto', $key);
            $this->db->where('id_local', $venta->local_id);
            $this->db->update('producto_almacen', array(
                'cantidad' => $result['cantidad'],
                'fraccion' => $result['fraccion']
            ));
        } else {
            $this->db->insert('producto_almacen', array(
                'id_producto' => $key,
                'id_local' => $venta->local_id,
                'cantidad' => $result['cantidad'],
                'fraccion' => $result['fraccion']
            ));
        }

        if ($venta->condicion_id == '2') {
            $this->db->where('id_venta', $venta_id);
            $this->db->delete('credito');

            $this->db->where('id_venta', $venta_id);
            $this->db->delete('credito_cuotas');
        }


        $this->db->where('venta_id', $venta_id);
        $this->db->update('venta', array('venta_status' => 'ANULADO'));

        $venta = $this->db->get_where('venta', array('venta_id' => $venta_id))->row();

        $moneda_id = 1;
        if ($venta->id_moneda == 1030)
            $moneda_id = 2;
        $this->cajas_model->save_pendiente(array(
            'monto' => $venta->total,
            'tipo' => 'VENTA_ANULADA',
            'IO' => 2,
            'ref_id' => $venta_id,
            'moneda_id' => $moneda_id,
            'local_id' => $venta->local_id
        ));

    }
}

public
function devolver_venta($venta_id, $total_importe, $devoluciones, $serie, $numero)
{
    $venta = $this->get_venta_detalle($venta_id);

    $venta_old = $this->db->get_where('venta', array('venta_id' => $venta_id))->row();

    $total = 0;
    $impuesto = 0;
    $subtotal = 0;
    if ($venta->documento_id == '1') {
        $subtotal = $total_importe;
        $impuesto = number_format(($total_importe * 18) / 100, 2);
        $total = $subtotal + $impuesto;
    } else {
        $total = $total_importe;
    }

    $this->db->where('venta_id', $venta_id);
    $this->db->update('venta', array(
        'total' => $total,
        'subtotal' => $subtotal,
        'total_impuesto' => $impuesto,
    ));


    $moneda_id = 1;
    if ($venta_old->id_moneda == 1030)
        $moneda_id = 2;
    $this->cajas_model->save_pendiente(array(
        'monto' => $venta_old->total - $total,
        'tipo' => 'VENTA_DEVUELTA',
        'IO' => 2,
        'ref_id' => $venta_id,
        'moneda_id' => $moneda_id,
        'local_id' => $venta_old->local_id
    ));

    $cantidades = array();
    foreach ($devoluciones as $detalle) {

        if (!isset($cantidades[$detalle->producto_id]))
            $cantidades[$detalle->producto_id] = 0;

        $cantidades[$detalle->producto_id] += $this->unidades_model->convert_minimo_by_um(
            $detalle->producto_id,
            $detalle->unidad_id,
            $detalle->devolver
        );

        if ($detalle->new_cantidad == 0) {
            $this->db->where('id_detalle', $detalle->detalle_id);
            $this->db->delete('detalle_venta');
        } else {
            $this->db->where('id_detalle', $detalle->detalle_id);
            $this->db->update('detalle_venta', array(
                'cantidad' => $detalle->new_cantidad,
                'detalle_importe' => $detalle->new_importe
            ));
        }
    }


    foreach ($cantidades as $key => $value) {

        $old_cantidad = $this->db->get_where('producto_almacen', array(
            'id_producto' => $key,
            'id_local' => $venta->local_id
        ))->row();

        $old_cantidad_min = $old_cantidad != NULL ? $this->unidades_model->convert_minimo_um($key, $old_cantidad->cantidad, $old_cantidad->fraccion) : 0;

        $result = $this->unidades_model->get_cantidad_fraccion($key, $old_cantidad_min + $value);

        /*$this->historico_model->set_historico(array(
            'producto_id' => $key,
            'local_id' => $venta->local_id,
            'cantidad' => $value,
            'cantidad_actual' => $this->unidades_model->convert_minimo_um($key, $result['cantidad'], $result['fraccion']),
            'tipo_movimiento' => "DEVOLUCION",
            'tipo_operacion' => 'ENTRADA',
            'referencia_valor' => 'Devolucion de Ventas',
            'referencia_id' => $venta_id
        ));*/

        $this->db->where('io', 2);
        $this->db->where('operacion', 1);
        $this->db->where('ref_id', $venta_id);
        $referencias = $this->db->get('kardex')->row();

        if (!isset($referencias->ref_val))
            $referencias->ref_val == "";

        $values = array(
            'local_id' => $venta->local_id,
            'producto_id' => $key,
            'cantidad' => $value * -1,
            'io' => 2,
            'tipo' => 7,
            'operacion' => 5,
            'serie' => $serie,
            'numero' => $numero,
            'ref_id' => $venta->venta_id,
            'ref_val' => $referencias->ref_val
        );
        $this->kardex_model->set_kardex($values);

        if ($old_cantidad != NULL) {
            $this->db->where('id_producto', $key);
            $this->db->where('id_local', $venta->local_id);
            $this->db->update('producto_almacen', array(
                'cantidad' => $result['cantidad'],
                'fraccion' => $result['fraccion']
            ));
        } else {
            $this->db->insert('producto_almacen', array(
                'id_producto' => $key,
                'id_local' => $venta->local_id,
                'cantidad' => $result['cantidad'],
                'fraccion' => $result['fraccion']
            ));
        }
    }
}

public
function imprimir_pedido($data)
{
    $this->load->library('mpdf53/mpdf');

    $mpdf = new mPDF('utf-8', array('225', '93'));
    $mpdf->SetTopMargin('0');


    $mpdf->SetJS('this.print();');

    $data['section'] = 'body';
    $mpdf->WriteHTML($this->load->view('menu/venta/impresiones/nota_pedido', $data, true));

    $nombre_archivo = utf8_decode('Nota de Pedido.pdf');
    $mpdf->Output($nombre_archivo, 'I');
}

public
function imprimir_boleta($data)
{
    $this->load->library('mpdf53/mpdf');

    $mpdf = new mPDF('utf-8', array('225', '209'));

    $mpdf->SetTopMargin('32');

    $data['section'] = 'header';
    $mpdf->SetHTMLHeader($this->load->view('menu/venta/impresiones/boleta', $data, true));

    $data['section'] = 'footer';
    $mpdf->SetHTMLFooter($this->load->view('menu/venta/impresiones/boleta', $data, true));

    $mpdf->SetJS('this.print();');

    $data['section'] = 'body';
    $mpdf->WriteHTML($this->load->view('menu/venta/impresiones/boleta', $data, true));

    $nombre_archivo = utf8_decode('Boleta.pdf');
    $mpdf->Output($nombre_archivo, 'I');
}

public
function imprimir_factura($data)
{
    $this->load->library('mpdf53/mpdf');

    $mpdf = new mPDF('utf-8', array('225', '93'));

    $mpdf->SetTopMargin('32');

    $data['section'] = 'header';
    $mpdf->SetHTMLHeader($this->load->view('menu/venta/impresiones/factura', $data, true));

    $data['section'] = 'footer';
    $mpdf->SetHTMLFooter($this->load->view('menu/venta/impresiones/factura', $data, true));

    $mpdf->SetJS('this.print();');

    $data['section'] = 'body';
    $mpdf->WriteHTML($this->load->view('menu/venta/impresiones/factura', $data, true));

    $nombre_archivo = utf8_decode('Factura.pdf');
    $mpdf->Output($nombre_archivo, 'I');
}

}

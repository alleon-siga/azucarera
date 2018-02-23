<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class pagos_ingreso_model extends CI_Model {

    private $table = 'pagos_ingreso';

    function __construct() {
        parent::__construct();
        $this->load->database();
    }

    function get_ajuste_detalle($local=false){

        if($local!=false) {
            $query=$this->db->where('local_id',$local);
            $query=$this->db->get('ajustedetalle');
            return $query->result();
        }
    }

    function get_by($campos,$filas){
//si filas es igual a falso se ejecuta row. sino ejecuta row_array
        $this->db->where($campos);
        $query=$this->db->get('ajustedetalle');

        if($filas!=false) {
            return $query->result();
        }else{
            return $query->row_array();

        }
    }

    function insert_pago_ingreso($data){

        $list_cp = array(
            'pagoingreso_ingreso_id' => $data['ingreso_id'],
            'pagoingreso_fecha' => date("Y-m-d H:i:s"),
            'pagoingreso_monto' => $data['monto'],
            'pagoingreso_restante' => $data['monto'],
            'pagoingreso_usuario' => $this->session->userdata('nUsuCodigo'),
            'id_moneda'=> $data['moneda_id'],
            'tasa_cambio'=> $data['tasa_cambio']
        );

        $this->db->insert('pagos_ingreso', $list_cp);
    }

    function guardar($data)
    {

        $this->load->model('cajas/cajas_model');

        if ($data['medio_pago_id'] != '4') {
            unset($data['banco_id']);
        }

        $this->db->insert('pagos_ingreso', $data);
        $id = $this->db->insert_id();

        if ($data['medio_pago_id'] != '6') {
            $moneda_id = 2;
            if($data['id_moneda'] == 1029)
                $moneda_id = 1;

            $ingreso = $this->db->get_where('ingreso', array('id_ingreso'=>$data['pagoingreso_ingreso_id']))->row();
            $this->cajas_model->save_pendiente(array(
                'monto' => $data['pagoingreso_monto'],
                'tipo' => 'PAGOS',
                'IO' => 2,
                'ref_id' => $id,
                'moneda_id' => $moneda_id,
                'local_id' => $ingreso->local_id
            ));
        } else {
            //AQUI VA EL REGISTRO DE KARDEX DE NOTA DE CREDITO
        }

            return $id;

    }


    public function traer_by($select = false, $from =false,  $join = false, $campos_join = false, $where = false,  $group = false,
                             $order = false,$retorno = false){
//si filas es igual a false entonces es un resutl que trae varios resultados
        //sino es una sola fila

        if($select !=false){
            $this->db->select($select);
            $this->db->from($from);


        }

        if($join != false and $campos_join != false){

            for($i=0;$i<count($join);$i++) {

                $this->db->join($join[$i], $campos_join[$i]);
            }
        }
        if($where!=false){
            $this->db->where($where);

        }
        if($group!=false){
            $this->db->group_by($group);
        }

        if($order!=false){
            $this->db->order_by($order);
        }

        $query=$this->db->get();

        if($retorno=="RESULT_ARRAY"){

            return $query->result_array();
        }elseif($retorno=="RESULT"){
            return $query->result();

        }else{
            return $query->row_array();
        }

    }


}

<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class ajusteinventario_model extends CI_Model
{

    private $table = 'ajusteinventario';

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    function get_all()
    {

        $this->db->select('*');
        $this->db->from('ajusteinventario');
        $this->db->join('local', 'ajusteinventario.local_id=local.int_local_id');
        $this->db->where('local.local_status', 1);
        $query = $this->db->get();
        return $query->result();

    }

    function get_ajuste_inventario($where)
    {


            $this->db->select('ajusteinventario.*, COUNT(id_producto_almacen) AS cantidad ');
            $this->db->from('ajusteinventario');
            $this->db->join('ajustedetalle', 'ajustedetalle.`id_ajusteinventario`=ajusteinventario.`id_ajusteinventario`');
            $this->db->where($where);
            $this->db->group_by('ajusteinventario.`id_ajusteinventario`');
            $query = $this->db->get();
            return $query->result();

    }

    function get_by($campo, $valor)
    {
        $this->db->where($campo, $valor);
        $query = $this->db->get('ajusteinventario');
        return $query->row_array();
    }

    function set_ajuste($campos)
    {


        $this->db->trans_start();
        $this->db->insert('ajusteinventario', $campos);
        $ultimo_id = $this->db->insert_id();
        $this->db->trans_complete();

        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if ($this->db->trans_status() === FALSE)
            return FALSE;
        else
            return $ultimo_id;
    }


}

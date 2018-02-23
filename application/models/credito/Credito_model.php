
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class credito_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    /*dec_credito_montodebito ES EL TOTAL PAGADO HASTA LOS MOMENTOS*/

    /*EL CAMPO dec_credito_montocuota ES EL TOTAL DE LA VENTA MENOS EL INICIAL.
                ESA SERIA LO QUE LE QUEDA POR PAGAR AL CLIENTE*/

    /*el campo pago_anticipado es para saber si es el pago de todas las cuotas a la vez*/

    /*el campo fecha_cancelado es la fecha en la que se paga toda la deuda*/

    public function update($where,$data){
        $this->db->trans_start();
        $this->db->where($where);
        $this->db->update('credito', $data);

        $this->db->trans_complete();


        if ($this->db->trans_status() === FALSE) {
            return false;
        } else {

            return true;
        }

        $this->db->trans_off();
    }
    public function get_credito_pendiente($condicion)
    {
        $this->db->select('credito.*');
        $this->db->from('credito');
        $this->db->join('venta', 'venta.venta_id=credito.id_venta');
        $this->set_where_credito_year($condicion);
        $query = $this->db->get();
        return $query->result();
    }


    private function set_where_credito_year($data)
    {
        if (isset($data['local_id']))
            $this->db->where('venta.local_id', $data['local_id']);

        if (isset($data['estado']))
            $this->db->where('credito.var_credito_estado', $data['estado']);

        if ( isset($data['year']) ) {
            $last_day = last_day($data['year'], sumCod('12', 2));
            $this->db->where('venta.fecha >=', $data['year'] . '-' . sumCod('01', 2) . '-' . sumCod('01', 2). " 00:00:00");
            $this->db->where('venta.fecha <=', $data['year'] . '-' . sumCod("12", 2) . '-' . $last_day . " 23:59:59");
        }
    }




}
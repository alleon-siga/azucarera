<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class banco extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('banco/banco_model');
    }


    function index()
    {

        if ($this->session->flashdata('success') != FALSE) {
            $data ['success'] = $this->session->flashdata('success');
        }
        if ($this->session->flashdata('error') != FALSE) {
            $data ['error'] = $this->session->flashdata('error');
        }

        $data["banco"] = $this->banco_model->get_all();
        $dataCuerpo['cuerpo'] = $this->load->view('menu/banco/banco', $data, true);
        if ($this->input->is_ajax_request()) {
            echo $dataCuerpo['cuerpo'];
        } else {
            $this->load->view('menu/template', $dataCuerpo);
        }
    }

    function form($id = FALSE)
    {

        $data = array();
        if ($id != FALSE) {
            $data['banco'] = $this->banco_model->get_by('banco_id', $id);
            $cuenta = $this->db->get_where('caja_desglose', array('id'=>$data['banco']['cuenta_id']))->row();
            $data['caja_actual'] = $this->db->get_where('caja', array('id' => $cuenta->caja_id))->row();
        }
        else{
            $data['caja_actual'] = $this->db->get_where('caja', array('moneda_id' => '1', 'local_id' => $this->session->userdata('int_local_id')))->row();
        }




        $data['cajas'] = $this->db->select('caja.*, local.local_nombre as local_nombre')
        	->from('caja')
        	->join('local', 'local.int_local_id = caja.local_id')
        	->where('estado', 1)
        	->get()->result();
        $data['caja_cuentas'] = $this->db->get_where('caja_desglose', array('estado' => 1))->result();
        $this->load->view('menu/banco/form', $data);
    }


    function guardar()
    {

        $id = $this->input->post('id');

        $banco = array(
            'banco_nombre' => $this->input->post('nombre'),
            'banco_numero_cuenta' => $this->input->post('nro_cuenta'),
            'banco_saldo' => $this->input->post('saldo'),
            'banco_cuenta_contable' => $this->input->post('cuenta_contable'),
            'banco_titular' => $this->input->post('titular'),
            'banco_status' => 1,
            'cuenta_id' => $this->input->post('cuentas_select')
        );

        if (empty($id)) {
            $resultado = $this->banco_model->insertar($banco);

        } else {
            $banco['banco_id'] = $id;
            $resultado = $this->banco_model->update($banco);
        }

        if ($resultado == TRUE) {
            $json['success'] = 'Solicitud Procesada con exito';
        } else {
            $json['error'] = 'Ha ocurrido un error al procesar la Solicitud';
        }

        echo json_encode($json);

    }


    function eliminar()
    {
        $id = $this->input->post('id');
        $nombre = $this->input->post('nombre');

        $banco = array(
            'banco_id' => $id,
            'banco_status' => 0

        );

        $data['resultado'] = $this->banco_model->update($banco);

        if ($data['resultado'] != FALSE) {

            $json['success'] = 'Se ha eliminado exitosamente';


        } else {

            $json['error'] = 'Ha ocurrido un error al eliminar el Banco';
        }

        echo json_encode($json);
    }

    //Funcion para validar numero de operacion

    function validaNumeroOperacion($num_operacion)
    {
        $resultado = $this->banco_model->buscarNumeroOperacion($num_operacion);

        $json = array();
        if ($resultado == true){
            $json['error'] = '1';
        }

        echo json_encode($json);

    }

     function DniRucEnBd()
    {
        $resultado = $this->cliente_model->DniRucEnBd($this->input->post('dni_ruc'), !empty($_POST['cliente_id']) ? $_POST['cliente_id'] : '');

        $json = array();
        if ($resultado == true) {
            $json['error'] = '1';
        }

        echo json_encode($json);

    }
}
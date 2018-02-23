<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class personal extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->login_model->verify_session();

        //$this->load->model('clientesgrupos/clientes_grupos_model');
    }


    function index()
    {

        if ($this->session->flashdata('success') != FALSE) {
            $data ['success'] = $this->session->flashdata('success');
        }
        if ($this->session->flashdata('error') != FALSE) {
            $data ['error'] = $this->session->flashdata('error');
        }

        $data['personales'] = $this->db->get('personal')->result();
        $dataCuerpo['cuerpo'] = $this->load->view('menu/personal/personal', $data, true);

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
            $data['personal'] = $this->db->get_where('personal', array('id', $id))->row_array();
        }
        $this->load->view('menu/personal/form', $data);
    }

    function guardar()
    {

        $id = $this->input->post('id');

        $personal = array(
            'codigo' => $this->input->post('codigo'),
            'nombre' => $this->input->post('nombre')
        );

        if (empty($id)) {
            $this->db->insert('personal', $personal);
            $resultado = $this->db->insert_id();
        } else {
            $this->db->where('id', $id);
            $this->db->update('personal', $personal);
            $resultado = $id;
        }

        if ($resultado == TRUE) {
            $json['success'] = 'Solicitud Procesada con exito';
        } else {
            $json['error'] = 'Ha ocurrido un error al procesar la solicitud';
        }

        echo json_encode($json);

    }


    function eliminar()
    {
        $id = $this->input->post('id');

        $this->db->where('id', $id);
        $this->db->delete('personal');
        $json['success'] = 'Se ha eliminado exitosamente';


        echo json_encode($json);

    }


}

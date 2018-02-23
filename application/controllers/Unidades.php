<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class unidades extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->login_model->verify_session();

        //$this->load->model('caja/caja_model','c');
        $this->load->model('unidades/unidades_model');
        $this->load->helper('form');

    }

    function index(){
        if ($this->session->flashdata('success') != FALSE) {
            $data ['success'] = $this->session->flashdata('success');
        }
        if ($this->session->flashdata('error') != FALSE) {
            $data ['error'] = $this->session->flashdata('error');
        }
        $data['lstMovimiento'] = array();
        $data['unidades']=$this->unidades_model->get_unidades();
        $dataCuerpo['cuerpo'] = $this->load->view('menu/unidades/unidades',$data, true);
        if ($this->input->is_ajax_request()) {
            echo $dataCuerpo['cuerpo'];
        }else{
            $this->load->view('menu/template', $dataCuerpo);
        }
    }

    function form($id = FALSE)
    {

        $data = array();
        if ($id != FALSE) {
            $data['unidad'] = $this->unidades_model->get_by('id_unidad', $id);
        }


        $this->load->view('menu/unidades/form', $data);
    }

    function guardar()
    {


        $id = $this->input->post('id');
        $grupo = array(
            'nombre_unidad' => $this->input->post('nombre'),
            'abreviatura' => $this->input->post('abreviatura'),
            'presentacion' => $this->input->post('presentacion')
        );
        if (empty($id)) {
            $data['resultado'] = $this->unidades_model->set_unidades($grupo);
        } else {
            $grupo['id_unidad'] = $id;
            $data['resultado'] = $this->unidades_model->update_unidades($grupo);
        }

        if ($data['resultado'] != FALSE) {

            $json['success']= 'Solicitud Procesada con exito';

        } else {

            $json['error'] = 'Ha ocurrido un error al procesar la solicitud';
        }

        if($data['resultado']===NOMBRE_EXISTE){
            //  $this->session->set_flashdata('error', NOMBRE_EXISTE);
            $json['error']= NOMBRE_EXISTE;
        }
        echo json_encode($json);


    }

    function eliminar()
    {
        $id = $this->input->post('id');
        $nombre = $this->input->post('nombre');

        $unidad = array(
            'id_unidad' => $id,
            'nombre_unidad' => $nombre,
            'estatus_unidad' => 0

        );


        if ($this->unidades_model->verifProdUnidad($unidad) != true) {


            $data['resultado'] = $this->unidades_model->update_unidades($unidad);

            if ($data['resultado'] != FALSE) {

                $json['success'] = 'Se ha Eliminado exitosamente';


            } else {

                $json['error']= 'Ha ocurrido un error al eliminar el impuesto';
            }
        }else{
             $json['warning'] = 'No se puede eliminar la unidad, tiene productos relacionados';

        }


        echo json_encode($json);
    }



    function activar(){

        $id = $this->input->post('id');
        $data['resultado'] = $this->unidades_model->activarUnidad($id);

        if ($data['resultado'] == true) {

            $json['success'] = 'Se ha activado exitosamente';


        } else {

            $json['error']= 'Ha ocurrido un error al activar la unidad';
        }
        echo json_encode($json);
    }

}
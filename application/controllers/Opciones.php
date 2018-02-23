<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class opciones extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->login_model->verify_session();

        $this->load->model('opciones/opciones_model');
    }
    

    function index($action = 'get')
    {
        $keys = array(
            'EMPRESA_NOMBRE',
            'CODIGO_DEFAULT',
            'VALOR_UNICO',
            'PRECIO_INGRESO',
            'PRODUCTO_SERIE',
            'PAGOS_ANTICIPADOS',
            'ACTIVAR_FACTURACION_VENTA',
            'ACTIVAR_FACTURACION_INGRESO',
            'ACTIVAR_SHADOW',
            'INGRESO_COSTO',
            'INGRESO_UTILIDAD',
        );

        if ($action == 'get') {
            $data['configuraciones'] = $this->opciones_model->get_opciones($keys);
            $dataCuerpo['cuerpo'] = $this->load->view('menu/opciones/opciones', $data, true);

            if ($this->input->is_ajax_request()) {
                echo $dataCuerpo['cuerpo'];
            } else {
                $this->load->view('menu/template', $dataCuerpo);
            }
        } elseif ($action == 'save') {

            $configuraciones = array();
            foreach ($keys as $key) {
                $configuraciones[] = array(
                    'config_key' => $key,
                    'config_value' => $this->input->post($key)
                );
            }

            $result = $this->opciones_model->guardar_configuracion($configuraciones);
            $configuraciones = $this->opciones_model->get_opciones($keys);

            if (count($configuraciones) > 0) {
                foreach ($configuraciones as $configuracion) {
                    $data[$configuracion['config_key']] = $configuracion['config_value'];
                }
                $this->session->set_userdata($data);
            }

            if ($result)
                $json['success'] = 'Las configuraciones se han guardado exitosamente';
            else
                $json['error'] = 'Ha ocurido un error al guardar las configuraciones';

            echo json_encode($json);
        }


    }

}
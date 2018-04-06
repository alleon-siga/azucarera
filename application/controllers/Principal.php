<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class principal extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->login_model->verify_session();


        $this->load->model('venta/venta_model');
        $this->load->model('ingreso/ingreso_model');
        $this->load->model('cliente/cliente_model');
        $this->load->model('usuario/usuario_model');
        $this->load->model('credito/credito_model');
        $this->load->model('producto/producto_model');
        $this->load->model('local/local_model');

    }

    function index()
    {
        $data['usuarios']=$this->usuario_model->select_all_user();
        //$data['ventashoy'] = count($this->venta_model->get_ventas_by(array('DATE(fecha)'=>date('Y-m-d'),'venta_status'=>COMPLETADO)));
        $data['ventashoy'] = 0;
        //$data['ventastotalhoy'] = $this->venta_model->get_total_ventas_by_date(date('Y-m-d'));
        $data['ventastotalhoy'] = 0;
        $data['comprashoy'] = count($this->ingreso_model->get_ingresos_by(array('DATE(fecha_registro)'=>date('Y-m-d'))));
        $data['entradasactuales'] = count($this->ingreso_model->get_cant_ingresos_by_year
        (array('estado'=>"COMPLETADO",
            'year' =>date ("Y"))));
        $data['ventasanual']= count($this->venta_model->get_total_ventas_by_year(array('estado'=>"COMPLETADO",
            'year' =>date ("Y"))));

        //PagoPendiente
        $data['creditoPendiente'] =count( $this->credito_model->get_credito_pendiente(array('estado'=>"PagoPendiente",
            'year' =>date ("Y"))));

        $data['cantidadPoductoAlmacen'] = $this->producto_model->get_sumcantidad_stock__almacen(array('producto_estatus '=>"1" ));

        $data['activosfijostotales'] =$data['creditoPendiente'] + $data['cantidadPoductoAlmacen'];
        
        if ($this->session->userdata('esSuper') == 1){
        	$data['locales'] = $this->local_model->get_all();
        }else{
        	$usu = $this->session->userdata('nUsuCodigo');
        	$data['locales'] = $this->local_model->get_all_usu($usu);
        }

        $dataCuerpo['cuerpo'] = $this->load->view('menu/principal', $data, true);

        if ($this->input->is_ajax_request()) {
            echo $dataCuerpo['cuerpo'];
        }else{
            $this->load->view('menu/template', $dataCuerpo);
        }


    }

    function getPage()
    {
        if (!$_POST['page']) die("0");
        $html = "";
        $page = $_POST['page'];

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $page);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $html .= curl_exec($curl);
        curl_close($curl);
        echo $html;

    }

    function reporteVentas(){
        $condicion= "venta_status='COMPLETADO' ";
        $group=" GROUP BY `ciclo`  ";

        $result['ventas'] = $this->venta_model->estadistica_semanaactual($condicion,$group);

        $group=" GROUP BY `ciclo`, venta_status ";
        $data['estatus'] = $this->venta_model->estadistica_semanaactual(" 1 ",$group);

        $data['totales'] = $this->venta_model->estadistica_semanaactual($condicion,false);

        $group=" GROUP BY `ciclo`  ";
        $condicion.=" and status_condiciones=1 ";
        $data['condicion_pago'] = $this->venta_model->condicion_pago_semanaactual($condicion,$group);

        $query="  SELECT SUM(detalleingreso.`precio`) AS suma FROM ingreso JOIN detalleingreso ON detalleingreso.`id_ingreso`=
        ingreso.`id_ingreso` WHERE ingreso.ingreso_status='COMPLETADO'
         and YEARWEEK (fecha_registro)= YEARWEEK(CURDATE())";
        $sumadeingreso = $this->ingreso_model->estadistica($query);

        $query="SELECT COUNT(id_ingreso) AS contador FROM ingreso  WHERE ingreso.ingreso_status='COMPLETADO'
    and YEARWEEK (fecha_registro)= YEARWEEK(CURDATE())";
        $contadoringreso = $this->ingreso_model->estadistica($query);

        if($data['totales'][0]['total_utilidad']==null){
            $data['margen']=0;
        }else{
            if($contadoringreso[0]['contador']==0){
                $con_ingreso=1;
            }else{
                $con_ingreso=$contadoringreso[0]['contador'];
            }

            if($data['totales'][0]['total_utilidad']==0){
                $total_utilidad=1;
            }else{
                $total_utilidad=$data['totales'][0]['total_utilidad'];
            }

            if($sumadeingreso[0]['suma']==0){
                $suma=1;
            }else{
                $suma=$sumadeingreso[0]['suma'];
            }
            $data['margen']=number_format( $total_utilidad/($suma/$con_ingreso),2);
        }

        $ciclo=7;
        $validar=false;
        
        for ($i = 1; $i <= $ciclo; $i++) {


            for ($j = 0; $j < count($result['ventas']); $j++) {

                if ($result['ventas'][$j]['ciclo'] == $i) {

                    $newData['data'] = array(array(1, $ciclo));
                    $newData = array();
                    $newData[0] = intval($result['ventas'][$j]['ciclo']);
                    $newData[1] = $result['ventas'][$j]['total_venta'];
                    //$newData[] = $result['ventas'][$i]['total_venta'];// ESto es el valor del eje X
                    $data['venta'][] = $newData;
                    $newData[1] = $result['ventas'][$j]['total_utilidad'];
                    $data['utilidad'][] = $newData;
                    $validar = true;
                }

            }
            if ($validar == false) {
                $newData['data'] = array(array(1, $ciclo));
                $newData = array();
                $newData[0] = $i;
                $newData[1] = intval(0);// ESto es el valor del eje X
                $data['venta'][] = $newData;
                $newData[1] = 0;
                $data['utilidad'][] = $newData;

            }
            $validar = false;

        }        
        echo json_encode($data);
    }

    function reporteCompras(){
        $data['ingresos'] = $this->ingreso_model->get_compras2();
        echo json_encode($data);
    }
}
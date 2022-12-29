
<?php

class Pedidospoi extends Controllers
{
	public function __construct()
	{
		parent::__construct();
		session_start();
		if (empty($_SESSION['login'])) {
			header('Location: ' . base_url() . '/login');
		}
		getPermisos(6);
	}
	public function getSelectregistrop()
	{
		
		$btnView = '';
		$btnEdit = '';
		$btnDelete = '';
		$arrData = $this->model->Selectregistrop();
		for ($i = 0; $i < count($arrData); $i++) {
			if ($_SESSION['permisosMod']['u']) {
				$btnView = '<button class="btn btn-info btn-sm btnView" onClick="btnimprimir(' . $arrData[$i]['idregistro'] . ')" title="Generar Actividad"><i class="fas fa-print"></i></button>';
				$btnEdit = '<button class="btn btn-primary btn-sm btnEditRegistro" onClick="fntviewInfo(' . $arrData[$i]['idregistro'] . ')" title="Editar"><i class="fas fa-pencil-alt"></i></button>';
			}
			if ($_SESSION['permisosMod']['d']) {
				
			}
			$arrData[$i]['options'] = '<div class="text-center">' . $btnView . ' ' . $btnEdit . ' ' . $btnDelete . '</div>';
		}
		$datajson =  json_encode($arrData, JSON_UNESCAPED_UNICODE);
		if (empty($arrData)) {
			$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
		} else {
			$arrResponse = array('status' => true, 'data' => $arrData);
		}
		echo $datajson;
		die();
	}


	public function Pedidospoi()
	{
		if (empty($_SESSION['permisosMod']['r'])) {
			header("Location:" . base_url() . '/dashboard');
		}
		$data['page_id'] = 4;
		$data['page_tag'] = "Pedidospoi ";
		$data['page_name'] = "Pedidospoi";
		$data['page_title'] = "Pedidospoi  <small> Tienda POI</small>";
		$data['page_functions_js'] = "functions_pedidospoi.js";
		//$data['page_functions_js'] = "functions_actividadestrategica.js";
		$this->views->getView($this, "Pedidospoi", $data);
	}

	
}
?>
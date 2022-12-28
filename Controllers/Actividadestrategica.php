<?php 
	class Actividadestrategica extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			if(empty($_SESSION['login']))
			{
				header('Location: '.base_url().'/login');
			}
			getPermisos(4);
		}

		public function Actividadestrategica()
		{
			if(empty($_SESSION['permisosMod']['r'])){
				header("Location:".base_url().'/dashboard');
			}
			$data['page_id'] = 4;
			$data['page_tag'] = "Actividadestrategica ";
			$data['page_name'] = "Actividadestrategica";
			$data['page_title'] = "Actividadestrategica  <small> Tienda POI</small>";
			$data['page_functions_js'] = "functions_actividadestrategica.js";
			$this->views->getView($this,"Actividadestrategica",$data);
		}
		public function getSelectactest(){
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';
				$arrData = $this->model->Selectactest();
				for ($i=0; $i < count($arrData); $i++) {
					if($_SESSION['permisosMod']['u']){
						$btnView = '<button class="btn btn-info btn-sm btnViewUsuario" onClick="openModalcua('.$arrData[$i]['idcodigo_act'].')" title="Permisos"><i class="app-menu__icon fa fa-shopping-cart"></i></button>';
						$btnEdit = '<button class="btn btn-primary btn-sm btnEditRol" onClick="fntEditInfoact('.$arrData[$i]['idcodigo_act'].')" title="Editar"><i class="fas fa-pencil-alt"></i></button>';
					}
					if($_SESSION['permisosMod']['d']){
						$btnDelete = '<button class="btn btn-danger btn-sm btnDelRol" onClick="fntDelRol('.$arrData[$i]['idcodigo_act'].')" title="Eliminar"><i class="far fa-trash-alt"></i></button>
					</div>';
					}
					$arrData[$i]['options'] = '<div class="text-center">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
				}
				$datajson =  json_encode($arrData,JSON_UNESCAPED_UNICODE);
				if(empty($arrData))
				{
					$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
				}else{
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				echo $datajson;
				die();
		}
		//Actualizar datos de Actividad

		public function setActividadestrategica(){
		//error_reporting(0);
			//[idActividadestrategica] => 5
		    //[txtNombreao] => Asd
		    //[txtProgp] => 2
		    //[txtCodpp] => 9002
		    //[txtDescao] => asd
		    //[txtDescma] => asd
		    //[txtResp] => 1
		if($_POST){
			//dep($_POST);exit;
			if (
				empty($_POST['txtNombreao']) || empty($_POST['txtProgp'])
				|| empty($_POST['txtDescao']) || empty($_POST['txtDescma'])
				|| empty($_POST['txtResp'])
			)
			{
				$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
			}else{ 
				$idActividadestrategica = strClean($_POST['idActividadestrategica']);
				$strNombreao = ucwords(strClean($_POST['txtNombreao']));
				$strProgp = strClean($_POST['txtProgp']);
				//$strCoe = ucwords(strClean($_POST['txtCoe']));
				$strDescao = strClean($_POST['txtDescao']);
				//$strUmoe = intval(strClean($_POST['txtUmoe']));
				$strDescma = strClean($_POST['txtDescma']);
				$strResp = strClean($_POST['txtResp']);

				$strNumficha = strClean($_POST['txtNumficha']);
				
				$request_act = "";
				if($idActividadestrategica == 0)
				{
					$option = 1;
					if($_SESSION['permisosMod']['w']){
						$request_act = $this->model->insertActestr($strNombreao,
										$strProgp,
										//$strCoe,
										$strDescao,
										//$strUmoe,
										$strDescma,
										$strResp,
										$strNumficha);
					}
				}else{
					$option = 2;
					
					//if($_SESSION['permisosMod']['u']){
						$request_act = $this->model->updateActestr($idActividadestrategica,
																	$strNombreao, 
																	$strProgp,
																	$strDescao, 
																	$strDescma, 
																	$strResp);
					//}
				}
				//echo $request_act;

				if ($request_act > 0) {
					$arrResponse = array('status' => true, 'msg' => 'Datos Actualizados correctamente.');
				} else {
					$arrResponse = array("status" => false, "msg" => 'No es posible almacenar los datos.');
				}
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		}
		die();
	}



		public function getSelectallregistroact(int $idregistroact)
		{

			$idreg = intval($idregistroact);


			$arrData = $this->model->Selectallregistroact($idreg);
			$datajson =  json_encode($arrData, JSON_UNESCAPED_UNICODE);
			//$datajson =  json_encode($arrData,JSON_UNESCAPED_UNICODE);

			if (empty($arrData)) {
				$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
			} else {
				$arrResponse = array('status' => true, 'data' => $arrData);
			}
			echo $datajson;

			die();
		}
		public function getSelectpp(){
				$arrData = $this->model->Selectpp();
				$datajson =  json_encode($arrData,JSON_UNESCAPED_UNICODE);
				//$datajson =  json_encode($arrData,JSON_UNESCAPED_UNICODE);
					
				if(empty($arrData))
				{
					$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
				}else{
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				echo $datajson;
				
				die();
			}
		
	}
?>
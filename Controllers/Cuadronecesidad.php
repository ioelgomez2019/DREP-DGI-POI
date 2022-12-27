<?php 

class Cuadronecesidad extends Controllers{
	public function __construct()
	{
		parent::__construct();
		session_start();
		session_regenerate_id(true);
		if(empty($_SESSION['login']))
		{
			header('Location: '.base_url().'/login');
		}
		getPermisos(4);
	}

	public function Cuadronecesidad()
	{
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$data['page_tag'] = "Cuadronecesidad";
		$data['page_title'] = "Cuadro nesesidad <small>Tienda poi</small>";
		$data['page_name'] = "cuadronesesidad";
		$data['page_functions_js'] = "functions_cuadronecesidad.js";
		$this->views->getView($this,"Cuadronecesidad",$data);
	}
	public function getSelectcuanes(){
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';
				$arrData = $this->model->Selectcuanes();
				for ($i=0; $i < count($arrData); $i++) {
					if($_SESSION['permisosMod']['u']){
						$btnView = '<button class="btn btn-info btn-sm btnViewUsuario" onClick="openModalcua('.$arrData[$i]['idcodigo_act'].')" title="Permisos"><i class="app-menu__icon fa fa-shopping-cart"></i></button>';
						$btnEdit = '<button class="btn btn-primary btn-sm btnEditRol" onClick="openModal('.$arrData[$i]['idcodigo_act'].')" title="Editar"><i class="fas fa-pencil-alt"></i></button>';
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

	}
 ?>
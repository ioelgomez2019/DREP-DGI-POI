<?php 

class Actividadestrategica extends Controllers{
	public function __construct()
	{
		parent::__construct();
		session_start();
		session_regenerate_id(true);
		if(empty($_SESSION['login']))
		{
			header('Location: '.base_url().'/login');
		}
		getPermisos(3);
	}

	public function Actividadestrategica()
	{
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$data['page_tag'] = "Actividad Estrategica";
		$data['page_title'] = "Actividade Estrategica <small>Tienda POI</small>";
		$data['page_name'] = "actividadestrategica";
		$data['page_functions_js'] = "functions_actividadestrategica.js";
		$this->views->getView($this,"Actividadestrategica",$data);
	}

	}
 ?> 
<?php 

	class RegistropoiModel extends Mysql
	{
		private $strCc;
		private $strOei;
		private $strCoe;
		private $strIoe;
		private $strUmoe;
		private $intMoe;
		private $strAei;
		private $strCae;
		private $strIae;
		private $strUmae;
		private $intMae;
		private $intIdindicadoroei;
		
		public function __construct()
		{
			parent::__construct();
		}

		public function SelectObjetivoestrategico()
		{
			$whereAdmin = "";
			if($_SESSION['idUser'] != 1 ){
				$whereAdmin = " and idrol != 1 ";
			}
			//EXTRAE nombre
			$sql = "SELECT * FROM obj_estrategico WHERE status != 0".$whereAdmin;
			$request = $this->select_all($sql);
			return $request;
		}

		public function SelectObjetivoestricooei()
		{
			$whereAdmin = "";
			if($_SESSION['idUser'] != 1 ){
				$whereAdmin = " and idrol != 1 ";
			}
			//EXTRAE nombre
			$sql = "SELECT * FROM indicadoroei".$whereAdmin;
			$request = $this->select_all($sql);
			return $request;
		}
		public function SelectUnidadMOE(int $idoei){
			$this->intIdindicadoroei = $idoei;
			$sql = "SELECT
						unidad_medidaoei.idunidad_medidaoei, 
						unidad_medidaoei.nombre, 
						unidad_medidaoei.indicadoroei_idindicadoroei
					FROM
						unidad_medidaoei
					WHERE unidad_medidaoei.indicadoroei_idindicadoroei = $this->intIdindicadoroei";
			$request = $this->select_all($sql);
			return $request;
		}
		public function SelectObjetivoestricooei1(int $idoei){
			$this->intIdindicadoroei = $idoei;
			$sql = "SELECT
						indicadoroei.idindicadoroei, 
						indicadoroei.nombreoei, 
						indicadoroei.obj_estrategico_idobjestr, 
						unidad_medidaoei.idunidad_medidaoei, 
						unidad_medidaoei.nombre, 
						unidad_medidaoei.indicadoroei_idindicadoroei
					FROM
						indicadoroei
						INNER JOIN
						unidad_medidaoei
						ON 
							indicadoroei.idindicadoroei = unidad_medidaoei.indicadoroei_idindicadoroei
					WHERE indicadoroei.obj_estrategico_idobjestr = $this->intIdindicadoroei";
			$request = $this->select_all($sql);
			return $request;
		}
		public function SelectAccionestrategica(int $idoei){
			$this->intIdindicadoroei = $idoei;
			$sql = "SELECT
						acc_estrategica.idaccestr, 
						acc_estrategica.accionestr, 
						acc_estrategica.codigoaei, 
						acc_estrategica.obj_estrategico_idobjestr, 
						acc_estrategica.`status`
					FROM
						acc_estrategica
					WHERE acc_estrategica.obj_estrategico_idobjestr = $this->intIdindicadoroei";

			$request = $this->select_all($sql);
			return $request;
		}

		public function selectRol(int $idrol)
		{
			//BUSCAR ROLE
			$this->intIdrol = $idrol;
			$sql = "SELECT * FROM rol WHERE idrol = $this->intIdrol";
			$request = $this->select($sql);
			return $request;
		}

		public function insertRol(string $rol, string $descripcion, int $status){

			$return = "";
			$this->strRol = $rol;
			$this->strDescripcion = $descripcion;
			$this->intStatus = $status;

			$sql = "SELECT * FROM rol WHERE nombrerol = '{$this->strRol}' ";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$query_insert  = "INSERT INTO rol(nombrerol,descripcion,status) VALUES(?,?,?)";
	        	$arrData = array($this->strRol, $this->strDescripcion, $this->intStatus);
	        	$request_insert = $this->insert($query_insert,$arrData);
	        	$return = $request_insert;
			}else{
				$return = "exist";
			}
			return $return;
		}	

		public function updateRol(int $idrol, string $rol, string $descripcion, int $status){
			$this->intIdrol = $idrol;
			$this->strRol = $rol;
			$this->strDescripcion = $descripcion;
			$this->intStatus = $status;

			$sql = "SELECT * FROM rol WHERE nombrerol = '$this->strRol' AND idrol != $this->intIdrol";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$sql = "UPDATE rol SET nombrerol = ?, descripcion = ?, status = ? WHERE idrol = $this->intIdrol ";
				$arrData = array($this->strRol, $this->strDescripcion, $this->intStatus);
				$request = $this->update($sql,$arrData);
			}else{
				$request = "exist";
			}
		    return $request;			
		}

		public function deleteRol(int $idrol)
		{
			$this->intIdrol = $idrol;
			$sql = "SELECT * FROM persona WHERE rolid = $this->intIdrol";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$sql = "UPDATE rol SET status = ? WHERE idrol = $this->intIdrol ";
				$arrData = array(0);
				$request = $this->update($sql,$arrData);
				if($request)
				{
					$request = 'ok';	
				}else{
					$request = 'error';
				}
			}else{
				$request = 'exist';
			}
			return $request;
		}
	}
 ?>
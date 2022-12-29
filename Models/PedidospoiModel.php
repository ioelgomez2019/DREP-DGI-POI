<?php

class PedidospoiModel extends Mysql
{
	
	public function Selectregistrop()
	{

		$sql = "SELECT
					registropoi.idregistro, 
					registropoi.centrocosto, 
					registropoi.objestrinst, 
					registropoi.indicadoroe, 
					registropoi.accestrinst, 
					registropoi.indicadorae, 
					actividad.nombre_act, 
					actividad.desc_act_ope, 
					actividad.responsable
				FROM
					registropoi
					INNER JOIN
					actividad
					ON 
						registropoi.idregistro = actividad.registropoi_idregistro";
		$request = $this->select_all($sql);
		return $request;
	}


}

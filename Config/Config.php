<?php 
	
	define("BASE_URL", "http://localhost/DREP-DGI-POI/");
	//const BASE_URL = "https://plan.ugelsanroman.gob.pe";**servidor**

	//Zona horaria
	date_default_timezone_set('America/Guatemala');
	//date_default_timezone_set("America/Lima");
	//date_default_timezone_set('sudamerica/peru');
	

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	//const DB_NAME = "plan_ceplanv1";
	//const DB_USER = "plan_ceplan";
	//const DB_PASSWORD = "by1vW*wQ#k]b";
	const DB_NAME = "db_tienda_v6";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB_CHARSET = "utf8";

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "Q";

 ?>



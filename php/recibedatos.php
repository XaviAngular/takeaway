<?php
//Para comprobar si se recibe un post desde un ajax
if ($_SERVER['REQUEST_METHOD']==='POST'){
	//Para almacenar los datos JSON recibidos en una variable
	$request= file_get_contents('php://input');
	//Para convertir un Json en un array de php
	$datos = json_decode($request,true);
	$valores='"';
	$campos="";
	foreach ($datos as $key => $value){
	$campos .= $value['name'].',';
	$valores.= $value['value'].'","';
	}
	$campos = substr($campos,0, -1);
	$valores = substr($valores,0, -2);

	$sql = "INSERT INTO contactform ($campos) VALUES ($valores)";
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sql);
		$mysqli->close();
	}

	if ($query) {
	echo json_encode([
		"campos" 	=> $campos,
		"error"		=> 0,
		"valores"	=> $valores,
		"sql"		=> $sql,
		"resultado" => "se ha grabado"
		]);	
	}
	else {
		echo json_encode([
		"campos" 	=> $campos,
		"error"		=> 1,
		"valores"	=> $valores,
		"sql"		=> $sql,
		"resultado" => "NO se ha grabado!!"
		]);	
	}
}
else {
echo json_encode([
		"campos" => "KO",
		"error"		=> 1,
		"valores"	=> "no hay"
	]);
}
?>
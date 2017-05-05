<?php
//Para comprobar si se recibe un post desde un ajax
if ($_SERVER['REQUEST_METHOD']==='POST'){
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	//Para almacenar los datos JSON recibidos en una variable
	//$request= file_get_contents('php://input');
	//Para convertir un Json en un array de php
	$datos = json_decode($_REQUEST['carrito'], true);
	$cliente= json_decode($_REQUEST['cliente'], true);
	$ids='';
	$cantidades="";
	$importe=0;
	
	$valores='"';
	$campos="";
	//var_dump($cliente[0]['value']) ;
	
	foreach ($cliente as $key => $value){
if ($value['name']=='password'){
	$campos .= $value['name'].',';
	$valores.= md5($value['value']).'","';
}
else {
	$campos .= $value['name'].',';
	$valores.= $value['value'].'","';
}
	
	}
	$campos = substr($campos,0, -1);
	$valores = substr($valores,0, -2);

	$sqlCli = "INSERT INTO clientes ($campos) VALUES ($valores)";

	$queryCli = $mysqli->query($sqlCli);
	if ($queryCli) {
		$lastIdCli=$mysqli->insert_id;
	}

	foreach ($datos as $value){	
	$importe=$importe+$value['precio']*$value['cantidad'];
	}

	$ids = substr($ids,0, -1);
	$cantidades = substr($cantidades,0, -1);
	$sqlPedido = "INSERT INTO pedidos (id_cliente,importe) VALUES ($lastIdCli,$importe);";	

	$sqlCliente= "SELECT * FROM clientes WHERE id=$lastIdCli";
	$queryCliente =  $mysqli->query($sqlCliente);
	$rowsCliente = $queryCliente->fetch_all(MYSQLI_ASSOC);

	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sqlPedido);
		$lastID=$mysqli->insert_id;
		$sqlDetalle="INSERT INTO detalle_pedido (id_pedido, id_plato, cantidad, importe) VALUES ";
		foreach ($datos as $value){	
		$id_plato=$value['id'];
		$cantidad=$value['cantidad'];
		$importe=$value['precio'];
		$sqlDetalle.="($lastID,$id_plato,$cantidad,$importe),";
	}
	$sqlDetalle = substr($sqlDetalle,0, -1);
	$queryDetalle=$mysqli->query($sqlDetalle);

	}
	$query=true;
	$queryDetalle=true;
	if (($query) && ($queryDetalle)) {		
	echo json_encode([
		"pedido" 	=> $datos,
		"error"		=> 0,
		"cliente"	=> $rowsCliente,
		"resultado" => "se ha grabado"
		]);	
	}
	else {
		$lastID="No se encuentra último id";
		echo json_encode([
		"ids" 	=> $ids,
		"error"		=> 0,
		"sqlpedido"	=> $sqlPedido,
		"sql"		=> $lastID,
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
$mysqli->close();
?>
<?php
//Para comprobar si se recibe un post desde un ajax
if ($_POST){
	
	if ($_FILES) {
		$files = array();
		$uploadDir= "../img/cats/";

foreach($_FILES as $file){
	if (move_uploaded_file($file['tmp_name'], "$uploadDir".basename($file['name'])))
	{
		$files[]= $uploadDir.$file['name'];
	}
	else {
		$files[]="no se ha subido archivo";
		}
	}
	$foto = "img/cats/".$_POST['foto'];
	}
	else {
		$foto = $_POST['foto'];
	}

	$nombre = $_POST['nombre'];
	$descripcion= $_POST['descripcion'];
	

	if ($_GET) {
		$id=$_POST['id'];
		
		$sql="UPDATE categoria SET nombre='$nombre', descripcion='$descripcion', foto='$foto' WHERE id=$id";
	}
	else {
		$sql = "INSERT INTO categoria (nombre,descripcion,foto) VALUES ('$nombre','$descripcion','$foto')";
	}
	
	
	$mysqli = new mysqli('127.0.0.1', 'root', '', 'takeaway');
	mysqli_set_charset($mysqli,"utf8");
	if ($mysqli) {
		$query=$mysqli->query($sql);
		$mysqli->close();
	}

	if ($query) {
	echo json_encode([
		"campos" 	=> "no hay",
		"error"		=> 0,
		"valores"	=> "no hay",
		"sql"		=> $sql,
		"resultado" => "se ha grabado"
		]);	
	}
	else {
		echo json_encode([
		"campos" 	=> "no hay",
		"error"		=> 1,
		"valores"	=> "no hay",
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
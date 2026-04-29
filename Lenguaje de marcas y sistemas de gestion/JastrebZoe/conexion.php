<?php 
    $servidor = 'localhost:3307';
    $usuario = 'root';
    $password = '';
    $basedatos = 'universidad';
    $conexion = mysqli_connect($servidor, $usuario, $password, $basedatos);

    if($conexion->connect_error){
        die("Error de conexión: " . $conexion->connect_error);
    }
?>

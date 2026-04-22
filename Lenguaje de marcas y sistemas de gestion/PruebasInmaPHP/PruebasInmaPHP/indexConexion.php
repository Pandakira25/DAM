<?php
//FICHERO CON EL CÓDIGO PARA CONEXIÓN

//PASO CERO: PREPARAR SENTENCIA 
    //Asignar a variables los datos de la conexión
    $servidor = 'localhost:3307'; 
    $usuario = 'root'; 
    $password = ''; 
    $basedatos = 'productosbd'; 
    $conexion = mysqli_connect($servidor, $usuario, $password, $basedatos); 
?>
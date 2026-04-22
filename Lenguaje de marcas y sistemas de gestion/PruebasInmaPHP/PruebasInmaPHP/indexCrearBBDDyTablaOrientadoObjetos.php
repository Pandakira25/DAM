<?php
    //NOTACIÓN ORIENTADA A OBJETOS//

    //PASO CERO: PREPARAR SENTENCIA 
    //Asignar a variables los datos de la conexión
    $servidor = 'localhost:3307'; 
    $usuario = 'root'; 
    $password = ''; 

    //Creamos un objeto
    $conexion = new mysqli($servidor, $usuario, $password); 
    $sqlCrearBD = "CREATE DATABASE IF NOT EXISTS productosbdOO"; 
    if($conexion->query($sqlCrearBD) === TRUE) {
        echo "Creada la Base de Datos correctamente <br>"; 
    }else {
        //el punto es para concatenar y la flecha es parte de la notación orientada a objetos
        echo "Error al crear la Base de Datos <br>" . $conexion->error; 
    }

    $conexion = new mysqli($servidor, $usuario, $password, "productosbdOO");
    $sqlCrearTabla = "CREATE TABLE IF NOT EXISTS productos (
        id_producto INT(11) NOT NULL,
        nombre VARCHAR(20),
        descripcion VARCHAR(225),
        precio INT(11), 
        fotografia BLOB, PRIMARY KEY (id_producto)
    )";
    if ($conexion->query($sqlCrearTabla) === TRUE) {
        echo "Creada la Tabla correctamente <br>"; 
    } else {
        echo "Error al crear la tabla <br>" . $conexion->error; 
    }
?>
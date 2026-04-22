<?php
    //ligamos con la conexión a la base de datos - este código está en otro fichero
    include "indexConexion.php"; 

    //variables
    $id = 103; 
    $nombre = "yo"; 
    $descripcion = "DAM2"; 
    $precio = 100; 
    //64k máximo - la imagen va en binario
    $rutaFoto = "PHPlogo.jpg"; 
    $nulo = null; 
    $imagen = file_get_contents($rutaFoto);
    
    //Evitar INYECCIONES SQL utilizando sentencias preparadas.  
    //mysqli_prepare: lo que hacemos es preparar la estructura de la sentencia SQL de forma que la sentencia no va a cambiar, solamente van a cambiar los datos (por cada campo una ?)
    $sentencia = mysqli_prepare($conexion, "INSERT INTO productos (id_producto, nombre, descripcion, precio, fotografia) VALUES (?, ?, ?, ?, ?)"); 

    //mysqli_stmt_bind_param: Después de la conexión y preparar la sentencia, permite asocial los datos/variables a cada una de las posiciones.
    //En el segundo parámetro del comando se indican los tipos de datos de cada parámetro en el mismo orden en el que aparecen. 
    //y pueden ser s -> string (text), i -> integer (número entero), d -> double (decimal), b ->blob (datos binarios)
    //No se pueden utilizar valores directos y tampoco expresiones, se deben utilizar variables. 
    //Los datos binarios no se pueden enviar directamente, una imagen en este caso, se indica con valor null
    //se indica la posición del fichero con la sentencia mysqli_start_send_long_data(sentencia, posicion, fichero)
    //La sentencia sería en nuestro caso: mysqli_start_send_long_data($sentencia, 4, $imagen)

    //la fotografía va como nulo
    //issib - son los tipos de datos que usamos /id es un integer i, nombre es un string s y así/ 
    mysqli_stmt_bind_param($sentencia, "issib", $id, $nombre, $descripcion, $precio, $nulo); 
    mysqli_stmt_send_long_data($sentencia, 4, $imagen); 
    if(mysqli_stmt_execute($sentencia)) {
        header("Location: https://universidadeuropea.com"); 
        //Sin exit, php podría seguir ejecutando código después del header. 
        //La sentencia 'Exit' detiene la ejecución de PHP
        exit; 
    } else {
        echo "Error al insertar" . mysqli_error($conexion); 
    }

?>
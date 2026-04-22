<?php
    //PASO CERO: PREPARAR SENTENCIA 
    //Asignar a variables los datos de la conexión
    $servidor = 'localhost:3307'; 
    $usuario = 'root'; 
    $password = ''; 
    //para conectarnos vamos a utilizar mysqli_connect(Servidor, Usuario, Contraseña, BD)
    //abre/crea la conexión con el servidor/BD y si no se puede conectar finaliza la ejecución del programa mostrando un mensaje de error 
    //or die("Error (con die)");
    $conexion = mysqli_connect($servidor, $usuario, $password); 
    //echo "Conectado a mySql<br>"; 

    if(!$conexion){
        echo"Error de conexión: " . mysqli_connect_error(); 
    } else {
        echo "Conectado a MySql"; 
        //el comando mysqli_query: permite ejecutar comandos SQL, ya sea para crear, consultar, insertar, actualiar o eliminar. 
        //Para todos los casos es necesario haber establecido la conexión, porque la conexión forma parete de los parámentros de la función. 
        //En las consultas devuelve todos los resutlados de esta, si los hay; y en el resto de operaciones devuelve 'true' si se ejecuta con éxito o 'false' si falla la ejecución.
        //mysql_query(conexión, sentencia_sql)
        
        //Variable y Sentencia
        $sqlCrearBD = "CREATE DATABASE IF NOT EXISTS productosbd"; 
        if(mysqli_query($conexion, $sqlCrearBD)) {
            echo "Base de datos creada <br>";
            //mysqli_select_db: sirve en este caso para seleccionar la base de datos con la que se va a trabajar después de establecer la conexión necesaria para ejecutar el comando (la conexión)
            //Devuelve 'true' si se selecciona correctamente la BD o 'false' si falla. 
            //se puede utilizar directamente mysqli_connect(servidor, usuario, password, nombredelabasededatos), si la base de datos está creada, sino no. 
            mysqli_select_db($conexion, "productosbd"); 
            //ahora que ya tenemos la base de datos seleccionada creamos una tabla
            $sqlCrearTabla = "CREATE TABLE IF NOT EXISTS productos (
                id_producto INT(11) NOT NULL,
                nombre VARCHAR(20),
                descripcion VARCHAR(225),
                precio INT(11), 
                fotografia BLOB, PRIMARY KEY (id_producto)
            )";
            if (mysqli_query($conexion, $sqlCrearTabla)){
                echo "Tabla creada correctamente <br>"; 
            }else {
                echo "Error al crear la tabla <br>"; 
            }

        } else {
            echo "Error al crear la Base de Datos <br>"; 
        }
    } 
?>


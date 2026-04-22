<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejemplo 1 Formulario PHP</title>
</head>
<body>
    <?php
    //DECLARACIÓN DE VARIABLES
    $nombre = "Lucía"; //variable de tipo string
    $edad = 25; //variable de tipo Integer
    $esEstudiante = true; //variable de tipo Boolean

    //DECLARACIÓN DE CONSTANTES
    define("Pi", 3.1416); //Constante con el valor Pi usando define - ("nombre", valor)
    const PAIS = "Argentina"; //Constante usando const (versión 5.3 o posterior) - const tipo nombre = valor

    echo "Nombre: $nombre <br>"; //Si se utilizan comillas simples no interpreta que es una variable, 
    //se muestra tal cual está entre las comillas, la solución a esto es concatenar como se muestra en la siguiente línea
    echo 'Nombre' . $nombre . '<br>'; 
    echo "Edad: $edad <br>"; 
    echo "Constante PI:" . Pi . "<br>";
    echo "Pais: " . PAIS . "<br>";
    echo "¿Estudiante? $esEstudiante <br>"; //1 o nada (?)
    echo "¿Estudiante?" . json_encode($esEstudiante) . "<br>"; //Para que imprima true o false es más fácil usar json_encode()
    
    //ÁMBITO VARIABLES
    function mostrarEdad() {
        //Variable LOCAL, solo existe dentro de esta función 
        $edadLocal = 30; 
        echo "Edad Local: $edadLocal, solo existe dentro de esta función <br>";

        //No se puede acceder a la variable $edad declarada fuera de esta función al inicio del archivo
        //echo "Edad Global: $edad <br>"; lo dejo comentado porque sino da error

        //Para acceder a la variable $edad que está fuera de la función añadimos la plabra global
        global $edad; 
        echo "Edad Global dentro de la función: $edad <br>"; 

    }
    //Llamar a la función que hemos creado
    mostrarEdad(); 

    //VARIABLES PREDEFINIDAS ESPECIALES
    echo "El navegador: es " . $_SERVER['HTTP_USER_AGENT'] . "<br>"; 
    echo "Script ejecutado: " . $_SERVER['PHP_SELF'] . "<br>";

    //ARRAY $_GET $_POST $_REQUEST
    //Añadir otra posición y valor a un array
    $_GET['var_get'] = "Valor GET"; //me añade var_get
    $_POST['var_post'] = "Valor POST"; 
    var_dump($_GET);
    var_dump($_POST); 
    echo "<pre>"; 
    echo 'Array $GET <br>'; 
    var_dump($_GET);
    echo 'Array $POST <br>';
    var_dump($_POST);

    //$_REQUEST: Contiene la información de $_GET, $_POST y $_COOKIE
    //Mantiene los datos originales no las modificaciones posteriores, para ello debería hacer una especide de actualización posterior
    var_dump($_REQUEST); 


    ?>

</body>
</html>
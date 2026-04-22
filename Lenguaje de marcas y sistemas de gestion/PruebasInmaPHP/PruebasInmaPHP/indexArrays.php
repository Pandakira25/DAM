<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejemplo 1 Formulario PHP</title>
</head>
<body>
    <?php
    //ARRAYS INDEXADOS (por posición en el array)
    //ARRAYS ASOCIATIVOS (por clave - claves pares valor)
    //ARRAYS MULTIDIMENSIONALES 
    
    //DECLARAR UN ARRAY INDEXADO (acceso por índice numérico) - Diferentes formas
    $frutas = ["Manzana", "Banana", "Naranja"];  //sintaxis corta (versión 5.4 o posterior)
    $frutas2 = array("Manzana", "Banana", "Naranja"); //sintaxis larga o antigua
    $frutasPos = array (10); //Array de 10 posiciones pero sin los valores de cada uno de ellos
    $frutasSinPos = array(); //Array sin posiciones definidas ni valores concretos

    //ACCEDER A LOS ELEMENTOS DEL ARRAY
    //echo "<h3>Array indexado</h3>"; 
    //var_dump($frutas); //Muestra el tipo del dato y los valores el array

    //Si queremos que salga PREFORMATEADO usamos pre
    echo "<h3>Array indexado</h3>"; 
    echo "<pre>"; 
    var_dump($frutas); //Muestra el tipo del dato y los valores el array
    //Para acceder uno a uno a los elementos del array
    for($i=0; $i < count($frutas); $i++){
        echo "Elemento $i: $frutas[$i] <br>";  
    }

    //DECLARAR UN ARRAY ASOCIATIVO 
    $persona = [
        "nombre" => "Lucía",
        "edad" => 25, 
        "ciudad" => "Buenos aires"
    ]; 

    //ACCEDER A LOS ELEMENTOS DEL ARRAY
    echo "<h3>Array indexado</h3>"; 
    echo "<pre>"; 
    var_dump($persona);

    //Aceder a cada uno de los elementos
    foreach($persona as $clave => $valor){
        echo "clave: $clave, Valor: $valor <br>";  
    }

    ?>

</body>
</html>
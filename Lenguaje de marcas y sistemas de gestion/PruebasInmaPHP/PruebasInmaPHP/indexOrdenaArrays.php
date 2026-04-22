<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejemplo 1 Formulario PHP</title>
</head>
<body>
    <pre>
    <?php
    //ARRAY INDEXADO - por posiciones
    $numeros = [5, 2, 9, 1, 7]; 
    echo "Array original: <br>"; 
    print_r($numeros); //mostrar el conenido de las variales pero un poco más estructurado o legible por los "humanos"
    
    //Ordenar de forma ASCENDENTE el array $numeros
    sort($numeros); 
    echo '<br>Array $numeros ordenado de forma ASCENDENTE. <br>';
    print_r($numeros); 
    
    //Ordenar de forma DESCENDENTE el array $numeros
    rsort($numeros); 
    echo '<br>Array $numeros ordenado de forma DESCENDENTE <br>'; 
    print_r($numeros); 
    
    
    //ARRAY ASOCIATIVO - par clave valor
    $edades = [
        "Carlos" => 30, 
        "Lucía" => 25, 
        "Ana" => 18,
        "Daniel" => 20,
    ];
    echo "Array original: <br>";
    print_r($edades);

    //Ordenar de forma ASCENDENTE el array 'edades', manteniendo las claves (asort)
    asort($edades); 
    echo '<br>Array $edades ordenado de forma ASCENDENTE, manteniendo las claves <br>'; 
    print_r($edades); 
    
    //Ordenar de forma ASCENDENTE el array 'edades', por las claves (ksort)
    ksort($edades); 
    echo '<br>Array $edades ordenado de forma ASCENDENTE, manteniendo las claves <br>'; 
    print_r($edades);

    //Ordenar de forma ASCENDENTE el array 'edades', manteniendo las claves (asort)
    arsort($edades); 
    echo '<br>Array $edades ordenado de forma ASCENDENTE, manteniendo las claves <br>'; 
    print_r($edades); 
    
    //Ordenar de forma ASCENDENTE el array 'edades', por las claves (ksort)
    krsort($edades); 
    echo '<br>Array $edades ordenado de forma ASCENDENTE, manteniendo las claves <br>'; 
    print_r($edades);

    ?>
    </pre>

</body>
</html>
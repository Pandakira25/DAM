<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control de Flujo</title>
</head>
<body>
    <?php
    echo "Inicio de la apliación PHP\n"; 
    echo "<br>"; 

    //Condicional
    echo "<br>";
    $numero = 10; 
    if ($numero<5) {
        echo "Menor que 5\n"; 
    } elseif($numero == 10){
        echo "Exactamente 10\n"; 
    } else {
        echo "Otro número\n"; 
    }

    //switch
    echo "<br>";
    $dia = "Lunes"; 
    switch ($dia) {
        case "Lunes"; 
            echo "Inicio de Semana\n"; 
            break; 
        case "Viernes"; 
            echo "Fin de Semana\n"; 
            break;
        default: 
            echo "Día Normal\n"; 
            break; 
    } 

    //Bucle for
    echo "<br>";
    echo "For loop:\n"; 
    for($i = 0; $i < 5; $i++){
        echo "Valor de i: $i\n"; 
    }

    //Bucle foreach
    echo "<br>";
    $nombres = ["Ana", "Luis", "Sofía"]; 
    echo "Foreach loop:<br>"; 
    foreach($nombres as $nombre){
        echo "Hola, $nombre!!!<br>"; 
    }

    //Bucle while
    echo "<br>";
    echo "While loop:<br>";
    $X = 0; 
    while ($X < 3){
        echo "Valor de X: $X<br>"; 
        $X++; 
    }

    //Bucle do...while
    echo "<br>";
    echo "do...while loop:<br>";
    $y = 0; 
    do {
        echo "Valor de y: $y<br>"; 
        $y++; 
    } while ($y < 2); 

    //Break & Continue
    echo "<br>";
    echo "Uso de break & continue<br>";
    for($j = 0; $j < 5; $j++){
        if ($j == 2){
            continue; //Salta el valor $j2
        }
        if ($j == 4){
            break; //finaliza el bucle
        }
        echo "Valor de j: $j<br>"; 
    }

    //include & require (deben existir archivos a insertar)
    echo "<br>";
    @include 'saludo2.php'; //intenta insertar un fichero, pero si no lo encuentra (como es este caso) no detiene la ejecución del programa
    @include 'saludo.php'; //en este caso mostrará el contenido del archivo porque sí que existe
        echo "Después de include<br>"; //para demostrar que aunque no encuentre uno de los archivos sigue ejecutando lo que viene después

    @require 'config.php'; //en este caso si el archivo no existe da un FATAl ERROR y ya no sigue
        echo "Después de require<br>"; //esta línea no aparecerá si el fichero anterior no existe
    
    //Goto
    goto salto; 
    echo "Este texto no se va a mostrar por estar entre dos salto";
    salto:
    echo "<br>";
    echo "Se ha saltado con goto<br>";
    echo "<br>";
    
    echo "Fin del script<br>";
    ?>
</body>
</html>
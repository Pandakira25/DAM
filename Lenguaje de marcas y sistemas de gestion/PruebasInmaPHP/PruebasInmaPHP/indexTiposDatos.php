<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Dentro de HTML</title>
</head>
<body>
    <?php
    //Así se abre el php 
        //Se permite hacer uso de palabras reservadas
        $entero = 10; 
        $decimal = 3.14; 
        $cadena= "Hola"; 
        $booleano = true; 
        $miArray = [1, 2, 3];
        $nulo = null; 
        $objeto = (object) ['nombre' => 'Carlos', 'edad' => 30]; //en los objetos la asignación es con =>

        //echo te imprime
        //gettype te dice qué tipo de dato es lo que se le pasa entre paréntesis que es la variable
        echo gettype($entero) . "<br>";
        echo gettype($decimal) . "<br>";
        echo gettype($cadena) . "<br>";
        echo gettype($booleano) . "<br>";
        echo gettype($miArray) . "<br>";
        echo gettype($nulo) . "<br>";
        echo gettype($objeto) . "<br>";


    //Así se cierra el php
    ?>
</body>
</html>
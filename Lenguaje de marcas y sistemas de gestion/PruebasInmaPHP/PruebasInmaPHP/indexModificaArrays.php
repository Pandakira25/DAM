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
        //ARRAY INDEXACIÓN
        $tareas = ["Revisar", "Reunir", "Escribir"]; 
        echo "Lista de tareas: "; 
        print_r($tareas); 

        //AÑÁDIR UNA TAREA AL FINAL DEL ARRAY 'tareas' con el método ARRAY_PUSH, devuelve la longitud del array
        $nuevoTamPush = array_push($tareas, "Enviar"); 
        echo "<br>Nuevo tamaño del array después de 'push': $nuevoTamPush <br>";
        print_r($tareas); 
        
        //AÑADIR UNA TAREA AL INICIO DEL ARRAY 'tareas' con el método ARRAY_UNSHIFT, devuelve la longitud del array
        $nuevoTamPush = array_unshift($tareas, "Preparar"); 
        echo "<br>Nuevo tamaño del array después de 'ushift': $nuevoTamPush <br>";
        print_r($tareas); 

        //ELIMINAR UNA TAREA DEL FINAL DEL ARRAY 'tareas' con el método ARRAY_POP, devuelve el elemento eliminado
        $tareaEliminadaPop = array_pop($tareas); 
        echo "<br>Elemento elimindo del array con 'array_pop: $tareaEliminadaPop <br>";
        print_r($tareas);

         //ELIMINAR UNA TAREA AL INICIO DEL ARRAY 'tareas' con el método ARRAY_UNSHIFT, devuelve la longitud del array
         $tareaEliminadaShift = array_shift($tareas); 
         echo "<br>Nuevo tamaño del array después de 'shift': $nuevoTamPush <br>";
         print_r($tareas); 
        
    ?>
    </pre>

</body>
</html>
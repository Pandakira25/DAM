<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Funciones</title>
</head>
<body>
    <?php
        //Función para calcular la nota media por valor (pasamos los dato y no se modifica)
        function calcularMedia($notas) {
            $suma = array_sum($notas); 
            return $suma / count($notas); 
        }

        //Función para subir las notas por referencia (pasamos la variable completa, significa que cualquier cambio que hagamos en la variable va a afectala también fuera de la función)
        //puntos por defecto va a 1 si no le pasamos nada
        function subirNotas(&$notas, $puntos = 1) {
            foreach($notas as &$nota) {
                $nota += $puntos; 
            }
        }

        //Otra función 
        function verEstudiante ($nombre, $notas){
            $media = calcularMedia($notas); 
            echo "Estudiante: $nombre<br>"; 
            //implode(separador, $array)
            //devuelve un array como una caena con el separador indicado como parámetro
            echo "Notas: ".implode(",",$notas)."<br>"; 
            echo "Media: $media<br>"; 
        }

        $notasJuan = [7, 8, 6, 9]; 
        verEstudiante("Juan", $notasJuan); 
        echo "<br>"; 
        echo "Subiendo las notas del alumno Juan...<br>"; 
        //subirNotas($notasJuan, 0.5); si pongo 0.5 me subirá 0.5 las notas
        subirNotas($notasJuan); //si no le paso ningún parámetro me cogerá el 1 por defecto
        verEstudiante("Juan (actualizado)", $notasJuan); 
    ?>
</body>
</html>
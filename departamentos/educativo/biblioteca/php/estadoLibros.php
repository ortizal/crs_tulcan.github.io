<?php
require ('../../../../conexion/conexion.php');
function getEstadoLibros(){
    $conexion=getConn();
    $query="SELECT * FROM estado";
    $respuestado=$conexion->query($query);
    $estado="<option value=0>--Estado libros--</option>";
    while($row=$respuestado->fetch_array(MYSQLI_ASSOC)){
        $estado.="<option value='$row[idestado]'>$row[estado]</option>";
    }
    return $estado;
}
echo getEstadoLibros();
?>
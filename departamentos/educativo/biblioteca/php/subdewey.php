<?php
require ('../../../../conexion/conexion.php');
function getSubDewey(){
    $conexion=getConn();
    $id=$_POST['id'];
    $query="SELECT * FROM subdewey WHERE dewey_iddewey = $id";
    $respuestado=$conexion->query($query);
    $subDewey.="<option value='0'>--Selecciona--</option>";
    while($row=$respuestado->fetch_array(MYSQLI_ASSOC)){
        $subDewey.="<option value='$row[idsubdewey]'>$row[codigo]-$row[subdewey]</option>";
    }
    return $subDewey;
}
echo getSubDewey();
?>
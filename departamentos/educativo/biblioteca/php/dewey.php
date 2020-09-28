<?php
require ('../../../../conexion/conexion.php');
function getDewey(){
    $conexion=getConn();
    $query="SELECT * FROM dewey";
    $respuestado=$conexion->query($query);
    $dewey="<option value=0>--Dewey--</option>";
    while($row=$respuestado->fetch_array(MYSQLI_ASSOC)){
        $dewey.="<option value='$row[iddewey]'>$row[codigo]-$row[dewey]</option>";
    }
    return $dewey;
}
echo getDewey();
?>
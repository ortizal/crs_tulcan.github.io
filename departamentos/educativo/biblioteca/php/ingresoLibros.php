<?php
require_once ('../../../../conexion/conexion.php');
    $conexion=getConn();
    $nombreLibro=$_POST['nombreLibro'];
    $autor=$_POST['autor'];
    $edicion=$_POST['edicion'];
    $ibsn=$_POST['ibsn'];
    $cutter=$_POST['cutter'];
    $dewey=$_POST['dewey'];
    $aFabricacion=$_POST['aFabricacion'];
    $fechaIngreso=$_POST['fechaIngreso'];
    $pais=$_POST['pais'];
    $editorial=$_POST['editorial'];
    $numeroLibros=$_POST['numeroLibros'];
    $estado=$_POST['estado'];
    $paginas=$_POST['paginas'];
    $query="INSERT INTO libro(nombreLibro,autor,edicion,ibsn,cutter,anoFabricacion,fechaIngreso,pais,editorial,dewey_iddewey,numeroLibros,paginas,estado_idestado) 
                    VALUES ('$nombreLibro','$autor','$edicion','$ibsn','$cutter','$aFabricacion','$fechaIngreso','$pais','$editorial','$dewey','$numeroLibros','$pais','$estado')";
    $ingresoLibros=mysqli_query($conexion, $query);
    echo $ingresoLibros;
?>
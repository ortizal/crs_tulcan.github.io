<?php
require ('../../../../conexion/conexion.php');
function listBooks(){
    $conexion=getConn();
    $query="SELECT * FROM libro INNER JOIN dewey 
            ON libro.dewey_iddewey = dewey.iddewey";
    $respLibro=$conexion->query($query);
    $listadoLibros="<tr><td></td></tr>";
    while($row=$respLibro->fetch_array(MYSQLI_ASSOC)){
        echo $listadoLibros=("<tr>
                            <td>$row[nombreLibro]</td>
                            <td>$row[autor]</td>
                            <td>$row[edicion]</td>
                            <td>$row[ibsn]</td>
                            <td>$row[cutter]</td>
                            <td>$row[codigo]-$row[dewey]</td>
                            <td>$row[anoFabricacion]</td>
                            <td>$row[fechaIngreso]</td>
                            <td>$row[pais]</td>
                            <td>$row[editorial]</td>
                        </tr>");
    }
    return $listadoLibros;
}
return listBooks();

?>

<?php
require_once '../../../conexion/conexion.php';
    function getListadoPpl(){
        $conection = getConn();
        $query = "SELECT * FROM ppl ORDER BY idppl DESC";
        $resultado = $conection->query($query);
        while ($row = $resultado->fetch_array(MYSQLI_ASSOC)){
           echo $listadoPpl = "<tr>
                                    <td>$row[idppl]</td>                     
                                    <td>$row[nombre]</td>
                                    <td>$row[apellido]</td>
                                    <td>$row[cedula]</td>
                                    <td>$row[delito]</td>
                                    <td>$row[nacionalidades_idnacionalidades]</td>
                                    <td>
                                        <img src='../../../imagenes/editar.png'  alt='Editar'>
                                        <img src='../../../imagenes/eliminar.png'  alt='Eliminar'>
                                        <img src='../../../imagenes/imprimir.png'  alt='Imprimir'>
                                    </td>
                                </tr>";
        }
        return $listadoPpl;
        
    }
    return getListadoPpl();
?>
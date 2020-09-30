
$(document).ready(function(){
    $.ajax({
        type:'POST',
        url:'../php/dewey.php',
        success:function(r){
            $('#dewey').html(r);
        }
    });
    $.ajax({
        type:'POST',
        url:'../php/estadoLibros.php',
        success:function(r){
            $('#estadoLibros').html(r);
        }
    });
    $.ajax({
        type:'POST',
        url:'../php/listadoLibros.php',
        success:function(re){
            if (re==1){
                $("#listadoLibros").html(re);
            }
            else{
                alert("Error en mostrar los libros");
            }
        }
    });
});
$("#guardarLibro").click(function(){
    var formIngreso = $("#formIngresoLibros").serialize();
    $.ajax({
        type:'POST',
        url:'../php/ingresoLibros.php',
        data:formIngreso,
        success:function(re){
            if (re==1){
                alert("Libro Ingresado");
            }
            else{
                alert("Error al ingresar los libros");
            }

        }
    });
    return false;
})
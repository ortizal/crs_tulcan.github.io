
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
    listarLibros();
    $("#guardarLibro").click(function(){
        var formIngreso = $("#formIngresoLibros").serialize();
        $.ajax({
            type:'POST',
            url:'../php/ingresoLibros.php',
            data:formIngreso,
            success:function(r){
                if (r==1){
                    alert("Libro Ingresado");
                    listarLibros();
                }
                else{
                    alert("Error al ingresar los libros");
                }
    
            }
        });
    })
});
function listarLibros(){
    $.ajax({
        type:'POST',
        url:'../php/listadoLibros.php',
        success:function(listaLibros){
                $("#listadoLibros").html(listaLibros);
        }
    });
}
$("#idEducativo").click(function(){
    alert("Página aún no habilitada");
})
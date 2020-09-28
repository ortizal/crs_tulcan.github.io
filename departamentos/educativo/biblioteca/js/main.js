
$(document).ready(function(){
    $.ajax({
        type:'POST',
        url:'../php/dewey.php',
        success:function(r){
            $('#dewey').html(r)
        }
    });
    $.ajax({
        type:'POST',
        url:'../php/estadoLibros.php',
        success:function(r){
            $('#estadoLibros').html(r)
        }
    });
});
$("#guardarLibro").click(function(){
    var formIngreso = $("#formIngresoLibros").serialize;
    alert("hello world");
    $.ajax({
        type:'POST',
        url:'../php/ingresoLibros.php',
        data:formIngreso
    })
    .done(function(r){
        if (r==1){
            alert("Libro Ingresado")
        }
        
    })
    .fail(
        alert("Error al ingresar los libros")
    );
})
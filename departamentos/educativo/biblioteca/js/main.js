$(document).ready(function(){
    $.ajax({
        type:'POST',
        url:'../php/dewey.php'
    })
    .done(function(listaDewey){
        $('#dewey').html(listaDewey);
    })
    .fail(function(){
        alert("Error al cargar listas dewey")
    })
    $("#dewey").on('change',function(){
        var id = $("#dewey").val();
        $.ajax({
            type:'POST',
            url:'../php/subdewey.php',
            data:{'id':id}
        })
        .done(function(listaDewey){
            $("#subdewey").html(listaDewey);
        })
        .fail(function(){
            alert("Error al cargar el subdewey")
        })
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
        $(".intoLibros").val("");
    });
});
function listarLibros(){
    $.ajax({
        type:'POST',
        url:'../php/listadoLibros.php',
        success:function(listaLibros){
                $("#listadoLibros").html(listaLibros);
        }
    });
};
function limpiarFormulario(){
    $("#formIngresoLibros").empty();
    alert("Formulario limpiado");
};
$("#idEducativo").click(function(){
    alert("Página aún no habilitada");
})
$("#reset").click(function reset(){
    $(".intoLibros").val("");
})
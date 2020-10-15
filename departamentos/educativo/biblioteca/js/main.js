$(document).ready(function(){
    $("#divSubdewey").hide();
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
        if (id == 1){
            $("#divSubdewey").show();
            $.ajax({
                type:'POST',
                url:'../php/subdewey.php',
                data:{'id':id}
            })
            .done(function(listaDewey){
                /* $("#divSubdewey").show(); */
                $("#subdewey").html(listaDewey);
            })
            .fail(function(){
                alert("Error al cargar el subdewey")
            })
        }
        else{
            $("#divSubdewey").hide();
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
        // alert(formIngreso);
        // return false;
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
    $("#divSubdewey").hide();
})
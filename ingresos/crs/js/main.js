$(document).ready(function(){
    /* Listado de nacionalidades */
    $('#ingresoData').hide();
    $.ajax({
        type:'POST',
        url:'../php/indexCrs.php'
    })
    .done(function(pplData){
        $('#listNacionalidades').html(pplData);
    })
    .fail(function(){
        alert("Error en la carga de nacionalidades");
    });
    /* Listado en tabla de los Ingresos realizados */
    listarDatos();

});
function listarDatos(){
    $.ajax({
        type:'POST',
        url:'../php/listIngresos.php',
        success:function(listaPpl){
            $('#tbodyPpl').html(listaPpl);
        }
    });
    $.ajax({
        type:'POST',
        url:'../php/detenidos.php'
    })
    .done(function(ingresoData){
        $('#listDetenidos').html(ingresoData);
    })
    .fail(function(){
        alert("Error en la carga de detenidos");
    });
}
/* Boton para incertar los datos persoales de los PPL's */
$('#insPplData').click(function(){
    var pplForm = $('#pplData').serialize();
    $.ajax({
      type:'POST',
      url:'../php/envioPpldatos.php',
      data:pplForm,
      success: function(r){
          if (r == 1){
              $('#pplData').hide();  
              $('#ingresoData').show();
              listarDatos();
          }
          else{
              alert("Error en la carga de archivos");
          }
      }
      });

    return false;
});
/* Boton para retoceder en el formulario */
/* $('#retIngData').click(function(){
    $('#ingresoData').hide();
    $('#pplData').show();
    return false;
}); */
/* Boton para insertar datos adicionales del Ingreso de los PPL's */
$('#insIngData').click(function(){
    var dataForm = $('#ingresoData').serialize();
    $.ajax({
        type:'POST',
        url:'../php/envioingreso.php',
        data:dataForm,
        success: function(r){
            if (r == 1){
                alert ("Ingreso exitoso");
                $('#ingresoData').hide();
                listarDatos();
            }
            else{
                alert('Error al ingresar datos');
            }
        }
    });
    return false;
});
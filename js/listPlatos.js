$(document).ready(function() {
   $('.modal').modal();
    var debug=true;
    $.ajax({
      url: '../php/getListPlatos.php',
      type: 'GET',
      dataType: 'json',
      success : function(result){
        console.log(result);
        var tbl_body = "";
        //Recorrer el array de la query que manda el php
        $.each(result.query, function(key,value) {
                tbl_body+="<tr>";
                tbl_body+="<td>"+value.nombre+"</td>";
                tbl_body+="<td>"+value.precio+"</td>";
                tbl_body+="<td><img width='90px' src=../"+value.foto+"></td>";
                if (value.activado=="on") tbl_body+="<td><i class='material-icons green-text lighten-3'>visibility</i></td>";
                else tbl_body+="<td><i class='material-icons red-text accent-3'>visibility_off</i></td>";
                tbl_body+="<td>"+value.nombreCat+"</td>";
                tbl_body+="<td><span onClick='verPlato("+JSON.stringify(value)+")'><i class='material-icons'>search</i></span></td>";
                tbl_body+="<td><span onClick='editaPlato("+JSON.stringify(value)+")'><i class='material-icons'>settings</i></span></td>";
                tbl_body+="</tr>";  
            });            
           
      
        if (debug) console.log(tbl_body);
        $("#listado tbody").html(tbl_body);       
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });
    cargaCats();   
});

function verPlato(plato){
  $('.titulo').html(plato.nombre);
  $('#precio').html(plato.precio);
  $('#desc').html(plato.descripcion);
  $('#foto').attr('src',"../"+plato.foto);
  $('#vistaPlato').modal('open');
}

function editaPlato(plato){
  
  (plato.activado=='on') ? $('#activadoEdit').prop('checked',true):$('#activadoEdit').prop('checked',false);
  $('#nombre').val(plato.nombre);
  $('#descripcion').val(plato.descripcion);
  $('#precioEdit').val(plato.precio);
  $('#fotoEdit').val(plato.foto);
  $('#categoriaEdit').val(plato.id_categoria);
  $('#activadoEdit').val(plato.activado);
  $('select').material_select();
  $('#editaPlato').modal('open');
}

function cargaCats(){
  $.ajax({
      url: '../php/getSelectCat.php',
      type: 'GET',
      dataType: 'json',
      success : function(result){
        console.log(result);
        var etiquetas ="";
        var values ="";
        var options ="";      
        //Recorrer el array de la query que manda el php
        $.each(result.query, function() {
            
            $.each(this, function(campo , valor) {
               if (campo=="id") values=valor;
               else etiquetas = valor;
            });
            options += "<option value='"
                          +values
                          +"'>"
                          +etiquetas
                          +"</option>";            
        });
        
        $("#categoriaEdit").html(options);
        $('select').material_select();       
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });
}   
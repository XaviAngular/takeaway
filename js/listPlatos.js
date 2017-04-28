var files=null;
$(document).ready(function() {
   $('.modal').modal();
   $('input[type=file]').on('change',function(event){
      files= event.target.files;
      console.log(files);
    })
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
  console.log('Id plato: '+plato.id);
  $('#idPlato').val(plato.id);
  $('select').material_select();
   Materialize.updateTextFields();
  $('#editaPlato').modal('open');
}

function updatePlato(){
  var formElement = document.getElementById("formPlato");
  var miForm = new FormData(formElement);
  //añadir el archivo al formdata para enviar
  if (files){
  $.each(files,function(key,value){
    miForm.append(key,value);
  })
  }
  $.ajax({
        url: '../php/recibePlatoArchivo.php?update=yes',
        type: 'POST',
        dataType: 'json',
        data: miForm,
        processData: false,
        contentType:false,
        success : function(result){
          
          Materialize.toast('¡Actualizado!',2000);
            
          
        },
        error: function(result){
          event.preventDefault();
          alert("errorrrrrr!!!");
        }
      })  
}
function removePlat (){
  var idPlat=$('#idPlato').val();
  var confirmar= confirm ("Vas a elimininar una categoría, estas seguro?");
  if (confirmar) {
    console.log("se elimina categoría");
    $.ajax({
        url: '../php/removeCatPlat.php?tipo=plat&id='+idPlat,
        type: 'GET',
        dataType : 'json',
        success: function(result){
            Materialize.toast(result.resultado,2000);
        },
        error: function(){
            alert("Error borrando categoría");
        }

    })
  }
  else {
    console.log("Se cancela eliminar categoría");
  }

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
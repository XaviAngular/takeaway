var files=null;
$(document).ready(function() {
    var debug=false;
    //Se prepara evento para capturar el archivo
    $('input[type=file]').on('change',function(event){
      files= event.target.files;
      console.log(files);
    })
    $('.modal').modal();
    $.ajax({
      url: '../php/getListCat.php',
      type: 'GET',
      dataType: 'json',
      success : function(result){
        console.log(result);
        var tbl_body = "";
        //Recorrer el array de la query que manda el php
        $.each(result.query, function(k,v) {
            if (debug) console.log("Pintando");
            var tbl_row ="<td>"+v.nombre+"</td>";
                tbl_row+="<td>"+v.descripcion+"</td>";
                tbl_row+="<td><img width='90px' src='../"+v.foto+"'></td>";
                tbl_row+="<td><a href='#' onClick='editCat("+JSON.stringify(v)+")'><i class='material-icons'>settings</i></a></td>";           
            tbl_body += "<tr>"+tbl_row+"</tr>";
        });
        if (debug) console.log(tbl_body);
        $("#listado tbody").html(tbl_body);       
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });
});

function editCat(categoria){
  $('#nombre').val(categoria.nombre);
  $('#descripcion').val(categoria.descripcion);
  $('#foto').val(categoria.foto);
  $('#imgPreview').attr('src',"../"+categoria.foto);
  $('#id').val(categoria.id);
  Materialize.updateTextFields();
  $('#editaCat').modal('open');
}

function updateCat(){
  console.log("Actualizamos categoria");
  var formElement = document.getElementById("formCat");
  var miForm = new FormData(formElement);
  //añadir el archivo al formdata para enviar
  if (files){
  $.each(files,function(key,value){
    miForm.append(key,value);
  })
  }
  $.ajax({
        url: '../php/recibeCatArchivo.php?update=yes',
        type: 'POST',
        dataType: 'json',
        data: miForm,
        processData: false,
        contentType:false,
        success : function(result){
          console.log(result.sql);
          if (result.error===0) {
            Materialize.toast('Categoría creada!', 4000); // 4000 is the duration of the toast
            //Borrar el contenido del formulario
            $('#formCat')[0].reset();
            //tambien se puede usar para borrar el form
            $('#formCat').trigger("reset");
          }
          else {
            Materialize.toast('Error al crear categoría!', 6000); // 4000 is the duration of the toast
            $('#formCat')[0].reset();
          }
          
        },
        error: function(result){
          alert("errorrrrrr!!!");
        }
      })
}

function removeCat (){
  var idCat=$('#id').val();
  var confirmar= confirm ("Vas a elimininar una categoría, estas seguro?");
  if (confirmar) {
    console.log("se elimina categoría");
    $.ajax({
        url: '../php/removeCatPlat.php?tipo=cat&id='+idCat,
        type: 'GET',
        dataType : 'json',
        success: function(result){

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
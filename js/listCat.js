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
  $('#editaCat').modal('open');
}

function updateCat(){
  
}    
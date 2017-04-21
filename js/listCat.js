$(document).ready(function() {
    var debug=false;
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
                tbl_row+="<td><img src='"+v.foto+"'></td>";
                tbl_row+="<td><a href='#' onClick='editCat("+v.id+")'>ver</a></td>";           
            tbl_body += "<tr>"+tbl_row+"</tr>";
        });
        if (debug) console.log(tbl_body);
        $("#listado tbody").html(tbl_body);       
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });

    $('input[type=file]').on('change', function(event){
        files = event.target.files;
        console.log(files);
    });
    $('select').material_select();
    $("#formCat").submit(function(event){
      
      event.preventDefault();//Evita el refresh automático que se produce al enviar el form
      
      // Se utiliza selector javascript en vez de jQuery
      // para que no se cree objeto jQuery que daría error con el FormData ya que no es jQuery sino JavaScript
      var formElement = document.getElementById("formCat");
      var miForm= new FormData(formElement);
      $.each(files, function(key, value)
    {
        miForm.append(key, value);
    });


// Display the key/value pairs
for (var pair of miForm.entries()) {
    console.log(pair[0]+ ', ' + pair[1]); 
}


      $.ajax({
        url: '../php/recibeCatFiles.php?files=y&update=y',
        type: 'POST',
        dataType: 'json',
        data: miForm,
        processData: false, // Don't process the files
        contentType: false,
        success : function(result){
          console.log(result);
          
        },
        error: function(result){
          alert("errorrrrrr!!!");
        }
      })
      

    }); 



});

function editCat(id){
   $.ajax({
      url: '../php/getCat.php?id='+id,
      type: 'GET',
      dataType: 'json',
      success : function(result){
        console.log(result);
            $.each(result.query, function(k,v) { 
                $('#nombre').val(v.nombre);
                $('#descripcion').val(v.descripcion);
                $('#foto').val(v.foto);
                $('#id').val(v.id);
            })        
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });
     $('#modal1').modal('open'); 
}     
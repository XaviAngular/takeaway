var files;
$(document).ready(function() {
   $('select').material_select();
    var debug=true;
    //Se prepara evento para capturar el archivo
    $('input[type=file]').on('change',function(event){
      files= event.target.files;
      console.log(files);
    })
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
            if (debug) console.log("Pintando");
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
        if (debug) console.log(options);
        $("#categoria").html(options);
        $('select').material_select();       
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });

  //Ajax para enviar formulario
  $("#formPlato").submit(function(event){
      event.preventDefault();//Evita el refresh automático que se produce al enviar el form
     

     var formElement = document.getElementById("formPlato");
     var miForm = new FormData(formElement);
      
      //añadir el archivo al formdata para enviar
      $.each(files,function(key,value){
        miForm.append(key,value);
      })
      $.ajax({
        url: '../php/recibePlatoArchivo.php?files',
        type: 'POST',
        dataType: 'json',
        data: miForm,
        processData: false,
        contentType:false,
        success : function(result){
          console.log(result.sql);
          if (result.error===0) {
            Materialize.toast('Plato creado!', 2000); // 4000 is the duration of the toast
            //Borrar el contenido del formulario
            $('#formPlato')[0].reset();
            //tambien se puede usar para resetear el form
            $('#formPlato').trigger("reset");
          }
          else {
            Materialize.toast('Error al crear plato!', 4000); // 4000 is the duration of the toast
            $('#formPlato')[0].reset();
          }
          
        },
        error: function(result){
          alert("errorrrrrr!!!");
        }
      });
    });    
});   
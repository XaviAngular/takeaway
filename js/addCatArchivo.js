var files;
$(document).ready(function() {
    var debug=true;
    $('select').material_select();
    
    //Se prepara evento para capturar el archivo
    $('input[type=file]').on('change',function(event){
      files= event.target.files;
      console.log(files);
    })
    
    $("#formCat").submit(function(event){
      event.preventDefault();//Evita el refresh automático que se produce al enviar el form
      
      var formElement = document.getElementById("formCat");
      var miForm = new FormData(formElement);
      
      //añadir el archivo al formdata para enviar
      $.each(files,function(key,value){
        miForm.append(key,value);
      })
      
      //Forma de mostrar por consola un objeto FormData
      for (var pair of miForm.entries()){
          console.log(pair[0]+', '+pair[1]);
      }

      
      $.ajax({
        url: '../php/recibeCatArchivo.php',
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
      

    });    
});     
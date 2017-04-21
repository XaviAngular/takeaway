var files;
$(document).ready(function() {
    var debug=true;
    
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
        url: '../php/recibeCatFiles.php?files',
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

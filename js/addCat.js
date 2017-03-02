$(document).ready(function() {
    var debug=false;
    $('select').material_select();
    $("#formCat").submit(function(event){
      event.preventDefault();//Evita el refresh automático que se produce al enviar el form
      //esta es la forma de obtener datos del formulario y 
      //convertirlo en formato JSON
      var jsonData= JSON.stringify($("#formCat").serializeArray());
      if (debug) console.log("Datos en Json:");
      if (debug) console.log(jsonData);
      $.ajax({
        url: '../php/recibeJson.php',
        type: 'POST',
        dataType: 'json',
        data: jsonData,
        success : function(result){
          console.log(result.sql);
          
        },
        error: function(result){
          alert("errorrrrrr!!!");
        }
      })
      

    });    
});     
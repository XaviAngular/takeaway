$(document).ready(function() {
    var debug=true;
    $.ajax({
      url: '../php/getSelectCat.php',
      type: 'GET',
      dataType: 'json',
      success : function(result){
        console.log(result);
        var options ="";       
        //Recorrer el array de la query que manda el php
        $.each(result.query, function() {
            if (debug) console.log("Pintando");
            $.each(this, function(campo , valor) {
            
                options += "<option>"+valor+"</option>";             
            });           
        });
        if (debug) console.log(options);
        //$("#categoria").html(options);       
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });
     });   
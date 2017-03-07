$(document).ready(function() {
    var debug=false;
    $.ajax({
      url: '../php/getListForm.php',
      type: 'GET',
      dataType: 'json',
      success : function(result){
        console.log(result);
        var tbl_body = "";
        //Recorrer el array de la query que manda el php
        $.each(result.query, function() {
            if (debug) console.log("Pintando");
            var tbl_row = "";
            $.each(this, function(k , v) {
              tbl_row += "<td>"+v+"</td>";
            });            
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
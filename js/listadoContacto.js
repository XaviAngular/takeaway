$(document).ready(function() {
    var debug=false;
    $.ajax({
      url: '../php/getListForm.php',
      type: 'GET',
      dataType: 'json',
      success : function(result){
        console.log(result);        
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });    
});     
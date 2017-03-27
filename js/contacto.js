$(document).ready(function (){
var debug=true;        
$('.row').fadeIn(1500);
$('#contactForm').hide();
$('#contactForm').slideDown(1500);
//Capturamos evento submit del form con jQuery. A destacar que reciba la variable event para que en firefox no de problemas.
$('#contactForm').submit(function(event){
	//El event.preventDefault evita que se haga un submit por defecto. Así no se ejecuta el atributo action.
	event.preventDefault();
	var jsonData=JSON.stringify($('#contactForm').serializeArray());
	if (debug) console.log(jsonData);
	$.ajax({
		url: 'php/recibedatos.php',
		type: 'POST',
		data: jsonData,
		dataType: 'json',
		success: function(result){
			console.log("Todo ha ido bien");
			console.log(result);
		},
		error: function(result){
			alert("Erroooooooor!!");

		}

	})
		





//fin del submit
})
		//Fin del document readu
        })
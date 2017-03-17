$(document).ready(function(){
			$('.modal').modal();
			$('#modal1').modal('open');
			var debug=true;
    $.ajax({
      url: 'php/getListPlatos.php',
      type: 'GET',
      dataType: 'json',
      success : function(result){
        console.log(result);
       $.each(result.query, function(k,v) { 
       		var nombre=v.nombre;
       		var descripcion=v.descripcion;
       		var precio=v.precio;
       		var categoria=v.nombreCat;
       });     
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });  
		});
function pintaCard(titulo,img,precio,descripcion,cat){
		var titulo="Card desde JS";
		var img="images/hotre.jpg";
		var precio="10.50";
		var descripcion="Texto de ejemplo para la descripción";
		var card =`
		<div class="col s6 m4 l3">
			<div class="card">
				<div class="card-image waves-effect waves-block waves-light">
					<img class="activator" src="${img}">
				</div>
				<div class="card-content">
					<span class="card-title activator grey-text text-darken-4">${titulo}<i class="material-icons right">more_vert</i></span>
					<p><span class="price">${precio} €</span></p>
				</div>
				<div class="card-reveal">
					<span class="card-title grey-text text-darken-4">${titulo}<i class="material-icons right">close</i></span>
					<p>${descripcion}</p>
				</div>
			</div>
		</div>
		`;
	$('#entrantes').append(card);
	}
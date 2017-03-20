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
       		console.log(result.query);
       		var nombre=v.nombre;
       		var descripcion=v.descripcion;
       		var precio=v.precio;
       		var categoria=v.nombreCat;
       		var imagen=v.foto;
       		pintaCard(nombre,imagen,precio, descripcion,categoria);

       });     
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });  
		});
function pintaCard(titulo,img,precio,descripcion,cat){
		console.log("pintaCard: "+cat);
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
	switch (cat){
			case "Ensaladas":
			$('#ensaRow').append(card);
			break;
			case "Principales":
			$('#princiRow').append(card);
			break;
			case "Postres":
			$('#postreRow').append(card);
			break;
			default:console.warn("Existen platos que no coinciden con categoría");
		}
	}
var carrito=[];
$(document).ready(function(){
			$('.modal').modal();
			$('#modal1').modal('open');
			var debug=true;
			//hayCarrito rescata la variable de localstorage para 
			//rescatar los productos añadidos al carrito
			var hayCarrito=localStorage.getItem('JsonCart');
			console.log(hayCarrito);
			hayCarrito=JSON.parse(hayCarrito);
			for (i in hayCarrito) {
				console.warn(hayCarrito[i].titulo);
			}
			

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
       		var id=v.id;
       		pintaCard(id,nombre,imagen,precio, descripcion,categoria);

       });     
      },
      error: function(result){
        alert("errorrrrrr!!!");
      }
    });  
		});
function pintaCard(id,titulo,img,precio,descripcion,cat){
		console.log("pintaCard: "+cat);
		var card =`
		<div class="col s6 m4 l3">
			<div class="card">
				<div class="card-image waves-effect waves-block waves-light">
					<div class="fixed-action-btn horizontal" style="position: absolute; display: inline-block; right: 14px;top:14px">
				<a class="btn-floating btn-large red">
				  <i class="large material-icons">shopping_basket</i>
				</a>
				<ul>
				  <li><a onclick="addCart(${id},1,${precio},'${titulo}')" class="btn-floating red center">1x</a></li>
				  <li><a onclick="addCart(${id},2,${precio},'${titulo}')" class="btn-floating yellow darken-1 center">2x</a></li>
				  <li><a onclick="addCart(${id},3,${precio},'${titulo}')" class="btn-floating green center">3x</a></li>
				  <li><a onclick="addCart(${id},4,${precio},'${titulo}')" class="btn-floating blue center">4x</a></li>
				</ul>
			  </div>
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
function addCart(id,cantidad,precio,titulo){	
	carrito.push({id:id,cantidad:cantidad,precio:precio*cantidad,titulo:titulo});
	console.log(carrito);
	var JsonCart=JSON.stringify(carrito);
	localStorage.setItem("JsonCart",JsonCart);
}
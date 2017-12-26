<link href="${css}/cartTable.css"  rel="stylesheet">
<div class="container">

	<c:choose>
		<c:when test="${not empty cartLines}">
		
			<table id="cart" class="table table-hover table-condensed">
		<thead>
			<tr>
				<th style="width: 50%">Product</th>
				<th style="width: 10%">Price</th>
				<th style="width: 8%">Quantity</th>
				<th style="width: 22%" class="text-center">Subtotal</th>
				<th style="width: 10%"></th>
			</tr>
		</thead>
		<tbody>
		
			<c:forEach items="${cartLines}" var="cartLine">
			<tr>
				<td data-th="Product">
					<div class="row">
						<div class="col-sm-4 ">
							<img src="${images}/${cartLine.product.code }.jpg" alt="${cartLine.product.name }"
								class="img-responsive cartImg" />
						</div>
						<div class="col-sm-8">
							<h4 class="nomargin">${cartLine.product.name }
								<c:if test="${cartLine.available == false}">
								
									<strong class="unavailable">(Not Available)</strong>
								</c:if>
							</h4>
							<h6> ${cartLine.product.brand }</h6>
							<p class="max-lines">${cartLine.product.description }</p>
						</div>
					</div>
				</td>
				<td data-th="Price">${cartLine.product.price} &#8364;</td>
				<td data-th="Quantity">${cartLine.productCount }</td>
				<td data-th="Subtotal" class="text-center">${cartLine.total} &#8364;</td>
				<td class="actions" data-th="">
					<a class="btn btn-info btn-sm" href="${contextRoot}/show/product/${cartLine.product.id}">
						<i class="material-icons">visibility</i>
					</a>
					<a class="btn btn-danger btn-sm" href="${contextRoot}/cart/${cartLine.id}/delete">
						<i class="material-icons">delete</i>
					</a>
				</td>
			</tr>
			
			</c:forEach>
		</tbody>
		<tfoot>
			<tr class="visible-xs">
				<td class="text-center"><strong>Total ${userModel.cart.total} &#8364;</strong></td>
			</tr>
			<tr>
				<td><a href="#" class="btn btn-warning"><i
						class="fa fa-angle-left"></i> Continue Shopping</a></td>
				<td colspan="2" class="hidden-xs"></td>
				<td class="hidden-xs text-center"><strong>Total ${userModel.cart.total} &#8364;</strong></td>
				<td><a href="#" class="btn btn-success btn-block">Checkout
						<i class="fa fa-angle-right"></i>
				</a></td>
			</tr>
		</tfoot>
	</table>
		</c:when>
		
		<c:otherwise>
			<div class="jumbotron">
				<div class="text-center">
					<h1> Your Cart is empty! </h1>
				</div>
			</div>
		</c:otherwise>
	
	
	</c:choose>

</div>
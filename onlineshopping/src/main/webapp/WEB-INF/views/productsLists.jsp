<br />
<br />
<br />
<br />

<div class="col-xs-12">
	<c:choose>
		<c:when test="${userClickCategoryProducts == true}">
			<script>
				window.categoryId = '${category.id}';
			</script>
			<div class="container-fluid">
				<div class="table-responsive">
					<table id="productListTable" class="uk-tabler uk-table-striped"
						cellspacing="10" width="100%">
						<thead>
							<tr>
								<th></th>
								<th>ID</th>
								<th>Brand</th>
								<th>Price</th>
								<th>Qty. Available</th>
								<th></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${userClickedCart == true}">
			<table>
				<tr>
					<th></th>
					<th>ID</th>
					<th>Brand</th>
					<th>Price</th>
					<th>Qty. Available</th>
					<th></th>
				</tr>
				</thead>

			</table>
		</c:when>
		<c:otherwise>
			<div id="carouselExampleIndicators" class="carousel slide my-4"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="col-lg-12 d-block img-fluid"
							src="${contextRoot}/resources/images/zelda.jpg" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="col-lg-12 d-block "
							src="${contextRoot}/resources/images/PRDDEBF3C8072.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="col-lg-12 d-block img-fluid"
							src="${contextRoot}/resources/images/destiny.jpg"
							alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="col-lg-12 d-block img-fluid"
							src="${contextRoot}/resources/images/xenoblade.jpg"
							alt="Fourth slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			<div class="row">
				<c:forEach items="${products}" var="products">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="${contextRoot}/show/product/${products.id}"> <img
								class="card-img-top"
								src="${contextRoot}/resources/images/${products.code}.jpg"
								alt="">
							</a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="${contextRoot}/show/product/${products.id}">${products.name }</a>
								</h4>
								<h5>${products.price }&#8364;</h5>
								<p class="card-text">${products.description }</p>
							</div>

							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</c:otherwise>
	</c:choose>
</div>
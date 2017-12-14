<!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-2">
          
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-8">
        
	      <div>
	        	<ol class="breadcrumb">
	           	  <li><a href="${contextRoot}/home"> All Games</a>  > </li>
	           	  <li><a href="${contextRoot}/show/category/${category.id}/products"> ${category.name}</a> > </li>
	        	  <li><a href="#"> ${product.name} </a></li>
	        	</ol>
	      </div>

          <div class="card mt-4">
            <img class="card-img-top img-fluid" src="${contextRoot}/resources//images/${product.code}.jpg" alt="">
            <div class="card-body">
              <h3 class="card-title">${product.name}</h3>
              <h4>${product.price } &#8364;</h4>
              <p class="card-text">${product.description}</p>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
            </div>
            
            <c:choose>
            	<c:when test="${product.quantity <1 }">
            		<a href="javascript:void(0)" class="btn btn-primary disabled">Out of Stock</a>
            	</c:when>
            	<c:otherwise>
            		<a href="${contextRoot}/cart" class="btn btn-primary"><i class="material-icons btn-sm">add_shopping_cart</i> Add to Cart</a>
            	</c:otherwise>
            </c:choose>
          </div>
          <!-- /.card -->

          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              Product Reviews
            </div>
            <div class="card-body">
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
              <small class="text-muted">Posted by Anonymous on 3/1/17</small>
              <hr>
              <a href="#" class="btn btn-success">Leave a Review</a>
            </div>
          </div>
          <!-- /.card -->

        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->
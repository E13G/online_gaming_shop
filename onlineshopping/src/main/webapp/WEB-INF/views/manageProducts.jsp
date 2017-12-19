<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class= "container">
	<br/>
	<br/>
	<br/>
	<div class="row">
	
		<c:if test="${not empty message}">
			<div class="col-md-8 offset-md-2">
			
				<div class="alert alert-success alert-dismissible">
				  <button type="button" class="close" data-dismiss="alert">&times</button>
				  
				  ${message}
				  
				</div>
			</div>
		</c:if>
		<div class="col-md-8 offset-md-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4> Product Management</h4>
				</div>
				<div class="panel-body">
					<!--  Form Elements -->
					<br/>
					<form:form class="form-horizontal" modelAttribute="product" 
					action="${contextRoot}/manage/products" 
					method="POST"
					enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-md-8" for="name"> Enter Product Name: </label>
							<div class="col-md-12">
								<form:input type="text" path="name" id="name" placeholder="Product Name" class="form-control"/>
								<form:errors path="name" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-8" for="brand"> Enter Company Name: </label>
							<div class="col-md-12">
								<form:input type="text" path="brand" id="brand" placeholder="Company Name" class="form-control"/>
								<form:errors path="brand" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-8" for="description"> Enter Product Description: </label>
							<div class="col-md-12">
								<form:textarea  path="description" id="description" placeholder="Write a description for the product" class="form-control"></form:textarea>
								<form:errors path="description" cssClass="help-block" element="em"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-8" for="price"> Enter Product Price: </label>
							<div class="col-md-12">
								<form:input type="number" step="0.01" path="price" id="price" placeholder="Product Price" class="form-control"/>
								<form:errors path="price" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-8" for="quantity"> Enter Product Quantity: </label>
							<div class="col-md-12">
								<form:input type="number" path="quantity" id="quantity" placeholder="Product Quantity" class="form-control"/>
								<form:errors path="quantity" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-8" for="file"> Select an Image: </label>
							<div class="col-md-12">
								<form:input type="file" path="file" id="file" class="form-control"/>
								<form:errors path="file" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-8" for="category"> Enter Product Category: </label>
							<div class="col-md-12">
								<form:select class="form-control" id="categoryId" path="categoryId"
									items="${categories}"
									itemLabel="name"
									itemValue="id"
								/>
								
								<c:if test="${product.id ==0 }">
									<div class="text-right">
									<br/>
									<button type="button" data-toggle="modal" data-target="#myCategoryModal" class ="btn btn-warning btn-sm"> Add Category</button>
									</div>
								</c:if>
							</div>
						</div>
						
						<div class="form-group">
							<div class="offset-md 4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary">
								<form:hidden path="id"/>
								<form:hidden path="code"/>
								<form:hidden path="supplierId"/>
								<form:hidden path="active"/>
								<form:hidden path="purchases"/>
								<form:hidden path="views"/>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>


	<div class="col-xs-12">
		<br/>
		<h3> Available Products </h3>
		<hr/>
		<br/>
	</div>
	
	<div class="col-xs-12">
		<div style="overflow:auto">
			<table id="adminProductsTable" class="table ">
			
				<thead>
					<tr>
					<th>Id</th>
					<th>&#160;</th>
					<th>Name</th>
					<th>Company</th>
					<th>Qty.</th>
					<th>Unit Price</th>
					<th>Active</th>
					<th>Edit</th>
					</tr>
				</thead>
				
				<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<label class="switch">
							<input type="checkbox" checked="checked" value="4">
							<div class="slider"></div>
						</label>
					</td>
					<td>
						<a href="${contextRoot}/manage/4/product" class="btn btn-sm rounded btn-warning">
							<i class="material-icons">create</i>
						</a>
					</td>
				</tr>
				</tbody>
				
				<tfoot>
				<tr>
					<th>Id</th>
					<th>&#160;</th>
					<th>Name</th>
					<th>Company</th>
					<th>Qty.</th>
					<th>Unit Price</th>
					<th>Active</th>
					<th>Edit</th>
				</tr>
				</tfoot>
			
			</table>
		</div>
	</div>
	
	<div class="modal fade" id="myCategoryModal" role="dialog">
	
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					
					<h4 class="modal-title">Add New Category</h4>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form id="categoryForm" modelAttribute="category" action="${contextRoot}/manage/category" 
					method="POST" class="form-horizontal">
						
						<div class="form-group">
							<label for="category_name" class="control-label col-md-4"> Category Name</label> 
							<div>
								<form:input type="text" path="name" id="category_name" class="form-control"/>
								<form:errors path="name" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
							<label for="category_description" class="control-label col-md-4"> Category Name</label> 
							<div>
								<form:textarea cols="" rows="5" path="description"  id="category_description" class="form-control"/>
								<form:errors path="description" cssClass="help-block" element="em"/>
							</div>
						</div>
						
						<div class="form-group">
						
							<div class="offset-md-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Add Category" class="btn btn-primary"/>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
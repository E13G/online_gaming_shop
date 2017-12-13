<h1 class="my-4"><a href="${contextRoot}/home "> E13G </a></h1>

<!-- Page Content - Category -->
<c:choose>
	<c:when test="${userClickCategoryProducts == true}">
		<h4 class="my-4"> ${category.name} </h4>
	</c:when>
	<c:otherwise>
		<h4 class="my-4"> Featured </h4>
	</c:otherwise>
</c:choose>

<div class="list-group">

	<c:forEach items="${categories}" var="category">
		<a href="${contextRoot}/show/category/${category.id}/products" class="list-group-item" id="a_${category.name}">${category.name}</a> 
	</c:forEach>

</div>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<spring:url var="css" value="/resources/css"/>
<spring:url var="js" value="/resources/js"/>
<spring:url var="images" value="/resources/images"/>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Indie Discovery - ${title} </title>

<script type="text/javascript">
	window.menu = '${title}';
	window.context = '${contextRoot}';
</script>

<!-- Material Design -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      
<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/flatty_theme.css"  rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/landingpage.css"   rel="stylesheet">


</head>

<body>
	<div class="wrapper">
		<!-- Navigation -->
		<%@include file="./shared_layouts/navbar.jsp"%>

		<!-- Page Content -->
		<div class="content">

			<div class="container">

				<div class="row">

					<div class="col-lg-12">

						<div class="jumbotron">

							<h1>${errorTitle }</h1>
							<hr />

							<blockquote style="word-wrap:break-word">
								${errorDescription }
							</blockquote>

						</div>

					</div>

				</div>

			</div>

		</div>
		<!-- /.container -->

		<!-- Footer -->
		<%@include file="./shared_layouts/footer.jsp"%>

		<!-- Bootstrap core JavaScript -->
		<script src="${js}/jquery-3.2.1.min.js"></script>
		<script src="${js}/bootstrap.bundle.min.js"></script>
		
		<!-- DataTable Plugins -->
		<script src="${js}/jquery.dataTables.js"></script>
		
		<!-- DataTable Plugins -->
		<script src="${js}/dataTables.bootstrap4.js"></script>

		<!-- JavaScript Pages-->
		<script src="${js}/mainController.js"></script>
	</div>
</body>

</html>
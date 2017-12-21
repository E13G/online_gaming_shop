<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Indie Discovery - ${title}</title>

<script type="text/javascript">
	window.menu = "${title}"
	window.context = "${contextRoot}"
</script>

<!-- Material Design -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/flatty_theme.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/landingpage.css" rel="stylesheet">


</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

		<div class="container">
			<a class="navbar-brand" href="${contextRoot}/home">Game World</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

		</div>
	</nav>
	<br />
	<br />
	<div class="container">

		<div class="row">

			<div class="offset-md-3 col-md-6">
				<div class="card">
					<div class="card-header card-title text-center">
						<h4>Login</h4>
					</div>

					<form action="${contextRoot}/login" method="post"
						class="form-horizontal" id="loginForm">
						<div class="card-body">
							<!-- FORM elements -->

							<div class="form-group row">
								<label class="control-label col-md-4" for="username">
									E-mail:</label>

								<div class="col-md-8">
									<input type="text" name="username" id="username"
										class="form-control" />
								</div>
							</div>

							<div class="form-group row">
								<label class="control-label col-md-4" for="password">
									Password:</label>

								<div class="col-md-8">
									<input type="password" name="password" id="password"
										class="form-control" />
								</div>
							</div>
						</div>

						<div class="col-md-12 card-footer">

							<div class="form-group " align="center">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit" value="Login"
									class="btn btn-primary" />
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
		
		<c:if test="${not empty message}">
			<div class="row">
				<div class="offset-md-3 col-md-6">
					<div class="alert alert-danger">${message}</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${not empty logout}">
			<div class="row">
				<div class="offset-md-3 col-md-6">
					<div class="alert alert-success">${logout}</div>
				</div>
			</div>
		</c:if>
		
		<div align="center" >
			<br/>
			<h6><a href="${contextRoot}/register"> Register Here</a></h6>

		</div>

	</div>

	<!-- Footer -->
	<%@include file="./shared_layouts/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="${js}/jquery-3.2.1.min.js"></script>
	<script src="${js}/bootstrap.bundle.min.js"></script>

	<!-- JavaScript Pages-->
	<script src="${js}/jquery.validate.js"></script>

	<!-- Bootbox Plugins -->
	<script src="${js}/bootbox.min.js"></script>

	<!-- JavaScript Pages-->
	<script src="${js}/mainController.js"></script>
</body>

</html>
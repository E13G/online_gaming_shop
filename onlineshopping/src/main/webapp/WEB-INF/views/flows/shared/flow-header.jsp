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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Indie Discovery - ${title} </title>

<script type="text/javascript">
	window.menu = "${title}"
	window.context = "${contextRoot}"
</script>

<!-- Material Design -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/flatty_theme.css"  rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/landingpage.css"   rel="stylesheet">

<link href="${css}/dataTables.bootstrap4.css"   rel="stylesheet">

</head>

<body>
	<div class="wrapper">
		
		<!-- Navigation -->
		<%@include file="../shared/flow-navbar.jsp" %>
		
		<br/>
		<br/>

		<div class="content">
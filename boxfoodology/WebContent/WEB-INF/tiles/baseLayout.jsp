<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<title>BoxFoodology</title>
		<meta name="description" content="BoxFoodology is Java web tutorial :)" />

		<base href="${baseurl}">
		<!-- CSS -->
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans">
		<link rel="stylesheet" href="css/custom.css?v=30012015" />
		<link rel="icon" href="images/logo.jpeg">
		<!-- JS -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/nav/jquery.nav.js"></script>
		<script type="text/javascript" src="js/custom.js?v=29112014"></script>
		<script type="text/javascript">
			<!--
			$(function() {
				<c:forEach var="successMessage" items="${flash.successMessages}" >
					notify('${successMessage}', 'success');
				</c:forEach>
				<c:forEach var="errorMessage" items="${flash.errorMessages}" >
					notify('${errorMessage}', 'error');
				</c:forEach>
				<c:forEach var="infoMessage" items="${flash.infoMessages}" >
					notify('${infoMessage}', 'info');
				</c:forEach>
			});
		//-->
		</script>
	</head>
	<body>
		<tiles:insertAttribute name="header" ignore="true" />
		<tiles:insertAttribute name="body" ignore="true" />
		<tiles:insertAttribute name="footer" ignore="true" />
	</body>
</html>
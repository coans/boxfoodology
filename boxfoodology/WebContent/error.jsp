<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page isErrorPage="true"%>

<html>
	<head>
		<style type="text/css">
			.section-blue {
			    background: none repeat scroll 0 0 rgb(247, 248, 249);
			    color: rgb(0, 0, 0);
			}	
		</style>
	</head>
	<body class="section-blue">
		<div align="center">
			<br/>
			<br/>
			<h2>Error occured</h2>	
			We are sorry for inconvenience. Please try again or contact us.
			<br/><br/>
			<FORM>
				<INPUT TYPE="button" VALUE="Back" onClick="history.go(-1);return true;">
			</FORM> 
			<br/><br/>
		</div>
	</body>
</html>
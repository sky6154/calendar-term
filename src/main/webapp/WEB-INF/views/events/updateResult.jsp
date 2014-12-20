<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
<title>Registration Success</title>
</head>
<body class="header">
	<div class="container" align="center">
		<jsp:include page="../includes/header.jsp" />
		<table border="0">
			<tr>
				<td colspan="2" align="center"><h2>Update Succeeded!</h2></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<h3>result details:</h3>
				</td>
			</tr>
			<tr>
				<td>event summary</td>
				<td>${eventForm.summary}</td>
			</tr>
			<tr>
				<td>event description</td>
				<td>${eventForm.description}</td>
			</tr>
			<tr>
				<td>event time</td>
				<td>${eventForm.when}</td>
			</tr>
		</table>
		<input type="button" value="Home"
			onClick="location.href='/calendar-dev/';">
	</div>
</body>
</html>
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

<script src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
<script src="${resourceUrl}/javascript/jquery.validate.js"></script>
<script src="${resourceUrl}/javascript/myScript.js"></script>

<script>
	addEventListener('load', prettyPrint, false);
	$(document).ready(function() {
		$('pre').addClass('prettyprint linenums');
	});
</script>

</body>

<title>Registration</title>
</head>

<body class="header">
	<div class="container" align="center">
		<jsp:include page="../includes/header.jsp" />
		<form:form action="signupResult" method="post" commandName="userForm"
			id="signupForm">
			<table>
				<tr>
					<td colspan="2" align="center"><h2>Registration</h2></td>
				</tr>
				<tr>
					<td>User ID:</td>
					<td><form:input path="user_id" name="user_id" id="user_id" /></td>
				</tr>
				<tr>
					<td>User Name:</td>
					<td><form:input path="name" name="name" id="name" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><form:password path="password" name="password" id="password" /></td>
				</tr>
				<tr>
					<td>Confirm Password:</td>
					<td><input type="password" name="confirm_password" id="confirm_password" /></td>
				</tr>
				<tr>
					<td>E-mail:</td>
					<td><form:input path="email" name="email" id="email" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Register" /></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>
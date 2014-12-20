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
<title>Registration</title>
</head>
<body class="header">
	<div class="container" align="center">
		<jsp:include page="../includes/header.jsp" />
		<form:form action="updateResult" method="post" commandName="userForm">
			<table border="0">
				<tr>
					<td colspan="2" align="center"><h2>회원 정보 수정</h2></td>
				</tr>
				<tr>
					<td>User Name:</td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><form:password path="password" /></td>
				</tr>
				<tr>
					<td>E-mail:</td>
					<td><form:input path="email" /></td>
				</tr>
				<form:hidden path="user_id" value="${pageContext.request.userPrincipal.name}" />
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Modify" /></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>
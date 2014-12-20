<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Log-in - CodePen</title>

<c:url var="resourceUrl" value="/resources" />

<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="http://codepen.io/assets/libs/fullpage/jquery-ui.css">

<link rel="stylesheet" href="${resourceUrl}/css/style.css"
	media="screen" type="text/css" />
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}
</style>

</head>

<body onload="document.loginForm.id.focus();">
	<div class="login-card">
		<h1>Log-in</h1>
		<br>
		<c:if test="${not empty error}">
			<div class="alert alert-danger" id="message">
				<div class="error">${error}</div>
			</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="alert alert-success" id="message">
				<div class="msg">${msg}</div>
			</div>
		</c:if>
		<form name="loginForm"
			action="<c:url value='/j_spring_security_check'/>" method='POST'>
			<input type="text" name='id' placeholder="Username"> <input
				type="password" name='password' placeholder="Password"> <input
				type="submit" name="login" class="login login-submit" value="login">
		</form>

		<div class="login-help">
			<a href="signup">Register</a>
		</div>
	</div>

	<!-- <div id="error"><img src="https://dl.dropboxusercontent.com/u/23299152/Delete-icon.png" /> Your caps-lock is on.</div> -->

	<script
		src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>

</body>
</html>
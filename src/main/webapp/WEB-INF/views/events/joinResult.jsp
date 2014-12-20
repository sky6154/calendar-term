<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
<title>Registration Success</title>
</head>
<body>
	<div align="center">
		<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
			<c:if test="${msg != null}">
				<div class="alert alert-success" id="message">
					<c:out value="${msg}" />
				</div>
			</c:if>
		</sec:authorize>
		<table border="0">
			<tr>
				<td colspan="2" align="center"><h2>Join Succeeded!</h2></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<h3>Thank you for registering! Here's the review of your
						details:</h3>
				</td>
			</tr>
			<tr>
				<td>User ID:</td>
				<td>${eventForm.userId}</td>
			</tr>
			<tr>
				<td>Events:</td>
				<c:forEach items="${eventForm.eventList}" var="event"
					varStatus="status">
					<tr>
					<td>${event}</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>
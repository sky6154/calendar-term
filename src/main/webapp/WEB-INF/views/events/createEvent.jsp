<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request" />
<html lang="en">
<head>
<title>myCalendar: <c:out value="${pageTitle}" /></title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap-datetimepicker.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />

<script src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
<script src="${resourceUrl}/javascript/jquery.validate.js"></script>
<script src="${resourceUrl}/javascript/event.js"></script>
<script src="${resourceUrl}/javascript/moment.js"></script>
<script type="text/javascript"
	src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>

<script type="text/javascript">
	addEventListener('load', prettyPrint, false);
	$(document).ready(function() {
		$('pre').addClass('prettyprint linenums');
	});
</script>

<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker();
	});
</script>

</head>
<body class="header">
	<sec:authorize access="isAnonymous()">
		<c:if test="${message != null}">
			<div class="alert alert-error">
				<c:out value="로그인이 필요한 페이지 입니다." />
			</div>
		</c:if>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
		<div class="container">
			<jsp:include page="../includes/header.jsp" />
			<c:if test="${message != null}">
				<div class="alert alert-success" id="message">
					<c:out value="${message}" />
				</div>
			</c:if>
			<div class="container row">
				<div class="alert alert-success col-md-6" id="message">
					도움말: <a
						href="https://github.com/Eonasdan/bootstrap-datetimepicker/wiki/Installation"
						target="_blank">https://github.com/Eonasdan/bootstrap-datetimepicker/wiki/Installation</a>
				</div>
				<div class="alert alert-success col-md-6" id="message">
					예제: <a href="http://eonasdan.github.io/bootstrap-datetimepicker/"
						target="_blank">http://eonasdan.github.io/bootstrap-datetimepicker/</a>
				</div>
			</div>

			<div class="container">
				<form:form action="createResult" method="post"
					commandName="eventForm" id="createEventForm">
					<div class="row">
						<div class='col-md-2'>
							<div class="form-group">Event Summary</div>
						</div>
						<div class='col-md-6'>
							<div class="form-group">
								<form:input path="summary" class="form-control" id="summary"
									name="summary" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class='col-md-2'>
							<div class="form-group">Event Description</div>
						</div>
						<div class='col-md-6'>
							<div class="form-group">
								<form:textarea path="description" class="form-control"
									id="description" name="description"></form:textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class='col-md-2'>
							<div class="form-group">Event Time</div>
						</div>
						<div class='col-md-6'>
							<div class="form-group">
								<div class='input-group date' id='datetimepicker1'>
									<form:input path="when" class="form-control" readonly="true" />
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<form:hidden path="owner"
						value="${pageContext.request.userPrincipal.name}" />
					<input type="submit" value="Event 생성" />
				</form:form>
			</div>
			<jsp:include page="../includes/footer.jsp" />
		</div>
	</sec:authorize>
</body>
</html>
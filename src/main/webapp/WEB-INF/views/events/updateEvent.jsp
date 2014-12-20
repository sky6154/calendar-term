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
<title>myCalendar: <c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap-datetimepicker.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
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

			<div class="container">
				<form:form action="updateResult" method="post"
					commandName="eventForm">
					<div class="row">
						<div class='col-md-2'>
							<div class="form-group">Event Summary</div>
						</div>
						<div class='col-md-6'>
							<div class="form-group">
								<form:input path="summary" class="form-control" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class='col-md-2'>
							<div class="form-group">Event Description</div>
						</div>
						<div class='col-md-6'>
							<div class="form-group">
								<form:textarea path="description" class="form-control"></form:textarea>
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
									<form:input path="when" class="form-control" readonly="true"/>
									<span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<form:hidden path="id" value="${eventForm.id}" />
					<input type="submit" value="Event 수정" />
				</form:form>
			</div>
			<jsp:include page="../includes/footer.jsp" />
		</div>
	</sec:authorize>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/moment.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#datetimepicker1').datetimepicker();
		});
	</script>
</body>
</html>
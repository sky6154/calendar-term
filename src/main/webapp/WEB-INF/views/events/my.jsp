<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body class="header">
	<div class="container">
		<jsp:include page="../includes/header.jsp" />
		<sec:authorize access="isAnonymous()">
			<c:out value="로그인이 필요한 페이지 입니다." />
		</sec:authorize>
		<div class="row">
			<div class="col-lg-12">
				<h1>My Event List</h1>
				<br> <br>

				<sec:authorize
					access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
					<table style="width: 100%;">
						<td align="center">event id</td>
						<td align="center">summary</td>
						<td align="center">time</td>
						<td align="center">description</td>
						<td align="center">likes</td>
						<td align="center">level</td>
						<td align="center">count</td>
						<c:forEach items="${events}" var="event" varStatus="status">
							<tr>
								<td align="center" class="eventId"><c:out
										value="${event.id}" /></td>
								<td align="center" class="eventSummary"><c:out
										value="${event.summary}" /></td>
								<td align="center" class="eventWhen"><c:out
										value="${event.when.getTime()}" /></td>
								<td align="center" class="eventDescription"><c:out
										value="${event.description}" /></td>
								<td align="center" class="numLikes"><c:out
										value="${event.numLikes}" /></td>
								<td align="center" class="evnetLevel"><c:out
										value="${event.eventLevel}" /></td>
								<td align="center" class="eventCount"><c:out
										value="${status.count}" /></td>
						</c:forEach>
					</table>
				</sec:authorize>
			</div>

			<br> <br> <br> <br> <br> <br>

			<div class="col-lg-12">
				<h1>My Join List</h1>
				<br> <br>
				<sec:authorize
					access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
					<table style="width: 100%;">
						<td align="center">event id</td>
						<td align="center">summary</td>
						<td align="center">time</td>
						<td align="center">description</td>
						<td align="center">likes</td>
						<td align="center">level</td>
						<td align="center">count</td>
						<c:forEach items="${joinEvents}" var="event" varStatus="status">
							<tr>
								<td align="center" class="eventId"><c:out
										value="${event.id}" /></td>
								<td align="center" class="eventSummary"><c:out
										value="${event.summary}" /></td>
								<td align="center" class="eventWhen"><c:out
										value="${event.when.getTime()}" /></td>
								<td align="center" class="eventDescription"><c:out
										value="${event.description}" /></td>
								<td align="center" class="numLikes"><c:out
										value="${event.numLikes}" /></td>
								<td align="center" class="evnetLevel"><c:out
										value="${event.eventLevel}" /></td>
								<td align="center" class="eventCount"><c:out
										value="${status.count}" /></td>
						</c:forEach>
					</table>
				</sec:authorize>
			</div>
		</div>
	</div>
</body>
</html>
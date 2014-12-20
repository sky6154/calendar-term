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

<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
	
		$(function() {
			$("input[name=chk_all]").click(function() {
				var chk = $(this).is(":checked");
				if (chk)
					$("input[name=chk_info]").prop("checked", true);
				else
					$("input[name=chk_info]").prop("checked", false);
			});
		});

		$(function() {
			$("#joinBtn").click(function() {
				//var eventArray = new Array();
				var eventArray = "";
				$("input[name=chk_info]:checked").each(function(idx, row) {
					var record = $(row).parents("tr");
					var val = record[0].innerText;

					eventArray += ":" + val[1];			
				});

				$('#idVal').val(eventArray);
				$('#joinForm').submit();
			}); 
		});
	</script>
</sec:authorize>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Calendar User List</h1>
				<br> <br>
				<sec:authorize
					access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
					<c:if test="${msg != null}">
						<div class="alert alert-success" id="message">
							<c:out value="${msg}" />
						</div>
					</c:if>
				</sec:authorize>
				<table style="width: 100%;">
					<tr>
						<sec:authorize
							access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
							<td align="center" rowspan="${fn:length(eventInfo.attendees)}"><input
								type="checkbox" name="chk_all"></td>
						</sec:authorize>
						<td align="center"><h3>event id</h3></td>
						<td align="center"><h3>event summary</h3></td>
						<td align="center"><h3>event owner</h3></td>
						<td align="center"><h3>event when</h3></td>
						<td align="center"><h3>event description</h3></td>
						<td align="center"><h3>event likes</h3></td>
						<td align="center"><h3>event level</h3></td>
						<td align="center"><h3>event Attendees</h3></td>
						<td align="center"><h3>count</h3></td>
					</tr>
					<c:forEach items="${eventInfoes}" var="eventInfo">
						<tr>
							<sec:authorize
								access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
								<td align="center" rowspan="${fn:length(eventInfo.attendees)}"><input
									type="checkbox" name="chk_info"></td>
							</sec:authorize>
							<td align="center" id="val"
								rowspan="${fn:length(eventInfo.attendees)}" class="eventId"><c:out
									value="${eventInfo.event.id}" /></td>
							<td align="center" rowspan="${fn:length(eventInfo.attendees)}"
								class="eventSummary"><c:out
									value="${eventInfo.event.summary}" /></td>
							<td align="center" rowspan="${fn:length(eventInfo.attendees)}"
								class="eventOwner"><c:out
									value="${eventInfo.event.owner.getName()}" /></td>
							<td align="center" rowspan="${fn:length(eventInfo.attendees)}"
								class="eventWhen"><c:out
									value="${eventInfo.event.when.getTime()}" /></td>
							<td align="center" rowspan="${fn:length(eventInfo.attendees)}"
								class="eventDescription"><c:out
									value="${eventInfo.event.description}" /></td>
							<td align="center" rowspan="${fn:length(eventInfo.attendees)}"
								class="numLikes"><c:out value="${eventInfo.event.numLikes}" /></td>
							<td align="center" rowspan="${fn:length(eventInfo.attendees)}"
								class="evnetLevel"><c:out
									value="${eventInfo.event.eventLevel}" /></td>

							<c:forEach items="${eventInfo.attendees}" var="attendee"
								varStatus="status">
								<td align="center"><c:out value="${attendee.getName()}" /></td>
								<td align="center"><c:out value="${status.count}" /></td>
						</tr>
						<tr>
					</c:forEach>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
		<form:form action="join" method="post" commandName="eventForm"
			id="joinForm">
			<form:hidden path="userId"
				value="${pageContext.request.userPrincipal.name}" />
			<form:hidden path="flag" value="join" />
			
			<form:hidden path="eventList" id="idVal" />
			<input type="button" id="joinBtn" value="선택한 이벤트 참여">

		</form:form>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<form:form method="post" commandName="eventForm" id="deleteForm">
				<input type="button" id="deleteBtn" value="선택한 이벤트 삭제">
			</form:form>
		</sec:authorize>
	</sec:authorize>

</body>
</html>
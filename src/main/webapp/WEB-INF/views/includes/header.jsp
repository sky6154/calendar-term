<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<c:url var="welcomeUrl" value="/" />
				<li><a id="navWelcomeLink" href="${welcomeUrl}"><span
						class="glyphicon glyphicon-home"></span> 홈</a></li>

				<c:url var="eventsUrl" value="/events/" />
				<li><a id="navEventsLink" href="${eventsUrl}"><span
						class="glyphicon glyphicon-th-list"></span> 모든 이벤트 보기</a></li>

				<sec:authorize
					access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
					<li><form:form id="myEventsLink"
							action="/calendar-dev/events/my" method="post"
							commandName="userInfo">
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<form:hidden path="name"
									value="${pageContext.request.userPrincipal.name}" />
							</c:if>
						</form:form><a href="javascript:eventSubmit()"><span
							class="glyphicon glyphicon-ok-sign"></span> 나의 이벤트</a></li>
				</sec:authorize>

				<c:url var="createEventUrl" value="/events/createEvent" />
				<li><a id="navCreateEventLink" href="${createEventUrl}"><span
						class="glyphicon glyphicon-new-window"></span> 이벤트 생성</a></li>

				<c:url var="signupUrl" value="/users/signup" />
				<li><a id="signupLink" href="${signupUrl}"><span
						class="glyphicon glyphicon-globe"></span> 회원 가입</a></li>

				<sec:authorize
					access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
					<c:url var="updateUrl" value="/users/updateUser" />
					<li><a id="updateLink" href="${updateUrl}"><span
							class="glyphicon glyphicon-pencil"></span> 내 정보 수정</a></li>
				</sec:authorize>

				<!-- For guest -->
				<sec:authorize access="isAnonymous()">
					<c:url var="signinUrl" value="/users/signin" />
					<li><a id="signinLink" href="${signinUrl}"><span
							class="glyphicon glyphicon-saved"></span> 로그인</a></li>
				</sec:authorize>

				<!-- For login user -->
				<sec:authorize
					access="hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')">
					<c:url var="signinUrl" value="/users/signin?logout" />
					<li><form id="logoutForm"
							action="/calendar-dev/j_spring_security_logout" method="post"></form>
						<a href="javascript:formSubmit()"><span
							class="glyphicon glyphicon-open"></span> 로그아웃</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</nav>

<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}

	function eventSubmit() {
		document.getElementById("myEventsLink").submit();
	}
</script>
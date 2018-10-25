<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<style>
.navbar {
	margin-top: 0px;
	margin-bottom: 0px;
	border-radius: 0px;
}
</style>

<c:if test="${pageContext.request.userPrincipal == null}">
	<nav class="navbar navbar-default" >
		
	</nav>
</c:if>
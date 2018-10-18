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
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/'></c:url>">Fashion
				Store</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value='/gallery'></c:url>">Browse All
						Products</a></li>
				<c:forEach items="${categories }" var="c">
					<li class="dropdown"><a href="" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">${c.maincategory }<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:forEach items="${subcat1}" var="sc">
								<c:if test="${sc.category.maincategory == c.maincategory}">
									<li><a
										href="<c:url value ='/products-by-subcategory-${sc.subcategory1}'></c:url>">${sc.subcategory1 }</a></li>
								</c:if>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</ul>
			<form class="navbar-form navbar-left" action="<c:url value ='/searchProduct'></c:url>" method="get">
				<div class="form-group">
					<input
						style="border-radius: 25px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; width: 320px;"
						type="text" class="form-control" placeholder="Search Products"
						name="search">
				</div>
				<button
					style="margin-left: -5px; border-radius: 25px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;"
					type="submit" class="btn btn-success">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>


			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value='/cart/listCart'></c:url>">My Cart <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
				<li><a href="<c:url value='/customer/myAccount'></c:url>">My
						Account</a></li>
				<security:authorize access="hasRole('ROLE_RETAILER')">
					<li><a href="<c:url value='/retailer/myAccount'></c:url>">My
							Account</a></li>
				</security:authorize>
				<li><a href="<c:url value = '/userLogin'></c:url>"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</nav>
</c:if>
<c:if test="${pageContext.request.userPrincipal != null }">
	<nav class="navbar navbar-inverse">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/'></c:url>">Fashion
				Store</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value='/gallery'></c:url>">Browse All
						Products</a></li>
				<c:forEach items="${categories }" var="c">
					<li class="dropdown"><a href="" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">${c.maincategory }<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:forEach items="${subcat1}" var="sc">
								<c:if test="${sc.category.maincategory == c.maincategory}">
									<li><a
										href="<c:url value ='/products-by-subcategory-${sc.subcategory1}'></c:url>">${sc.subcategory1 }</a></li>
								</c:if>
							</c:forEach>
						</ul></li>
				</c:forEach>
			</ul>
			<form class="navbar-form navbar-left"
				action="<c:url value ='/gallery'></c:url>" method="get">
				<div class="form-group">
					<input
						style="border-radius: 25px; border-top-right-radius: 0px; border-bottom-right-radius: 0px; width: 300px;"
						type="text" class="form-control" placeholder="Search Products"
						name="srch-str">
				</div>
				<button
					style="margin-left: -5px; border-radius: 25px; border-top-left-radius: 0px; border-bottom-left-radius: 0px;"
					type="submit" class="btn btn-success">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="hasRole('ROLE_USER')">
					<li><a href="<c:url value='/cart/listCart'></c:url>">My Cart <span
							class="glyphicon glyphicon-shopping-cart"></span></a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_USER')">
					<li><a href="<c:url value='/customer/myAccount'></c:url>">My
							Account</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_RETAILER')">
					<li><a href="<c:url value='/retailer/myAccount'></c:url>">My
							Account</a></li>
				</security:authorize>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href=""><span
						class="glyphicon glyphicon-user"></span>
						${pageContext.request.userPrincipal.name } <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value='/logout'></c:url>">Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
</c:if>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>Fashion Store(Admin Portal)</title>

<link href="<c:url value ='/resources/css/bootstrap.min.css'></c:url>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/style.css'></c:url>"
	rel="stylesheet" />
<link
	href="<c:url value = '/resources/css/jquery.dataTables.min.css'></c:url>"
	rel="stylesheet" />
<link
	href="<c:url value = '/resources/css/dataTables.bootstrap.min.css'></c:url>"
	rel="stylesheet" />
<link
	href="<c:url value = '/resources/css/font-awesome.min.css'></c:url>"
	rel="stylesheet" />
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector : 'textarea'
	});
</script>

<style>
.navbar-default {
	background-color: #a32222;
	border-color: #293872;
}

.navbar-default .navbar-brand {
	color: #ecf0f1;
}

.navbar-default .navbar-brand:hover, .navbar-default .navbar-brand:focus
	{
	color: #f8f9f8;
}

.navbar-default .navbar-text {
	color: #ecf0f1;
}

.navbar-default .navbar-nav>li>a {
	color: #ecf0f1;
}

.navbar-default .navbar-nav>li>a:hover, .navbar-default .navbar-nav>li>a:focus
	{
	color: #f8f9f8;
}

.navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.active>a:hover,
	.navbar-default .navbar-nav>.active>a:focus {
	color: #f8f9f8;
	background-color: #293872;
}

.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:hover,
	.navbar-default .navbar-nav>.open>a:focus {
	color: #f8f9f8;
	background-color: #293872;
}

.navbar-default .navbar-toggle {
	border-color: #293872;
}

.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus
	{
	background-color: #293872;
}

.navbar-default .navbar-toggle .icon-bar {
	background-color: #ecf0f1;
}

.navbar-default .navbar-collapse, .navbar-default .navbar-form {
	border-color: #ecf0f1;
}

.navbar-default .navbar-link {
	color: #ecf0f1;
}

.navbar-default .navbar-link:hover {
	color: #f8f9f8;
}

@media ( max-width : 767px) {
	.navbar-default .navbar-nav .open .dropdown-menu>li>a {
		color: #ecf0f1;
	}
	.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover,
		.navbar-default .navbar-nav .open .dropdown-menu>li>a:focus {
		color: #f8f9f8;
	}
	.navbar-default .navbar-nav .open .dropdown-menu>.active>a,
		.navbar-default .navbar-nav .open .dropdown-menu>.active>a:hover,
		.navbar-default .navbar-nav .open .dropdown-menu>.active>a:focus {
		color: #f8f9f8;
		background-color: #293872;
	}
}
</style>

</head>

<body>
	<div>

		<nav class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/admin/home'></c:url>">Admin
					Portal</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Product<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value = '/admin/product/list'></c:url>">View
									Product List</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Category<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value = '/admin/category/list'></c:url>">View
									Category List</a></li>
							<li><a href="<c:url value = '/admin/category/add'></c:url>">Add
									New Category</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Sub Category<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value = '/admin/subcat1/list'></c:url>">View
									SubCategory List</a></li>
							<li><a href="<c:url value = '/admin/subcat1/add'></c:url>">Add
									New SubCategory</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Retailer<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value = '/admin/retailer/list'></c:url>">View
									Retailer List</a></li>
							<li><a href="<c:url value = '/admin/retailer/add'></c:url>">Add
									New Retailer</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Customer<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value = '/admin/customer/list'></c:url>">View
									Customer List</a></li>
							<li><a href="<c:url value = '/admin/customer/add'></c:url>">Add New Customer</a></li>
						</ul></li>


				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/logout'></c:url>">Sign out</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>

	<div>
		<script src="<c:url value ='/resources/js/jquery.min.js'></c:url>"></script>
		<script src="<c:url value ='/resources/js/bootstrap.min.js'></c:url>"></script>
		<script src="<c:url value ='/resources/js/bootbox.min.js'></c:url>"></script>
		<script src="<c:url value ='/resources/js/scripts.js'></c:url>"></script>

		<!-- data table -->
		<script
			src="<c:url value ='/resources/js/jquery.dataTables.min.js'></c:url>"></script>
		<script
			src="<c:url value ='/resources/js/dataTables.bootstrap.min.js'></c:url>"></script>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<title>Category Details</title>

<script type="text/javascript">
$(document).ready(function() {
	$("table").DataTable({
		"lengthMenu": [[5,10,15,20,-1],[5,10,15,20,"All"]],
		"ordering": true,
		stateSave: true
	});
});
</script>
</head>
<body>
	<!-- List of Products , productsAttr is the name of the model attribute -->
	<div class="container">
	<h1>Category Details</h1>
	<br>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Main Category</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
		<!-- JSTL tag for iterating list of products -->
		<c:forEach items="${list}" var="c"><!-- p is referring to Product -->
			<tr>
				<td>${c.maincategory }</td>
				<td><a href = "<c:url value = '/admin/category/update/${c.maincategory }'></c:url>"><span class = "glyphicon glyphicon-cog"></span></a></td>
				<td><a href = "<c:url value = '/admin/category/delete/${c.maincategory}'></c:url>"><span class = "glyphicon glyphicon-trash"></span></a></td>
				
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Product List</title>
<script type="text/javascript">
$(document).ready(function() {
	$("table").DataTable({
		"lengthMenu": [[5,10,15,20,-1],[5,10,15,20,"All"]],
		"ordering": false,
		stateSave: true
	});
});
</script>
</head>
<body>
	<!-- List of Products , productsAttr is the name of the model attribute -->
	<div class="container">
	<h1>Product Details</h1>
	<br>
	<table class="table table-striped">
		<thead>
			<tr>
			    <th>Thumbnail</th>
				<th>Product name</th>
				<th>Description</th>
				<th>Main Category</th>
				<th>Sub Category</th>
				<th>Price</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
		<!-- JSTL tag for iterating list of products -->
		<c:forEach items="${lists }" var="p"><!-- p is referring to Product -->
			<tr>
			   
			    <td><img class = "img img-responsive img-thumbnail" style = "width:200px; height:200px;" src = "<c:url value='/resources/${p.imageUrl1}'></c:url>"></td>
				<td>${p.productname }</td>
				<td>${p.description }</td>
				<td>${p.category.maincategory }</td>
				<td>${p.subcategory1.subcategory1 }</td>
				<td>${p.price }</td>
				<td><a href = "<c:url value = '/admin/product/update/${p.productId }'></c:url>"><span class = "glyphicon glyphicon-cog"></span></a></td>
				<td><a href = "<c:url value = '/admin/product/delete/${p.productId }'></c:url>"><span class = "glyphicon glyphicon-trash"></span></a></td>
				
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</div>
</body>
</html>
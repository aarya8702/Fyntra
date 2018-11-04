<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.material.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.material.min.css" rel="stylesheet">
<title>Retailers List</title>
<script type="text/javascript">
$(document).ready(function(){
	var searchCondition='${searchCondition}'
	$('.table').DataTable({
		 columnDefs: [
	            {
	                targets: [ 0, 1, 2 ],
	                className: 'mdl-data-table__cell--non-numeric'
	            }
	        ]
	})
})

</script>
<script type="text/javascript">

$(window).on('scroll',function(){

if($(window).scrollTop()){
	$('.navbar').addClass('navbar-default');
}else{
	$('.navbar').removeClass('navbar-default');
}
})</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container">
	<h1>Retailer Details</h1>
	<br>
	<table class="table table-striped">
		<thead>
			<tr>
			    <th>Retailers Name</th>
				<th>contactperson</th>
				<th>gtin</th>
				<th>email</th>
				<th>password</th>
				<th>phonenumber</th>
				<th>alternatenumber</th>
				<th>Address</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
		<!-- JSTL tag for iterating list of products -->
		<c:forEach items="${list }" var="r"><!-- p is referring to Product -->
			<tr>
				<td>${r.retailername }</td>
				<td>${r.contactperson }</td>
				<td>${r.gtin }</td>
				<td>${r.user.email}</td>
				<td>${r.user.password }</td>
				<td>${r.phonenumber }</td>
				<td>${r.alternatenumber }</td>
				<td>${r.street1 },${r.route1 },${r.city1 },${r.state1 },${r.zipcode1 },${r.country1 }</td>
				<td><a href = "<c:url value = '/retailer/update/${r.retId }'></c:url>"><span class = "glyphicon glyphicon-cog"></span></a></td>
	            <td><a href = "<c:url value = '/retailer/delete/${r.retId }'></c:url>"><span class = "glyphicon glyphicon-trash"></span></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file = "/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Site made with Mobirise Website Builder v4.8.1, https://mobirise.com -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.8.1, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon" href="resourcesimages/mbr-122x122.jpg"
	type="image/x-icon">
<meta name="description" content="Product Update">
<title>Add New Category</title>
</head>
<body>
<div class = "jumbotron"></div>
<div class = "container">
<div class="jumbotron">
 <div class = "col-xs-04"><h2>Add New category</h2></div>
</div>
<spring:url value="/admin/category/save" var = "saveUrl"/>
<form:form action = "${saveUrl }" method = "post" modelAttribute="categoryForm">
 <div class = "form-group">
  <label><b>Enter Main Category: </b></label>
  <form:input type = "text" path = "maincategory" class = "form-control" placeholder = "Main Category"/>
 </div>

 <div class = "form-group">
  <button type = "submit" class = "btn btn-primary">Add Category</button>
 </div>
</form:form>
</div>
</body>
</html>
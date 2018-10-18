<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>Add/Update Product</title>


</head>
<body bgcolor="grey">
<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<div class = "jumbotron"></div>
<div class = "container" >
<div class = "jumbotron">
<div class = "col-xs-04"><h2>Add/Update Product</h2></div>
</div>
<spring:url value="/admin/product/save" var = "saveUrl"/>
<form:form action = "${saveUrl }" method = "post" modelAttribute="productForm" enctype="multipart/form-data">
 <form:hidden path="productId"/>
 <div class = "form-group">
  <label><b>Enter Productname: </b></label>
  <form:input type = "text" path = "productname" class = "form-control" placeholder = "Enter Productname"/>
 </div>
 <div class = "form-group">
  <label><b>Enter Description: </b></label>
  <form:input type = "text" path="description" class = "form-control" placeholder = "Enter Description"/>
 </div>
 <div class = "form-group">
  <label><b>Select Category </b></label>
  <form:select path="category.maincategory" class="form-control">
   <c:forEach items = "${categories }" var = "c">
    <form:option value="${c.maincategory }">${c.maincategory }</form:option>
   </c:forEach>
  </form:select>
 </div>
  <div class = "form-group">
  <label><b>Select Sub Category </b></label>
  <form:select path="subcategory1.subcategory1" class="form-control">
   <c:forEach items = "${subcat }" var = "sc">
    <form:option value="${sc.subcategory1 }">${sc.subcategory1 }</form:option>
   </c:forEach>
  </form:select>
 </div>
 <div class = "form-group">
  <label><b>Enter Quantity: </b></label>
  <form:input type = "text" path="quantity" class = "form-control" placeholder = "Enter Quantity"/>
 </div>
 <div class = "form-group">
  <label><b>Enter Price: </b></label>
  <form:input type = "text" path="price" class = "form-control" placeholder = "Enter Price"/>
 </div>

  <div class = "form-group">
  <label><b>Upload Image 1: </b></label>
  <form:input type="file" path="file1" class = "form-control"/>
 </div>
 <div class = "form-group">
  <button type = "submit" class = "btn btn-primary">Add product!</button>
 </div>
</form:form>
</div>
</body>
</html>
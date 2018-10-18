<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div class="col-md-3 ">
	<div class="list-group ">
		<a class="list-group-item list-group-item-action active">Dashboard</a>
		<a href="<c:url value ='/retailer/product/add'></c:url>" class="list-group-item list-group-item-action">Add new Product</a> 
		<a href="<c:url value ='/retailer/product/list'></c:url>" class="list-group-item list-group-item-action">Product List</a> 
		<a href="<c:url value ='/retailer/promoAdd'></c:url>" class="list-group-item list-group-item-action">Add Promotion Code</a>
	    <a href="<c:url value ='/retailer/promotionlist'></c:url>" class="list-group-item list-group-item-action">Promotion Code List</a>
	    <a href="<c:url value ='/retailer/changePassword'></c:url>" class="list-group-item list-group-item-action">Change Password</a>
	    <a href="<c:url value ='/retailer/info'></c:url>" class="list-group-item list-group-item-action">Account Details</a>	
	</div>
</div>

<security:authorize access = "hasRole('ROLE_USER')">

</security:authorize>
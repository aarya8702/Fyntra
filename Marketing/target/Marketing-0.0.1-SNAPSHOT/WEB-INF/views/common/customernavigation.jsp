<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-3 ">
	<div class="list-group ">
		<a class="list-group-item list-group-item-action active">Dashboard</a>
		<a href="<c:url value ='/customer/orders'></c:url>" class="list-group-item list-group-item-action">Orders</a>
		<a href="<c:url value ='/customer/shippingForm'></c:url>" class="list-group-item list-group-item-action">Shipping Address</a>
	    <a href="<c:url value ='/customer/billingForm'></c:url>" class="list-group-item list-group-item-action">Billing Address</a>
	    <a href="<c:url value ='/customer/changePassword'></c:url>" class="list-group-item list-group-item-action">Change Password</a>
	    <a href="<c:url value ='/customer/info'></c:url>" class="list-group-item list-group-item-action">Account Details</a>	
	</div>
</div>
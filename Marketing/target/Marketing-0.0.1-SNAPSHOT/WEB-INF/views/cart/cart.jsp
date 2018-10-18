<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/resources/css/style.css'></c:url>" rel="stylesheet">
<script>
$(document).ready(function(){
	$(".cartItemQty").on('change', function(){
		$('#update-item').css('display', 'inline-block');
	});
});
</script>
<title>Fashion Store: Cart</title>
<style>

.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<c:if test="${!empty(cartItems) }">

<div class="container-fluid" style="margin-top: 50px;">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
        <a href="<c:url value="/cart/clearCart"></c:url>" class="btn btn-danger pull-left" >Clear Cart <span class = "glyphicon glyphicon-trash"></span></a>
            <table class="table table-hover" width = "100%">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th class = "text-center">Quantity</th>
                        <th class="text-center">Price/Quantity</th>
                        <th class = "text-center">Promocodes</th>
                        <th class = "text-center">SubTotal</th>
                        
                        
                    </tr>
                </thead>
             
                <tbody>
           
                   <c:forEach items = "${cartItems }" var = "cart">
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="img img-thumbnail pull-left" > <img style = "width:200px; height:150px;"class="media-object img-thumbnail img-responsive" src="${pageContext.request.contextPath }/resources/${cart.product.imageUrl1}" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${cart.product.productname }</a></h4>
                                
                                <h5 class="media-heading"> by <a href="#">${cart.product.retailer.retailername }</a></h5>
                            </div>
                        </div>
                        </td>
                         <td class="col-sm-1 col-md-1 text-center" > ${cart.product.category.maincategory }</td>
                        <td class="col-sm-1 col-md-1" style="text-align: center"> ${cart.quanity }</td>
                          <td class="col-sm-1 col-md-1" style="text-align: center"> ${cart.product.price }</td>
                        <td>
                        <form action="<c:url value='/cart/applyCode'></c:url>" >
                        <c:if test="${error }">
                        <font color="red"><span class="glyphicon glyphicon-remove"></span> <b>Invalid Code</b> </font>
                        </c:if>
                        <c:if test="${success }">
                        <font color="green"><span class="glyphicon glyphicon-ok"></span><b> ${promo.promotioncode }</b> </font>
                        </c:if>
                        <c:if test="${invalid }">
                        <font color="red"><span class="glyphicon glyphicon-remove"></span> <b>Invalid Code</b> </font>
                        </c:if>
                        <input type="text" placeholder="Enter Promocodes" class="form-control cartItemQty" name="promoCode"/>
                        <button style="display: none;" id="update-item" type="submit" class="btn btn-warning btn-xs">Update</button>
                        </form>
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>Rs. ${cart.subtotal }</strong></td>
                      

                        <td class="col-sm-1 col-md-1">
                        <a href = "<c:url value='/cart/delete/${cart.cartId }'></c:url>" class="btn btn-danger">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a></td>
                    </tr>
                  </c:forEach>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong>Rs. ${shoppingCart.grandTotal }</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>Free</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h4><strong>Rs. ${shoppingCart.grandTotal }</strong></h4></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href = "${pageContext.request.contextPath }/gallery" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </a></td>
                        <td>
                        <a href = "<c:url value='/cart/shippingaddress'></c:url>" class="btn btn-success">
                            Proceed To Checkout <span class="glyphicon glyphicon-play"></span>
                        </a></td>
                    </tr>
                </tbody>
                  
            </table>
        </div>
    </div>
</div>
</c:if>
<c:if test="${ empty(cartItems) }">
<div class = "container">
<div class = "jumbotron">
<div style = "margin-top:150px; margin-left:250px;">
<h1 style = "color:black;">Your Cart is Empty </h1><span><a href = "${pageContext.request.contextPath }/gallery">continue shopping......</a></span>
</div>
</div>
</div>
</c:if>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
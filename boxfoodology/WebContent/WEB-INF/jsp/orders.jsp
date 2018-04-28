<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="home">
	<div class="section-container">
		<jsp:include page="home-picture.jsp"/>	
		<section id="about" class="section-blue">
			<div class="moving-text">
				<h3 style="width:100%; font-family:georgia;" align="center"><i>Selected food</i></h3>
			</div>
			<c:if test="${confirmed}">
			 	<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<div align="center"><strong>Your order is sent successfully</strong></div>
			    </div>
		    </c:if>
			<c:if test="${emptyList}">
			 	<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<div align="center"><strong>Your list is empty, please add some food to the list</strong></div>
			    </div>
		    </c:if>		    
			<div class="container">
				<p><a href="my/orders/clear" class="btn btn-info"><spring:message code="orders.clear"/></a></p>
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">Image</th> 
							<th class="text-center">Food</th>
							<th class="text-center">Category</th>
							<th class="text-center">Price</th>
							<th class="text-center">Quantity</th>
							<th class="text-center">Amount</th>
							<th class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order" varStatus="loop">	
							<tr>
								<td width="10%" align="center">${loop.count}</td>
								<td align="center"><img class="thumbnail img-responsive" src="items/image/${order.food.id}" style="margin-bottom: 2px;"></td>
								<td width="25%" align="center">${order.food.name}</td>
								<td width="20%" align="center">${order.food.category.title}</td>
								<td width="10%" align="center">${order.food.price}</td>
								<td width="10%" align="center">${order.quantity}</td>
								<td width="10%" align="center">${order.amount}</td>
								<td width="15%" align="center">
									<c:if test="${not confirmed}">
										<a href="my/orders/add/${order.food.id}/1" title="Add one more item"><i class="glyphicon glyphicon-plus"></i></a>
										&nbsp;
										<a href="#" data-href="my/orders/delete/${order.food.id}" data-toggle="modal" data-target="#confirmDeleteId" title="Delete from order"><i class="glyphicon glyphicon-remove"></i></a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						<tr><td colspan="8">&nbsp;</td></tr>
						<tr>
							<td class="active">&nbsp;</td>
							<td class="active">&nbsp;</td>
							<td class="active">&nbsp;</td>
							<td class="active">&nbsp;</td>
							<td class="active">&nbsp;</td>
							<td class="active" align="center">In total:</td>
							<td class="success">${priceOfOrderedItems} AED</td>	
							<c:if test="${not confirmed}">
								<td class="active" align="right" style="padding-right: 0px;"><a href="my/orders/confirm" class="btn btn-primary btn-small">Confirm order</a></td>						
							</c:if>
							<c:if test="${confirmed}">
								<td class="active">&nbsp;</td>						
							</c:if>					
						</tr>
						<%-- <tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>						
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<c:if test="${not confirmed}">
								<td align="right" style="padding-right: 0px;"><a href="my/orders/confirm" class="btn btn-primary btn-small">Confirm order</a></td>						
							</c:if>
							<c:if test="${confirmed}">
								<td>&nbsp;</td>						
							</c:if>
						</tr> --%>
					</tbody>
			    </table>
			</div>
		</section>
	</div>
</div>
<div class="modal fade" id="confirmDeleteId" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" align="center"><b>Confirm Delete</b></div>
            <div class="modal-body" align="center">Are you sure you want to delete this item?</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger btn-ok">Delete</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	// default navigation	
	if(window.location.href == '<c:out value="${baseurl}"/>#about') {
		setActiveHeader("#about");
	} else {
		setActiveHeader("#home");
	}
	// animate navigation
	$('.nav').onePageNav({
	    currentClass: 'active',
	    changeHash: true,
	    easing: 'swing'
	});
	
	$(".btn-down a").click(function(e) {
		e.preventDefault();
		$('html, body').animate({
            scrollTop: $("#info").offset().top
        }, 750, function() { $(".btn-down").remove(); });
	});
	
	$('#confirmDeleteId').on('show.bs.modal', function(e) {
	    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
	});
</script>
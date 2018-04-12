<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="home">
	<div class="section-container">
		<section class="section-home-background">
			<div class="container text-center">
				<c:choose>
					<c:when test="${not empty user}">
						<div>
							<a href="my/posts" class="btn btn-primary btn-lg">Add post</a>
						</div>
					</c:when>
					<c:otherwise>
<!-- 						<div>
							<a href="signup" class="btn btn-primary btn-lg">Sign up it's free!</a>
						</div>
						<div>
							<a href="login" class="orlogin">or log in</a>
						</div> -->
					</c:otherwise>
				</c:choose>
				<div class="btn-down">
					<a href="#info"><i class="fa fa-angle-double-down"></i>
						<img alt="" onmouseover="this.src='images/scroll-hover.png';" onmouseout="this.src='images/scroll.png';" />
					</a>
				</div>
			</div>
		</section>
		<c:if test="${not empty posts}">
			<c:forEach var="post" items="${posts}">
				<section id="info" class="section-white section-home-white">
					<div class="container text-center">
						<h2>${post.title}</h2>
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<p>${post.message}</p>
								<p>${post.user.firstName} ${post.user.lastName}: <fmt:formatDate pattern="dd-MM-YYYY hh:mm" value="${post.created}"/></p>
							</div>
						</div>
					</div>
				</section>
			</c:forEach>
		</c:if>		
		<section id="about" class="section-blue">
			<div class="moving-text">
				<h3 style="width:100%; font-family:georgia;" align="center"><i>Selected food</i></h3>
			</div>
			<div class="container">
				<p><a href="my/orders/clear" class="btn btn-info"><spring:message code="orders.clear"/></a></p>
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center">Food</th>
							<th class="text-center">Price</th>
							<th class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">	
							<tr>
								<td width="50%" align="center">${order.food.name}</td>
								<td width="30%" align="center">${order.food.price}</td>
								<td width="20%" align="center">
									<a href="my/orders/add/${order.food.id}" title="Add one more item"><i class="glyphicon glyphicon-plus"></i></a>
									&nbsp;
									<a href="my/orders/delete/${order.food.id}" title="Delete from order"><i class="glyphicon glyphicon-remove"></i></a>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td class="active">&nbsp;</td>
							<td class="active" align="center">In total:</td>
							<td class="success">${priceOfOrderedItems} AED</td>						
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td align="right" style="padding-right: 0px;"><a href="policies/confirm" class="btn btn-primary btn-small">Confirm order</a></td>						
						</tr>
					</tbody>
			    </table>
			</div>
		</section>
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

</script>
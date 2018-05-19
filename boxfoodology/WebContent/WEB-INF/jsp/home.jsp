<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="home">
	<div class="section-container">
		<jsp:include page="home-picture.jsp"/>
		
		<section id="about" class="section-blue">
			<div class="moving-text">
				<p><i>Welcome to the best place in Dubai where you can order food. <a href="signup">Sign up</a> it's free, or <a href="login"><spring:message code="button.login"/></a></i></p>
			</div>		
			<div class="container text-center" style="padding-top: 0px;">
				<table style="width:100%" align="center">
					<tr>
						<c:forEach items="${categories}" var="category" varStatus="loop">
							<c:if test="${loop.count % 3 eq 0}">
								<td style="padding-right: 20px;">
									<a href="items/${category.id}" class="thumbnail"><img src="image/${category.id}" title="Select ${category.name}"/></a>
								</td>
								</tr><tr>
							</c:if>
							<c:if test="${not (loop.count % 3 eq 0)}">
								<td style="padding-right: 20px;">
									<a href="items/${category.id}" class="thumbnail"><img src="image/${category.id}" title="Select ${category.name}"/></a>
								</td>					
							</c:if>
						</c:forEach>
					</tr>
				</table>
			</div>
		</section>
		<div id="myCarousel" class="carousel slide" data-ride="carousel"> <!-- data-interval="false" -->
			<h3 align="center"><i><spring:message code="carousel.bestsellers"/></i></h3>
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<c:if test="${not empty bestsellerPageOne}">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				</c:if>
				<c:if test="${not empty bestsellerPageTwo}">
					<li data-target="#myCarousel" data-slide-to="1"></li>
				</c:if>
				<c:if test="${not empty bestsellerPageThree}">
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</c:if>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" align="center">
				<c:if test="${not empty bestsellerPageOne}">
					<div class="item active" style="margin-bottom: 2%;">
						<div class="row">
							<c:forEach items="${bestsellerPageOne}" var="bestseller" varStatus="loop">
								<c:if test="${loop.index == 0}">
									<div class="col-xs-2" style="margin-left: 17%;">
								</c:if>
								<c:if test="${loop.index != 0}">
									<div class="col-xs-2">
								</c:if>
								<a href="items/details/${bestseller.food.id}" title="View details"><i class="fa fa-angle-double-down"></i>
									<img src="items/image/${bestseller.food.id}" alt="Slide 1" height="148" width="170">
								</a>
								<label>${bestseller.food.name}</label>
							</div>
							</c:forEach>																	
						</div>
					</div>
				</c:if>
				<c:if test="${not empty bestsellerPageTwo}">
					<div class="item" style="margin-bottom: 2%;">
						<div class="row">
							<c:forEach items="${bestsellerPageTwo}" var="bestseller" varStatus="loop">
								<c:if test="${loop.index == 0}">
									<div class="col-xs-2" style="margin-left: 17%;">
								</c:if>
								<c:if test="${loop.index != 0}">
									<div class="col-xs-2">
								</c:if>
								<a href="items/details/${bestseller.food.id}" title="View details"><i class="fa fa-angle-double-down"></i>
									<img src="items/image/${bestseller.food.id}" alt="Slide 1" height="148" width="170">
								</a>
								<label>${bestseller.food.name}</label>
							</div>
							</c:forEach>																		
						</div>
					</div>
				</c:if>
				<c:if test="${not empty bestsellerPageThree}">
					<div class="item" style="margin-bottom: 2%;">
						<div class="row">
							<c:forEach items="${bestsellerPageThree}" var="bestseller" varStatus="loop">
								<c:if test="${loop.index == 0}">
									<div class="col-xs-2" style="margin-left: 17%;">
								</c:if>
								<c:if test="${loop.index != 0}">
									<div class="col-xs-2">
								</c:if>
								<a href="items/details/${bestseller.food.id}" title="View details"><i class="fa fa-angle-double-down"></i>
									<img src="items/image/${bestseller.food.id}" alt="Slide 1" height="148" width="170">
								</a>
								<label>${bestseller.food.name}</label>
							</div>
							</c:forEach>																		
						</div>
					</div>
				</c:if>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only"><spring:message code="carousel.previous"/></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only"><spring:message code="carousel.next"/></span>
			</a>
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
</script>
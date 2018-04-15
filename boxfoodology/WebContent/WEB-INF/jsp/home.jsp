<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="home">
	<div class="section-container">
	<jsp:include page="home_picture.jsp"/>
		
		<section id="about" class="section-blue">
			<div class="moving-text">
				<p><i>Welcome to the best place in Dubai where you can order food. <a href="signup">Sign up</a> it's free, or <a href="login"><spring:message code="button.login"/></a></i></p>
			</div>		
			<div class="container text-center" style="padding-top: 0px;">
				<table style="width:50%" align="center">
				<tr>
					<td style="padding-right: 20px;"><a href="items/1"><i class="fa fa-angle-double-down"></i>
							<img src="images/cat1.jpg" title="Select Italian cuisine" height="250" width="375" />
						</a>
					</td>
					<td style="padding-right: 20px;"><a href="items/2"><i class="fa fa-angle-double-down"></i>
							<img src="images/cat2.jpg" title="Select Indian cuisine" height="250" width="375"/>
						</a></td>
					<td><a href="items/3"><i class="fa fa-angle-double-down"></i>
							<img src="images/cat3.jpg" title="Select meals for two" height="250" width="375"/>
						</a></td>				
				</tr>
				<tr>
					<td style="padding-top: 40px; padding-right: 20px;"><a href="items/4"><i class="fa fa-angle-double-down"></i>
							<img src="images/cat6.jpg" title="Ramadan food" height="250" width="375"/>
						</a></td>
					<td style="padding-top: 40px; padding-right: 20px;"><a href="items/5"><i class="fa fa-angle-double-down"></i>
							<img src="images/cat8.jpg" title="Select vegetarian" height="250" width="375"/>
						</a></td>
				</tr>
				</table>
			</div>
		</section>
		<div id="myCarousel" class="carousel slide" data-ride="carousel"> <!-- data-interval="false" -->
			<h3 align="center"><i><spring:message code="carousel.bestsellers"/></i></h3>
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" align="center">
				<div class="item active" style="margin-bottom: 2%;">
					<div class="row">
						<div class="col-xs-2" style="margin-left: 17%;">
							<a href="items/1"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat1.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>
						<div class="col-xs-2">
							<a href="items/2"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat2.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>
						<div class="col-xs-2">
							<a href="items/3"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat3.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>	
						<div class="col-xs-2">
							<a href="items/11"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat5.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>																	
					</div>
				</div>
				<div class="item" style="margin-bottom: 2%;">
					<div class="row">
						<div class="col-xs-2" style="margin-left: 17%;">
							<a href="items/8"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat4.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>
						<div class="col-xs-2">
							<a href="items/11"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat5.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>
						<div class="col-xs-2">
							<a href="items/4"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat6.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>
						<div class="col-xs-2">
							<a href="items/1"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat1.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>																		
					</div>
				</div>
				<div class="item" style="margin-bottom: 2%;">
					<div class="row">
						<div class="col-xs-2" style="margin-left: 17%;">
							<a href="policies/items"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat7.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>
						<div class="col-xs-2">
							<a href="policies/items"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat8.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>
						<div class="col-xs-2">
							<a href="policies/items"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat4.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>
						<div class="col-xs-2">
							<a href="policies/items"><i class="fa fa-angle-double-down"></i>
								<img src="images/cat5.jpg" alt="Slide 1" height="148" width="170">
							</a>
						</div>																		
					</div>
				</div>
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
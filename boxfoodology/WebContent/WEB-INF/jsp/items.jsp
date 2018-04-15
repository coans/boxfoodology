<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="home">
	<div class="section-container">
		<jsp:include page="home_picture.jsp"/>		
		<section id="about" class="section-blue">
			<div class="moving-text">
				<h3 style="width:100%; font-family:georgia;" align="center"><i>List of <b>${title}</b> food</i></h3>
			</div>
			<div class="container text-center" style="padding-top: 0px;">
				<table style="width:50%; margin-left: 20px;" align="center">
					<c:forEach items="${foods}" var="oneRow">
						<tr>
							<c:forEach items="${oneRow}" var="food">
								<td style="padding-right: 40px;"><a href="items/details/${food.id}"><img src="items/image/${food.id}" alt="??image??" title="View details" height="212" width="243"/></a></td>
							</c:forEach>	
						</tr>
						<tr>
							<c:forEach items="${oneRow}" var="food">
								<td style="padding-right: 40px;" align="center"><h2>${food.name}</h2></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${oneRow}" var="food">
								<td style="padding-right: 40px;" align="center"><p align="left">${food.description}</p></td>
							</c:forEach>
						</tr>						
						<tr>
							<c:forEach items="${oneRow}" var="food">
								<td style="padding-right: 40px;" style="padding-right: 40px;" align="center">
									<div class="row">
										<div class="col-sm-6" align="left"><label>${food.price} AED</label></div>
										<div class="col-sm-6" align="right"><a href="my/orders/add/${food.id}" class="btn btn-primary btn-lg">Add</a></div>
									</div>
								</td>
							</c:forEach>
						</tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</c:forEach>							
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
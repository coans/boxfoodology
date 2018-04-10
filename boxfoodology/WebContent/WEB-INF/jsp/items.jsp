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
			<h3 style="width:100%" align="center"><i>List of <b>${title}</b> food</i></h3>
			<div class="container text-center" style="padding-top: 0px;">
				<table style="width:50%; margin-left: 20px;" align="center">
						<tr>
							<c:forEach items="${foods}" var="food">
								<td style="padding-right: 40px;"><a href="foods/detail/${food.id}"><img src="foods/image/${food.id}" alt="??image??" title="View details" height="212" width="243"/></a></td>
							</c:forEach>	
						</tr>
						<tr>
							<c:forEach items="${foods}" var="food">
								<td align="center"><label>${food.name}</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${foods}" var="food">
								<td style="padding-right: 40px;" align="center"><label>${food.price} AED</label></td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${foods}" var="food">
								<td align="center"><a href="foods/add/${food.id}" class="btn btn-primary btn-lg">Add</a></td>
							</c:forEach>
						</tr>
<!--				<tr>
						<td style="padding-right: 40px;">
							<a href="policies/details"><img src="images/sl1.jpg" alt="item1" title="View details"/></a></td>
						<td style="padding-right: 40px;"><img src="images/sl2.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl1.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl2.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl1.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl2.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl1.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl2.jpg" alt="item1"/></td>
					</tr>
					<tr>
						<td style="padding-right: 40px;" align="center"><label>Sarma</label></td>
						<td style="padding-right: 40px;" align="center"><label>Pljeska</label></td>
						<td style="padding-right: 40px;" align="center"><label>Burek</label></td>
						<td style="padding-right: 40px;" align="center"><label>Becka</label></td>
						<td style="padding-right: 40px;" align="center"><label>Sarma</label></td>
						<td style="padding-right: 40px;" align="center"><label>Pljeska</label></td>
						<td style="padding-right: 40px;" align="center"><label>Burek</label></td>
						<td style="padding-right: 40px;" align="center"><label>Becka</label></td>					
					</tr>
					<tr>
						<td style="padding-right: 40px;" align="center"><label>150 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>120 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>135 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>200 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>150 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>120 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>135 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>200 RSD</label></td>					
					</tr>
					<tr>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>					
					</tr>	
					
					<tr>
						<td style="padding-right: 40px;"><img src="images/sl1.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl2.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl1.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl2.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl1.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl2.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl1.jpg" alt="item1"/></td>
						<td style="padding-right: 40px;"><img src="images/sl2.jpg" alt="item1"/></td>
					</tr>	
					<tr>
						<td style="padding-right: 40px;" align="center"><label>Sarma</label></td>
						<td style="padding-right: 40px;" align="center"><label>Pljeska</label></td>
						<td style="padding-right: 40px;" align="center"><label>Burek</label></td>
						<td style="padding-right: 40px;" align="center"><label>Becka</label></td>
						<td style="padding-right: 40px;" align="center"><label>Sarma</label></td>
						<td style="padding-right: 40px;" align="center"><label>Pljeska</label></td>
						<td style="padding-right: 40px;" align="center"><label>Burek</label></td>
						<td style="padding-right: 40px;" align="center"><label>Becka</label></td>					
					</tr>
					<tr>
						<td style="padding-right: 40px;" align="center"><label>150 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>120 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>135 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>200 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>150 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>120 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>135 RSD</label></td>
						<td style="padding-right: 40px;" align="center"><label>200 RSD</label></td>					
					</tr>
					<tr>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>
						<td style="padding-right: 40px;padding-bottom: 20px;" align="center"><a href="policies/details" class="btn btn-primary btn-lg">Details</a></td>					
					</tr>	-->									
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
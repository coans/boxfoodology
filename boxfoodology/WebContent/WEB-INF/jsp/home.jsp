<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="home">
	<div class="section-container">
		<section class="section-home-background">
			<div class="container text-center">
				<h1>
					<span class="h1grey">Welcome</span>
					<span class="h1grey">to</span>
					<br/>
					<span class="h1brown">BoxFoodology</span>
				</h1>
				<c:choose>
					<c:when test="${not empty user}">
						<div>
							<a href="my/posts" class="btn btn-primary btn-lg">Add post</a>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<a href="signup" class="btn btn-primary btn-lg">Sign up it's free!</a>
						</div>
						<div>
							<a href="login" class="orlogin">or log in</a>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="btn-down">
					<a href="#info"><i class="fa fa-angle-double-down"></i>
						<img src="images/scroll.png" onmouseover="this.src='images/scroll-hover.png';" onmouseout="this.src='images/scroll.png';" />
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
		<section id="about" class="section-white">
			<div class="container text-center">
				<div class="row">
	                <div class="col-md-6 col-md-offset-3">
						<p>This is a public wall. You can share your content with others.</p>
						<br/>
						<a id="get-started" href="my/posts" class="btn btn-primary btn-lg">Get started</a>
	                </div>
	            </div>
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
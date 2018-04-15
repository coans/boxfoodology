<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<section class="section-home-background">
	<div class="container text-center">
		<c:choose>
			<c:when test="${not empty user}">
				<div>
					<!-- <a href="my/posts" class="btn btn-primary btn-lg">Add post</a> -->
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
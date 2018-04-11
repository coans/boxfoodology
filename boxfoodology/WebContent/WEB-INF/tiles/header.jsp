<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a href="" class="navbar-brand">BoxFoodology</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.mains"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="my/profile"><spring:message code="submenu.mains.chicken"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.mains.beef"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.mains.lamb"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.mains.fish"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.mains.vegetarian"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.mains.meals.for.one"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.mains.meals.for.two"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.mains.family.meals"/></a></li>
					</ul>
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.ranges"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="my/profile"><spring:message code="submenu.ranges.thai"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.ranges.italian"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.ranges.maroccan"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.ranges.french"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.ranges.british"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.ranges.korean"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.ranges.mexican"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.ranges.chinese"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.ranges.japanese"/></a></li>
					</ul>				
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.soups"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="my/profile"><spring:message code="submenu.soups.carrot"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.soups.chicken"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.soups.lentil"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.soups.green"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.soups.potato"/></a></li>
					</ul>
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.sides"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="my/profile"><spring:message code="submenu.sides.mashed.potato"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.sides.cheesy.potato"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.sides.roasted.carrot.broccoli"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.sides.baked.parmesan.zuccini"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.sides.roasted.vegetables"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.sides.baked.parmesan.mashrooms"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.sides.garlic.roasted.carrots"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.sides.slow.cooked.creamed.corn"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.sides.garlic.parmesan.roasted.potatoes"/></a></li>
					</ul>				
				</li>
				<li>
				<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.special.diets"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="my/profile"><spring:message code="submenu.special.diets.vegetarian"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.special.diets.vegan"/></a></li>
					</ul>
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.special.events"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="my/profile"><spring:message code="submenu.special.events.ramadan"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.special.events.easter"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.special.events.christmas"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.special.events.provate.events"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.special.events.catering"/></a></li>
					</ul>
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.about.us"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="my/profile"><spring:message code="submenu.about.our.story"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.about.our.values"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.about.our.kitchen"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.about.meet.chef"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.about.careers"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.about.contact"/></a></li>
						<li><a href="my/profile"><spring:message code="submenu.about.find.us"/></a></li>
					</ul>	
				</li>	
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<li>
						<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.admin"/><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="foods"><spring:message code="food.menu"/></a></li>
						</ul>
					</li>
				</sec:authorize>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="my/orders"><spring:message code="button.my.orders"/></a></li>
				<c:choose>
					<c:when test="${not empty user}">
						<li class="dropdown"><a class="dropdown-toggle"	data-toggle="dropdown" href="#">
							${user.firstName} ${user.lastName}
							<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="my/profile">Edit Profile</a></li>
								<li><a href="<c:url value='j_spring_security_logout' />">Logout</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="login"><spring:message code="button.login"/></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>
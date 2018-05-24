<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
						<c:forEach items="${menu_mains}" var="main">
							<li><a href="items/${main.id}">${main.name}</a></li>
						</c:forEach>
					</ul>
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.ranges"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:forEach items="${menu_ranges}" var="range">
							<li><a href="items/${range.id}">${range.name}</a></li>
						</c:forEach>
					</ul>				
				</li>
<%-- 				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.soups"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="items/28"><spring:message code="submenu.soups.carrot"/></a></li>
						<li><a href="items/29"><spring:message code="submenu.soups.chicken"/></a></li>
						<li><a href="items/30"><spring:message code="submenu.soups.lentil"/></a></li>
						<li><a href="items/31"><spring:message code="submenu.soups.green"/></a></li>
						<li><a href="items/32"><spring:message code="submenu.soups.potato"/></a></li>
					</ul>
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.sides"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="items/33"><spring:message code="submenu.sides.mashed.potato"/></a></li>
						<li><a href="items/34"><spring:message code="submenu.sides.cheesy.potato"/></a></li>
						<li><a href="items/35"><spring:message code="submenu.sides.roasted.carrot.broccoli"/></a></li>
						<li><a href="items/36"><spring:message code="submenu.sides.baked.parmesan.zuccini"/></a></li>
						<li><a href="items/37"><spring:message code="submenu.sides.roasted.vegetables"/></a></li>
						<li><a href="items/38"><spring:message code="submenu.sides.baked.parmesan.mashrooms"/></a></li>
						<li><a href="items/39"><spring:message code="submenu.sides.garlic.roasted.carrots"/></a></li>
						<li><a href="items/40"><spring:message code="submenu.sides.slow.cooked.creamed.corn"/></a></li>
						<li><a href="items/41"><spring:message code="submenu.sides.garlic.parmesan.roasted.potatoes"/></a></li>
					</ul>				
				</li> --%>
				<li>
				<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.special.diets"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:forEach items="${menu_special_diets}" var="diet">
							<li><a href="items/${diet.id}">${diet.name}</a></li>
						</c:forEach>
					</ul>
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.special.events"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:forEach items="${menu_special_events}" var="event">
							<li><a href="items/${event.id}">${event.name}</a></li>
						</c:forEach>
					</ul>
				</li>
				<li>
					<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.about.us"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="our-story"><spring:message code="submenu.about.our.story"/></a></li>
						<li><a href="meet-the-chef"><spring:message code="submenu.about.meet.chef"/></a></li>
						<li><a href="careers/new"><spring:message code="submenu.about.careers"/></a></li>
						<li><a href="messages/new"><spring:message code="submenu.about.contact"/></a></li>
						<li><a href="location"><spring:message code="submenu.about.find.us"/></a></li>
						<li><a href="our-story/faq">FAQ</a></li>
					</ul>	
				</li>	
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
					<li>
						<a class="dropdown-toggle"	data-toggle="dropdown" href="#mains"><spring:message code="menu.admin"/><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="categories"><spring:message code="category.menu.name"/></a></li>
							<li><a href="foods"><spring:message code="food.menu"/></a></li>
							<li><a href="messages">Messages</a></li>
							<li><a href="bestsellers">Bestsellers</a></li>
							<li><a href="careers"><spring:message code="submenu.about.careers"/></a></li>
						</ul>
					</li>
				</sec:authorize>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<form:form class="form-inline" modelAttribute="search" method="POST" action="items/search" style="padding-top: 7px;">
						<form:input style="width:150px;" path="name" class="form-control mr-sm-2" type="search" placeholder="Search"/>
					</form:form>
				</li>
				<li><a href="my/orders"><spring:message code="button.my.orders"/><span class="badge">${numberOfOrderedItems}</span></a></li>
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
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<footer>
	<div class="row">
		<div class="col-xs-2" align="left">
			<ul>
				<li><h4><i>ABOUT</i></h4></li>
				<li><a href="location/empty">Our story</a></li><br/>
				<li><a href="location/empty">Careers</a></li><br/>
			</ul>
		</div>
		<div class="col-xs-2" align="left">
			<ul>
				<li><h4><i>CONTACT</i></h4></li>
				<li><a href="location">Where to find us</a></li>
				<li><a href="messages/new"><spring:message code="submenu.about.contact"/></a></li>
			</ul>
		</div>
		<div class="col-xs-2">
			<ul>
				<li><h4><i>FOLLOW US</i></h4></li>
				<li><a href="www.facebook.com"><img alt="Facebook" src="images/facebook.png" title="Facebook"></a></li>
				<li><a href="www.instagram.com"><img alt="Instagram" src="images/instagram.png" title="Instagram"></a></li>
				<li><a href="www.twitter.com"><img alt="Twitter" src="images/twitter.png" title="Twitter"></a></li>
			</ul>
		</div>	
		<div class="col-xs-4" align="right">
			<ul>
				<li><a href="#home"><img alt="BoxFoodology" src="images/logo.jpeg" height="95" width="120"></a></li>
			</ul>
		</div>				
	</div>
	<div class="container">
		<ul>
			<li><a href="policies/terms">Terms</a></li>
			<li>|</li>
			<li><a href="policies/privacy">Privacy Policy</a></li><br/>
<%-- 			<li>Currently v${verison}</li> --%>
			<p><font size="2">&copy; 2018 BoxFoodology</font></p>
			<p style="margin-top: -1.5%;"><font size="1">Web site by IT-OROZ</font></p>
		</ul>
	</div>
</footer>

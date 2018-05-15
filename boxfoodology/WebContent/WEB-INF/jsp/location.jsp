<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="section-container">
	<section class="section-blue">
		<div class="container">
			<div class="row">
				<div class="col-md-4" id="map" style="width:50%;height:400px;">My map will go here</div>
				<div class="col-md-2"></div>
				<div class="col-md-4" align="center">
					<p>
						<h4><b>Head office</b></h4>
						<span>P.O. Box 127512 Dubai U.A.E</span><br>
						<span>Prime Tower, Office 1402</span><br>
						<span>Al Abraj St., Business Bay</span><br>
					</p><br/>
					<p>
						<h5><b>Telephone: </b>+0123456789</h5>
					</p>
					<p>
						<h5><b>Email: </b>contact@boxfoodology.com</h5>
					</p><br/>			
					<p>
						<form:form modelAttribute="message" method="POST" action="${action}">
							<form:hidden path="id" />
							<div class="form-group">
								<form:label path="title" class="required">Title</form:label>
								<form:input path="title" type="text" class="form-control" />
								<div class="has-error">
									<form:errors path="title" cssClass="help-block" element="label"/>
								</div>
							</div>
							<div class="form-group">
								<form:label path="content" class="required">Message</form:label>
								<form:textarea path="content" class="form-control" />
								<div class="has-error">
									<form:errors path="content" cssClass="help-block" element="label"/>
								</div>
							</div>
							<p>&nbsp;</p>					
							<button type="submit" class="btn btn btn-primary"><spring:message code="button.save"/></button>
							<a class="btn btn-success" href="#"><spring:message code="button.cancel"/></a>
						</form:form>
					</p>
				</div>
			</div>
		</div>
	</section>
</div>
<script type="text/javascript">
	function myMap() {
	    var mapOptions = {
	        center: new google.maps.LatLng(25.204041, 55.257237),
	        zoom: 10,
	        mapTypeId: google.maps.MapTypeId.ROADMAP
	    };
		var map = new google.maps.Map(document.getElementById("map"), mapOptions);
	}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdh8tXtJLdO5ocJvnp5CvDzs5OaQ4S7Ak&callback=myMap"></script> 


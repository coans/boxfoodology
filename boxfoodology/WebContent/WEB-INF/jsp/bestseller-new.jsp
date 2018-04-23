<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-xs-5">
			<h3>${title}</h3>
			<form:form modelAttribute="bestsellermodel" method="POST" action="${action}">
				<form:hidden path="id" />
				<div class="form-group">
					<form:label path="food.id" class="required"><spring:message code="food.name"/></form:label>
					<form:select path="food.id" class="form-control"  items="${foods}" itemLabel="name" itemValue="id"/>
					<div class="has-error">
						<form:errors path="food.id" cssClass="help-block" element="label"/>
					</div>
				</div>
				<p>&nbsp;</p>					
				<button type="submit" class="btn btn btn-primary"><spring:message code="button.save"/></button>
				<a class="btn btn-success" href="foods"><spring:message code="button.cancel"/></a>
			</form:form>
		</div>
	</div>
</div>

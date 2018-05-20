<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-xs-5">
			<h3>${title}</h3>
			<form:form modelAttribute="foodmodel" method="POST" action="${action}" enctype="multipart/form-data">
				<form:hidden path="id" />
				<div class="form-group">
					<form:label path="name" class="required"><spring:message code="food.name"/></form:label>
					<form:input path="name" type="text" class="form-control" />
					<div class="has-error">
						<form:errors path="name" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="description" class="required"><spring:message code="food.description"/></form:label>
					<form:textarea path="description" class="form-control" />
					<div class="has-error">
						<form:errors path="description" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="category.id" class="required"><spring:message code="food.category"/></form:label>
					<form:select path="category.id" class="form-control"  items="${categories}" itemLabel="name" itemValue="id"/>
					<div class="has-error">
						<form:errors path="category.id" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="price" class="required"><spring:message code="food.price"/></form:label>
					<form:input path="price" type="text" class="form-control" />
					<div class="has-error">
						<form:errors path="price" cssClass="help-block" element="label"/>
					</div>
				</div>					
				<div class="form-group">
					<form:label path="imageFile" class="required"><spring:message code="food.image"/></form:label>
					<form:input type="file" path="imageFile"/>
					<div class="has-error">
						<form:errors path="imageFile" cssClass="help-block" element="label"/>
					</div>
				</div>
				<p>&nbsp;</p>					
				<button type="submit" class="btn btn btn-success"><spring:message code="button.save"/></button>
				<a class="btn btn-primary" href="foods"><spring:message code="button.cancel"/></a>
			</form:form>
			<span class="form-group"><label class="required"/><font size="2"><spring:message code="page.required.fields"/></font></span>
		</div>
	</div>
</div>

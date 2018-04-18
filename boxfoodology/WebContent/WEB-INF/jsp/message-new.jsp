<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-xs-5">
			<h3>${title}</h3>
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
		</div>
	</div>
</div>

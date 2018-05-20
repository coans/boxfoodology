<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-xs-5">
			<h3>${title}</h3>
			<form:form modelAttribute="categorymodel" method="POST" action="${action}" enctype="multipart/form-data">
				<form:hidden path="id" />
				<div class="form-group">
					<form:label path="name" class="required"><spring:message code="category.name"/></form:label>
					<form:input path="name" type="text" class="form-control" />
					<div class="has-error">
						<form:errors path="name" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="menu" class="required"><spring:message code="category.menu"/></form:label>
					<form:select path="menu" class="form-control"  items="${main_menu}"/>
					<div class="has-error">
						<form:errors path="menu" cssClass="help-block" element="label"/>
					</div>
				</div>	
				<div class="form-group">
					<form:label path="showOnHome" style="padding-right: 20px;"><spring:message code="category.show.on.home" /></form:label>
					<form:checkbox path="showOnHome"/>
					<div class="has-error">
						<form:errors path="showOnHome" cssClass="help-block" element="label"/>
					</div>
				</div>								
				<div class="form-group">
					<form:label path="imageFile"><spring:message code="category.image"/></form:label>
					<form:input type="file" path="imageFile"/>
					<div class="has-error">
						<form:errors path="imageFile" cssClass="help-block" element="label"/>
					</div>
				</div>
				<p>&nbsp;</p>					
				<button type="submit" class="btn btn btn-success"><spring:message code="button.save"/></button>
				<a class="btn btn-primary" href="categories"><spring:message code="button.cancel"/></a>
			</form:form>
			<span class="form-group"><label class="required"/><font size="2"><spring:message code="page.required.fields"/></font></span>
		</div>
	</div>
</div>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-xs-5">
			<h3>${title}</h3>
			<form:form modelAttribute="careersmodel" method="POST" action="${action}" enctype="multipart/form-data">
				<form:hidden path="id" />
				<div class="form-group">
					<form:label path="firstName" class="required">First name</form:label>
					<form:input path="firstName" type="text" class="form-control" />
					<div class="has-error">
						<form:errors path="firstName" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="lastName" class="required">Last name</form:label>
					<form:input path="lastName" type="text" class="form-control" />
					<div class="has-error">
						<form:errors path="lastName" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="email" class="required">Email</form:label>
					<form:input path="email" type="text" class="form-control" />
					<div class="has-error">
						<form:errors path="email" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="phone" class="required">Contact phone</form:label>
					<form:input path="phone" type="text" class="form-control" />
					<div class="has-error">
						<form:errors path="phone" cssClass="help-block" element="label"/>
					</div>
				</div>						
				<div class="form-group">
					<form:label path="position" class="required">Position</form:label>
					<form:select path="position" class="form-control"  items="${careers_positions}"/>
					<div class="has-error">
						<form:errors path="position" cssClass="help-block" element="label"/>
					</div>
				</div>					
				<div class="form-group">
					<form:label path="cvFile" class="required">CV(as pdf)</form:label>
					<form:input type="file" path="cvFile"/>
					<div class="has-error">
						<form:errors path="cvFile" cssClass="help-block" element="label"/>
					</div>
				</div>
				<p>&nbsp;</p>					
				<button type="submit" class="btn btn btn-primary" onclick="showmessage()"><spring:message code="button.save"/></button>
				<a class="btn btn-success" href="#"><spring:message code="button.cancel"/></a>
			</form:form>
		</div>
	</div>
</div>
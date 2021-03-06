<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-xs-5">
			<h3><spring:message code="signup.page.header"/></h3>
			<form:form modelAttribute="usermodel" method="POST" action="${action}">
				<div class="form-group">
					<form:label path="email" class="required"><spring:message code="signup.page.email"/></form:label>
					<form:input type="text" path="email" class="form-control"/>
					<div class="has-error">
						<form:errors path="email" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="password" class="required"><spring:message code="signup.page.password"/></form:label>
					<form:input type="password" path="password" class="form-control"/>
					<div class="text-muted"><spring:message code="signup.page.password.info"/></div>
					<div class="has-error">
						<form:errors path="password" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="firstName" class="required"><spring:message code="signup.page.firstname"/></form:label>
					<form:input type="text" path="firstName" class="form-control"/>
					<div class="has-error">
						<form:errors path="firstName" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="lastName" class="required"><spring:message code="signup.page.lastname"/></form:label>
					<form:input type="text" path="lastName" class="form-control"/>
					<div class="has-error">
						<form:errors path="lastName" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					<form:label path="address" class="required"><spring:message code="signup.page.address"/></form:label>
					<form:textarea type="text" path="address" class="form-control" placeholder="This address is used for delivery, please, enter as precise as possible"/>
					<div class="has-error">
						<form:errors path="address" cssClass="help-block" element="label"/>
					</div>
				</div>	
				<div class="form-group">
					<form:label path="phone" class="required"><spring:message code="signup.page.phone"/></form:label>
					<form:input type="text" path="phone" class="form-control"/>
					<div class="has-error">
						<form:errors path="phone" cssClass="help-block" element="label"/>
					</div>
				</div>							
				<div class="form-group">
					<form:label path="gender" class="required"><spring:message code="signup.page.gender"/></form:label><br/>
					<label class="radio-inline">
						<form:radiobutton value="Female" path="gender"/>
						<spring:message code="signup.page.female"/>
					</label>
					<label class="radio-inline">
						<form:radiobutton value="Male" path="gender"/>
						<spring:message code="signup.page.male"/>
					</label>
					<div class="has-error">
						<form:errors path="gender" cssClass="help-block" element="label"/>
					</div>
				</div>
				<div class="form-group">
					By clicking Sign Up, you agree to our <a href="policies/terms" target="_blank">Terms</a> and <a href="policies/privacy" target="_blank">Privacy Policy</a>.
				</div>
				<button type="submit" class="btn btn-success"><spring:message code="button.signup"/></button>
			</form:form>
			<span class="form-group"><label class="required"/><font size="2"><spring:message code="page.required.fields"/></font></span>
		</div>
	</div>
</div>
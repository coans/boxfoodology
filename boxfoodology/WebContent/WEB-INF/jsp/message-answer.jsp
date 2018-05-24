<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="section-container">
	<section class="section-blue">
		<div class="container">
			<div class="row">
				<div class="col-xs-5">
					<h3><b>Answer to user[${user}] message</b></h3>
					<p>${message.content}</p>
					<form:form modelAttribute="answer" method="POST" action="${action}">
						<form:hidden path="id" />
						<div class="form-group">
							<%-- <form:label path="title" class="required">Title</form:label> --%>
							<form:input path="title" type="text" class="form-control" placeholder="Title *"/>
							<div class="has-error">
								<form:errors path="title" cssClass="help-block" element="label"/>
							</div>
						</div>
						<div class="form-group">
							<%-- <form:label path="content" class="required">Message</form:label> --%>
							<form:textarea path="content" class="form-control" placeholder="Answer *"/>
							<div class="has-error">
								<form:errors path="content" cssClass="help-block" element="label"/>
							</div>
						</div>
						<p>&nbsp;</p>					
						<button type="submit" class="btn btn btn-success"><spring:message code="button.send"/></button>
						<a class="btn btn-primary" href="messages"><spring:message code="button.cancel"/></a>
					</form:form>
					<span class="form-group"><label class="required"/><font size="2"><spring:message code="page.required.fields"/></font></span>
				</div>
			</div>
		</div>
	</section>
</div>

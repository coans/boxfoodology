<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<p><a href="messages/new" class="btn btn-info">${title}</a></p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center" scope="col">User</th>
				<th class="text-center" scope="col">Title</th>
				<th class="text-center" scope="col">Content</th>
				<th class="text-center" scope="col">Date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${messages}" var="message">	
				<tr>
					<td align="center">${message.user.firstName} ${message.user.lastName}</td>
					<td align="center">${message.title}</td>
					<td align="center">${message.content}</td>
					<td align="center">${message.created}</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
</div>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
	<h4 align="center"><b>List of candidates</b></h4>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center" scope="col">#</th>
				<th class="text-center" scope="col">First name</th>
				<th class="text-center" scope="col">Last name</th>
				<th class="text-center" scope="col">Email</th>
				<th class="text-center" scope="col">Phone</th>
				<th class="text-center" scope="col">Position</th>
				<th class="text-center" scope="col">Date</th>
				<th class="text-center" scope="col">CV</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${careers}" var="career" varStatus="loop">	
				<tr>
					<td align="center">${loop.count}</td>
					<td align="center">${career.firstName}</td>
					<td align="center">${career.lastName}</td>
					<td align="center">${career.email}</td>
					<td align="center">${career.phone}</td>
					<td align="center">${career.position}</td>
					<td align="center"><fmt:formatDate pattern = "yyyy-MM-dd HH:MM:ss" value = "${career.created}" /></td>
					<td align="center">
						<a href="careers/cv/${career.id}" title="View CV"><i class="glyphicon glyphicon-list-alt"></i></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
</div>

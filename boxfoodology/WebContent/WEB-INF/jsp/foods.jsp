<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<p><a href="foods/new" class="btn btn-info"><spring:message code="food.header"/></a></p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Description</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${foods}" var="food">	
				<tr>
					<td>${food.name}</td>
					<td>${food.price}</td>
					<td>${food.category.title}</td>
					<td>${food.description}</td>
					<td>
						<a href="foods/edit/${food.id}" title="Edit"><i class="glyphicon glyphicon-pencil"></i></a>
						&nbsp;
						<a href="foods/delete/${food.id}" title="Delete"><i class="glyphicon glyphicon-remove"></i></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
</div>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<p><a href="foods/new" class="btn btn-info"><spring:message code="food.header"/></a></p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center" scope="col">Name</th>
				<th class="text-center" scope="col">Price</th>
				<th class="text-center" scope="col">Category</th>
				<th class="text-center" scope="col">Description</th>
				<th class="text-center" xscope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${foods}" var="food">	
				<tr>
					<td align="center">${food.name}</td>
					<td align="center">${food.price}</td>
					<td align="center">${food.category.title}</td>
					<td align="center">${food.description}</td>
					<td align="center">
						<a href="foods/edit/${food.id}" title="Edit"><i class="glyphicon glyphicon-pencil"></i></a>
						&nbsp;
						<a href="foods/delete/${food.id}" title="Delete"><i class="glyphicon glyphicon-remove"></i></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
</div>

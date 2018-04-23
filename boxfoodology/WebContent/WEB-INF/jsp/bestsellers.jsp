<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<p><a href="bestsellers/new" class="btn btn-info">New food to bestseller</a></p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center" scope="col">ID</th>
				<th class="text-center" scope="col">Food</th>
				<th class="text-center" xscope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bestsellers}" var="bestseller">	
				<tr>
					<td align="center">${bestseller.id}</td>
					<td align="center">${bestseller.food.name}</td>
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

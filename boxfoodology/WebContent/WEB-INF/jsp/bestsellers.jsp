<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<c:if test="${not full}">
		<p><a href="bestsellers/new" class="btn btn-info">New food to bestseller</a></p>
	</c:if>
	<c:if test="${full}">
	 	<div class="alert alert-info alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<div align="center"><strong>Bestseller is full. First delete old item(s) and then add new.</strong></div>
	    </div>		
	</c:if>	
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center" scope="col">ID</th>
				<th class="text-center" scope="col">Food</th>
				<th class="text-center" xscope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bestsellers}" var="bestseller" varStatus="loop">	
				<tr>
					<td align="center">${loop.count}</td>
					<td align="center">${bestseller.food.name}</td>
					<td align="center">
					<%-- 	<a href="bestsellers/edit/${food.id}" title="Edit"><i class="glyphicon glyphicon-pencil"></i></a>
						&nbsp; --%>
						<a href="bestsellers/delete/${bestseller.id}" title="Delete"><i class="glyphicon glyphicon-remove"></i></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
</div>

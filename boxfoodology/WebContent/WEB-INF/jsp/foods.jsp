<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<p><a href="foods/new" class="btn btn-info"><spring:message code="food.header"/></a></p>
	<label>Filter by category</label>
	<select id="category" onchange="filterFoodByCategory()">
	    <c:forEach items="${categories}" var="category">
            <option value="${category.id}" ${category.id == selectedCategoryId ? 'selected' : ''}>${category.title}</option>
	    </c:forEach>
	</select>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center" scope="col">#</th>
				<th class="text-center" scope="col">Name</th>
				<th class="text-center" scope="col">Price</th>
				<th class="text-center" scope="col">Category</th>
				<th class="text-center" scope="col">Description</th>
				<th class="text-center" xscope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${foods}" var="food" varStatus="loop">	
				<tr>
					<td align="center">${loop.count}</td>
					<td align="center">${food.name}</td>
					<td align="center">${food.price}</td>
					<td align="center">${food.category.title}</td>
					<td align="center">${food.description}</td>
					<td align="center">
						<a href="foods/edit/${food.id}" title="Edit"><i class="glyphicon glyphicon-pencil"></i></a>
						&nbsp;
						<a href="#" data-href="foods/delete/${food.id}" data-toggle="modal" data-target="#confirmDeleteId" title="Delete"><i class="glyphicon glyphicon-remove"></i></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
    </table>
</div>
<div class="modal fade" id="confirmDeleteId" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" align="center"><b>Confirm Delete</b></div>
            <div class="modal-body" align="center">Are you sure you want to delete this item?</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger btn-ok">Delete</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	$('#confirmDeleteId').on('show.bs.modal', function(e) {
	    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
	});
	
	function filterFoodByCategory() {
		var baseUrl = "${baseurl}";
		location.href = baseUrl + "foods?categoryId=" + $("#category").val();
	}
</script>

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
				<th class="text-center" scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bestsellers}" var="bestseller" varStatus="loop">	
				<tr>
					<td align="center">${loop.count}</td>
					<td align="center">${bestseller.food.name}</td>
					<td align="center">
						<a href="#" data-href="bestsellers/delete/${bestseller.id}" data-toggle="modal" data-target="#confirmDeleteId" title="Delete"><i class="glyphicon glyphicon-remove"></i></a>
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
</script>
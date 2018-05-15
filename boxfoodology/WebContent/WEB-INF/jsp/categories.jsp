<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
	<p><a href="categories/new" class="btn btn-info"><spring:message code="category.header"/></a></p>
 	<label>Filter by menu</label>
	<select id="menu" onchange="filterCategoryByMenu()">
	    <c:forEach items="${main_menu}" var="menu">
            <option value="${menu}" ${menu == selectedMenu ? 'selected' : ''}>${menu}</option>
	    </c:forEach>
	</select>
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center" scope="col">#</th>
				<th class="text-center" scope="col">Name</th>
				<th class="text-center" scope="col">Menu</th>
				<th class="text-center" scope="col">Show on home</th>
				<th class="text-center" scope="col">Date</th>
				<th class="text-center" scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${categories}" var="category" varStatus="loop">	
				<tr>
					<td align="center">${loop.count}</td>
					<td align="center">${category.name}</td>
					<td align="center">${category.menu}</td>
					<c:if test="${category.showOnHome}">
						<td align="center">Yes</td>
					</c:if>
					<c:if test="${ not category.showOnHome}">
						<td align="center">No</td>
					</c:if>
					<td align="center"><fmt:formatDate pattern = "yyyy-MM-dd HH:MM:ss" value = "${category.created}" /></td>
					<td align="center">
						<a href="categories/edit/${category.id}" title="Edit"><i class="glyphicon glyphicon-pencil"></i></a>
						&nbsp;
						<a href="#" data-href="categories/delete/${category.id}" data-toggle="modal" data-target="#confirmDeleteId" title="Delete"><i class="glyphicon glyphicon-remove"></i></a>
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
	
	function filterCategoryByMenu() {
		var baseUrl = "${baseurl}";
		location.href = baseUrl + "categories?menu="+ $("#menu").val();
	}
</script>

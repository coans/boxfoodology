<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
	<h4 align="center"><b>List of messages</b></h4>
	<div id="notifications"></div><!-- notif for cv upload -->
	<table class="table table-striped">
		<thead>
			<tr>
				<th class="text-center" scope="col">#</th>
				<th class="text-center" scope="col">User</th>
				<th class="text-center" scope="col">Title</th>
				<th class="text-center" scope="col">Content</th>
				<th class="text-center" scope="col">Date</th>
				<th class="text-center" scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${messages}" var="message" varStatus="loop">	
				<tr>
					<td align="center">${loop.count}</td>
					<td align="center">${message.user.firstName} ${message.user.lastName}</td>
					<td align="center">${message.title}</td>
					<td align="center">${message.content}</td>
					<td align="center"><fmt:formatDate pattern = "yyyy-MM-dd HH:MM:ss" value = "${message.created}" /></td>
					<td align="center">
						<c:if test="${not empty message.user.email}">
							<a href="messages/answer/${message.id}" title="Answer"><i class="glyphicon glyphicon-envelope"></i></a>
						</c:if>
						&nbsp;
						<a href="#" data-href="messages/delete/${message.id}" data-toggle="modal" data-target="#confirmDeleteId" title="Delete"><i class="glyphicon glyphicon-remove"></i></a>
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
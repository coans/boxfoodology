<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="home">
	<div class="section-container">
		<jsp:include page="home-picture.jsp"/>	
		<section id="about" class="section-blue">
			<div class="container">
			    <div class="col-md-4">
			        <img class="thumbnail img-responsive" src="items/image/${food.id}">
			    </div>
			    <div class="col-md-8">
			        <h3>${food.name}</h3>
			        <p>${food.description}</p> 
			        <div class="row" align="right">
				        <div class="col-md-6">
				        </div>
						<div align="right" class="col-sm-2">
							<label style="padding-right: 3%;">${food.price} AED</label>
						</div>
						<div align="right" class="col-sm-2">
							<form:select path="food.description" class="form-control" id="quantity" items="${quantity}"/>
  						</div>
  						<div align="right" class="col-sm-1">
  							<a class="btn btn-primary btn-lg" href="javascript:add(${food.id})">Add</a>
  						</div>
					</div>
					<br/>
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">About <b><i>${food.name}</i></b></a>
								</h4>
						    </div>
						    <div id="collapse1" class="panel-collapse collapse in">
								<div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						      		sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
						      		minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
						      		commodo consequat.
						      	</div>
						    </div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">How to make it</a>
								</h4>
						    </div>
						    <div id="collapse2" class="panel-collapse collapse">
								<div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						      		sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
						      		minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
						      		commodo consequat.
						      	</div>
						    </div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Nutrition</a>
								</h4>
						    </div>
						    <div id="collapse3" class="panel-collapse collapse">
								<div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						      		sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
						      		minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
						      		commodo consequat.
						      	</div>
							</div>
						</div>
					</div> 
			    </div>
			</div>
		</section>
	</div>
</div>

<script type="text/javascript">
	// default navigation	
	if(window.location.href == '<c:out value="${baseurl}"/>#about') {
		setActiveHeader("#about");
	} else {
		setActiveHeader("#home");
	}
	// animate navigation
	$('.nav').onePageNav({
	    currentClass: 'active',
	    changeHash: true,
	    easing: 'swing'
	});
	
	$(".btn-down a").click(function(e) {
		e.preventDefault();
		$('html, body').animate({
            scrollTop: $("#info").offset().top
        }, 750, function() { $(".btn-down").remove(); });
	});
	
	function add(foodId) {
		var baseUrl = "${baseurl}";
		location.href = baseUrl + "my/orders/add/" + foodId + "/" + $("#quantity").val();
	}

</script>
<!-- 
// page : pawner-index
// version : 1.3
// task : modal select type 
// edit by : khawkreab
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>pawner-index</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/new-design.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

</head>

<body id="page-top" style="overflow-y: hidden">


	<!-- Navigation -->
	<jsp:include page="navbar.jsp" />

	<section>
		<div class="container">

			<div class="box-main">
				<div class="box-sup">
					<div class="box-semi text-center">
						<h1>The 5 Step</h1>
						<h6>---- easy to pawn ----</h6>
						<br>
					</div>
					<div class="box-semi">
						<span class="time-line"></span>
						<ul>
							<li><span class="cycle">1</span> Enter item information</li>
							<li><span class="cycle">2</span> Upload picture and post
								item</li>
							<li><span class="cycle">3</span> Get offers from pawner shop</li>
							<li><span class="cycle">4</span> Walk in pawn shop</li>
							<li><span class="cycle">5</span> Deal rice again with pawn
								shop</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>

			</div>
			<div class="box-main">
				<div class="box-semi">
					<a href="pawner-post-form-gold.html">Create post gold</a> <a href="pawner-post-form-watch.html">Create post watch</a>
					<a href="pawner-post-form-electronic.html">Create post electronic</a>
				</div>
			</div>

		</div>
	</section>


</body>
</html>
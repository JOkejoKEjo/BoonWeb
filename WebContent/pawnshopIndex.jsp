<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Bounyong</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/custom-style.min.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

</head>

<body id="page-top">

	<!-- Navigation -->
	<jsp:include page="navbar.jsp" />


	<section>
		<div class="container">
			<div class="dashboard-left">

				<!-- ----------------------------------------------------------------------------  -->
				<div class="dashboard">
					<!-- ----------------------------------------------------------------------------  -->
					<a> <img class="DashboardProfileCard" src="img/profile.jpg"
						width="80px"></a>
					<!-- ----------------------------------------------------------------------------  -->
					<div class="DashboardProfileCard-userFields">
						<a>K'win</a> <br> <a>@<b>GuoChakkaphat</b></a>
					</div>
					<!-- ----------------------------------------------------------------------------  -->
				</div>
				<!-- ----------------------------------------------------------------------------  -->
				<div class="list-type">
					list
					<ul>
						<li>gold</li>
						<li>watch</li>
						<li>computer</li>
					</ul>
				</div>
				<!-- ----------------------------------------------------------------------------  -->
			</div>
			<!-- ----------------------------------------------------------------------------  -->
			<div class="tbody">hvfhkvkhv
				<c:forEach items="${listGold}" var="gold">
					<div class="card" style="width: 500px;">
						<div class="card-img">
							<img class="card-img-top" src="img/header-bg.jpg"
								alt="Card image cap">
						</div>
						<div class="card-block">
							<h4 class="card-title">${gold.goldName}</h4>
							<p class="card-text">${gold.goldBrand}</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><a
								href="proposePriceForm.do?goldId=${gold.goldId}">Propose
									Price</a></li>
						</ul>
					</div>
				</c:forEach>
			</div>
			<!-- ----------------------------------------------------------------------------  -->
			<div class="appove">approve</div>

			<!-- ----------------------------------------------------------------------------  -->


		</div>
	</section>
</body>
</html>
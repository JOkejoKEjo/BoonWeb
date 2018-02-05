<!-- 
// page : pawner-post-history
// version : 2.0
// task : connect data
// edit by : khawkreab
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>pawner-post-history</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/new-design.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<section>
		<div class="container">
			<div class="history-filter">
				<div class="d-flex">
					<div class="mr-auto p-2">history</div>
					<div class="ml-auto p-2">
						Show: <select>
							<option>finish</option>
							<option>process</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<c:forEach items="${pawnerPosts}" var="post">
			<div class="container">
				<div class="history-main">
					<div class="d-flex history-title">
						<div class="mr-auto p-2">
							<span>${post.pawnerPostDate }</span>
						</div>
						<div class="ml-auto p-2">
							<span>Delete</span>
						</div>
					</div>
					<div class="history-body">
						<span class="history-img"><img class="" src="" /></span> <span
							class="history-name">${post.pawnerPostName }</span>
						<div class="history-detail">
							<ul>
								<li>${post.pawnerPostBrand }</li>
								<li>${post.pawnerPostPure  }</li>
								<li>${post.pawnerPostWeigh }</li>
								<li>${post.pawnerPostCategory }</li>
								<li>${post.pawnerPostDescription }</li>
							</ul>
						</div>

					</div>
					<div class="line margin-lr-1"></div>
					<div class="history-show-estimate">
						<div id="showlist${post.pawnerPostId}" class="collapse">
							<c:forEach items="${estimatesList}" var="estimate">
								<c:if
									test="${estimate.pawnerPostId.pawnerPostId == post.pawnerPostId}">
							ID post ${estimate.pawnerPostId.pawnerPostId}
							
							</c:if>

							</c:forEach>
						</div>
						<div class="d-flex justify-content-center">
							<span> <a id="more" class="show" href="#"
								data-toggle="collapse"
								data-target="#showlist${post.pawnerPostId}">more</a></span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</section>


	<script type="text/javascript">
		$('div span a').click(function() {
			$(this).text(function(i, old) {
				return old == 'more' ? 'less' : 'more';
			});
		});
	</script>
</body>
</html>
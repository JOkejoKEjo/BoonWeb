<!-- 
// page : pawner-post-history
// version : 3.1
// task : pawner approve
// edit by : khawkreab
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
							<fmt:formatDate type="both" dateStyle="long" timeStyle="short"
								value="${post.pawnerPostDate }" />
						</div>
						<div class="ml-auto p-2">
							<span>Delete</span>
						</div>
					</div>
					<div class="history-body">
						<div class="row">
							<div class="col-sm-5">
								<div class="pro-img">
									<img class="img-responsive"
										src="images/uploadImage/${post.pawnerPostPicture }" />
								</div>
							</div>
							<div class="col-md-7 single-top-in">
								<div class="span_2_of_a1 simpleCart_shelfItem">
									<h3>${post.pawnerPostName }${post.pawnerPostBrand }</h3>
									<p class="in-para">Information</p>
									<div class="price_single">
										<div class="preview">
											<ul class="row">
												<li>${post.pawnerPostBrand }</li>
												<li>${post.pawnerPostPure  }</li>
												<li>${post.pawnerPostWeigh }</li>
												<li>${post.pawnerPostCategory }</li>
												<li>${post.pawnerPostDescription }</li>
											</ul>
										</div>

									</div>

									<c:if test="${post.pawnerPostStatus == 'Complete'}">
										<div class="line margin-lr-1"></div>
										<div class="history-show-estimate">
											<div id="showlist${post.pawnerPostId}" class="collapse">
												<div class="row">
													<div class="col-md-6">Pawn Shop</div>
													<div class="col-md-2">min</div>
													<div class="col-md-2">max</div>
													<div class="col-md-2">*****</div>
												</div>
												<ul>
													<c:forEach items="${estimatesList}" var="estimate">
														<c:if
															test="${estimate.pawnerPostId.pawnerPostId == post.pawnerPostId }">

															<li>
																<div class="row">
																	<div class="col-md-6">
																		${estimate.pawnshopId.pawnshopName}</div>
																	<div class="col-md-2">${estimate.estimatePriceMin}</div>
																	<div class="col-md-2">${estimate.estimatePriceMax}</div>
																	<div class="col-md-2">
																		<form action="pawner-approve.html" method="post">
																			<input type="hidden" name="estimateId"
																				value="${estimate.estimateId}"> <input
																				type="hidden" name="pawnerPostId"
																				value="${post.pawnerPostId}">
																			<button type="submit">Approve</button>
																		</form>
																	</div>
																</div>
															</li>
														</c:if>

													</c:forEach>
												</ul>
											</div>
											<div class="d-flex justify-content-center">
												<span> <a id="more" class="show" href="#"
													data-toggle="collapse"
													data-target="#showlist${post.pawnerPostId}">more</a></span>
											</div>
										</div>
									</c:if>
								</div>
							</div>
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
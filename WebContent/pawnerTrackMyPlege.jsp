<!-- 
// page : pawner-track-pledge
// version : 3.2
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
<title>pawner-track-pledge</title>

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
									<h3>${post.pawnerPostName } -${post.pawnerPostBrand }
										${post.pawnerPostTypeCamera } ${post.pawnerPostCameraLen }</h3>
									<p class="in-para">Information</p>
									<div class="price_single">
										<div class="preview">
											<ul class="row">

												<!-- Watch,Electronic -->
												<c:if test="${post.pawnerPostModel != null}">
													<li class="col-md-6">Production :
														${post.pawnerPostProduction}</li>
													<li class="col-md-6">Model : ${post.pawnerPostModel}</li>
													<li class="col-md-6">Serial : ${post.pawnerPostSerial}</li>
													<li class="col-md-6">Purchase :
														${post.pawnerPostPurchase }</li>
												</c:if>

												<!-- Gold -->
												<c:if test="${post.pawnerPostPure != null}">
													<li class="col-md-6">Pure : ${post.pawnerPostPure  }</li>
													<li class="col-md-6">Weigh : ${post.pawnerPostWeigh }</li>
													<li class="col-md-6">Category :
														${post.pawnerPostCategory }</li>
												</c:if>



												<!-- Electronic tv com telephone -->
												<c:if test="${post.pawnerPostSize != null}">
													<li class="col-md-6">Size : ${post.pawnerPostSize }</li>
												</c:if>

												<!-- Electronic camera com telephone -->
												<c:if test="${post.pawnerPostBattery != null}">
													<li class="col-md-6">Battery :
														${post.pawnerPostBattery }</li>
												</c:if>

												<!-- Electronic com telephone -->
												<c:if test="${post.pawnerPostHarddisk != null}">
													<li class="col-md-6">Harddisk :
														${post.pawnerPostHarddisk }</li>
												</c:if>

												<!-- Electronic com-->
												<c:if test="${post.pawnerPostRam != null}">
													<li class="col-md-6">Ram : ${post.pawnerPostRam }</li>
												</c:if>

												<!-- Watch -->
												<c:if test="${post.pawnerPostCase != null}">
													<li class="col-md-6">Case : ${post.pawnerPostCase }</li>
													<li class="col-md-6">Bracelet :
														${post.pawnerPostBracelet }</li>
													<c:if test="${post.pawnerPostDiamond != null}">
														<li class="col-md-6">Diamond :
															${post.pawnerPostDiamond }</li>
													</c:if>
													<c:if test="${post.pawnerPostPackage != null}">
														<li class="col-md-6"><span
															class="glyphicon glyphicon-check" aria-hidden="true">
														</span> Package</li>
													</c:if>
												</c:if>

												<!-- Electronic tv -->
												<c:if test="${post.panwePostRemote != null}">
													<li class="col-md-6"><span
														class="glyphicon glyphicon-check" aria-hidden="true">
													</span> Remote</li>
												</c:if>


												<!-- Watch,Electronic -->
												<c:if test="${post.pawnerPostModel != null}">
													<li class="col-md-6"><span
														class="glyphicon glyphicon-check" aria-hidden="true">
													</span> Warranty</li>
												</c:if>

											</ul>
										</div>
									</div>
									<h4 class="quick">Other Detail </h4>
									<p class="quick_desc">${post.pawnerPostDescription }</p>
								</div>
							</div>
						</div>

					</div>

					<c:if test="${post.pawnerPostStatus == 'waiting'}">
						<div class="line margin-lr-1"></div>
						<span class="text-center"> ยังไม่ประเมิน </span>
					</c:if>
					<c:if test="${post.pawnerPostStatus == 'approve'}">
						<div class="line margin-lr-1"></div>
					Print
					</c:if>
					<c:if test="${post.pawnerPostStatus == 'process'}">
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
		</c:forEach>
	</section>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		$('div span a').click(function() {
			$(this).text(function(i, old) {
				return old == 'more' ? 'less' : 'more';
			});
		});
	</script>
</body>
</html>
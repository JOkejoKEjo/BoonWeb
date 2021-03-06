<!-- 
// page : pawner-post-form-Electronic
// version : 1.0
// task : create
// edit by : ter
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

		<html lang="en">

		<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<meta name="description" content="">
			<meta name="author" content="">

			<title>pawner-post-form</title>

			<!-- Bootstrap core CSS -->
			<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

			<!-- Custom styles for this template -->
			<link href="css/new-design.css" rel="stylesheet">
			<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		</head>

		<body>
			<!-- Navigation   -->
			<jsp:include page="navbar.jsp" />
			<!--banner-->
			<div class="banner-top">
				<div class="container">
					<h1>Pledge Computer&Laptop</h1>
					<em></em>
				</div>
			</div>
			<!--content-->
			<div class="content">
				<div class="container">
					<!--products-->
					<div class="content-mid">
						<div class="mid-popular">
							<div class="container-contact100 ">
								<div class="wrap-contact100">
									<div class="contact100-form">
										<form:form method="post" action="savePost.html" modelAttribute="pawnerPost" enctype="multipart/form-data">
											<input type="hidden" name="pawnerPostId" />
											<input type="hidden" name="pawnerId.pawnerId" />
											<input type="hidden" name="pawnerPostItemType" value="Electronic" />
											<div class="form-group float-left">
												<input name="files" type="file" onchange="readURL(this);" />
											</div>
											<label class="label-input100">Post Name</label>
											<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
												<input class="input100" type="text" name="pawnerPostName">
											</div>
											<label class="label-input100">Brand</label>
											<div class="wrap-input100 validate-input">
												<select class="input100" type="text" name="pawnerPostBrand" required="required">
													<option>Acer</option>
													<option>Apple</option>
													<option>Asus</option>
													<option>Canon</option>
													<option>Dell</option>
													<option>Fuji Film</option>
													<option>HP</option>
													<option>Lenovo</option>
													<option>LG</option>
													<option>MSI</option>
													<option>Nikon</option>
													<option>Olympus</option>
													<option>Panasonic</option>
													<option>Philips</option>
													<option>Samsung</option>
													<option>Sony</option>
													<option>Sharp</option>
													<option>TCL</option>
													<option>Toshiba</option>
													<option>Others</option>
												</select>
											</div>
											<label class="label-input100">Serial Number and Model</label>
											<div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Type first name">
												<input class="input100" type="text" name="pawnerPostSerial" placeholder="Serial Number">
												<span class="focus-input100"></span>
											</div>
											<div class="wrap-input100 rs2-wrap-input100 validate-input" data-validate="Type last name">
												<input class="input100" type="text" name="pawnerPostModel" placeholder="Model">
												<span class="focus-input100"></span>
											</div>
											<label class="label-input100">Display size</label>
											<div class="wrap-input100 validate-input" data-validate="Type first name">
												<input class="input100" type="text" name="pawnerPostSize" placeholder="Display size">
												<span class="focus-input100"></span>
											</div>
											<label class="label-input100">Harddisk size and Ram</label>
											<div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Type first name">
												<select class="input100" name="pawnerPostHarddisk">
													<option>250 GB</option>
													<option>500 GB</option>
													<option>1 TB</option>
													<option>2 TB</option>
													<option>3 TB</option>
													<option>Others</option>
												</select>
												<span class="focus-input100"></span>
											</div>
											<div class="wrap-input100 rs2-wrap-input100 validate-input" data-validate="Type last name">
												<select class="input100" name="pawnerPostRam">
													<option>4 Gb</option>
													<option>8 Gb</option>
													<option>16 Gb</option>
													<option>32 Gb</option>
													<option>64 Gb</option>
												</select>
												<span class="focus-input100"></span>
											</div>
											<label class="label-input100">Year of purchase</label>
											<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
												<input class="input100" type="date" name="pawnerPostPurchase" placeholder="">
												<span class="focus-input100"></span>
											</div>
											<label class="label-input100">Year of production </label>
											<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
												<input class="input100" type="date" name="pawnerPostProduction" placeholder="">
												<span class="focus-input100"></span>
											</div>
											<label class="label-input100">Description</label>
											<div class="wrap-input100 validate-input" data-validate="Message is required">
												<textarea class="input100" name="pawnerPostDescription" placeholder="Write us a message(optional) "></textarea>
												<span class="focus-input100"></span>
											</div>
											<div class="form-group-post float-left">
												<dt style="line-height: 45px;">
													<input type="checkbox" name="pawnerPostBattery" value="yes" /> Battery charger
												</dt>
												<dt style="line-height: 5px;">
													<input type="checkbox" name="pawnerPostWarranty" value="yes" /> Warranty Certificate
													<strong>(If you have)</strong>
												</dt>
												<dt style="line-height: 55px;">
													<input type="checkbox" required="required"> I agree to the
													<strong>trem of service</strong>
												</dt>
											</div>
											<div class="container-contact100-form-btn">
												<button type="summot" class="contact100-form-btn">
													Create Post
												</button>
											</div>
										</form:form>
									</div>
									<!-- Picture -->
									<div class="contact100-more flex-col-c-m" style="background-image: url('img/bgIndex.jpg');">
										<div class="flex-w size1 p-b-47">
											<div class="txt1 p-r-25">
												<span class="lnr lnr-map-marker"></span>
											</div>

											<div class="flex-col size2">
												<span class="txt1 p-b-20">
													Address
												</span>

												<span class="txt2">
													Mada Center 8th floor, 379 Hudson St, New York, NY 10018 US
												</span>
											</div>
										</div>

										<div class="dis-flex size1 p-b-47">
											<div class="txt1 p-r-25">
												<span class="lnr lnr-phone-handset"></span>
											</div>

											<div class="flex-col size2">
												<span class="txt1 p-b-20">
													Lets Talk
												</span>

												<span class="txt3">
													+1 800 1236879
												</span>
											</div>
										</div>

										<div class="dis-flex size1 p-b-47">
											<div class="txt1 p-r-25">
												<span class="lnr lnr-envelope"></span>
											</div>

											<div class="flex-col size2">
												<span class="txt1 p-b-20">
													General Support
												</span>

												<span class="txt3">
													contact@example.com
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</body>

		</html>
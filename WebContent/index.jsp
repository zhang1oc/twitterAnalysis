<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<!DOCTYPE html>
<html lang="${language}">

<head>
	<title>University of Windsor Group 10</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="css/bootstrap-dark.css">
	<link rel="stylesheet" href="css/banner.css">
	<link rel="stylesheet" href="css/style.css"/>

	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="row service-container">
	<div class="col-lg-12 service-header">
		<div style="background-image:url(images/bg1.jpg)" class="row header">
			<div class="container">
				<div
						class="avatar img-container col-lg-2 col-md-2 col-sm-2 hidden-xs">
					<img src="images/IBM.png" class="service-icon">
				</div>
				<div
						class="col-lg-10 col-md-10 col-sm-10 col-xs-12 dialog-description">
					<h1 style="font-size: 50px;" class="service-title">Personality Motivation Analysis</h1>
					<p>When users visit our web page, they can see a simple interface like Google search at the beginning. There are just a few buttons and an input box. After typing some key words on the input box, our program will collect related tweets from Twitter and then these data will present on the web page. If users want to receive personal insight data, they can click ¡°Analyze¡± button. The related tweets would be sent to IBM Personal Insight module to analyze. Next, we would get the analyzed results and show as charts on the web page</p>
					<div class="resource">
					</div>
					<div class="resource-item-container">
						<a></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row" align="center">
	<img src="images/logo.png" width="600" height="300" />
	<form role="form">
		<div>
			<input type="text" style="height:40px;width:550px" class="form-control input-box" placeholder="type into the keyword">
		</div>
		<div>
			<button class="btn btn-lg btn-primary twittersearch text-center" type="button">Twitter Search</button>
		</div>
	</form>
</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-xs-12">
				<h2>Twitter search results / Text Input</h2>
				<div class="well">
					<div class="form-group row">
						<div style="padding: 0px;" class="col-lg-12 col-xs-12">
							<textarea rows="12" required="true" name="text"
								placeholder="content"
								class="content form-control"></textarea>
							<div class="text-right inputFootnote">
								<span class="wordsCount"></span> <span class="small"></span>words</span>
							</div>
						</div>
					</div>
					<div style="display: none; margin-bottom: 10px;"
						class="form-group row captcha">
						<div data-sitekey="6LcRbQkTAAAAAGUFVbnuqDfse-XZASLZwoC34oJV"
							class="col-lg-12 col-md-12 col-xs-12 g-recaptcha"></div>
					</div>
					<div class="form-group row buttons-container">
						<div class="col-lg-4 col-xs-4">
							<button type="button" class="btn btn-danger clear-btn">clear</button>
						</div>
						<div class="col-lg-4 col-lg-push-4 col-xs-4 col-xs-push-4">
							<button type="button" class="btn btn-success analysis-btn">analyze</button>
						</div>
					</div>
				</div>
			</div>
			<div style="display: none;" class="results">
				<div class="row">
					<div>
						<h3>Data Behind Your Personality</h3>
						<div style="display: none;" class="col555px well traits"></div>
					</div>
				</div>
			</div>
			<div class="hidden">
				<div id="header-template">
					<div class="row theader">
						<div class="col-lg-5 col-xs-5">
							<span>Name</span>
						</div>
						<div class="col-lg-7 col-xs-7 text-right">
							<span>value ± Sampling Error</span>
						</div>
					</div>
				</div>
				<div id="trait-template">
					<div class="row">
						<div class="tname col-lg-7 col-xs-7">
							<span></span>
						</div>
						<div class="tvalue col-lg-5 col-xs-5 text-right">
							<span></span>
						</div>
					</div>
				</div>
				<div id="model-template">
					<div class="row">
						<div class="col-lg-12 col-xs-12 text-center">
							<span></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		Visualization of Personality Data
		<div id="myDiv" style="width: 700px; height: 700px;"></div>
	</div>

	<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
	<script type="text/javascript" src="js/demo.js"></script>
</body>
</html>

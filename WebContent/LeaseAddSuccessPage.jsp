<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.gk.assetmgment.dto.LeaseDeedDetails"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lease Addition Response</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="stylesheets/weblayout.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.structure.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.theme.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/bootstrap-theme.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/bootstrap.css"/>

<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<script type="text/javascript" src="scripts/jquery.validate.js"></script>
<script type="text/javascript" src="scripts/bootstrap.min.js"></script></head>
<body>
<div id="header">
<h1>Lease Addition Response</h1>
</div>

<!-- <div id="nav">
<a href="index.html">Home</a><br>
<a href="AddAssetScr.jsp">Add Asset</a><br>
<a href="GetFreeAssets">Add Lease </a><br>
<a href="GetDeedBillGenerate">Bill Summary</a><br>
<a href="PaymentConfirm">Make Pay</a><br>
</div> -->

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">AMS</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html">Home</a></li>
					<li><a href="AddAssetScr.jsp">Add Asset</a></li>
					<li><a href="GetFreeAssets">Add Lease </a></li>
					<li><a href="GetDeedBillGenerate">Bill Summary</a></li>
					<li><a href="PaymentConfirm">Make Pay</a></li>
				</ul>

			</div>
		</div>
	</nav>

<div id="section">
<h2>
<p align="center">
<%LeaseDeedDetails leaseDetails= (LeaseDeedDetails) session.getAttribute("leaseDetails");%>
Your Lease Deed Id is :  <%=leaseDetails.getDeedId() %>
</p>
</h2>
</div>
<div id="end">
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.gk.assetmgment.dto.Billsummary"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill Generation Response</title>

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
<script type="text/javascript" src="scripts/bootstrap.min.js"></script>


<style type="text/css">
table{
border-collapse:collapse;
width:70%;
}
th,td{
border-style:solid;
border-width:1px;
border-color:#000000;
}
td{
column-width}
</style>
</head>
<body>

<div id="header">
<h1>Bill Generation Response</h1>
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
<%-- Lease Id added for is : ${returndetails.getLeaseId()} --%>
<table>
<th colspan="4"> Rental Bill </th>
<tr>
	<td> bill number </td>
	<td>${returndetails.getBillId()}</td>
	<td>bill date</td>
	<td>${returndetails.getBillDate()}</td>
</tr>
<tr>
	<td> lease number</td>
	<td colspan="3"> ${returndetails.getLeaseDeed()}</td>
</tr>
<tr>
<td> Tenant</td>
<td colspan="3"> ${returndetails.getTenantName()}</td>
</tr>

<tr>
	<td colspan ="2">lease amt </td>
	<td>${returndetails.getLeaseAmt()}</td>
	<td></td>
</tr>

<tr>
	<td colspan ="2">electric charge </td>
	<td> ${returndetails.getElectricityCharge()}</td>
	<td></td>
</tr>

<tr>
	<td colspan ="2">water charge </td>
	<td> ${returndetails.getWaterCharge()}</td>
	<td></td>
</tr>

<tr>
<td> Misc Charge 1</td>
<td> ${returndetails.getMiscCharge1comm()} </td>
<td> ${returndetails.getMiscCharge1()}</td>
<td></td>
</tr>

<tr>
<td> Misc Charge 2</td>
<td> ${returndetails.getMiscCharge2comm()} </td>
<td> ${returndetails.getMiscCharge2()}</td>
<td></td>
</tr>

<tr>
<td> Misc Charge 3</td>
<td> ${returndetails.getMiscCharge3comm()} </td>
<td> ${returndetails.getMiscCharge3()}</td>
<td></td>
</tr>

<tr>
<td> Fine</td>
<td> ${returndetails.getFineAmtcomm()} </td>
<td> ${returndetails.getFineAmt()}</td>
<td></td>
</tr>

<tr>
	<td colspan ="2">Total </td>
	<td> ${returndetails.getTotalAmt()}</td>
	<td></td>
</tr>
</table>
</div>

<div id="end">
</div>
</body>
</html>

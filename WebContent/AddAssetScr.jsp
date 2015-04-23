<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AssetAdditionScreen</title>
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


<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}

</style>
</head>

<body>
<script>
$(document).ready(function(){
	var validfield=true;
	$("#submit").click(function(e){
		$("#assetname,#assetstreetname,#assetunitnumber,#assetpincode").each(function(){
			if ($.trim($(this).val())==''){
				validfield=false;
				 	$(this).css({
                    "border": "1px solid red",
                    "background": "#FFCECE"
					});
				}
           	else {
               		$(this).css({
                   	"border": "",
                   	"background": ""
               		});
           }	
			});
		
		if(validfield==false) {
			e.preventDefault();
		}
	});
	 $("#date").datepicker();
});
</script>

<div id="header">
<h1>Asset Addition Screen</h1>
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
<p align="center">
<form method="post" action=AssetAddAuth>
<Table>
	<tr>
		<td class="td_span_center" colspan="2"> Asset Details</td>
	</tr>
	
	<tr>
		<td> Asset Name </td>
		<td> <input name="assetname" id="assetname" type="text"> </td>
	</tr>

	<tr>
		<td> Street Name </td>
		<td> <input name="assetstreetname" id="assetstreetname" type="text"> </td>
	</tr>

	<tr>
		<td> Unit Number </td>
		<td> <input name="assetunitnumber" id="assetunitnumber" type="text"> </td>
	</tr>
	
	<tr> 
		<td class="td_span_center" colspan="2"> Location </td>
	</tr>

	<tr>
		<td> Door Number </td>
		<td> <input name="assetdoornum" id="assetdoornum" type="text"> </td>
	</tr>

	<tr>
		<td> AssetAddressline1 </td>
		<td> <input name="assetaddln1" id="assetaddln1" type="text"> </td>
	</tr>
	
	<tr>
		<td> AssetAddressline2 </td>
		<td> <input name="assetaddln2" id="assetaddln2" type="text"> </td>
	</tr>
	
	<tr>
		<td> Asset Pincode </td>
		<td> <input name="assetpincode" id="assetpincode" type="text"> </td>
	</tr>

	
	<tr>
		<td class="td_span_center" colspan="2">  
			<input type="submit" id="submit" value=Add>
		</td>
	</tr>
</Table>
</form>
</div>
<div id="arti">
Asset Addition screen. Please provide the details.
</div>
<div id="end">
</div>
</body>
</html>

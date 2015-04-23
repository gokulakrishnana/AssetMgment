<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Set,java.util.Iterator,java.util.HashMap,org.gk.assetmgment.servlet.GetFreeAssets,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Lease Detail Screen</title>

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
<script type="text/javascript" src="scripts/bootstrap.min.js"></script> 

<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
.error_msg{
color:red;
text-size:10px;
font-size:30px;
font-style: italic;
}
</style>
</head>

<body>
<script>
$(document).ready(function(){
	var validfield=true;
	$("#submitleasedetails").click(function (e){
		var n = $( "#assetid:checked" ).length;
		if (n>3){
			e.preventDefault();
		}
		$("#leaseLandLord,#leaseNumber,#leaseStartDate,#leaseEndDate,#leaseTenant1").each(function(){
			if($.trim($(this).val())==''){
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
		if (validfield == false){
            e.preventDefault();
		}
	});
	$("#leaseStartDate,#leaseEndDate,#leaseTerminationDate").datepicker({
		changeMonth: true,changeYear: true,dateFormat:"yy-mm-dd"
	});
	$( "input.assetid" ).on( "click", function() {
		var n = $( "#assetid:checked" ).length;
		if (n <4){
			$( "#checkoutput" ).text(" " );
		}
		else{
			$( "#checkoutput" ).addClass("error_msg");
			$( "#checkoutput" ).text( "Select only upto 3 assets!" );
			preventDefault();
		}
	});
});
</script>

<div id="header">
<h1>Lease Detail Addition Screen</h1>
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
	
<%List<String> getasset = (List<String>)session.getAttribute("freeasset"); %>

<div id="section">
<form method="post" action=AddLeaseDeed>
<Table>
	<tr> 
		<td class="td_span_center" colspan="2"> Lease Details</td>
	</tr>
	
	<tr>
		<td> Lease Deed Registration/Document Number </td>
		<td> <input id="leaseNumber"  name="leaseNumber" type="text"> </td>
	</tr>

	<tr>
		<td> Start Date </td>
		<td> <input id="leaseStartDate" name="leaseStartDate" type="text"> </td>
	</tr>

	<tr>
		<td> End Date </td>
		<td> <input id="leaseEndDate" name="leaseEndDate" type="text"> </td>
	</tr>

	<tr>
		<td> Termination Date </td>
		<td> <input id="leaseTerminationDate" name="leaseTerminationDate" type="text"> </td>
	</tr>	
	<tr>
		<td> Lease Deed Amt </td>
		<td> <input id="leaseDeedAmt" name="leaseDeedAmt" type="number"> </td>
	</tr>	
	
	<tr> 
		<td class="td_span_center" colspan="2"> Tenant signatories </td>
	</tr>

	<tr>
		<td> Tenant-1</td>
		<td> <input id="leaseTenant1" name="leaseTenant1" type="text"> </td>
	</tr>

	<tr>
		<td> Tenant-2 </td>
		<td> <input name="leaseTenant2" type="text"> </td>
	</tr>
	
	<tr>
		<td> Tenant-3 </td>
		<td> <input name="leaseTenant3" type="text"> </td>
	</tr>

	<tr> 
		<td class="td_span_center" colspan="2"> Landlord signatory</td>
	</tr>
	
	<tr>
		<td> LandLord Representative </td>
		<!-- <input name="leaseLandLord" value="FirstName LastName" type="text" id="blankit" onfocus="javascript:blank();"> -->
		<td> <input id="leaseLandLord" name="leaseLandLord" type="text"> </td>
	</tr>


	<tr> 
		<td class="td_span_center" colspan="2"> Asset Ids</td>
	</tr>
	<tr>
	<td colspan=2>
		<table>
			<tr> 
				<th>Option</th>
				<th>AssetId</th>
				<th>Asset Name</th>
				<th>Street Name</th>
				<th>Unit Number</th>			
			</tr>
				<%
				for(String assetdet: getasset)
				{
					String[] assetarray = assetdet.split(",");
					String varAssetId = assetarray[0];
					String varAssetName = assetarray[1];
					String varAssetStreet = assetarray[2];
					String varAssetUnit = assetarray[3];
					
				%>
				<tr> 
				<td><input type="checkbox" name="assetid" class="assetid" id="assetid" value="<%=varAssetId%>" /> </td>
				<td><%=varAssetId%></td>
				<td><%=varAssetName%></td>
				<td><%=varAssetStreet%></td>
				<td><%=varAssetUnit%></td>
				</tr> 
				<%}%>
		</table>
		</td>
</tr>

	
	
	<tr>
		<td class="td_span_center" colspan="2">  
			<input id="submitleasedetails" name="submitleasedetails" type="submit" value="Submit">
		</td>
	</tr>
</Table>
</form>

</div>
<div id="arti">
Lease deed addition screen. Please enter leasedeed details.
You can provide dummy lease numbers for movable assets.
</div>
<div id="end">
<div id="checkoutput">
</div>
</div>

</body>
</html>

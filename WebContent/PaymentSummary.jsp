<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Summary</title>

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
table{
border-style:solid;
border-width:2px;
border-color:#000000;
border-collapse:collapse;
}
td,th{
border-style:solid;
border-width:2px;
border-color:#D1F0F9
}
.teston{
background-color:green;;
}
.testoff{
background-color:#000000;
}
</style>
<script> 
$(document).ready(function(e){
 	var err = false;
 	$("#submitPayStatus").click(function(e){
 		var n = $("#paidstatus:checked").length;
 		if (n < 1){
 			err =true;
 			$("#outputmsg").text("No Record selected");
 			e.preventDefault();
 		}else{
 			err =false;
 		} 
 	});
 })
</script>

</head>
<body>
<div id="header">
<h1>Payment Summary</h1>
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
<table>
<Form id="updatePayStatus" class="updatePayStatus" name="updatePayStatus" method="post" action="PaymentConfirm">
<th>Option</th>
<th>Bill Number </th>
<th>Lease Id </th>
<th>Lease Number </th>
<th> Tenant Name</th>
<th> Bill Date </th>
<th> Bill Month </th>
<th> Lease Amount </th>
<th> Electricity Charge</th>
<th> Water Charge </th>
<th> Misc 1 Amt</th>
<th> Misc 2 Amt </th>
<th> Misc 3 Amt </th>
<th> Fine </th>
<th> Total </th>
<th>Paid Status</th>
<%List<String> paymentdetails = (List<String>) session.getAttribute("paymentdetails");
String [] individualdetails;
for(String tempvar:paymentdetails)
{ 
	individualdetails = tempvar.split(",");%>
<tr>
<td>
<input id="paidstatus" type="checkbox" name="paidstatus" value =" <%=individualdetails[0]%>">
</td>
<% 

	for(String individualcomponent:individualdetails)
	{
%>

<td> <%=individualcomponent%> </td>
<%} %>
</tr>
<%} %>
<tr>
<td colspan="17">
<input id="submitPayStatus" type="Submit" value="Confirm Payment"/>
</td>
</tr>
</Form>
</table>
<div>

<div id="outputmsg" class="outputmsg">
<%String returnmsg = (String)session.getAttribute("returnmsg");
if (returnmsg == "initial"){
%>
Welcome
<%}else 
	{%>
	<%=returnmsg %>
<%}
 %>
</div>
</body>
</html>
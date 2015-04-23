<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List,java.util.Date,java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Billing Summary</title>
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

<script type="text/javascript">
$(document).ready(function(){
	$("p.errmsg").text(" ");
	$("input.chk_DeedId").click(function(){
		var radioval = $("#chk_DeedId:checked").val();
		alert("Radio clicked :" + radioval );
	});
	$("#billingDate").datepicker({
		changeMonth: true,changeYear: true,dateFormat:"yy-mm-dd"
	});
});


</script>
<style>
.div_assetcollc{
position:relative;
padding:10px;
border-width:1px;
border-color:#000000;
border-style:solid;
}

th {
font-size:15px;
font-style: italic;
text-align:center;
}
tr.deedcollec{
border-width:2px;
border-color:red;
}


td{
border-style:solid;
border-width:2px;
border-color:#D1F0F9
}

td.tableheading{
font-size:20px;
font-style: italic;
text-align:center;
}
td.head{
text-align:center;
}
tr.odd{
background-color:#D1F0FF;
}
tr.even{
background-color:#ECF9FF;
}
.form_table{
border-collapse:collapse;
}

table{
border-width:2px;
border-color:#D1F0F9;
border-collapse:collapse;

}
</style>
</head>
<body>

<div id="header">
<h1>Billing Summary</h1>
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
<form method="post" action="AddBillDetails" name="billSummaryForm" id="billSummaryForm">
<Table class="form_table">
	<tr class="odd"> 
		<td class="tableheading" colspan="3"> Billing Summary</td>
	</tr>
	
	<tr class="even">
		<td> LeaseId </td>
		<td> <input id="leaseId"  name="leaseId" type="number">	</td>
		<td></td>
	</tr>
	<tr class="even">
		<td> Lease Deed Registration/Document Number </td>
		<td> <input id="leaseNumber"  name="leaseNumber" type="text">	</td>
		<td></td>
	</tr>
	<tr class="even">
		<td> Tenant Name </td>
		<td> <input id="Tenantname"  name="Tenantname" type="text">	</td>
		<td></td>
	</tr>

	<tr class="odd">
		<td> Billing Month </td>
		<td> 
		<select id="billingMonth" name="billingMonth" multiple="multiple">	
		<% Calendar mcalendar = Calendar.getInstance();
		String mnth[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
		int CurMonth=mcalendar.get(Calendar.MONTH); 
		%>		
		<option value="<%=mnth[CurMonth]%>" > <%=mnth[CurMonth]%> </option>
		<option value="<%=mnth[CurMonth + 1]%>"> <%=mnth[CurMonth + 1]%> </option>
		<option value="<%=mnth[CurMonth + 2]%>"> <%=mnth[CurMonth + 2]%> </option> 
		</select>
		</td>
		<td></td>
	</tr>

	<tr class="odd">
		<td> Billing Date </td>
		<td> <input id="billingDate" name="billingDate" type="text" placeholder="yyyy-mm-dd"> </td>
		<td></td>
		
	</tr>

	<tr class="even">
		<td> Lease Amount </td>
		<td> <input id="leaseAmt" name="leaseAmt" type="number"> </td>
		<td></td>
		
	</tr>

	<tr class="odd">
		<td> Electricity </td>
		<td> <input id="elecAmt" name="elecAmt" type="number"> </td>
		<td></td>
	</tr>	
	<tr class="even">
		<td> Water Charge </td>
		<td> <input id="waterCharge" name="waterCharge" type="number"> </td>
		<td></td>
	</tr>	
	
	<tr class="odd">
		<td class="head" colspan="3"> Miscellaneous Charge </td>
	</tr>

	<tr class="even">
		<td> Misc 1 Charge:  </td>
		<td> <input id="misc1ChargeAmt" name="misc1ChargeAmt" type="number"> </td>
		<td> Comment: <input id="misc1ChargeComm" name="misc1ChargeComm" type="text"> </td>
	</tr>
	<tr class="even">
		<td> Misc 2 Charge:  </td>
		<td> <input id="misc2ChargeAmt" name="misc2ChargeAmt" type=number> </td>
		<td> Comment: <input id="misc2ChargeComm" name="misc2ChargeComm" type="text"> </td>
	</tr>
	<tr class="even">
		<td> Misc 3 Charge:  </td>
		<td> <input id="misc3ChargeAmt" name="misc3ChargeAmt" type="number"> </td>
		<td> Comment: <input id="misc3ChargeComm" name="misc3ChargeComm" type="text"> </td>
	</tr>

	<tr class="even">
		<td> Fine Charge:  </td>
		<td> <input id="fineChargeAmt" name="fineChargeAmt" type="number"> </td>
		<td> Comment: <input id="fineChargeComm" name="fineChargeComm" type="text"> </td>
	</tr>
	<tr>
	<td colspan=2>	</td>
	</tr>	
	<tr>
		<td class="head" colspan="3">  
			<input id="submitleasedetails" name="submitleasedetails" type="submit" value="Submit">
		</td>
	</tr>
</Table>
</form>

<br><br><br>
<%
List<String> ls_activedeeds = (List<String>)session.getAttribute("activedeeds");
String i_DeedId,i_AssetId,i_UnitNum;
String str_AssetName, str_StreetName, str_LeasedeedNumber,str_StDate,str_EndDate, str_Tenant;
String dbl_LeaseAmt;
%>
<div class="div_assetcollc">
<table class="assetcoll" border="1">
<tr>
<th> Option </th>
<th> Deed Id </th>
<th> Asset Id </th>
<th> Asset Name </th>
<th> Street Name </th>
<th> Unit # </th>
<th> Lease Deed #</th>
<th> Start Date </th>
<th> End Date </th>
<th> Lease Amt</th>
<th> Tenant Name </th>
</tr>
<%  for (String st_activedeeds:ls_activedeeds ){
	String [] arr_activedeeds = st_activedeeds.split(",");
	i_DeedId  		= arr_activedeeds[0];
	i_AssetId 		= arr_activedeeds[1];
	str_AssetName	= arr_activedeeds[2];
	str_StreetName	= arr_activedeeds[3];
	i_UnitNum		= arr_activedeeds[4];
	str_LeasedeedNumber	= arr_activedeeds[5];
	str_StDate		= arr_activedeeds[6];
	str_EndDate		= arr_activedeeds[7];
	dbl_LeaseAmt	= arr_activedeeds[8];
	str_Tenant		= arr_activedeeds[9];
%>

<tr>
	<td> <input type="radio" class="chk_DeedId" id="chk_DeedId" name= "chk_DeedId" value="<%=i_DeedId%>"/></td>
	<td><%=i_DeedId %> </td>  
	<td><%=i_AssetId %> </td>
	<td><%=str_AssetName %> </td>
	<td><%=str_StreetName %> </td>
	<td><%=i_UnitNum %> </td>
	<td><%=str_LeasedeedNumber %> </td>
	<td><%=str_StDate %> </td>
	<td><%=str_EndDate %> </td>
	<td><%=dbl_LeaseAmt %> </td>
	<td><%=str_Tenant %> </td>
</tr>
<%} %>
</table>
</div>
</div>
<div id="arti">
You can create Monthly bill, for assets rented/leased.
</div>
<div id="end">
<p class="errmsg"> </p>
</div>
</body>
</html>

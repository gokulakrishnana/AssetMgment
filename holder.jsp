<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Billing Summary</title>

<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.structure.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/jquery-ui.theme.css"/>
<link rel="stylesheet" type="text/css" href="stylesheets/multiple-select.css"/>
<script type="text/javascript" src="scripts/jquery-2.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/jquery-ui.js"></script>
<script src="jquery.multiple.select.js"></script>
</head>
<body>

<div align= "center">
<form method="get" name="billSummaryForm" id="billSummaryForm">
<Table>
	<tr> 
		<td colspan="2"> Billing Summary</td>
	</tr>
	
	<tr>
		<td> Lease Deed Registration/Document Number </td>
		<td> <input id="leaseNumber"  name="leaseNumber" type="text">	</td>
	</tr>

	<tr>
		<td> Billing Month </td>
		<td> 
		<select id="billingMonth" name="billingMonth" multiple="multiple">
		<option value="1"> Jan </option>
		<option value="2"> Feb </option>
		<option value="3"> Mar </option> 
		</select>
		</td>
	</tr>

	<tr>
		<td> Lease Amount </td>
		<td> <input id="leaseAmt" name="leaseAmt" type="text"> </td>
		<td></td>
		
	</tr>

	<tr>
		<td> Electricity </td>
		<td> <input id="elecAmt" name="elecAmt" type="text"> </td>
		<td></td>
	</tr>	
	<tr>
		<td> Water Charge </td>
		<td> <input id="waterCharge" name="waterCharge" type="text"> </td>
		<td></td>
	</tr>	
	
	<tr> 
		<td colspan="3"> Miscellaneous Charge </td>
	</tr>

	<tr>
		<td> Misc 1 Charge:  </td>
		<td> <input id="misc1ChargeAmt" name="misc1ChargeAmt" type="text"> </td>
		<td> Comment: <input id="misc1ChargeComm" name="misc1ChargeComm" type="text"> </td>
	</tr>
	<tr>
		<td> Misc 2 Charge:  </td>
		<td> <input id="misc2ChargeAmt" name="misc2ChargeAmt" type="text"> </td>
		<td> Comment: <input id="misc2ChargeComm" name="misc2ChargeComm" type="text"> </td>
	</tr>
	<tr>
		<td> Misc 3 Charge:  </td>
		<td> <input id="misc3ChargeAmt" name="misc3ChargeAmt" type="text"> </td>
		<td> Comment: <input id="misc3ChargeComm" name="misc3ChargeComm" type="text"> </td>
	</tr>

	<tr>
		<td> Fine Charge:  </td>
		<td> <input id="fineChargeAmt" name="fine3ChargeAmt" type="text"> </td>
		<td> Comment: <input id="fine3ChargeComm" name="fine3ChargeComm" type="text"> </td>
	</tr>

	<tr>
	<td colspan=2>	</td>
	</tr>	
	<tr>
		<td class="td_span_center" colspan="2">  
			<input id="submitleasedetails" name="submitleasedetails" type="submit" value="Submit">
		</td>
	</tr>
</Table>
</form>
</div>

    <script>
        $('select').multipleSelect({
            styler: function(value) {
                if (value == '1') {
                    return 'background-color: #ffee00; color: #ff0000;';
                }
                if (value == '6') {
                    return 'background-color: #000; color: #fff;';
                }
            }
        });
    </script>

</body>
</html>
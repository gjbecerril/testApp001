<!--- 
Challenge 1
1) Post the form back to the same page and send an email to info@wamdevtech.com from the "sendFrom" 
form element.
--->
<!--- validation and mail tag goes here --->
<cfset variables.sendEmail = false>
<cfset variables.errorMsg = "">
<cfif event.valueExists("sendFrom") and len(trim(event.getValue("sendFrom")))>
	<cftry>
		<cfmail from="#event.getValue("sendFrom")#" to="info@wamdevtech.com" subject="Javier Becerril - Code Challenge 1" type="html">
			#event.getValue("message")#
		</cfmail>
		<cfset variables.sendEmail = true>
		<cfcatch type="any">
			<cfset variables.errorMsg = "Error occurred">	
		</cfcatch>
	</cftry>
</cfif>

<cfoutput>
<html>
<head>	
	<title>Challenge 1 Mail Form</title>
 	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script> <!--- documentation: jqueryvalidation.org/ --->	
</head>
<!---
Bonus: add client-side form validation using jQuery. Use the provided jquery.validate plugin or replace it with your own. 
--->
<body>
	<cfif variables.sendEmail>
		<div>Message sent!!</div>
	<cfelse>
		<cfif len(variables.errorMsg)>
			<div>#variables.errorMsg#</div>
		<cfelse>
			<div>Please fill out the form below to send an test email</div>
		</cfif>
	</cfif>

	<form class="cmxform" action="" method="post" id="emailForm" name="emailForm">
	<input type="hidden" name="postBack" value="1">
	  <table class="zui-table" style="margin: 25px;">
	<tbody>
	<tr>		
		<td>
			Send From:
		</td>
		<td>
			<input type="email" name="sendFrom" id="sendFrom" value="" style="width: 250px;" required>
		</td>
	</tr>
	<tr>		
		<td>
			Message:
		</td>
		<td>
			<textarea name="message" id="message" style="width: 250px; height: 250px;"></textarea>
		</td>
	</tr>
	<tr>		
		<td>			
		</td>
		<td>
			<input type="submit" name="go" id="go" value="send message">
		</td>
	</tr>
	</tbody>
	</table>	
</form>
<script>
	$("##emailForm").validate();
</script>
</body>
</html>
</cfoutput>


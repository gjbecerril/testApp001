<!--- 
Challenge 3

Step 1
challenge.cfc
In challenge.cfc, edit the getplayers() function that returns the same query as in challenge 2
Create an optional argument called "dob".
If the argument is NOT present all players should be returned.
If the argument IS present only players born AFTER the date passed in the argument should be returned.
Return the results of your query as the return value of the "getPlayers()" function

Step 2
challenge3.cfm
Use "CreateObject" to instantiat the challenge.cfc component.
Use your instance of challenge.cfc and get back a query from getPlayers() containing only players born after 1985.
Use the query to output all the records and alternate the row colors as before.
Bonus: Implement a formated UI for the data returned. Functionality may include, but are not limited to column sorting, instant search, and alternate row colors. Use the provided datatable jQuery plugin or replace with another.

 --->
 <cfset variables.qryPlayers = CreateObject("component","models.challenge").getPlayers(dob="12/31/1985").qry>
 <cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Challenge 3</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script> <!--- Documentation: www.datatables.net --->
	<link href="//cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" rel="stylesheet">
	<style>
		##players-table tr:nth-child(even) {background: rgb(214, 201, 12)}
		##players-table tr:nth-child(odd) {background: ##FFF}
	</style>
	<script>
	$(document).ready( function () {
		$('##players-table').DataTable();
	});
	</script>
</head>
<body>
	<div style="width:650px">
		<table style="width: 600px;" id="players-table">
			<thead>
				<tr>
					<th>Full Name</th>
					<th>Height</th>
					<th>Weight</th>
					<th>Home town</th>
					<th>Coaches Name</th>
				</tr>
			</thead>
			<tbody id="players">
			<cfloop query="variables.qryPlayers">
				<tr>
					<td>#variables.qryPlayers.fullname#</td>
					<td>#variables.qryPlayers.height#</td>
					<td>#variables.qryPlayers.weight#</td>
					<td>#variables.qryPlayers.hometown#</td>
					<td>#variables.qryPlayers.coachname#</td>
				</tr>
			</cfloop>
			</tbody>
		</table>
	</div>
</body>
</html>
</cfoutput>

<html>
<head><title>Reports</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Report Filters</h2>
<form action="report_result.jsp" method="get">
  <p>Select Report:</p>
  <input type="radio" name="report" value="above"> Marks Above<br>
  <input type="radio" name="report" value="subject"> Subject Wise<br>
  <input type="radio" name="report" value="top"> Top N Students<br><br>
  Value: <input type="text" name="value"/><br/>
  <input type="submit" value="Generate Report"/>
</form>
</body>
</html>
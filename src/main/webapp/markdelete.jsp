<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Delete Marks</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Delete Student Marks</h2>

<form method="post">
    Student ID: <input type="text" name="id" required/><br/>
    <input type="submit" value="Delete"/>
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/bb";
        String user = "root";
        String pass = "";

        con = DriverManager.getConnection(url, user, pass);

        // ✅ Get correct parameter
        int id = Integer.parseInt(request.getParameter("id"));

        PreparedStatement ps = con.prepareStatement("DELETE FROM StudentMarks WHERE StudentID = ?");
        ps.setInt(1, id);
        int rows = ps.executeUpdate();

        if (rows > 0) {
            out.println("<p style='color:green;'>✅ Record deleted successfully.</p>");
        } else {
            out.println("<p style='color:orange;'>⚠️ No record found with ID " + id + ".</p>");
        }

    } catch (NumberFormatException nfe) {
        out.println("<p style='color:red;'>❌ Invalid input. Please enter a valid Student ID.</p>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>❌ Error: " + e.getMessage() + "</p>");
    } finally {
        if (con != null) try { con.close(); } catch (Exception ex) {}
    }
}
%>

</body>
</html>

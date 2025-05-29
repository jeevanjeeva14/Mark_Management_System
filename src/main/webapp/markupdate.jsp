<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Update Marks</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Update Student Marks</h2>

<form method="post">
    Student ID: <input type="text" name="id" required/><br/>
    New Marks: <input type="number" name="marks" required/><br/>
    <input type="submit" value="Update"/>
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    Connection con = null;
    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // DB connection info
        String url = "jdbc:mysql://localhost:3306/bb";
        String user = "root";
        String pass = "";

        con = DriverManager.getConnection(url, user, pass);

        int id = Integer.parseInt(request.getParameter("StudentID"));
        int marks = Integer.parseInt(request.getParameter("Marks"));

        PreparedStatement ps = con.prepareStatement("UPDATE StudentMarks SET Marks = ? WHERE StudentID = ?");
        ps.setInt(1, marks);
        ps.setInt(2, id);

        int rows = ps.executeUpdate();

        if (rows > 0) {
            out.println("<p style='color:green;'>✅ Record updated successfully.</p>");
        } else {
            out.println("<p style='color:orange;'>⚠️ No record found with StudentID " + id + ".</p>");
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>❌ Error: " + e.getMessage() + "</p>");
    } finally {
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
}
%>

</body>
</html>

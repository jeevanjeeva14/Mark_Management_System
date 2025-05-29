<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>
    <title>Add Student Marks</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Add Student Marks</h2>

<form method="post">
    Student ID: <input type="text" name="id" required/><br/>
    Name: <input type="text" name="name" required/><br/>
    Subject: <input type="text" name="subject" required/><br/>
    Marks: <input type="number" name="marks" min="0" max="100" required/><br/>
    Exam Date: <input type="date" name="date" required/><br/>
    <input type="submit" value="Add"/>
</form>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    Connection con = null;
    PreparedStatement ps = null;
    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // DB credentials
        String url = "jdbc:mysql://localhost:3306/bb"; // Replace with your DB name
        String user = "root"; // Replace with your username
        String pass = ""; // Replace with your password

        // Connect to database
        con = DriverManager.getConnection(url, user, pass);

        // Read form data
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        int marks = Integer.parseInt(request.getParameter("marks"));
        String dateStr = request.getParameter("date"); // yyyy-MM-dd expected

        // Insert record
        String sql = "INSERT INTO StudentMarks (StudentID, StudentName, Subject, Marks, ExamDate) VALUES (?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ps.setString(2, name);
        ps.setString(3, subject);
        ps.setInt(4, marks);
        ps.setDate(5, Date.valueOf(dateStr));
        ps.executeUpdate();

        out.println("<p style='color:green;'>✅ Record added successfully.</p>");
    } catch (NumberFormatException e) {
        out.println("<p style='color:red;'>❌ Invalid input. Please ensure all fields are filled correctly.</p>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>❌ Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException ex) {
            // Log exception (optional)
        }
    }
}
%>

</body>
</html>

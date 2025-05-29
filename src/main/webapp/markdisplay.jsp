<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Marks</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Display Student Marks</h2>

<table border="1" cellpadding="5" cellspacing="0">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Subject</th>
    <th>Marks</th>
    <th>Exam Date</th>
</tr>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/bb";
    String user = "root";
    String pass = "";

    con = DriverManager.getConnection(url, user, pass);
    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM StudentMarks");

    while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt("StudentID") %></td>
    <td><%= rs.getString("StudentName") %></td>
    <td><%= rs.getString("Subject") %></td>
    <td><%= rs.getInt("Marks") %></td>
    <td><%= rs.getDate("ExamDate") %></td>
</tr>
<%
    }
} catch (Exception e) {
    out.println("<tr><td colspan='5' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (st != null) try { st.close(); } catch (SQLException e) {}
    if (con != null) try { con.close(); } catch (SQLException e) {}
}
%>
</table>

</body>
</html>

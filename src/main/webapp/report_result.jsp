<%@ page import="java.sql.*" %>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    // Load JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // DB connection info — change as needed
    String url = "jdbc:mysql://localhost:3306/bb";
    String user = "root";
    String pass = "";

    con = DriverManager.getConnection(url, user, pass);

    String type = request.getParameter("report");
    String value = request.getParameter("value");

    if (type == null || value == null) {
        out.println("<p style='color:red;'>Invalid report type or value.</p>");
        return;
    }

    if ("above".equals(type)) {
        ps = con.prepareStatement("SELECT * FROM StudentMarks WHERE marks > ?");
        ps.setInt(1, Integer.parseInt(value));
    } else if ("subject".equals(type)) {
        ps = con.prepareStatement("SELECT * FROM StudentMarks WHERE subject = ?");
        ps.setString(1, value);
    } else if ("top".equals(type)) {
        ps = con.prepareStatement("SELECT * FROM StudentMarks ORDER BY marks DESC LIMIT ?");
        ps.setInt(1, Integer.parseInt(value));
    } else {
        out.println("<p style='color:red;'>Invalid report type specified.</p>");
        return;
    }

    rs = ps.executeQuery();
%>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th><th>Name</th><th>Subject</th><th>Marks</th><th>Exam Date</th>
    </tr>
<%
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
%>
</table>

<%
} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (ps != null) try { ps.close(); } catch (SQLException e) {}
    if (con != null) try { con.close(); } catch (SQLException e) {}
}
%>

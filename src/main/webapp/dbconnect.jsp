<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/bb"; // use your DB name
    String user = "root";
    String pass = ""; // use your DB password

    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
    } catch (Exception e) {
        out.println("<p style='color:red;'>❌ DB Connection Error: " + e.getMessage() + "</p>");
    }
%>

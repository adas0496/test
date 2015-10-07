<%@ page import="java.sql.*" %>

<%
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost:8888/vanetdb", "adas0496", "letmein");
	Statement stmt = conn.createStatement();
	String sqlStr;
	ResultSet rset;

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
%>

<%
	sqlStr = "SELECT password, name FROM users WHERE userId = '" + userId + "';";
	System.out.println(sqlStr);

	try {
		rset = stmt.executeQuery(sqlStr);

		if (!rset.next()) {
%>
			<p>User Id '<%= userId %>' does not exist.</p>
			<p>Register <a href="registration.html">here</a></p>
<%			
		} else {
			if (password.equals(rset.getString("password")))
				out.println("<p>Welcome " + rset.getString("name") + ".</p>");
			else
				out.println("<p>Wrong password, try again.</p>");
		}
	} catch (Exception e) {
		System.out.println(e);
	}

	stmt.close();
	conn.close();
%>
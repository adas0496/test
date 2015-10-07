<%@ page import="java.sql.*" %>

<%
	Connection conn = DriverManager.getConnection(
		"jdbc:mysql://localhost:8888/vanetdb", "adas0496", "letmein");
	Statement stmt = conn.createStatement();
	String sqlStr;
	ResultSet rset;
	int status;
	boolean duplicate = false;

	String vin = request.getParameter("vin");
	String vrn = request.getParameter("vrn");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phoneNo = request.getParameter("phoneNo");
	String email = request.getParameter("email");
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
%>

<%
	try {
		sqlStr = "SELECT userId, email FROM users WHERE vin = " + vin + ";";
		rset = stmt.executeQuery(sqlStr);
		if (rset.next()) {
			out.println("Vehicle Identification Nunber '" + vin + "' already exists with User Id '" 
				+ rset.getString("userId") + "' and Email-id '" + rset.getString("email") + "'.");
			duplicate = true;
		}

		if (!duplicate) {
			sqlStr = "SELECT userId, email FROM users WHERE vrn = " + vrn + ";";
			rset = stmt.executeQuery(sqlStr);
			if (rset.next()) {
				out.println("Vehicle Registration Nunber '" + vrn + "' already exists with User Id '" 
					+ rset.getString("userId") + "' and Email-id '" + rset.getString("email") + "'.");
				duplicate = true;
			}
		}

		if (!duplicate) {
			sqlStr = "SELECT userId, email FROM users WHERE email = '" + email + "';";
			rset = stmt.executeQuery(sqlStr);
			if (rset.next()) {
				out.println("Email-id '" + rset.getString("email") + "' is already being used by User '" 
					+ rset.getString("userId") + "'.");
				duplicate = true;
			}
		}

		if (!duplicate) {
			sqlStr = "SELECT userId FROM users WHERE userId = '" + userId + "';";
			rset = stmt.executeQuery(sqlStr);
			if (rset.next()) {
				out.println("User Id '" + rset.getString("userId") + "' is already in use.");
				duplicate = true;
			}
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>

<%
	if (!duplicate) {
		sqlStr = "INSERT INTO users VALUES (";
		sqlStr += vin + ", ";
		sqlStr += vrn + ", ";
		sqlStr += "'" + name + "', ";
		sqlStr += "'" + address + "', ";
		sqlStr += phoneNo + ", ";
		sqlStr += "'" + email + "', ";
		sqlStr += "'" + userId + "', ";
		sqlStr += "'" + password + "'";
		sqlStr += ");";

//		System.out.println("SQL: " + sqlStr);
		try {
			status = stmt.executeUpdate(sqlStr);
			if (status != 0) {
%>
				<h4>You have been registered successfully with username '<%= userId %>'.</h4>
				<hr />

<%@ include file="login.html" %>
	
<%			}
		} catch (Exception e) {
			out.println("An error has occured. Try again.");
			System.out.println(e);
		}
	}

	stmt.close();
	conn.close();
%>

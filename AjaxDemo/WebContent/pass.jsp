<%@ page import="java.io.*,java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
	String sn = request.getParameter("ver");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "ganesh");
	Statement st = con.createStatement();
	//ResultSet rs = st.executeQuery("select * from employee where eid="+sn);
	ResultSet rs = st.executeQuery("select * from employee where ename='" + sn + "'"); // this is for name
	if (rs.next()) {
		out.println("<font color=red>");
		out.println("Name already taken");
		out.println("</font>");

	} else {

		out.println("<font color=green>");
		out.println("Available");
		out.println("</font>");

	}

	rs.close();
	st.close();
	con.close();
%>
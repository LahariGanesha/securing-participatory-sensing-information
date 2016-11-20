<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
String ans=request.getParameter("ans");
String qid=(String)session.getAttribute("qid");
String myid=(String)session.getAttribute("myid");
int iqid=Integer.parseInt(qid);
int imyid=Integer.parseInt(myid);

try{
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");


PreparedStatement psmt1=con1.prepareStatement("insert into answer(aid,qid,uid,answer) values(?,?,?,?)");

psmt1.setInt(1,1);
psmt1.setInt(2,iqid);
psmt1.setInt(3,imyid);
psmt1.setString(4,ans);


try
{
psmt1.executeUpdate();
respnse.sendRedirect("");
}
catch(Exception ex)
{

out.println("Error in insertion: "+ex);
}			
//response.sendRedirect("dcp4.jsp?message=success");

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);
}			
%>
</body>
</html>
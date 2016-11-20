
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String title=request.getParameter("title");
session.setAttribute("title",title);
String description=request.getParameter("description");
session.setAttribute("description",description);
String cloc=(String)session.getAttribute("clocation");

String myid=(String)session.getAttribute("myid");
System.out.println(cloc);	
System.out.println("***0");	


try
{
Class.forName("com.mysql.jdbc.Driver");	
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
	Statement st = con1.createStatement();
	System.out.println("***1");	
	String qry ="select *  from locations where  location='"+cloc+"' ";
	ResultSet rs = st.executeQuery(qry);
	System.out.println("***2");	
	if(rs.next()!=false)
	{
		while(rs.next())
		{
			System.out.println("***4");	

			String l=rs.getString("level");
			System.out.println("l");
		if(l.equals(""))
		{	
				
			response.sendRedirect("insensitive.jsp");
		}
		if(l.equals("sensitive"))
		{
		response.sendRedirect("sensitive.jsp");
		}
		else if(l.equals("insensitive"))
		{
		response.sendRedirect("insensitive.jsp");
		}
		else if(l.equals("mixzone"))
		{
		response.sendRedirect("mixzone.jsp");
		}
		}
	}
	else
	{
		System.out.println("***3");	
		System.out.println("result set empty");	

		response.sendRedirect("insensitive.jsp");

	}
	
}
catch(Exception e)
{
	System.out.println("***5");	

	System.out.println(e);	
}
	%>
</body>
</html>
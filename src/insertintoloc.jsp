<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String clocation=null;
Double wt;
String level="insensitive";
try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");


StringBuffer place1=new StringBuffer();
String myplacetemp1[]=null;
	Statement st1 = null;
		ResultSet rs1=null;
		Class.forName("com.mysql.jdbc.Driver");	
		st1=con1.createStatement();

	try{

			
			String sql1="select Distinct(clocation) from history";
			rs1=st1.executeQuery(sql1);
			
			while(rs1.next()){
				
				place1.append(rs1.getString(1));
				place1.append(",");
				
								
			}
			myplacetemp1=(place1.toString()).split(",");
			System.out.println("myplacetemp1"+myplacetemp1.length);
			System.out.println("myplacetemp="+myplacetemp1.toString());	
	}
	catch (Exception e1) 
		{
			out.println(e1.getMessage());
		}
	

	try{

		PreparedStatement psmt1=con3.prepareStatement("delete from locations");
		psmt1.executeUpdate();

			
			if(psmt1==null)
				out.println("error in deletion location");

				
	}
	catch (Exception e1) 
		{
			out.println(e1.getMessage());
		}
for(int i=0;i<myplacetemp1.length;i++)
{	
Statement st = con2.createStatement();
String sql2="select max(weight) from history where clocation='"+myplacetemp1[i]+"' ";
ResultSet rs2=st.executeQuery(sql2);
while(rs2.next()){
	//clocation=rs1.getString("clocation");
	//wt=rs1.getDouble("clocation");
	clocation=myplacetemp1[i];
	wt=rs2.getDouble(1);

	if(wt>0.75)
	    level="sensitive";
	else if(wt<0.25)
		level="insensitive";
	else if(wt>0.25 && wt<0.75)
		level="mixzone";
	try
	{
	PreparedStatement psmt1=con3.prepareStatement("insert into locations(location,level) values(?,?)");
	psmt1.setString(1,clocation);
	psmt1.setString(2,level);
	psmt1.executeUpdate();
	}
	catch(Exception e)
	{
		out.println("insert into location"+e);
	}
	}
}
}
catch(Exception e)
{
	out.println("history clocation"+e);
}

%>
</body>
</html>
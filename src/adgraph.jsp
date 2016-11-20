<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Graph-->

 
 <table width="325px" height="350px" style="margin-right:10px; background-color:#66FFFF" border="1">
<tr>
<td>MP</td>
	
<%
StringBuffer place1=new StringBuffer();
String myplacetemp1[]=null;
	Statement st1 = null;
		ResultSet rs1=null;
		Class.forName("com.mysql.jdbc.Driver");	
		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
		st1=con1.createStatement();

	try{

			
			String sql2="select Distinct(clocation) from history";
			rs1=st1.executeQuery(sql2);
			
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
 %>
 
 
 <%
StringBuffer place2=new StringBuffer();
String myplacetemp2[]=null;
	Statement st2 = null;
		ResultSet rs2=null;
		Class.forName("com.mysql.jdbc.Driver");	
		Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
		st2=con2.createStatement();
		System.out.println("*****");

	try{

			
			String sql2="select oldlocation from history";
			rs2=st2.executeQuery(sql2);
			System.out.println("*****");
			if(rs2==null)
				System.out.println("empty oldlacotion");

			while(rs2.next()){
				
				place2.append(rs2.getString(1));
				place2.append(",");
				
								
			}
			System.out.println("*****");

			myplacetemp2=(place2.toString()).split(",");
			System.out.println("myplacetemp2"+myplacetemp2.length);
			System.out.println("myplacetemp2="+myplacetemp2.toString());	
	}
	catch (Exception e1) 
		{
		System.out.println("**e11***");

			out.println(e1.getMessage());
		}
 %>
 
<%

for(int i=0;i<myplacetemp1.length;i++){%>
	<td><%=myplacetemp1[i]%></td>
<%}%>
</tr>


<% for(int i=0;i<myplacetemp2.length;i++){%>
<tr>
<td><%=myplacetemp2[i]%></td>

<%
ResultSet rs5= null;
Class.forName("com.mysql.jdbc.Driver");	
Connection con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Statement st5=con5.createStatement();
	for(int j=0;j<myplacetemp1.length;j++){
%>
	
		<%
			
		String qry ="select * from history where oldlocation='"+myplacetemp2[i]+"' and clocation='"+myplacetemp1[j]+"'"; 
		rs5 = st5.executeQuery(qry);
			if(rs5.next()){
		%>
				<td><%=rs5.getDouble("weight")%></td>

		<%		
			}
			else
			{System.out.println("else");
		%>
			<td> 0</td>
			
<% 	} //end of else
			
	} //inner for%>


</tr>
<% } // end for outer for%>

</table>
		<!--end graph-->
</body>
</html>
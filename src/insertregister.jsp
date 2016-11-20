<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>



<html>
<head>
</head>
<body>

<%

		
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
		 Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
			st=con.createStatement();
			String sql1="select max(id) from profile";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
	

	
	
		String name=null,phone=null,password=null,location=null,usertype=null;
	
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
	name=request.getParameter("name");
	phone=request.getParameter("phone");
	password=request.getParameter("password");
	location=request.getParameter("location");
	usertype=request.getParameter("usertype");				
	String status="Un Authorized";
		try {			
			
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");

			PreparedStatement ps=con1.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,name);
				ps.setString(3,phone);	
       			ps.setString(4,password);
       			ps.setString(5,location);
			    ps.setString(6,usertype);
				ps.setString(7,status);
			   
	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("home.html?message=success");
			}
			else
			{
				response.sendRedirect("home.html?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
			}	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
			
 %>
</body>
</html>
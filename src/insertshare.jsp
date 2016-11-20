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
		String description = request.getParameter("description");
		String lat = request.getParameter("lat");
		String lon = request.getParameter("lon");
		String title=request.getParameter("title");
		String location=request.getParameter("Address");
		System.out.println(description+location+title+lat+lon);
		
/*	try{
		
		Class.forName("com.mysql.jdbc.Driver");	
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
			st=con.createStatement();
			String sql1="select max(id) from share";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
			}

PreparedStatement psmt1=null;
java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
	 
	 String DATE_FORMAT2 = "hh:mm:ss";
	 SimpleDateFormat sdf2 = new SimpleDateFormat(DATE_FORMAT2);
     String strDateNew2 = sdf2.format(now);

String place = request.getParameter("place");
session.setAttribute("myplace",place);

String title = request.getParameter("title");
session.setAttribute("mytitle",title);
String description = request.getParameter("description");
String lat = request.getParameter("lat");
String lon = request.getParameter("lon");
String question=request.getParameter("question");
String location=request.getParameter("address");

 String status="Processing";
 
		String myid=(String)session.getAttribute("myid");
		String myname=(String)session.getAttribute("myname");
		String myphone=(String)session.getAttribute("myphone");
		String mylocation=(String)session.getAttribute("mylocation");

try{
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");


psmt1=con1.prepareStatement("insert into share(id,dc_id,dc_name,dc_phone,title,question,description,latitude,longitude,place,location,date,time) values(?,?,AES_ENCRYPT(?, 'key'),AES_ENCRYPT(?, 'key'),?,?,?,?,?,?,?,?,?)");

psmt1.setInt(1,id);
psmt1.setString(2,myid);
psmt1.setString(3,myname);
psmt1.setString(4,myphone);
psmt1.setString(5,title);
psmt1.setString(6,question);
psmt1.setString(7,description);
psmt1.setString(8,lat);
psmt1.setString(9,lon);
psmt1.setString(10,place);
psmt1.setString(11,mylocation);
psmt1.setString(12,strDateNew1);
psmt1.setString(13,strDateNew2);

psmt1.executeUpdate();
response.sendRedirect("dcp4.jsp?message=success");

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);
}			
	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
	*/		
 %>
</body>
</html>
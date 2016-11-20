<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%
Connection con=null;
Statement st = null;
ResultSet rs = null;

java.util.Date now = new java.util.Date();
String DATE_FORMAT1 = "dd/MM/yyyy";
SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
String strDateNew1 = sdf1.format(now);

String DATE_FORMAT2 = "hh:mm:ss";
SimpleDateFormat sdf2 = new SimpleDateFormat(DATE_FORMAT2);
String strTimeNew1 = sdf2.format(now);

session.setAttribute("date",strDateNew1);
session.setAttribute("itime",strTimeNew1);

String name = request.getParameter("name");
String password = request.getParameter("password");
String usertype = request.getParameter("usertype");
session.setAttribute("name",name);
session.setAttribute("password",password);
if((name.equals("admin"))&(password.equals("admin")))
	response.sendRedirect("admin.jsp");	

try{
	Class.forName("com.mysql.jdbc.Driver");	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
	st = con.createStatement();
	String qry ="select * from profile where (phone='"+name+"' AND password='"+password+"' AND usertype='"+usertype+"') OR (name='"+name+"' AND password='"+password+"' AND usertype='"+usertype+"') "; 
	rs = st.executeQuery(qry);
	
	if(!rs.next()){
	out.println("Enter correct username, password");
	
	}
	else{
		
		int id=rs.getInt("uid");
		String myid=String.valueOf(id);
		session.setAttribute("myid",myid);
		session.setAttribute("name",rs.getString("name"));
		session.setAttribute("phone",rs.getString("phone"));
		session.setAttribute("email",rs.getString("email"));

		session.setAttribute("location",rs.getString("location"));
		if(usertype.equals("Data Collector")){
			response.sendRedirect("dchome.jsp");	
		}
		if(usertype.equals("Personal User")){
			response.sendRedirect("queriers.jsp");	
		}
		if(usertype.equals("Community User")){
			response.sendRedirect("queriers.jsp");	
		}
	}
	

		
}
catch(Exception ex){
	out.println(ex);
}
%>



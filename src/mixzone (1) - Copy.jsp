<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.security.MessageDigest"%>
    <%@ page import="java.util.Arrays"%>
    <%@ page import="javax.crypto.KeyGenerator"%>
    <%@ page import=" javax.crypto.SecretKey"%>
        <%@ page import=" javax.crypto.spec.SecretKeySpec"%>
            <%@ page import=" javax.crypto.spec.SecretKeySpec"%>

        <%@ page import=" javax.crypto.spec.IvParameterSpec"%>

        <%@ page import=" javax.crypto.Cipher"%>

        <%@ page import=" javax.crypto.spec.IvParameterSpec"%>
        <%@ page import=" javax.crypto.spec.SecretKeySpec"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
        

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


java.util.Date now = new java.util.Date();
String DATE_FORMAT1 = "dd/MM/yyyy";
SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
String date = sdf1.format(now);

String DATE_FORMAT2 = "hh:mm:ss";
SimpleDateFormat sdf2 = new SimpleDateFormat(DATE_FORMAT2);
String etime = sdf2.format(now);
session.setAttribute("etime",etime);

 String IV = "AAAAAAAAAAAAAAAA";
 String encryptionKey = "0123456789abcdef";
String myid=(String)session.getAttribute("uid");
String name=(String)session.getAttribute("name");
String phone=(String)session.getAttribute("phone");
String email=(String)session.getAttribute("email");
String location=(String)session.getAttribute("location");
String title=(String)session.getAttribute("title");
String description=(String)session.getAttribute("description");
String itime=(String)session.getAttribute("itime");
String lat=(String)session.getAttribute("lat");
String lon=(String)session.getAttribute("lng");
String clocation=(String)session.getAttribute("clocation");
int sid=0;


try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf","root","root");
Statement st = con1.createStatement();
String sql1="select max(sid) from share";
ResultSet rs1=st.executeQuery(sql1);
while(rs1.next()){
	if(rs1.getInt(1)==0)
		sid=1;
	else
		sid=rs1.getInt(1)+1;
}
}
catch(Exception e)
{
	out.println(e);
	}



	String namef=(String)session.getAttribute("name")+"\0\0\0";
	String phonef=(String)session.getAttribute("phone")+"\0\0\0";
	String emailf=(String)session.getAttribute("email")+"\0\0\0";
	String locationf=(String)session.getAttribute("location")+"\0\0\0";


Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding", "SunJCE");
SecretKeySpec key = new SecretKeySpec(encryptionKey.getBytes("UTF-8"), "AES");
cipher.init(Cipher.ENCRYPT_MODE, key,new IvParameterSpec(IV.getBytes("UTF-8")));
String  encname=new String(cipher.doFinal(name.getBytes("UTF-8")));
String  encphone=new String(cipher.doFinal(phone.getBytes("UTF-8")));
String  encemail=new String(cipher.doFinal(email.getBytes("UTF-8")));
String  enclocation=new String(cipher.doFinal(location.getBytes("UTF-8")));
String  encmyid=new String(cipher.doFinal(location.getBytes("UTF-8")));

System.out.println(encname+encphone+encemail+enclocation);
try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf","root","root");
Statement st = con1.createStatement();
PreparedStatement psmt1=con1.prepareStatement("insert into share(sid,uid,name,phone,email,location,title,description,lat,lon,clocation,date,itime,etime) values(?,'?','?','?','?','?','?','?','?','?','?','?','?','?')");

		psmt1.setInt(1,sid);
		psmt1.setString(2,myid);
		psmt1.setString(3,encname);
		psmt1.setString(4,encphone);
		psmt1.setString(5,encemail);
		psmt1.setString(6,enclocation);
		psmt1.setString(5,title);
		
		psmt1.setString(6,description);
		psmt1.setString(7,lat);
		psmt1.setString(8,lon);
		psmt1.setString(9,clocation);
		psmt1.setString(10,date);
		psmt1.setString(11,itime);
		psmt1.setString(12,etime);

		psmt1.executeUpdate();
		System.out.println("succ ins to share");

		response.sendRedirect("dchome.jsp");
}
catch(Exception e)
{
	out.println(e);
	}



//static String plaintext = "test text 123\0\0\0";
%>
</body>
</html>
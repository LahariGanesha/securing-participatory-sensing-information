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
        <%@ page import=" javax.crypto.Cipher"%>
        <%@ page import="org.apache.commons.codec.binary.Base64"%>
        
        
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
        

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
String myid=(String)session.getAttribute("myid");
int imyid=Integer.parseInt(myid);
String name=(String)session.getAttribute("name");
String phone=(String)session.getAttribute("phone");
String email=(String)session.getAttribute("email");
String location=(String)session.getAttribute("location");
String title=(String)session.getAttribute("title");
String description=(String)session.getAttribute("description");
String itime=(String)session.getAttribute("itime");
String lat=(String)session.getAttribute("lat");
String lon=(String)session.getAttribute("lon");
String clocation=(String)session.getAttribute("clocation");
String oldlocation=null;
int sid=0,hid=0;
System.out.println("sensitive");

try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
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




try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Statement st = con1.createStatement();
String sql1="select max(hid) from history";
ResultSet rs1=st.executeQuery(sql1);
while(rs1.next()){
	if(rs1.getInt(1)==0)
		hid=1;
	else
		hid=rs1.getInt(1)+1;
}
}
catch(Exception e)
{
	out.println("history"+e);
}

try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Statement st = con1.createStatement();
String sql1="select * from history where hid='"+myid+"'";
ResultSet rs1=st.executeQuery(sql1);
while(rs1.next()){
	oldlocation=rs1.getString("oldlocation");
}
}
catch(Exception e)
{
	out.println("history"+e);
}

try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Statement st = con1.createStatement();
PreparedStatement psmt1=con1.prepareStatement("insert into history(hid,uid,name,oldlocation,clocation,lat,lon,date,itime,etime,weight) values(?,?,?,?,?,?,?,?,?,?,?)");

		psmt1.setInt(1,hid);
		psmt1.setInt(2,imyid);
		psmt1.setString(3,name);
		psmt1.setString(4,oldlocation);
		psmt1.setString(5,clocation);
		psmt1.setString(6,lat);
		psmt1.setString(7,lon);
		psmt1.setString(8,date);
		psmt1.setString(9,itime);
		psmt1.setString(10,etime);
		psmt1.setDouble(11,0.0);

		psmt1.executeUpdate();
		System.out.println("success ins to history");

		
}
catch(Exception e)
{
	out.println(e);
}
//DES

Cipher ecipher = Cipher.getInstance("DES");
SecretKey key = KeyGenerator.getInstance("DES").generateKey();
ecipher.init(Cipher.ENCRYPT_MODE, key);


byte[] utf8 = name.getBytes("UTF8");
byte[] enc = ecipher.doFinal(utf8);
byte [] base64Bytes = Base64.encodeBase64(enc);
String  encname= new String(base64Bytes);

byte[] utf81 = phone.getBytes("UTF8");
byte[] enc1 = ecipher.doFinal(utf81);
byte [] base64Bytes1 = Base64.encodeBase64(enc1);
String  encphone= new String(base64Bytes1);

byte[] utf82 = email.getBytes("UTF8");
byte[] enc2 = ecipher.doFinal(utf82);
byte [] base64Bytes2 = Base64.encodeBase64(enc2);
String  encemail= new String(base64Bytes2);

byte[] utf83 = location.getBytes("UTF8");
byte[] enc3 = ecipher.doFinal(utf83);
byte [] base64Bytes3 = Base64.encodeBase64(enc3);
String  enclocation= new String(base64Bytes3);


System.out.println(encname+encphone+encemail+enclocation);
try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Statement st = con1.createStatement();
PreparedStatement psmt1=con1.prepareStatement("insert into share(sid,uid,name,phone,email,location,title,description,lat,lon,clocation,date,itime,etime) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

		psmt1.setInt(1,sid);
		psmt1.setInt(2,imyid);
		psmt1.setString(3,encname);
		psmt1.setString(4,encphone);
		psmt1.setString(5,encemail);
		psmt1.setString(6,enclocation);
		psmt1.setString(7,title);
		
		psmt1.setString(8,description);
		psmt1.setString(9,lat);
		psmt1.setString(10,lon);
		psmt1.setString(11,clocation);
		psmt1.setString(12,date);
		psmt1.setString(13,itime);
		psmt1.setString(14,etime);

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
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
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
        

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("mixzone");

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
String namef=(String)session.getAttribute("name");
String phonef=(String)session.getAttribute("phone");
String emailf=(String)session.getAttribute("email");
String locationf=(String)session.getAttribute("location");
String title=(String)session.getAttribute("title");
String descriptionf=(String)session.getAttribute("description");
String itime=(String)session.getAttribute("itime");
String lat=(String)session.getAttribute("lat");
String lon=(String)session.getAttribute("lng");
String clocation=(String)session.getAttribute("clocation");
int sid=0,hid=0;
String oldlocation=null;

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
	out.println("history maxid"+e);
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
	out.println("history oldlocation"+e);
}

try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Statement st = con1.createStatement();
PreparedStatement psmt1=con1.prepareStatement("insert into history(hid,uid,name,oldlocation,clocation,lat,lon,date,itime,etime,weight) values(?,?,?,?,?,?,?,?,?,?,?)");

		psmt1.setInt(1,hid);
		psmt1.setInt(2,imyid);
		psmt1.setString(3,namef);
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
	out.println("error to insert to history"+e);
}


//AES




	/*String namef=(String)session.getAttribute("name");
	String phonef=(String)session.getAttribute("phone");
	String emailf=(String)session.getAttribute("email");
	String locationf=(String)session.getAttribute("location");
	*/
	while(namef.length()!=16)
	{
		namef=namef+"\0";
	}
	while(phonef.length()!=16)
	{
		phonef=phonef+"\0";
	}
	while(emailf.length()!=16)
	{
		emailf=emailf+"\0";
	}
	while(locationf.length()!=16)
	{
		locationf=locationf+"\0";
	}
	while(descriptionf.length()!=16)
	{
		descriptionf=descriptionf+"\0";
	}

Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding", "SunJCE");
SecretKeySpec key = new SecretKeySpec(encryptionKey.getBytes("UTF-8"), "AES");
cipher.init(Cipher.ENCRYPT_MODE, key,new IvParameterSpec(IV.getBytes("UTF-8")));
String  encname=new String(cipher.doFinal(namef.getBytes("UTF-8")));
String  encphone=new String(cipher.doFinal(phonef.getBytes("UTF-8")));
String  encemail=new String(cipher.doFinal(emailf.getBytes("UTF-8")));
String  enclocation=new String(cipher.doFinal(locationf.getBytes("UTF-8")));
String  encdescription=new String(cipher.doFinal(descriptionf.getBytes("UTF-8")));

System.out.println(encname+encphone+encemail+enclocation);

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
	out.println("maxid shar"+e);
}
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
		
		psmt1.setString(8,encdescription);
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
	out.println("insert share"+e);
}



//static String plaintext = "test text 123\0\0\0";
%>
</body>
</html>
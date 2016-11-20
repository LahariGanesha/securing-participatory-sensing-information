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
 String add=request.getParameter("txtAddress");
 String lat=request.getParameter("latbox");
 String lon=request.getParameter("lngbox");
  
 session.setAttribute("clocation",add);
 session.setAttribute("lat",lat);
 session.setAttribute("lng",lon);
response.sendRedirect("participatorshare1.jsp");
%>
 </body>
</html>
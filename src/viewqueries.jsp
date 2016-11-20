<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head></head>
<body>
<form action="viewqueries1.jsp">
<%

String myid=(String)session.getAttribute("myid");
String myname=(String)session.getAttribute("myname");
String myphone=(String)session.getAttribute("myphone");
String mylocation=(String)session.getAttribute("mylocation");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
Statement st=con1.createStatement();
String sql1="select * from question";
ResultSet rs1=st.executeQuery(sql1);
while(rs1.next())
{
	
%>

  
   <input type="radio" value="<%=rs1.getInt("qid")%>" name="question"><%=rs1.getString("question") %>
  
            </br>	
<%
}
%>
  <input type="submit" name="answer" value="Answer" align="right">

<%
}
catch(Exception ex)
{
out.println("Error in connection : "+ex);
}				
%>
</form>
</body>
</html>

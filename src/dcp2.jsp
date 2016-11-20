<%@ page import="java.sql.*"%>

<%

Statement st = null;
ResultSet rs = null;
String myid = (String)session.getAttribute("myid");


try{
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
	st = con.createStatement();
	String qry ="select * from profile where id='"+myid+"' AND status='Authorized' "; 
	rs = st.executeQuery(qry);

	if(!rs.next()){
		out.println("Send Register Request to Trusted Third Party");
		out.println("-----");
		out.println(" or  ");
		out.println("-----");
		out.println("You are Mallicious Attacker");
		%>
				<html>
					<body><br><a href="dchome.jsp">Go Back</a></body>
				</html>
		<%	
	}
	else{
			response.sendRedirect("participatorshare.jsp");
		}

}
catch(Exception ex){
	out.println(ex);
}
%>




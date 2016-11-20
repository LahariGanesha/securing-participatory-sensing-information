<%@ page import="java.sql.*"%>

<%
Connection con=null;
Statement st = null;
ResultSet rs = null;
int id=0;
	

try{
	Class.forName("com.mysql.jdbc.Driver");	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
	st = con.createStatement();
	String qry ="select max(tid) from transaction  "; 
	rs = st.executeQuery(qry);
	if(rs.next()){
		if(rs.getInt(1)==0)
					id=1;
				else
					id=rs.getInt(1)+1;
		session.setAttribute("tid",Integer.toString(id));
		response.sendRedirect("dchome.jsp");
	
	
	}
	else{
		out.println("Enter correct username, password");	
			
	}
	con.close();
	st.close();
		
		
}
catch(Exception ex){
	out.println(ex);
}
%>



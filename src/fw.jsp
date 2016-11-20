<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>find weight</p>
<%


int n=0,p=0;
double wt=0;
try{

 Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("SELECT COUNT(*)  FROM history");
	while(rs1.next()){
	n = rs1.getInt(1);
	}
	con.close();
	st.close();
	rs1.close();
	System.out.println("MyTable has " + n + " row(s).");
	 Class.forName("com.mysql.jdbc.Driver");	
		Connection con0 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
		Statement st0 = con0.createStatement();
	ResultSet rs = st0.executeQuery("SELECT * from history");
	while(rs.next())
	{
		System.out.println("inside while");

		int hid=rs.getInt("hid");
		String cloc=rs.getString("clocation");
		String itime=rs.getString("itime");
		String etime=rs.getString("etime");
		int isec=(Integer.parseInt(itime.substring(0,2)))*3600+(Integer.parseInt(itime.substring(3,5)))*60+(Integer.parseInt(itime.substring(6,8)));
		int esec=(Integer.parseInt(etime.substring(0,2)))*3600+(Integer.parseInt(etime.substring(3,5)))*60+(Integer.parseInt(etime.substring(6,8)));
		System.out.println("cloc"+cloc);

		Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
		Statement st2 = con2.createStatement();
		String qr="SELECT count(*)   FROM history where clocation='"+cloc+"'";
		ResultSet rs2 = st2.executeQuery(qr);
		while(rs2.next()){
			System.out.println("p=pppp");
			p = rs2.getInt(1);
			p++;
			System.out.println("p="+p);

			}
		con2.close();
		st2.close();
		rs2.close();
		
		System.out.println("p="+p);

		double diff=(double)(esec-isec)/(60.0);
		System.out.println("diff="+diff);

		double dp=(double)p;
		double is=(1.0/(Math.sqrt(2*3.1428)))*diff;
		
		wt=((double)((double)p/(double)n)*is);
		System.out.println(wt);
		Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
		Statement st3 = con3.createStatement();

		int s=st3.executeUpdate("update history set weight='"+wt+"' where hid='"+hid+"'");
		if(s>0)
			System.out.println("updated succ");
		else
			System.out.println(" updation failure");
		con3.close();
		st3.close();
		

	}
	con0.close();
	st0.close();
	rs.close();
	
}
catch(Exception e)
{
	System.out.println(e);
}
response.sendRedirect("adgraph.jsp?message=success");
%>
</body>
</html>
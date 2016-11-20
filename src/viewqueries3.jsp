<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  %>


<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>trpf1</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_400-Myriad_Pro_700-Myriad_Pro_italic_400-Myriad_Pro_italic_700.font.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.easing.compatibility.js"></script>
<script type="text/javascript" src="js/jcarousellite.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/general.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
</head>
<body>
<%
	String qid=(String)session.getAttribute("qid");
String title="";
try{
	
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/trpf1","root","root");
		Statement st=con.createStatement();
		String sql1="select question from question where qid='"+qid+"'";
		ResultSet rs1=st.executeQuery(sql1);
		while(rs1.next()){
			title=rs1.getString(1);
		}
}
catch(Exception e)
{
	out.println("question"+e);
}
%>
	<form name="form" action="insertanswer.jsp" onSubmit="return valid();" method="post"  >
	
  <div id="wrapper"> 
    <div id="header"> 
      <h2><font color="#00FFFF" size="+2">trpf1: A Trajectory Privacy-Preserving Framework
for Participatory Sensing</font></h2>
    </div>
    <div id="nav"> 
      <div class="inner"> 
        <ul>
          
        </ul>
      </div>
    </div>
    <div id="hold"> 
      <div id="content"> 
        <div id="subheader"> 
          <h2 style="color:#FF0000">Participator Sharing &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</h2>
        </div>
        <div id="leftcolumn"> 
          <table width="400px" height="250px">
          
          <tr>
          
          
            
            <tr> 
              <td><font color="#660000" size="2"><strong>Title:</strong></font></td>
              <td><input name="title" type="textbox" value="<%=title %>"/></td>
            </tr>
            <tr> 
              <td><font color="#660000" size="2"><strong>Description:</strong></font></td>
              <td><textarea name="description" cols="50" rows="5"></textarea></td>
            </tr>
			
            <tr> 
              <td colspan="2" align="center"><input name="search" type="submit" value="Send" class="button"> 
                &nbsp;&nbsp;&nbsp; 
                <input name="search" type="reset" value="Reset" class="button"></td>
            </tr>
                      </table>
   
          <div id="error"></div>
        </div>
        <div id="rightcolumn"> 
          <h3> 
            
          </h3>
          <ul class="blog-entries">
            <img src="images/overview.jpg" width="300" height="300"> 
          </ul>
        </div>
        <div class="clear"></div>
      </div>
      
      <div id="copyright"> 
        <p align="center">trpf1: A Trajectory Privacy-Preserving Framework
for Participatory Sensing</p>
      </div>
    </div>
  </div>
</form>
</body>
</html>

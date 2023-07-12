<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<%
	request.setCharacterEncoding("utf8");	
	
	Connection conn =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	
	String id= request.getParameter("id");
	String pwd= request.getParameter("pwd");	

	String driver ="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pass="123456";
	
	Class.forName(driver); 
	conn = DriverManager.getConnection(url, user, pass);
	
	sql="select pwd from member where id=?";

	pstmt=conn.prepareStatement(sql);

	
	pstmt.setString(1,id );
	
	//실행
	rs=pstmt.executeQuery(); //insert 실행

	System.out.println(id);
	System.out.println(pwd);
	
	int x=-1;
	String msg="";
	String password="";
	
	if (rs.next()){
		 password=rs.getString("pwd");
		 
			if(password.equals(pwd)){
				x=1;
				msg="";
			}else{
				x=0;
				msg="";
			}
		 
	}else{
		x=-1;
	}
	
	if(x==1){ //실패
		session.setAttribute("sessionID", id);
		msg="../mainForm.jsp";
	}else if(x==0){ //실패
		msg="./loginForm.jsp?msg=0";
	}else{
		msg="./loginForm.jsp?msg=-1";
	}
	
	response.sendRedirect(msg);
	System.out.print("XXXXX: "+x);
	
%>

</body>
</html>